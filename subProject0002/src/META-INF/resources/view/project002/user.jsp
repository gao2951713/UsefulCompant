<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'user.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=basePath %>resources0002/style/sayhello.css">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	这是在subProject0002.jar中的jsp文件
	<br> 这个图片文件同样来自该模块的jar
	<img alt="hp" src="<%=basePath%>resources0002/images/hp.gif">
	跳转到subProject0002.jar中的module2.jsp页面
	<a href="<%=basePath%>view/project002/module2.jsp">views/project002/module2.jsp这是subProject0002.jar包下的jsp页面</a>
	<br>
	<img alt="hp" src="<%=basePath%>resources0002/images/hp.gif">
	<div class="hello">这是一个测试页面，该页面主要测试在web片段中实现页面所需的JavaScript，图片资源，样式表资源的正确访问。以及页面间的servlet跳转。</div>
</body>
<script type="text/javascript" src="<%=basePath%>resources0002/js/sayhello.js"></script>
</html>
