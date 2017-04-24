package org.tjhuey.manager.controller.user;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tjhuey.common.utils.Pager;
import org.tjhuey.manager.pojo.Comment;
import org.tjhuey.manager.pojo.Resource;
import org.tjhuey.manager.pojo.User;
import org.tjhuey.manager.service.user.CommentService;

@RequestMapping("/comment")
@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	/**
	 * 单一删除
	 * @param resourceId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAjax")
	public String deleteAjax(@RequestParam("commentId") Integer commentId) {
		commentService.deleteById(commentId);
		return "ok";
	}

	/**
	 * 插入评论
	 * @param comment
	 * @param userId
	 * @param resourceId
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/insert")
	public String insert(Comment comment, @RequestParam("userId") Integer userId,
			@RequestParam("resourceId") Integer resourceId) throws ParseException {
		User user = new User();
		user.setUserId(userId);
		Resource resource = new Resource();
		resource.setResourceId(resourceId);
		comment.setUser(user);
		comment.setResource(resource);
		commentService.save(comment);
		return "redirect:/comment/queryAllComment?resourceId="+resourceId;
	}

	
	
	/**
	 * 查询评论详情
	 * @param commentId
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryCommentDetail")
	public String queryCommentDetail(@RequestParam("id") Integer commentId, Map<String, Object> map) {
		Comment detail = commentService.getDetail(commentId);
		map.put("detail", detail.getContent());
		return "pages/comment/CommentDetail";
	}

	
	
	/**
	 * 根据资源id查询一个资源的评论信息分页处理
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllCommentAdmin")
	public String queryAllCommentAdmin(HttpServletRequest request,
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
			pager = new Pager(commentService.getCount(null), pageNum, pageSize);
		} else {
			pager = new Pager(commentService.getCount(null), pageNum);
		}
		List<Comment> list = commentService.queryByPager(pager,null);
		map.put("list", list);
		map.put("pager", pager);
		return "pages/comment/CommentAllAdmin";
	}
	
	
	
	/**
	 * 根据资源id查询一个资源的评论信息分页处理
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllComment")
	public String queryAllComment(@RequestParam("resourceId") Integer resourceId, HttpServletRequest request,
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
			pager = new Pager(commentService.getCount(resourceId), pageNum, pageSize);
		} else {
			pager = new Pager(commentService.getCount(resourceId), pageNum);
		}
		List<Comment> list = commentService.queryByPager(pager, resourceId);
		map.put("list", list);
		map.put("pager", pager);
		map.put("resourceId",resourceId);
		return "pages/comment/CommentAll";
	}
	/**
	 * 普通用户查询自己资源的评论
	 * @param resourceId
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/queryAllCommentSelf")
	public String queryAllCommentSelf(@RequestParam("resourceId") Integer resourceId, HttpServletRequest request,
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
			pager = new Pager(commentService.getCount(resourceId), pageNum, pageSize);
		} else {
			pager = new Pager(commentService.getCount(resourceId), pageNum);
		}
		List<Comment> list = commentService.queryByPager(pager, resourceId);
		map.put("list", list);
		map.put("pager", pager);
		map.put("resourceId",resourceId);
		return "pages/comment/CommentAllSelf";
	}
}
