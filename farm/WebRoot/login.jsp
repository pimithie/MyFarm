<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/imgPosition.css">
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script>
</head>
<style>
	 body{
            margin: 0px;
            background-image:url(<%=basePath%>images/background.png);
            background-size:100% 100%;
            background-repeat:no-repeat;
            background-color: transparent;
			border:none;
			width:100%;
			height:750px;
        }
        .combobox-item {
        	font-size: 12px;
        }
	</style>
<body>
	<div id="userBox" class="easyui-dialog" title="用户选择" iconCls="icon-man"style="width: 400px; height: 200px; padding: 10px 15px; overflow: hidden;"data-options="iconCls:'icon-man', minimizable:false,maxmizable:false,closable:false,collapsible:false" >
			 <table class='tbledit' style="table-layout:fixed" width="350"> 
		         <tr><td>当前用户:</td></tr>
		         <tr><td>
		         	<input id="user" class="easyui-combobox" name="language" style="width:350px"	data-options="
		         																editable: false,
																				url: '<%=basePath%>user/retrieveLoginInfo',
																				method: 'post',
																				valueField: 'userId',
																				textField: 'username',
																				panelWidth: 350,
																				panelHeight: 'auto',
																				formatter: formatItem">
					
					</td>
					<tr><td ><hr></td></tr>
		        </tr>
		        <tr>
		        	<td style="word-wrap:break-word;">请在下拉框中选择用户昵称,并点击"确认"按钮&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" style="width:50px;heigth:20px;" class="easyui-linkbutton"  onclick="login()">确认</a>设定当前用户信息。</td>
		        </tr>
			</table>
	</div>
	<script type="text/javascript">
		function formatItem(row) {
			var result = $("<div id=''>");
			var image =  $("<img id='userPic'>");
			var desc =  $("<span id='desc'>");
			result.css("height","32px");
			image.attr("src","<%=basePath%>images/upload/"+row.headPic);
			image.css("height","32px");
			desc.html("&nbsp;&nbsp;"+row.username+"&nbsp;|&nbsp;经验:"+row.userExp+"&nbsp;|&nbsp;金币:"+row.money+"&nbsp;|&nbsp;积分:"+row.point);
			desc.css("height","32px");
			desc.css("line-height","32px");
			desc.css("desplay","32px");
			desc.css("size","10px");
			result.append(image);
			result.append(desc);
			return result.prop("outerHTML");
		}
		
		function login() {
			var userId = $("#user").combobox("getValue");
			$.ajax({
				url: '<%=basePath%>user/login',
				data: 'userId='+userId,
				dataType: 'json',
				async: true,
				type: 'post',
				success: function (data) {
					 $.messager.alert({
		                  	title : '服务器消息',
		                  	msg : data.msg+"当前用户被设定为："+data.data.username,
		                  	fn:function(){
		                  		window.location.href = 'main.jsp';
		                  	}
		                 });
					$(window.parent.frames["menu"].document).find('#currentUsername').html(data.data.username);
					$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+data.data.userExp);
					$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+data.data.money);
					$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+data.data.point);
					$(window.parent.frames["menu"].document).find('#headPic').attr("src",'<%=basePath%>images/upload/'+data.data.headPic);
				}
			});
		}
	</script>
</body>
</html>