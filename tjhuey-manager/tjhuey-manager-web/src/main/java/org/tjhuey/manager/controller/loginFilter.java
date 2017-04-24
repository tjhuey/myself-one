package org.tjhuey.manager.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.tjhuey.manager.pojo.User;
/**
 * @author huey
 * 登录过滤
 */
public class loginFilter extends HttpFilter{

	
	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		if (user == null) {
			request.setAttribute("message", "该操作需要登录");
			request.getRequestDispatcher("/login.jsp?jsession="+UUID.randomUUID().toString()).forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

}
