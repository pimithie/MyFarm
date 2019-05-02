<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>

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
		<script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN1.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script>
	</head>

	<body>
		<div id="controlBox">
			<input id="seedName" class="easyui-textbox" panelHeight="auto" data-options="editable:true,
                                    url:'/farm/seed/data'">
			<a href="#" class="easyui-linkbutton c1" iconCls="icon-search" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton c2" iconCls="icon-add" onclick="loadAddForm()">添加</a>
			<a href="#" class="easyui-linkbutton c4" iconCls="icon-save" onclick="javascript:grid.edatagrid('saveRow')">保存</a>
			<a href="#" class="easyui-linkbutton c3" iconCls="icon-remove" onclick="javascript:grid.edatagrid('cancelRow')">取消</a>
			<a href="#" class="easyui-linkbutton c5" iconCls="icon-cancel" onclick="javascript:grid.edatagrid('destroyRow')">删除</a>
		</div>
		<table id="grid"></table>
		<div id="msgBox"></div>
		<div id="formSeedContainer" class="easyui-dialog" style="width:400px;height:500px;padding:10px 10px;padding-bottom:50px;" closed="true" buttons="#formSeedButtons">
			<form id="formSeed" method="POST" novalidate>
				<table class='tbledit'>
					<tr>
						<td>种子ID</td>
						<td><input name="id" required="true" class="easyui-validatebox" readonly="readonly"></td>
					</tr>
					<tr>
						<td>种子名称</td>
						<td><input name="seedName" required="true" class="easyui-validatebox"></td>
					</tr>
					<tr>
						<td>X季作物</td>
						<td><input name="xSeason" required="true" class="easyui-numberbox ">季作物</td>
					</tr>
					<tr>
						<td>种子等级</td>
						<td><input name="seedLevel" required="true" class="easyui-numberbox ">级作物</td>
					</tr>
					<tr>
						<!-- 下拉框无数据 -->
						<td>种子类型</td>
						<td><input id="seedType"  name="seedTypeId" required="true" class="easyui-combobox" panelHeight="auto" data-options="editable:false,
                                    valueField:'key',
                                    textField:'value',
                                    data:seedTypeInit()"></td>
					</tr>
					<tr>
						<td>可获经验</td>
						<td><input name="exp" required="true" class="easyui-numberbox "></td>
					</tr>
					<tr>
						<td>每季成熟所需时间</td>
						<td><input name="matureTime" required="true" class="easyui-numberbox ">秒</td>
					</tr>
					<tr>
						<td>每季成熟可收获个数</td>
						<td><input name="fruitNum" required="true" class="easyui-numberbox "></td>
					</tr>
					<tr>
						<td>种子采购价</td>
						<td><input name="seedPrice" required="true" class="easyui-numberbox ">金币</td>
					</tr>
					<tr>
						<td>每个成熟的果实价格</td>
						<td><input name="fruitPrice" required="true" class="easyui-numberbox ">金币</td>
					</tr>
					<tr>
						<!-- 下拉框无数据 -->
						<td>土地需求</td>
						<td><input name="landTypeId" required="true" class="easyui-combobox" panelHeight="auto" data-options="editable:false,
                                    valueField:'key',
                                    textField:'value',
                                    data:landTypeInit()"></td>
					</tr>
					<tr>
						<td>每季成熟可获积分</td>
						<td><input name="integration" required="true" class="easyui-numberbox ">分</td>
					</tr>
					<tr>
						<td>提示信息</td>
						<td><input name="promptMessage" required="true" class="easyui-validatebox"></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="formSeedButtons">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveForm()">保存</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formSeedContainer').dialog('close')">取消</a>
		</div>
		<!--生长阶段的导航栏-->
		<div id="controlBox1" class="easyui-dialog" style="width:1000px;height:450px;padding:20px 20px;overflow:hidden;" closed="true" >
		       <table class='tbledit' >
		        
		           <tr>
		           <td><a href="#" class="easyui-linkbutton " iconCls="icon-add" onclick="GrowthAdd()">添加</a></td>
		             <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" onclick="GrowthloadForm()">编辑</a></td>
		             <td><a href="#" class="easyui-linkbutton " iconCls="icon-save" onclick="javascript:grid2.edatagrid('saveRow')">保存</a></td>
		          <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:grid2.edatagrid('cancelRow')">取消</a></td>
		            <td><a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:grid2.edatagrid('destroyRow')">删除</a></td>        
		           </tr>  
		        </table>
		         <table  id="grid2" ></table>
		    
		</div>
		<!--生长阶段修改编辑表-->
		<div id="formCropContainer" class="easyui-dialog" style="width:800px;height:450px;padding:20px 20px;overflow:hidden;" closed="true" buttons="#formCropButtons">
		    <form id="formCropState" method="POST" novalidate>
		        <table class='tbledit' >
		            <tr>
		                <td>ID：</td>
		                <td><input name="id" required="true" class="w200" value="0" readonly="readonly" id="growthID"></td>
		                
		                 <td>种子ID：</td>
		                <td><input name="seedId" required="true" class="easyui-validatebox w1024" id="seedId" readonly="readonly"></td>
		            </tr>
		            
		            
		            <tr>
		                <td>生长阶段：</td>
		                <td><input name="growPeriod" required="true" class="easyui-validatebox w1024"></td>
		                
		                <td>生长阶段标题：</td>
		                <td><input name="growPeriodTitle" required="true" class="easyui-validatebox "></td>
		            </tr>
		            <tr>
		                
		                
		                  <td>阶段生长时间：</td>
		                <td><input name="growPeriodTime" required="true" class="easyui-validatebox "></td>
		                
		                 <td>生虫概率：</td>
		                <td><input name="wormProbability" required="true" class="easyui-validatebox"></td>
		            </tr>
		            
		             <tr>
		               <td>图片宽度：</td>
		                <td><input name="imgWidth" required="true" class="easyui-validatebox" id="width"></td>
		                
		                <td>图片高度：</td>
		                <td><input name="imgHeight" required="true" class="easyui-validatebox" id="height"></td>
		            </tr>
		            
		             <tr>
		                <td>图片offsetX：</td>
		                <td><input name="offsetX" required="true" class="easyui-validatebox " id="offsetX"></td>
		                
		                 <td>图片offsetY：</td>
		                <td><input name="offsetY" required="true" class="easyui-validatebox" id="offsetY"></td>
		            </tr>
		             
		             <tr>
		        
		                 <td>作物状态：</td>
		                <td><input name="growStateId" required="true" class="easyui-combobox" panelHeight="auto"
		                           data-options="editable:false,
		                                    valueField:'key',
		                                    textField:'value',
		                                    data:initGrowStateData()"></td>  
		                <td><a href="#" class="easyui-linkbutton " iconCls="icon-blank" onclick="setImagePostion()">编辑图片位置</a></td>
		            </tr>
		              
		        </table>
		    </form>
		</div>
		<div id="formCropButtons">
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="GrowthStatesaveForm()">保存</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#formCropContainer').dialog('close')">取消</a>
		</div>
		
		<!--编辑图片位置的弹窗-->
		<div id="positionDialog" class="easyui-dialog" style="width:240px;height:420px;padding:10px 10px" closed="true" buttons="#positionDialogButtons">
		    <div id="tools-imagePositioner-display" class="tools-imagePositioner-display">
		       <img class="easyui-draggable easyui-resizable" id="positionImg" src="">
		    </div>
		</div> 
		<div id="positionDialogButtons">
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="gainPostion()">确定</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#positionDialog').dialog('close')">取消</a>
		</div>
		<script>
			var params = {
				id: '',
				mode: 'insert'
			};
			var grid;
			var id;
			
			var growthId;

