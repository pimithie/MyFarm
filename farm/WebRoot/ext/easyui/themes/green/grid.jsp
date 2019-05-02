<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script>    
</head>
<body>
<div id="controlBox">
    <span><font color="white">种子类别:</font>></span>
    <input id="genderSearch" class=" ">
    <a href="#" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
    <a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="javascript:grid.edatagrid('addRow')">添加</a>
    <a href="#" class="easyui-linkbutton c4" iconCls="icon-save" onclick="javascript:grid.edatagrid('saveRow')">保存</a>
    <a href="#" class="easyui-linkbutton c3" iconCls="icon-remove" onclick="javascript:grid.edatagrid('cancelRow')">取消</a>
    <a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
</div>
<table id="grid"></table>
<div id="msgBox"></div>
<div id="formStudentContainer" class="easyui-dialog" style="width:280px;height:300px;padding:10px 10px" closed="true" >
    <form id="formStudent" method="POST" novalidate>
        <table class='tbledit'>
            <tr>
                <td>ID：</td>
                <td><input name="id" required="true" class="IDbox" value="0"></td>
            </tr>
            <tr>
                <td>种子ID：</td>
                <td><input name="seedid" required="true" class="seedIDnumber"></td>
            </tr>
            <tr>
                <td>种子名称：</td>
                <td><input name="seedname" required="true" class="seednamebox"></td>
            </tr>
            <tr>
                <td>X季作物：</td>
                <td><input name="quarter" required="true" class="datebox"></td>
            </tr>
            <tr>
                <td>种子等级：</td>
                <td><input name="lever" required="true" class="leverbox"></td>
            </tr>
            <tr>
                <td>种子类型：</td>
                <td><input name="seedtype" required="true" class="seedtypebox"></td>
            </tr>
            <tr>
                <td>可获经验：</td>
                <td><input name="experience" required="true" class="experiencebox"></td>
            </tr>
            <tr>
                <td>每季成熟所需时间：</td>
                <td><input name="time" required="true" class="timebox"></td>
            </tr>
            <tr>
                <td>每季成熟可获收成：</td>
                <td><input name="crop" required="true" class="cropbox"></td>
            </tr>
            <tr>
                <td>种子采购价：</td>
                <td><input name="purchase-price" required="true" class="ppricebox"></td>
            </tr>
            <tr>
                <td>每个收获的果实单价：</td>
                <td><input name="price" required="true" class="pricebox"></td>
            </tr>
            <tr>
                <td>土地需求：</td>
                <td><input name="land" required="true" class="landbox"></td>
            </tr>
            <tr>
                <td>每季成熟可获积分：</td>
                <td><input name="integral" required="true" class="integralbox"></td>
            </tr>
            <tr>
                <td>显示信息：</td>
                <td><input name="message" required="true" class="messagebox"></td>
            </tr>
            <tr>
                <td>操作：</td>
                <td><input name="operate" required="true" class="operatebox"></td>
            </tr>
        </table>
    </form>
</div>

