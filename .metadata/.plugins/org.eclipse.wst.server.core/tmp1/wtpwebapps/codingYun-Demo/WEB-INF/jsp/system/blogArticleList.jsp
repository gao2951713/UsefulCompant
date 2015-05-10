<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="coding云博客首页，作为一个java程序员，coding云希望将自己懂得技术，包含但不限于nginx，tomcat，spring mvc，ssh等分享给大家。">
    <meta name="keywords" content="coding云,coding,java网站,spring mvc,阿里云,建站,java web网站,系统演示,java做的网站"/>
    <meta name="author" content="jack">
    <link rel="shortcut icon" href="${baseUrlStatic}/icon/favicon.png">
    <title>coding云博客首页</title>
    <!-- Bootstrap core CSS -->
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- 我们自己的css样式文件放在这里 -->
    <link href="${baseUrlStatic}/css/system/dashboard.css" rel="stylesheet">
     <style type="text/css">
		textarea {
			display: block;
		}
    </style>
  </head>
  <body>
  	<div id="contentDiv" class="">
          <ul id="contentUl" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active firstLi"><a href="#">课程管理</a></li>
		  </ul>
   		  <div id="listDiv" class="listDiv">
	          <div class="sub-header">
	          		<span id="periodTitle" class="title h2">课程管理</span>
					<button id="newArticleBtn" class="btn btn-primary btn-xs" type="button" style="float: right; margin-top: 4px;">
						<span style="font-size:15px;">新增课程</span>
					</button>
			  </div>
			  <form id="courseListForm" action="/system/article">
		          <div class="table-responsive">
		            <table class="table table-striped">
		              <thead>
		                <tr>
				            <th>文章title</th>
				            <th>阅读次数</th>
				            <th>分类</th>
				            <th>发表时间</th>
				            <th>作者</th>
				            <th class="text-center">操作</th>
			          	</tr>
		              </thead>
		              <tbody>
		                <c:forEach var="data" items="${articleList}" varStatus="status">
				        	<tr>
					            <td style="width: 20%;"><span class="ellipsis" title="test">${data.title}</span></td>
					            <td style="width: 15%;">${data.userReadCount}</td>
					            <td style="whdth: 15%;">${data.category}</td>
					            <fmt:formatDate var="publishTime" value="${data.publishTime}" pattern="yyyy-MM-dd " />
					            <td style="width: 15%;">${publishTime}</td>
					            <td style="width: 15%;">${data.author}</td>
					            <td class="text-center" style="width:20%;">
					            	<a href="javascript:" onclick="toUpdateArticle(${data.id})" >修改</a>
					            	<a href="javascript:" onclick="delArticleById(${data.id})" >删除</a>
		                        </td>
		                    </tr>
		                </c:forEach>
		              </tbody>
		            </table>
		          </div>
		          <jsp:include page="/WEB-INF/jsp/common/page.jsp" />
	         </form>   
	     </div> 
    </div>
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- 请首先引用jquery，再引用其他js文件 -->
    <!-- Placed at the end of the document so the pages load faster -->
<%--     <script type="text/javascript" src="${baseUrlStatic}/js/common/jquery-1.11.1.min.js"></script> --%>
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${baseUrlStatic}/js/common/commonFunc.js"></script>
    <script type="text/javascript" src="${baseUrlStatic}/kindeditor-4.1.7/kindeditor.js?ver=${version}"></script>
    <script type="text/javascript" src="${baseUrlStatic}/kindeditor-4.1.7/lang/zh_CN.js?ver=${version}"></script>
    <script type="text/javascript" src="${baseUrlStatic}/js/system/blogArticle.js?ver=${version}"></script>
  </body>
</html>
