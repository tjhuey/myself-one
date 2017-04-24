package org.tjhuey.manager.controller.user;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.tjhuey.common.utils.GlobalSettings;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Resource;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.exception.ScoreTooLowException;
import org.tjhuey.manager.service.user.ResourceService;

/**
 * 资源处理控制层
 * 
 * @author huey
 * 
 */
@RequestMapping("/resource")
@Controller
public class ResourceController {

	@Autowired
	private ResourceService resourceService;

	/**
	 * 上传资源
	 * 
	 * @param resource
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpResource")
	public String toUpResource(MultipartFile upFile, Resource resource,
			HttpSession session) {
		boolean empty = upFile.isEmpty();
		if (!empty) {
			ServletContext servletContext = session.getServletContext();
			String virtual = "/WEB-INF/resources";
			String realPathTemp = servletContext.getRealPath(virtual);
			// 获取文件大小
			long size = upFile.getSize();

			User user = (User) session.getAttribute("loginUser");
			resource.setSize((int) size);
			// resource.setPath(virtual + "/" + upFile.getOriginalFilename());
			resource.setPath(upFile.getOriginalFilename());
			resource.setUploadTime(new Date());
			resource.setUser(user);
			// 保存积分
			user.setScore(user.getScore() + 5);
			// 保存到数据库
			resourceService.save(resource);

			String path = realPathTemp + "\\" + upFile.getOriginalFilename();
			File file = new File(path);
			try {
				// 保存文件到目录
				upFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "pages/resource/ResourceAllSelf";
	}

	@RequestMapping("/queryResourceDetail")
	public String queryAdminDetail(@RequestParam("id") Integer resourceId,
			Map<String, Object> map) {
		Resource detail = resourceService.getDetail(resourceId);
		map.put("detail", detail.getDetail());
		return "pages/resource/ResourceDetail";
	}

	@RequestMapping("/toDownLoad")
	public ResponseEntity<byte[]> toDownLoad(HttpServletRequest request,
			HttpSession session) {
		// 判断积分是否允许下载
		User user = (User) session.getAttribute("loginUser");
		Integer score = user.getScore();
		String resourceScoreStr = request.getParameter("resourceScoreStr");
		String userIdStr = request.getParameter("userIdStr");
		Integer userId = Integer.parseInt(userIdStr);
		Integer resourceScore = Integer.parseInt(resourceScoreStr);
		// 同一个用户不进行操作
		if (userId != user.getUserId()) {
			if (score == null || score < resourceScore) {
				throw new ScoreTooLowException(
						GlobalSettings.MESSAGE_SCORE_TOO_LOW);
			}
			// 当前用户减少积分
			if (user.getAuthority() != 3) {
				user.setScore(user.getScore() - resourceScore);
			}
			if (user.getScore() < 0) {
				user.setScore(0);
			}
			resourceService.updateScore(user);
			// 获取资源的用户id和积分
			// 增加相应的积分
			resourceService
					.addScore(Integer.parseInt(userIdStr), resourceScore);
		}

		// /WEB-INF/resources/TinyLighthouse.jpg
		String resourceName = request.getParameter("resourcePath");
		// 从后往前获取最后一个.分割
		int lastIndexOf = resourceName.lastIndexOf('.');
		// 为了下载用
		String subfix = resourceName.substring(lastIndexOf);
		// 获取服务器端的资源供下载
		ServletContext servletContext = session.getServletContext();
		String realPath = servletContext.getRealPath("/WEB-INF/resources/"
				+ resourceName);

		HttpHeaders headers = new HttpHeaders();
		byte[] byteArray = null;
		// 下载的名字
		String uuIdTemp = UUID.randomUUID().toString();
		String uuIdFinal = uuIdTemp.replaceAll("-", "");
		String fileName = uuIdFinal + subfix;
		try {
			// 用utf-8编码解析url
			fileName = URLEncoder.encode(fileName, "utf-8");
			// 设置响应头
			headers.add("Content-Disposition", "attachment; filename="
					+ fileName);
			byteArray = IOUtils.toByteArray(new FileInputStream(realPath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(byteArray,
				headers, HttpStatus.OK);
		return responseEntity;
	}

	/**
	 * 批量删除
	 * 
	 * @param delArray
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteMultiAjax")
	public String deleteMultiAjax(HttpServletRequest request) {
		String[] values = request.getParameterValues("delArray[]");
		for (String string : values) {
			if (string != null && !"".equals(string)) {
				resourceService.deleteById(Integer.parseInt(string));
			}
		}
		return null;
	}

	/**
	 * 单一删除
	 * 
	 * @param resourceId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAjax")
	public String deleteAjax(@RequestParam("resourceId") Integer resourceId) {
		try {
			resourceService.deleteById(resourceId);
		} catch (Exception e) {
			return "error";
		}
		return "ok";
	}

	/**
	 * 查询所有相应管理员的信息，并分页处理
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllResource")
	public String queryAllResource(HttpServletRequest request,
			Map<String, Object> map) {

		int pageSize = 0;
		// 默认从第一页开始
		int pageNum = 1;
		try {
			String pageSizeStr = request.getParameter("pageSize");
			String pageNumStr = request.getParameter("pageNum");
			if (pageSizeStr != null || "".equals(pageSizeStr)) {
				pageSize = Integer.parseInt(pageSizeStr);
			}
			if (pageNumStr != null || "".equals(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Pager pager = null;
		if (pageSize != 0) {
			pager = new Pager(resourceService.getCount(), pageNum, pageSize);
		} else {
			pager = new Pager(resourceService.getCount(), pageNum);
		}
		List<Resource> list = resourceService.queryByPager(pager);
		map.put("list", list);
		map.put("pager", pager);
		return "pages/resource/ResourceAll";
	}

	@RequestMapping("/queryAllResource/{userId}")
	public String queryAllResourceByUserId(
			@PathVariable("userId") Integer userId, HttpServletRequest request,
			Map<String, Object> map) {

		int pageSize = 0;
		// 默认从第一页开始
		int pageNum = 1;
		try {
			String pageSizeStr = request.getParameter("pageSize");
			String pageNumStr = request.getParameter("pageNum");
			if (pageSizeStr != null || "".equals(pageSizeStr)) {
				pageSize = Integer.parseInt(pageSizeStr);
			}
			if (pageNumStr != null || "".equals(pageNumStr)) {
				pageNum = Integer.parseInt(pageNumStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Pager pager = null;
		if (pageSize != 0) {
			pager = new Pager(resourceService.getCount(userId), pageNum,
					pageSize);
		} else {
			pager = new Pager(resourceService.getCount(userId), pageNum);
		}
		List<Resource> list = resourceService.queryByPager(pager, userId);
		map.put("list", list);
		map.put("pager", pager);
		return "pages/resource/ResourceAllSelf";
	}

}
