<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title>this is a test page for sub module</title>
	</head>
	<body>
	<h1> :) module2 access successful !</h1>
	<p>@RequestMapping("/dotestmodule2")
	@ResponseBody
	public void forword2Module2(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map models=new HashMap<>();
		System.out.println(req.getParameter("p"));
		 req.getRequestDispatcher("view/project002/module2.jsp").forward(req, resp);
	}</p>
	</body>
</html>