<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/farm/farm.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>ext/farm/imgPosition.css">
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="<%=basePath%>ext/farm/helper.js?346t"></script>
	
	<style type="text/css">
		.panel{
			margin: auto;
		}
	</style>
</head>

<body>
	<table id="grid"></table>  
<script>
    var grid;
    $(document).ready(function () {
        grid = $('#grid').edatagrid({
            title: '用户列表',
            width: 1000,
            height: 530,
            method:'post',
            url: '<%=basePath%>user/findAll',
            border: false,                 
            rownumbers: true,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true, 
            striped: true,
            idField: "id",            
            columns: [[
                {field: 'id', title: 'ID', width: 50, sortable: true,align: 'center'},
                {field: 'username', title: '用户名', width: 100, align: 'center'},
                {field: 'userExp', title: '当前经验', width: 100, align: 'center'},
                {field: 'currentLevel', title: '当前等级', width: 100, align: 'center' },               
                {field: 'vipLevel', title: 'vip等级', width: 100, align: 'center' },               
                {field: 'point', title: '积分', width: 100, align: 'center' },               
            ]]
        });        
        grid.edatagrid("getPager").pagination({
            pageSize: 5,
            pageList: [5,10,15,20]
        });
    });    
</script>
</body>

</html>