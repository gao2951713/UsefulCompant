<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="description" content="coding云后台管理系统">
	    <meta name="author" content="jack">
	    <link rel="shortcut icon" href="${baseUrlStatic}/icon/favicon.png">
	    <title>coding云后台管理系统登录</title>
	    <!-- Bootstrap core CSS -->
	    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
	    <!-- 我们自己的css样式文件放在这里 -->
	    <link href="${baseUrlStatic}/css/system/login.css" rel="stylesheet">
	    <link href="${baseUrlStatic}/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
    	<style>
    		.form-actions {
			    background-color: #f5f5f5;
			    border-top: 1px solid #e5e5e5;
			    margin-bottom: 20px;
			    margin-top: 20px;
			}
    	</style>
    <body>
        <div id="logo">
            <img src="${baseUrlStatic}/img/codingyun.png" alt="" />
        </div>
        <div id="loginbox">            
            <form id="loginForm" class="form-vertical"/>
            	<input type="hidden" name="randomString" id="randomString" value=""/>
				<input type="hidden" name="type" id="type" value="syslogin"/>
				<p>请输入用户名以及密码后登录.</p>
                <div class="form-group">
                    <div class="input-group" style="margin-left: 80px;">
					    <span class="input-group-addon"><i class="icon-user"></i></span>
					    <input type="text" class="form-control" name="userName" id="userName" placeholder="请输入用户名" style="width:206px;display: inline;">
					</div>
                </div>
                <div class="form-group">
                    <div class="input-group" style="margin-left: 80px;">
					    <span class="input-group-addon"><i class="icon-lock"></i></span>
					    <input type="password" class="form-control" name="userPass" id="userPass" placeholder="请输入密码" style="width:206px;display: inline;">
					</div>
                </div>
                <div class="form-group">
                    <div class="input-group" style="margin-left: 80px;">
					    <span class="input-group-addon"><i class="icon-lock"></i></span>
					    <input type="text" class="form-control" name="authCode" id="authCode" placeholder="请输入验证码" style="width:123px;display: inline;">
	                    <img id="authCodeImg" class="yanzheng" alt="验证码" src=""  width="0" height="0" onclick="randomImg()" 
	                    	style="margin-left: -20px;margin-top: 5px;height: 22px;width: 66px;"/>
                    	<span style="font-size: 12px;"><a class="" href="javascript:;" onclick="randomImg()" >点击换一张</a></span>
					</div>
                </div>
                <div class="form-actions">
                    <span class="pull-right">
                    	<button id="loginBtn" data-loading-text="登录中..." class="btn btn-primary btn-sm" type="button" style="background-color: #363636;">登录</button>
                   	</span>
                </div>
            </form>
        </div>
        
        <!-- Bootstrap core JavaScript
	    ================================================== -->
	    <!-- 请首先引用jquery，再引用其他js文件 -->
	    <!-- Placed at the end of the document so the pages load faster -->
	    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	    <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="${baseUrlStatic}/js/common/commonFunc.js"></script>
	    <script type="text/javascript" src="${baseUrlStatic}/js/system/login.js"></script>
    </body>
</html>

