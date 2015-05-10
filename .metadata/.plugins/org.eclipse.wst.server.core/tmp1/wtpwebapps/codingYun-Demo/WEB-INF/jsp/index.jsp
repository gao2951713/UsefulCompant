<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="coding云的java网站，作为一个java程序员，coding云希望将自己懂得技术，包含但不限于nginx，tomcat，spring mvc，ssh等分享给大家。"/>
    <meta name="author" content="coding云"/>
    <meta name="keywords" content="coding云,coding,java网站,spring mvc,阿里云,建站,java web网站,系统演示,java做的网站"/>
    <link rel="apple-touch-icon-precomposed" href="http://system.yingshibao.com/userDirectory/resource-file/user/image/Coding.png">
	<link rel="shortcut icon" href="http://system.yingshibao.com/userDirectory/resource-file/user/image/Coding.png">

    <title>coding云</title>

    <!-- Bootstrap core CSS -->
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/static/css/blog/blog.css" rel="stylesheet">
    <link href="/static/css/main/carousel.css" rel="stylesheet">
    <link href="/static/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet">
  </head>
  <body class="post-template page">

  <jsp:include page="common/topHeader.jsp" />

   <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
<!--       <ol class="carousel-indicators"> -->
<!--         <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!--         <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!--         <li data-target="#myCarousel" data-slide-to="2"></li> -->
<!--       </ol> -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <div class="container">
            <div class="carousel-caption">
<!-- 	          <img style="height: 300px;padding-top: 50px;" src="http://system.yingshibao.com/userDirectory/resource-file/user/image/Coding.png" alt="First slide"> -->
<!--               <h1>Example headline.</h1> -->
              <h1 style="color:black;font-size: 80px;">Coding云</h1>
			  <h3 style="color:black;">一个跑在tomcat上的java web网站</h3>
              <p>Coding云将java web开发中常见的各个模块都写成具体的案例，通过技术文章介绍源码，辅以系统演示（由用户亲手体验），让大家不仅看到文字方面的教程，而且能够从实际操作中体会这些模块的实现，进而提升自己的编码能力.</p>
<!--               <p>Note: If you're viewing this page via a <code>file://</code>  rules.</p> -->
              <p><a class="btn btn-lg btn-primary" href="/demo/upload" role="button">在线功能演示</a></p>
            </div>
          </div>
        </div>
<!--         <div class="item"> -->
<!--           <img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide"> -->
<!--           <div class="container"> -->
<!--             <div class="carousel-caption"> -->
<!--               <h1>Another example headline.</h1> -->
<!--               <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> -->
<!--               <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="item"> -->
<!--           <img src="data:image/gif;base64,R0lGODlhAQABAIAAAFVVVQAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide"> -->
<!--           <div class="container"> -->
<!--             <div class="carousel-caption"> -->
<!--               <h1>One more for good measure.</h1> -->
<!--               <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> -->
<!--               <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row">
        <div class="col-lg-4">
<!--           <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;"> -->
          <p style="font-size: 35px;"><i class="icon-laptop icon-4x"></i></p>
          <h2>前台技术</h2>
          <div style="height:120px;">
	          <p style="padding:10px;">Coding云用的是非常出名的Bootstrap前端开发框架，Bootstrap 是最受欢迎的 HTML、CSS 和 JS 框架，用于开发响应式布局、移动设备优先的 WEB 项目</p>
          </div>
          <p><a class="btn btn-default" target="_black" href="http://www.bootcss.com/" role="button">详细内容 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p style="font-size: 35px;"><i class="icon-hdd icon-4x"></i></p>
<!--           <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;"> -->
          <h2>后台技术</h2>
          <div style="height:120px;">
	          <p style="padding:10px;">Coding云是部署在阿里云服务器上的，省事、省心、安全。该站点是Ubuntu 12.04 64位操作系统，集成软件：JDK1.7.0、Nginx1.6.0、MySQL5.5.37、Tomcat7.0.54</p>
          </div>
          <p><a class="btn btn-default" href="#" role="button">详细内容 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <p style="font-size: 35px;"><i class="icon-briefcase icon-4x"></i></p>
<!--           <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style="width: 140px; height: 140px;"> -->
          <h2>相关技术</h2>
          <div style="height:120px;">
         	  <p style="padding:10px;">包括但不限于java基础、spring mvc框架、javascript、ajax、一些前台控件（日历选择控件、文本编辑控件等），以及jsp相关的知识</p>
          </div>
          <p><a class="btn btn-default" href="#" role="button">详细内容 &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


      <!-- START THE FEATURETTES -->

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">适合java程序员. 
          <br>
          <span class="text-muted">专注java web系统开发.</span></h2>
          <p class="lead">本站专注于帮助java程序员进阶，非java程序员的朋友，本站可能不适合您.</p>
        </div>
        <div class="col-md-5">
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-5">
        </div>
        <div class="col-md-7">
          <h2 class="featurette-heading">系统功能实操. 
          <br>
          <span class="text-muted">Do it by yourself.</span></h2>
          <p class="lead">有在线模拟系统供操作参考，辅助以源码博客讲解，让您理论+实操，提升编码技能，解决实际问题.</p>
        </div>
      </div>

      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h2 class="featurette-heading">本站需要您的资助. 
          <br>
          <span class="text-muted">Thanks.</span></h2>
          <p class="lead">本站购买的阿里云服务器为您提供服务，完全出于作者奉献的精神，如果您能给与一定的经济支持，我们将不胜感激。
          我们会用您的资助购买更好的硬件服务+带宽服务，以此来给您提供更好的服务.</p>
          <p class="lead">
          请到<a href="http://www.codingyun.com/about/about.html">关于页面</a>联系我们。</p>
        </div>
        <div class="col-md-5">
        </div>
      </div>
      <!-- google ads -->
      
	  <!-- google ads end-->
      <!-- /END THE FEATURETTES -->
    </div><!-- /.container -->

<jsp:include page="common/footerSideBar.jsp" />

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#left-sidebar .left-group-list").find('a').removeClass('active');
// 	var demoType = "${demoType}";
	$('#left-sidebar .left-group-list .${demoType}').addClass('active');
});
</script>

</body>
</html>

