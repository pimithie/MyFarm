<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单</title>
<style>
        body {
            margin: 0px;           
        }
        
        .bar{
        	background-image:url(images/topbar.png);        	
            background-size:25% 60px;
            background-repeat:repeat-x;            
        }
        
        .shadow{
        	-moz-box-shadow:2px 2px 5px #333333;
        	-webkit-box-shadow:2px 2px 5px #333333;
        	box-shadow:2px 2px 5px #333333;
        }
        
        .menu{
           margin: 3px 5px 5px 5px;
        }
        
        .logo{
        	position: relative;
        	right: 10px;
        }
    </style>
</head>
<body class="bar">
	<div width="100%">
		<div style="float: left; margin-left: 5px;margin-top: 5px; width: 200px;">
			<img id="headPic" src="images/upload/none.png" width="50px" height="50px" style="float: left;">
			<span id="currentUsername" style="float: right; color: #d5d00f; margin-right: 20%">未知用户</span>
			<br/>
			<span id="userInfo" style="float: right;color: white;background-color: #3aace5;border: 1px solid #3aace5;border-radius: 12px;">
				&nbsp;
				<font id='userExp' style="font-size: 12px;" color="#48d2f5">经验:0</font>
				<font id='userMoney' style="font-size: 12px;" color="#d3e998">金币:0</font>
				<font id='userPoint' style="font-size: 12px;" color="#c87e86">积分:0</font>
				&nbsp;
			</span>
		</div>
		
		<div style="float: right;">
		<a href="<%=basePath%>main.jsp" target="workspace"><img class="menu shadow" src="images/farmButton.png" width="50px" height="50px"></a>
		<a href="<%=basePath%>saleOfSeed/saleSeed.jsp" target="workspace"><img class="menu shadow" src="images/packet.png" width="50px" height="50px"></a>
		<a href="<%=basePath%>login.jsp" target="workspace"><img class="menu shadow" src="images/login.png" width="50px" height="50px"></a>
		<a href="<%=basePath%>user/list" target="workspace"><img class="menu shadow" src="images/user.png" width="50px" height="50px"></a>
		<a href="<%=basePath%>seed/grid" target="workspace"><img class="menu shadow" src="images/seedManager.png" width="50px"></a>
		</div>
	</div>
</body>
</html>