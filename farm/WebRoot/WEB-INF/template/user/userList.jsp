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
		.operation{
			width:100px;
			border: none;
		}
		#FileUpLoad{
			margin-left: 15px;
			margin-right: 20px;
			background-color: #b3e9cd;
		}
		#save{
			background-color: #fdadab;
		}
	</style>
</head>

<body>
<div id="controlBox">
        <span style="color:white">姓名:</span>
        <input id="nameSearch"  class="easyui-textbox" data-options="iconCls:'icon-search'"  panelHeight="auto">
        <a href="#" class="easyui-linkbutton c1" iconCls="icon-search" 
onclick="doSearch()">查询</a>

        <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" 

onclick="javascript:grid.edatagrid('addRow')">添加</a>

        <a href="#" class="easyui-linkbutton c3" iconCls="icon-remove" 

onclick="javascript:grid.edatagrid('cancelRow')">取消</a>

        <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel"

onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
</div>
	<table id="grid"></table>
	<div id="dlg" class="easyui-dialog" closed="true" style="width:400px;height:200px;padding:10px">
		<form id="headPicUpLoad" method="post" enctype="multipart/form-data">
		<div style="margin-bottom:20px">
			<div>文件头像:</div>
			<input id="fileBox" class="easyui-filebox" name="headPic" data-options="prompt:'选择上传的文件...'" style="width:100%">
		</div>
		<div style="text-align: right;">
			<a id="uploadButton" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"  style="width:20%; margin-right:3%;">上传</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" style="width:20%;" onclick="javascript:$('#dlg').dialog('close')" >取消</a>
		</div>
		</form>
	</div>
<script>
    var grid;
    $(document).ready(function () {
        grid = $('#grid').edatagrid({
            title: '用户列表',
            width: 1000,
            height: 500,
            method:'post',
            url: '<%=basePath%>user/findAll',
            saveUrl: '<%=basePath%>user/save',
            updateUrl: '<%=basePath%>user/update',
            destroyUrl: '<%=basePath%>user/delete',
            border: false,                 
            rownumbers: false,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true, 
            striped: true,
            idField: "id",            
            columns: [[
                {field: 'id', title: 'ID', width: 50, sortable: true,align: 'center'},
                {field: 'headPic', title: '头像', width: 90, align: 'center',
                    formatter:function(value,row){
                     if(value==null || '' == value)value="none.png";
                      return '<img src="<%=basePath%>images/upload/'+value+'" width="90px">';
                    },
                    editor:{
                        type:'textbox',
                        options: {                         
                            validType:'length[1,100]',                            
                            invalidMessage:'有效长度1-100',
                        }
                }},
                {field: 'username', title: '用户名', width: 100, align: 'center',
                	editor:{
                        type:'validatebox',
                        options: {                         
                            validType:'length[1,10]',                            
                            invalidMessage:'有效长度1-5',
                            required:true
                        }
                }},
                {field: 'userExp', title: '当前经验', width: 70, align: 'center',
                	formatter:function(value,user){
                		var basic = '<img src="<%=basePath%>images/exp.png" width="20px">';
                		if(value==null)value="0";
                		return basic+value;
                	}
                },
                {field: 'money', title: '金币总量', width: 70, align: 'center',
                	formatter:function(value,user){
                		var basic = '<img src="<%=basePath%>images/gold.png" width="20px">';
                		if(value==null)value="0";
                		return basic+value+"个";
                	}
                },
                {field: 'currentLevel', title: '当前等级', width: 70, align: 'center',
                	formatter:function(value,user){
                		var basic = '<img src="<%=basePath%>images/level.png" width="20px">';
                		if(value==null)value="0";
                		return basic+value;
                	}
                },               
                {field: 'vipLevel', title: 'vip等级', width: 70, align: 'center',
                	formatter:function(value,user){
                		var basic = '<img src="<%=basePath%>images/vip.png" width="20px">';
                		if(value==null)value="0";
                		return basic+value;
                	}
                },               
                {field: 'point', title: '积分', width: 70, align: 'center',
                	formatter:function(value,user){
                		var basic = '<img src="<%=basePath%>images/point.png" width="20px">';
                		if(value==null)value="0";
                		return basic+value;
                	}
                },
                {field: 'operation',title:'操作',width: 210,align: 'center',
                	formatter:function(value,row,index){
                		return "<button id = 'FileUpLoad' class='operation' onClick=openFileUpLoadDialog("+index+");>头像上传</button>"+
                		"<button id = 'save' class='operation' onClick=saveHeadPic("+index+");>保存数据</button>";
                }}
            ]],
            destroyMsg:{
                norecord:{
                    title:'警告',
                    msg:'首先需要选中记录，然后在点击删除按钮'
                },
                confirm:{
                    title:'确认',
                    msg:'是否删除选中记录?'
                }
            },
            onSuccess:function(index,row){
                console.log(row);
                $.messager.show({
                	title:'服务器消息',
                	msg:row.msg,
                	timeout:600,
                	showType:'slide'
                });
                grid.datagrid('reload');
            },
            onDestroy:function(index,row){
                console.log(row);
                $.messager.show({
                	title:'服务器消息',
                	msg:row.msg,
                	timeout:600,
                	showType:'slide'
                });
                grid.datagrid('reload');
            }
        });        
        grid.edatagrid("getPager").pagination({
            pageSize: 5,
            pageList: [5,10,15,20]
        });
    });   
    function openFileUpLoadDialog(index){
    	$("#uploadButton").click(function(){
    		upload(index);
    	});
        $("#dlg").dialog('open').dialog('setTitle','上传头像');
    }
    function upload(index){
        $("#headPicUpLoad").form("submit",{
        	url:'<%=basePath%>user/fileUpLoad',
        	success: function (responseText){
        		 var result = eval('(' + responseText + ')');
        		 $.messager.show({
                 	title : '服务器消息',
                 	msg : result.msg,
                 	timeout: 600,
                 	showType:'slide'
                 });
        		 $('#grid').datagrid('beginEdit', index);
        		 var ed = $('#grid').datagrid('getEditor', {index:index,field:'headPic'});
        		 $(ed.target).textbox('setValue', result.data);
        		 $('#grid').datagrid('endEdit', index);
        		 $("#dlg").dialog("close");
        	}
        });
    }
    function saveHeadPic(index){
    	var row = $('#grid').datagrid('getRows')[index];
    	$.ajax({
    		async: true,
    		url:'<%=basePath%>user/update',
    		type:'post',
    		data:row,
    		contentType:"application/x-www-form-urlencoded",
    		dataType:'json',
    		success: function(result){
    			console.log(result);
    			 $.messager.show({
                  	title : '服务器消息',
                  	msg : result.msg,
                  	timeout: 600,
                  	showType:'slide'
                 });
    		}
    	});
    }
    function doSearch(){
    	var username = $("#nameSearch").val();
    	var queryParams = grid.datagrid("options").queryParams;
    	queryParams.username = username;
    	grid.datagrid('reload');
    }
</script>
</body>

</html>