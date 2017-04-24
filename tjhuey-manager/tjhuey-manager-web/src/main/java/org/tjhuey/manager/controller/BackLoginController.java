package org.tjhuey.manager.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.tjhuey.common.constants.SystemConstant;
import org.tjhuey.common.utils.PagePrefixUtil;
import org.tjhuey.common.utils.UUIDUtil;
import org.tjhuey.common.utils.VerifyCodeUtil;

/**
 * <p>
 * Description:
 * </p>
 * Path: org.tjhuey.manager.controller
 * <p>
 * Title: BackLoginController.java
 * </p>
 * Company: resource.huey.org>
 * 
 * @author huey
 * @date 2017年3月31日
 * @version 1.0
 */
@RequestMapping("/back")
@Controller
public class BackLoginController {

	public static Logger logger = LoggerFactory.getLogger(BackLoginController.class);
	/**
	 * <p>
	 * Description:去登录界面
	 * </p>
	 * 
	 * @author huey
	 * @date 2017年3月31日
	 */
	@RequestMapping("/toLogin")
	public String loginInit(Map<String, Object> map) {

		String randomID = UUIDUtil.getUUID();
		map.put("randomID", randomID);

		return PagePrefixUtil.PAGE_PREFIX + PagePrefixUtil.LOGIN_MODULE + "backLogin";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("verifyCode") String verifyCode, HttpSession session,
			RedirectAttributes redirectAttributes) throws Exception {
		logger.debug("前台表单传入的参数:username->" + username + "，password->"
				+ password + "，verifyCode->" + verifyCode);
		// 1、验证验证码
		String s_verifyCode = (String) session.getAttribute("verifyCode");
		// 验证码验证失败
		if (!verifyCode.equals(s_verifyCode)) {
			logger.error("验证码验证失败!");
			redirectAttributes.addFlashAttribute("errMsg", "验证码验证失败!");
			return "redirect:/backLogin.jsp";
		}

		// 2、用户名或密码失败的情况下
		//用户名
		if(username == null || username == ""){
			redirectAttributes.addFlashAttribute("errMsg", "用户名或密码错误!");
			return "redirect:/backLogin.jsp";
		}
		
		Subject currentUser = SecurityUtils.getSubject();
		if (!currentUser.isAuthenticated()) {
			UsernamePasswordToken token = new UsernamePasswordToken(username,
					password);
			token.setRememberMe(true);
			try {
				currentUser.login(token);
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("errMsg", "用户密码错误!");
			}
		}
		session.setAttribute(SystemConstant.NAME_LOGIN_USER, currentUser.getPrincipal());
		return "redirect:/backHome.jsp";
	}

	/**
	 * @方法名: getVerifyImage
	 * @功能描述: 获取验证码图片和文本(验证码文本会保存在HttpSession中)
	 * @作者 huey
	 * @日期 2016年11月25日
	 */
	@RequestMapping("getVerifyCodeImage")
	public void getVerifyCodeImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// 设置页面不缓存
		response.setHeader("Pragma", "no-cache");// HTTP 1.1
		response.setHeader("Cache-Control", "no-cache");// HTTP 1.0
		response.setDateHeader("Expires", 0);// 设置缓存时间，0就是不缓存
		/*
		 * 
		 * 可生成数字、大写、小写字母及三者混合类型的验证码
		 * 支持自定义验证码字符数量,支持自定义验证码图片的大小,支持自定义需排除的特殊字符,支持自定义干扰线的数量,支持自定义验证码图文颜色
		 * 验证码类型为仅数字,即0~9
		 */
		String verifyCode = VerifyCodeUtil.generateTextCode(
				VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);
		// 将验证码放到HttpSession里面
		request.getSession().setAttribute("verifyCode", verifyCode);
		logger.debug("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");
		// 设置输出的内容的类型为JPEG图像
		response.setContentType("image/jpeg");
		// 将生成的验证码生成为图片流
		BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(
				verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
		// 写给浏览器
		ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
	}
}
