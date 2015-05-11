package org.plugin.module0002.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="hello",urlPatterns="/hello")
public class Sample extends HttpServlet{
	
	private static final long serialVersionUID = -4248672330788996271L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println(req.getParameter("p"));
		req.getRequestDispatcher("project001/index.jsp").forward(req, resp);
	}
	
}
