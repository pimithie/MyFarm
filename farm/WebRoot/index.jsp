<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>我的农场</title>
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
    <style>
        body {
            margin: 0px;           
        }
    </style>
</head>
<frameset id="container" rows="60,*,50" border="0">
	<frame src="menu.jsp" scrolling="no" name="menu" id="menu">
	<frame id="workspace" name="workspace" src="welcome.jsp" scrolling="no" width="100%">
	<frame id="footer" name="footer" src="tools.jsp" scrolling="no">	
</frameset>
</html>