<script>
    var params = {
        id: '',
        mode: 'insert'
    };
    var grid;
    $(document).ready(function () {
        //配置表格
        grid = $('#grid').edatagrid({
            title: '种子清单',
            width : 1500,
            height: 500,
            fitColumns: true,
            method: 'post',
            url: '<%=basePath%>/farm/gridData',
            saveUrl: '<%=basePath%>/farm/save',
            updateUrl: '<%=basePath%>/farm/save',
            destroyUrl: '<%=basePath%>/farm/delete',
            border: false,
            rownumbers: true,
            remoteSort: true,
            nowrap: false,
            singleSelect: true,
            fitColumns: true,
            pagination: true,
            striped: true,
            autoSave: true,
            idField: "id",
            columns: [[
                {field: 'id', title: 'ID', width: 50, sortable: true,align: 'center', 
 
 halign: 'center'},
 
                {
                    field: 'seedid', title: '种子ID', width: 50,align: 'right', 
 
halign: 'center',
				editor: {
    						type: 'numberbox',
   							options: {
      					  	validType: 'length[1,3]',
        					invalidMessage: '可输入的最大值为999',
        					required: true
   						 }
}
				},
                {
                    field: 'seedname', title: '种子名称', width: 100, align: 'left', sortable: true, halign: 'center',
 
                    editor: {
                        type: 'validatebox',
                        options: {
                            validType: 'length[1,5]',
                            invalidMessage: '有效长度1-5',
                            required: true
                        }
                    }
                },
                {
                    field: 'quarter', title: 'X季作物', width: 100, align: 'right', halign: 'center', 
                    editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,2]',
    					invalidMessage: '可输入的最大值为99',
    					required: true
								 }
							}
                },
                {field: 'lever', title: '种子等级', width: 100,align: 'center', halign: 'center',
                	editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,2]',
    					invalidMessage: '可输入的最大值为99',
    					required: true
								 }
							}
                },
 
                {
                    field: 'seedtype', title: '种子类型', width: 100, align: 'center',halign: 'center'
                },
                {
                    field: 'experience', title: '可获经验', width: 100, align: 'center',halign: 'center',
                    editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,5]',
    					invalidMessage: '可输入的最大值为99999',
    					required: true
								 }
							}
                },
                {
                    field: 'time', title: '每季成熟所需时间', width: 100, align: 'center',halign: 'center',
                    editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,3]',
    					invalidMessage: '可输入的最大值为999',
    					required: true
								 }
							}
                },
                {
                    field: 'crop', title: '每季成熟可收获收成', width: 100, align: 'center',halign: 'center',
                    	 editor: {
     						type: 'numberbox',
     							options: {
       					  	validType: 'length[1,3]',
         					invalidMessage: '可输入的最大值为999',
         					required: true
     								 }
     							}
                },
                {
                    field: 'purchase-price', title: '种子采购价', width: 100, align: 'center',halign: 'center',
                    	 editor: {
     						type: 'numberbox',
     							options: {
       					  	validType: 'length[1,3]',
         					invalidMessage: '可输入的最大值为999',
         					required: true
     								 }
     							}
                },
                {
                    field: 'price', title: '每个收获的果实单价', width: 100, align: 'center',halign: 'center',
                    	 editor: {
     						type: 'numberbox',
     							options: {
       					  	validType: 'length[1,3]',
         					invalidMessage: '可输入的最大值为999',
         					required: true
     								 }
     							}
                },
                {
                    field: 'land', title: '土地需求', width: 100, align: 'center',halign: 'center',
                    	 editor: {
     						type: 'numberbox',
     							options: {
       					  	validType: 'length[1,2]',
         					invalidMessage: '可输入的最大值为99',
         					required: true
     								 }
     							}
                },
                {
                    field: 'integral', title: '每季成熟可获积分', width: 100, align: 'center',halign: 'center',
                    editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,3]',
    					invalidMessage: '可输入的最大值为999',
    					required: true
								 }
							}
                },
                {
                    field: 'message', title: '提示信息', width: 100, align: 'center',halign: 'center',
                    editor: {
						type: 'numberbox',
							options: {
  					  	validType: 'length[1,10]',
    					invalidMessage: '可输入的最大长度为10',
    					required: true
								 }
							}
                },
                {
                    field: 'operate', title: '操作', width: 100, align: 'center',halign: 'center',
              		formatter: function(value, row){
              			return '<a href="<%=basePath%>seed/grow"> <button>成长阶段</button></a>'
              		}
                },
            ]],
            destroyMsg: {
                norecord: {
                    title: '警告',
                    msg: '首先需要选中记录，然后在点击删除按钮'
                },
                confirm: {
                    title: '确认',
                    msg: '是否删除选中记录?'
                }
            },
            onSuccess: function (index, result) {
                console.log(result);
                $("#msgBox").text(result.msg);
            },
            onDestroy: function (index, result) {
                console.log(result);
                $("#msgBox").text(result.msg);
            }
        });
        grid.datagrid("getPager").pagination({
            pageSize: 5,
            pageList: [5, 10, 15, 20]
        });
    });
    function doSearch() {
        grid.datagrid("load", {
            gender: $("#genderSearch").val()
        });
    }
    
    function loadForm() {
        var row = grid.datagrid('getSelected');
        if (row) {
            params.id = row.id;
            params.mode = 'edit';
            $('#formStudentContainer').dialog('open').dialog('setTitle', '编辑数据');
            $('#formStudent').form('load', row);
        } else {
            alert("请先选择一行数据，然后再尝试点击操作按钮！");
        }
    }
    function saveForm() {
        $('#formStudent').form('submit', {
            url: '<%=basePath%>/student/save',
            onSubmit: function (param) {
                param.id = params.id;
                param.mode = params.mode;
                return $(this).form('validate');
            },
            success: function (result) {
                var result = eval('(' + result + ')');
                if (result.code == 0) {
                    $('#formStudentContainer').dialog('close');
                    grid.datagrid('reload');
                }
                $.messager.show({
                    title: "消息",
                    msg: result.msg
                });
            }
        });
    }
</script>
</body>
</html>