//			生长阶段表格
			var grid2;
			$(document).ready(function() {
				//配置表格
				grid = $('#grid').edatagrid({
					title: '种子信息',
					width: 1410,
					height: 500,
					method: 'post',
					url: '<%=basePath%>seed/find',
					saveUrl: '<%=basePath%>seed/save',
					updateUrl: '<%=basePath%>seed/update',
					destroyUrl: '<%=basePath%>seed/delete',
					toolbar: [{
						iconCls: 'icon-edit',
						handler: function() {
							loadExitForm();
						}
					}, '-', {
						iconCls: 'icon-help',
						handler: function() {
							alert('可以把需要的帮助信息放在本function中调用显示');
						}
					}],
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
					columns: [
						[{
								field: 'id',
								title: 'ID',
								width: 70,
								sortable: true,
								align: 'center',
								halign: 'center'
							},

							{
								field: 'seedId',
								title: '种子ID',
								width: 70,
								align: 'right',
								halign: 'center',
								editor: {
									type: 'validatebox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedName',
								title: '种子名称',
								width: 100,
								align: 'left',
								sortable: true,
								halign: 'center',

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
								field: 'quarter',
								title: 'X季作物',
								width: 100,
								align: 'center',
								halign: 'center',

								formatter: function(value, row) {
								
									return value + '季作物';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedLevel',
								title: '种子等级',
								width: 100,
								align: 'left',
								halign: 'center',

								formatter: function(value, row) {
									return value + '级作物';
								},
								editor: {
									type: 'numberbox',
									options: {
				
										required: true
									}
								}
							},
							{
								field: 'seedType',
								title: '种子类型',
								width: 80,
								align: 'center',
								sortable: true,
								halign: 'center',

								editor: {
									type: 'combobox',
									options: {
										valueField: 'key',
										textField: 'value',
										data: seedTypeInit(),
										panelHeight: 'auto',
										required: true
									}
								},
								formatter: function(value, row) {
									return value + '类型';
								}
							},
							{
								field: 'harvestExp',
								title: '可获经验',
								width: 100,
								align: 'left',
								halign: 'center',

								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'timePerQuarter',
								title: '每季成熟时间',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '秒';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'harvestNum',
								title: '每季可收获个数',
								width: 100,
								align: 'left',
								halign: 'center',
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedPrice',
								title: '种子采购价',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '金币';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'profitPerFruit',
								title: '每个果实价格',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '金币';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'landType',
								title: '土地需求',
								width: 100,
								align: 'center',
								halign: 'center',

								editor: {
									type: 'combobox',
									options: {
										valueField: 'key',
										textField: 'value',
										data:landTypeInit(),
										panelHeight: 'auto',
										required: true
									}
								},
								formatter: function(value, row) {
									return value ;
								}
							},
							{
								field: 'pointPerQuarter',
								title: '每季可获积分',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '分';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'promptMessage',
								title: '提示信息',
								width: 100,
								align: 'left',
								sortable: true,
								halign: 'center',

								editor: {
									type: 'validatebox',
									options: {
										validType: 'length[1,100]',
										invalidMessage: '有效长度1-100',
										required: true
									}
								}
							},
							{
		                    field: 'operate', title: '操作', width: 100, align: 'center', halign: 'center',
		                    formatter: function (value, row,index) {
		                        
		                        return '<button onclick="growth()">成长阶段 </button>'; 
		                    }
                    
                },

						]
					],
					onSave:function(index,row){
				        alert("系统消息","保存成功"+row.name);
			        },
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
					onSuccess: function(index, result) {
						console.log(index);
						console.log(result);
						$("#msgBox").text(result.msg);
					},
					onDestroy: function(index, result) {
						console.log(result);
						$("#msgBox").text(result.msg);
					},
					onAfterEdit:function(index,data,changes){
						  $.post(
								""	  
						  );
					}
				});
				grid.datagrid("getPager").pagination({
					pageSize: 10,
					pageList: [5, 10, 15, 20]
				});
				
				
			});

			//模糊查询
			function doSearch() {
//				alert($("#keySearch").val());
				grid.datagrid({
					title: '种子信息',
					width: 1520,
					height: 500,
					method: 'post',
					url: '<%=basePath%>seed/findBySeedName?seedName='+$("#seedName").val(),
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
					columns: [
						[{
								field: 'id',
								title: 'ID',
								width: 70,
								sortable: true,
								align: 'center',
								halign: 'center'
							},

							{
								field: 'id',
								title: '种子ID',
								width: 70,
								align: 'right',
								halign: 'center',
								editor: {
									type: 'validatebox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedName',
								title: '种子名称',
								width: 100,
								align: 'left',
								sortable: true,
								halign: 'center',

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
								field: 'xSeason',
								title: 'X季作物',
								width: 100,
								align: 'center',
								halign: 'center',

								formatter: function(value, row) {
								
									return value + '季作物';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedLevel',
								title: '种子等级',
								width: 100,
								align: 'left',
								halign: 'center',

								formatter: function(value, row) {
									return value + '级作物';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedTypeName',
								title: '种子类型',
								width: 80,
								align: 'center',
								sortable: true,
								halign: 'center',

								editor: {
									type: 'combobox',
									options: {
										valueField: 'key',
										textField: 'value',
										data: seedTypeInit(),
										panelHeight: 'auto',
										required: true
									}
								},
								formatter: function(value, row) {
									return value + '类型';
								}
							},
							{
								field: 'exp',
								title: '可获经验',
								width: 100,
								align: 'left',
								halign: 'center',

								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'matureTime',
								title: '每季成熟所需时间',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '秒';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'fruitNum',
								title: '每季成熟可收获个数',
								width: 100,
								align: 'left',
								halign: 'center',
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'seedPrice',
								title: '种子采购价',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '金币';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'fruitPrice',
								title: '每个收获的果实价格',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '金币';
								},
								editor: {
									type: 'numberbox',
									options: {
										required: true
									}
								}
							},
							{
								field: 'landTypeName',
								title: '土地需求',
								width: 100,
								align: 'center',
								halign: 'center',

								editor: {
									type: 'combobox',
									options: {
										valueField: 'key',
										textField: 'value',
										data:landTypeInit(),
										panelHeight: 'auto',
										required: true
									}
								},
								formatter: function(value, row) {
									return value ;
								}
							},
							{
								field: 'integration',
								title: '每季成熟可获积分',
								width: 100,
								align: 'center',
								halign: 'center',
								formatter: function(value, row) {
									return value + '分';
								},
								editor: {
									type: 'numberbox',
									options: {
										precision: 1,
										required: true
									}
								}
							},
							{
								field: 'promptMessage',
								title: '提示信息',
								width: 100,
								align: 'left',
								sortable: true,
								halign: 'center',

								editor: {
									type: 'validatebox',
									options: {
										validType: 'length[1,100]',
										invalidMessage: '有效长度1-100',
										required: true
									}
								}
							},
							{
								field: 'operate',
								title: '操作',
								width: 100,
								align: 'left',
								halign: 'center',

								editor: {
									type: 'validatebox',
									options: {
										required: true
									}
								}
							},

						]
					],
					onSuccess: function(index, result) {
						console.log(index);
						console.log(result);
						$("#msgBox").text(result.msg);
					}
				});
			}
            //	当点击成长阶段按钮时触发这个函数，生成成长阶段表	
			function growth(){
			    var obj = event.srcElement ? event.srcElement : event.target; 
			    id=$(obj).parent().parent().parent().children("td").eq(1).children("div").html()
		    	
		    	$('#controlBox1').dialog('open').dialog('setTitle', '编辑成长阶段');
		    	
		    	
		    	
		    	 grid2 = $('#grid2').edatagrid({
		            title: '成长阶段定义',
		            width:950,
		            height: 565,
		            method: 'post',
		            url:'<%=basePath%>growStage/growthData',
		            saveUrl: '<%=basePath%>growStage/save',
		            updateUrl: '<%=basePath%>growStage/update',
		            destroyUrl: '<%=basePath%>growStage/delete',
		            queryParams:{ 
						seedId:id 
					},
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
		                {field: 'id', title: 'ID', width: 70, align: 'center',  halign: 'center'},
		                {field: 'seedId', title: '种子ID', width: 70, align: 'center',    halign: 'center',
						     editor: {
						         type: 'validatebox',
						         options: {
						             validType: 'length[0,1024]',
						             invalidMessage: '有效长度0-1024',
						             required: true
						         }
						     }
		                },
		                {
		                    field: 'growPeriod', title: '生长阶段', width: 100, align: 'center',sortable: true,   halign: 'center',
		
		                   
		                    editor: {
		                        type: 'validatebox',
		                        options: {
		                            
		                            required: true
		                        }
		                    }
		                },
		                {
		                    field: 'growPeriodTitle', title: '阶段标题', width: 100, align: 'center', sortable: true, halign: 'center',                 
		                    editor: {
		                        type: 'validatebox',
		                        options: {
		                            
		                            required: true
		                        }
		                    }
		                },
		                {
		                    field: 'growPeriodTime', title: '生长时间', width: 100, align: 'center', sortable: true, halign: 'center',
		
		                    formatter: function (value, row) {
		                        return value + '秒';
		                    },
		                    editor: {type: 'numberbox', options: { required: true}}
		                },
		                {
		                    field: 'wormProbability', title: '生虫概率', width: 100, align: 'center', sortable: true, halign: 'center',  
		                    
		                    editor: {type: 'numberbox', options: {precision: 2,required: true}}
		                },
		                {
		                    field: 'imgWidth', title: '宽度', width: 100, align: 'center', sortable: true, halign: 'center',
		
		                    editor: {type: 'numberbox', options: { required: true}}
		                },
		                {
		                    field: 'imgHeight', title: '高度', width: 100, align: 'center', sortable: true, halign: 'center',
		
		                    editor: {type: 'numberbox', options: { required: true}}
		                },
		                {
		                    field: 'offsetX', title: 'offSetX', width: 100, align: 'center', sortable: true, halign: 'center',
		
		                    editor: {type: 'numberbox', options: { required: true}}
		                },
		                {
		                    field: 'offsetY', title: 'offSetY', width: 100, align: 'center', sortable: true, halign: 'center',
		                   
		                    editor: {type: 'numberbox', options: { required: true}}
		               
		                },
		                {
		                    field: 'growStateName', title: '作物状态', width: 130, align: 'center', sortable: true, halign: 'center',
		                    editor: {
		                        type: 'combobox',
		                        options: {
		                            valueField: 'key',
		                            textField: 'value',
		                            data: initGrowStateData(),
		                            panelHeight: 'auto',
		                            required: true
		                        }
		                    },
		                    formatter: function (value, row) {
		                        return value ;
		                    },
		               
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
			        
			        grid2.datagrid("getPager").pagination({
							pageSize: 10,
							pageList: [5, 10, 15, 20]
					});
			}
			

			//加载添加 
			function loadAddForm(){
				params.mode = 'add'; 
				$('#formSeedContainer').dialog('open').dialog('setTitle', '添加数据');
//				$('#formSeed').form('load', row);
//              $("#growthID").val()
			}

            //加载修改
			function loadExitForm() {
				var row = grid.datagrid('getSelected');
				if(row) {
					console.log(row)
					params.id = row.id;
					params.mode = 'edit';
					$('#formSeedContainer').dialog('open').dialog('setTitle', '编辑数据');
					$('#formSeed').form('load', row);
					
					
				} else {
					alert("请先选择一行数据，然后再尝试点击操作按钮！");
				}
			}

			function saveForm() {
				
//				alert($("#seedType").val())
				$('#formSeed').form('submit', {
					url: '/farm/seed/update',
					contentType: 'application/json',
					onSubmit: function(param) {
						param.id = params.id;
						param.mode = params.mode;
						return $(this).form('validate');
					},
					success: function(result) {
						var res= eval('(' + result + ')');
						if(res.code == 200) {
							console.log(5555)
							$('#formSeedContainer').dialog('close');
							grid.datagrid('reload');
						}
						$.messager.show({
							title: "消息",
							msg: res.msg
						});
					}
				});
			}
		
		    //初始化种子类型
			function seedTypeInit() {
				var seedTypeData;
				$.ajax({
					type: "get",
					url: "<%=basePath%>seedType/findAll",
					dataType: 'json',
					contentType: 'application/json',
					async:false,
					success: function(res) {
						if(res.code!==1){
							console.log(res.msg)
							return ;
						}
						
						var datas = res.data;
						var len =datas.length;
						seedTypeData=new Array(len);
						for (var i = 0; i < len; i++) {
							seedTypeData[i]={"key":datas[i].id+"","value":datas[i].seedTypeName};
							
						}
						
						return seedTypeData;
					},
					error: function(res) {
						alert("标签库出错");
					}
				});
				
				
//				console.log(seedTypeData)
//				var test=[{"key":"1","value":"蔬菜"},{"key":"2","value":"植株"},{"key":"3","value":"水果"},{"key":"4","value":"花草"}];
//				console.log(test)
				return seedTypeData;
			}
			
			//初始化土壤类型
			function landTypeInit() {
				var landTypeData;
				$.ajax({
					type: "get",
					url: "<%=basePath%>landType/findAll",
					dataType: 'json',
					contentType: 'application/json',
					async:false,
					success: function(data) {
						if(data.code!==1){
							console.log(data.msg)
							return ;
						}
						
						var datas = data.data;
						var len=datas.length;
						landTypeData = new Array(len);
						for (var i = 0; i < len; i++) {
							landTypeData[i]={"key":datas[i].id+"","value":datas[i].landName}
						}
						
						return landTypeData;
					},  
					error: function(res) {
						alert("标签库出错");
					}
				});
				
				
//				console.log(landTypeData)
				return landTypeData;
			}
			
			//初始化生长状态
			function initGrowStateData() {
		    	var growStateData;
				$.ajax({
					type: "get",
					url: "<%=basePath%>growthState/findAll",
					dataType: 'json',
					contentType: 'application/json',
					async:false,
					success: function(res) {
						if(res.code!==1){
							console.log(res.msg)
							return ;
						}
						
						var datas = res.datas;
						var len=datas.length;
						growStateData = new Array(len);
						for (var i = 0; i < len; i++) {
							growStateData[i]={"key":datas[i].id+"","value":datas[i].stateName}
						}
						
						return growStateData;
					},  
					error: function(res) {
						alert(res.msg);
					}
				});
				
				
//				console.log(landTypeData)
				return growStateData;
		    }
			

			
			
			

			//生长阶段点击编辑时触发的表 ，此时还把图片添加进去了，图片地址在下面被我写死了
			function  GrowthloadForm() {
				var url="<%=basePath%>images/crops/1/1.png";
				$("#positionImg").attr("src",url);
				 
				var row = grid2.datagrid('getSelected');
			    if (row) {
			        params.id = grid2.datagrid('getSelected').id;
			        params.mode = 'edit';
			        $('#formCropContainer').dialog('open').dialog('setTitle', '编辑数据');
			        $('#formCropState').form('load', row);
			        $("#seedId").val(id); 
			        $("#growthID").val(grid2.datagrid('getSelected').id);
			    } else {
			         alert("请先选择一行数据，然后再尝试点击操作按钮！");
			    }
			    
			    //初始化growthID值
			    growthId= grid2.datagrid('getSelected').id;
			    
			} 
			 
			function GrowthAdd() {
				 var url="<%=basePath%>images/crops/1/1.png";
				 
				 
				 params.mode = 'add'; 
				 $("#positionImg").attr("src",url);
				 $('#formCropContainer').dialog('open').dialog('setTitle', '编辑数据');
				 $("#seedId").val(id);
				 growthId=0;
			 }
			
			
			//图片属性回显函数
			function initImgAttr(growthId){
			    
			    var id=growthId+"";
			    
			    $.ajax({
			    	type:"post",
			    	url:"<%=basePath%>growStage/imgAttr",
			    	dataType: 'json',
			    	data:id,
					contentType: 'application/json',
					async:false,
					success: function(res) {
//					    alert(res.msg);
                        $("#positionImg").css("width", res.data.imgWidth);
                        $("#positionImg").css("height", res.data.imgHeight);
                        $("#positionImg").offset({top:res.data.offsetY,left:res.data.offsetX});
                        
					},  
					error: function(res) {
						alert(res.msg);
					}
			    	
			    });
			}
			//点击编辑图片位置，触动这个方法
			function setImagePostion(){

			    if(growthId>0){
			        initImgAttr(growthId);
			        
			    }
		    	$('#positionDialog').dialog('open').dialog('center').dialog('setTitle','定位编辑器');
		    	
		    }
			
			function GrowthStatesaveForm(){
//			    alert(id);
				$('#formCropState').form('submit', {
					url: '/farm/growth/update',
					contentType: 'application/json',
//					onSubmit: function(param) {
////					    param.id = id;
////						param.mode = params.mode;
//						return $(this).form('validate');
//					},
					success: function(result) {
						var res= eval('(' + result + ')');
//						alert(res.code)
						if(res.code == 200) {
							
							$('#formCropContainer').dialog('close');
							grid2.datagrid('reload');
							growthId=0;
						}
						$.messager.show({
							title: "消息",
							msg: res.msg
						});
					}
				});
				growthId=0;
			}
			
			//获得图片信息
			function gainPostion(){
//			    console.log($("#positionImg").width());
//				console.log($("#positionImg").height());
//				console.log($("#positionImg").position().left);
//				console.log($("#positionImg").position().top);
				 
				$("#width").val($("#positionImg").width());
				$("#height").val($("#positionImg").height());
				$("#offsetX").val($("#positionImg").position().left);
				$("#offsetY").val($("#positionImg").position().top);
				
				$('#positionDialog').dialog('close');

			}
		</script>
	</body>

</html>