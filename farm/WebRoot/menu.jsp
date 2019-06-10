<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
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
		<div style="float: left; margin-left: 5px;margin-top: 5px; width: 400px;">
			<img id="headPic" src="images/upload/none.png" width="50px" height="50px" style="float: left;">
			<span id="currentUsername" style="float: left; color: #d5d00f; margin-left: 5%">未知用户</span>
			<br/>
			<span id="userInfo" style="margin-right:135px;width:200px; float: right;color: white;background-color: #3aace5;border: 1px solid #3aace5;border-radius: 12px;">
				&nbsp;
				<span id='userExp' style="font-size: 12px;margin-left: 2px;color:#48d2f5;" >经验:0</span>
				<span id='userMoney' style="font-size: 12px;margin-left: 2px;color:#d3e998;" >金币:0</span>
				<span id='userPoint' style="font-size: 12px;margin-left: 2px;color:#c87e86;" >积分:0</span>
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
<script type="text/javascript">

	$(document).ready(function () {
		$.ajax({
			url: '<%=basePath%>user/getCurrentUser',
			dataType: 'json',
			async: true,
			type: 'post',
			success: function (data) {
				if (data.code == 200) {
					$(window.parent.frames["menu"].document).find('#currentUsername').html(data.data.username);
					$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+data.data.userExp);
					$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+data.data.money);
					$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+data.data.point);
					$(window.parent.frames["menu"].document).find('#headPic').attr("src",'<%=basePath%>images/upload/'+data.data.headPic);
				}
			}
		});
	});



</script>
</html>