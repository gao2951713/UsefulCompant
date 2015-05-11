<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title>this is a test page for sub module</title>
	</head>
	<body>
	<h1> :) module21 access successful !</h1>
	<p>@SuppressWarnings("unchecked")
	@RequestMapping("/dotestmodule21")
	@ResponseBody
	public void forword2Module21(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map models=new HashMap<>();
		System.out.println(req.getParameter("p"));
		 req.getRequestDispatcher("view/project002/module21.jsp").forward(req, resp);
	}
	</p>
	<h3>今天测试发现采用serverlet跳转不灵活，但用springMVC标签在web fragment中跳转页面失败。因此，采用上述写法，利用springMVC注解加上servlet请求实现<br>
	在web fragment中实现前后台的指定跳转</h3>
	</body>
</html>