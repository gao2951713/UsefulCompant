<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<c:if test="${!empty sysUser}">
   <div id="lside" class="col-sm-3 col-md-2 sidebar">
   <ul class="nav nav-sidebar menubar">
     <li class="article active"><a href="/system/article" target="mainframe">文章管理</a></li>
     <li class="article"><a href="/system/article" target="mainframe">calendar</a></li>
     <li class="article"><a href="/system/article" target="mainframe">地图</a></li>
   </ul>
   </div>
</c:if>
