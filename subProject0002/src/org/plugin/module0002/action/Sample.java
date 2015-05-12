package org.plugin.module0002.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

@Controller
public class Sample {
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/dotestmodule2")
	@ResponseBody
	public void forword2Module2(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map models=new HashMap<>();
		System.out.println(req.getParameter("p"));
		 req.getRequestDispatcher("view/project002/module2.jsp").forward(req, resp);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/dotestmodule21")
	@ResponseBody
	public void forword2Module21(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//如果前台响应了forword2Module21这个方法，则在前台的backtoforce变量就会有内容显示。否则没有。
		req.setAttribute("backtoforce", "this is a message from background method value set!");
		System.out.println(req.getParameter("p"));
		 req.getRequestDispatcher("view/project002/module21.jsp").forward(req, resp);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/findUser")
	@ResponseBody
	public void forword2user(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map models=new HashMap<>();
		System.out.println(req.getParameter("p"));
		 req.getRequestDispatcher("view/project002/user.jsp").forward(req, resp);
	}
	
}
