<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<style type="text/css">
		#left {
			float: left;
			margin-top: 10px;
			margin-left: 10%;
		}
		#right {
			float: right;
			margin-top: 10px;
			margin-right: 10%;
		}
		.infoContainer {
			float: left;
			text-align: center;
			margin: auto 50px;
		}
		p {
			width:50px;
			background-color: red;
			border-radius: 50px;
			color: white;
			margin: 10px auto;
		}
	</style>
</head>
<body>
	<div style="width: 100%;height: 150px">
		<a><img id="left" width="100px" height="100px" src="<%=basePath%>images/left.png"></a>
		<div id="userAssetInfo"></div>
		<a><img id="right" width="100px" height="100px" src="<%=basePath%>images/right.png"></a>
	</div>
</body>
</html>