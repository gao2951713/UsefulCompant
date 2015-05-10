/*=======================================*/
/*	登陆功能的js                           */
/*	@author coding云                        */
/*	2014-9-23 21:28:24                         */
/*=======================================*/

$(document).ready(function(){
	$("#loginBtn").on('click',function(){
		login();
    });
	// 按回车执行查询
	$("#userName").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
//			$("#loginForm").submit();
			login();
		} // 回车键的键值为13
	}); 
	$("#userPass").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			login();
		} // 回车键的键值为13
	}); 
	$("#authCode").on("keypress", function(){
		var event = arguments.callee.caller.arguments[0]||window.event;//消除浏览器差异 
		if (event.keyCode == 13) {
			login();
		} // 回车键的键值为13
	}); 
	randomImg();   //加载页面时生成验证码
});

function login(){
// 			var datasent = {"userName":"王test","userPass":"admin","userEmail":"wangyong@qq.com"};
	var btn = $("#loginBtn");
    btn.button('loading');
	var datasent = $("#loginForm").serializeObject();
	params = JSON.stringify(datasent); 
	$.ajax({
		type : "POST",
		url : "/system/login/loginCheck",
		dataType : "json",
		contentType : "application/json;charset=utf-8",
		data : params,
		async : false,
		success : function(data) {
			if(data.resultCode == 0){   //登录成功
				window.location.href="/system";
			}else{
				randomImg();   //加载页面时生成验证码
				alert(data.resultMessage);
			}
			btn.button('reset');
		}
	});
}

function randomImg() {
	var random = new Date().getTime();
	$("#randomString").val(random);
	$("#authCodeImg").attr("src", "/valid/image/getValidImage?type=syslogin&randomString="+random);
}
