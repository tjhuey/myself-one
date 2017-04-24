package org.tjhuey.manager.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 定制HttpFilter 目的 省略不常用的方法。
 * @author huey
 *
 */
public abstract class HttpFilter implements Filter {

	private FilterConfig filterConfig;

	public FilterConfig getFilterConfig() {
		return filterConfig;
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		this.init();
	}

	//专门用来初始化时被重新的初始化的方法
	public void init() throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		this.doFilter(req, resp, chain);
	}

	public abstract void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException;

	@Override
	public void destroy() {
	}

}
