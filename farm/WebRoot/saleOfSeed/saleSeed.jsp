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
		.seedInfoContainer {
			background-image: url(<%=basePath%>images/border.gif);
		}
		.buy {
			border: 0;
			border-radius: 3px;
			background-color: #a8eac4;
		}
	</style>
</head>
<body>
	<table id="tt" style="width:100%;height:420px"
			title="种子商店" singleSelect="true" fitColumns="true" remoteSort="false"
			url="<%=basePath%>seed/find" pagination="true" sortOrder="desc" sortName="seedName">
		<thead>
			<tr>
				<th field="seedName" width="80" sortable="true" align="center">种子名称</th>
				<th field="seedLevel" width="80" sortable="true" align="center">种子等级</th>
				<th field="seedType" width="80" sortable="true" align="center">种子类型</th>
				<th field="landType" width="150" sortable="true" align="center">所需土地类型</th>
			</tr>
		</thead>
	</table>
</body>
<script type="text/javascript">
	
		var cardview = $.extend({}, $.fn.datagrid.defaults.view, {
                       renderRow: function (target, fields, frozen, rowIndex, rowData) {
                            var container = $("<div class='seedInfoContainer'></div>");
                            var imagePath = '<%=basePath%>images/crops/'+rowData.seedImage;
                            var seedImage = $("<img class='seedImage' src='"+imagePath+"'/>");
                            var description = $("<p class='seedDescription'>"+rowData.tips+"</p>");
                            var buttonDiv = $("<div style='text-align: center'></div>");
                            var obj = "{seedPrice:"+rowData.seedPrice+",seedId:"+rowData.seedId+",seedName:"+"\""+rowData.seedName+"\"}";
                            var button = $("<button class='buy' onclick='doBuy("+obj+")'>点击购买</button>");
                            container.css("float","left");
                            container.css("width","23%").css("height","70%");
                            container.css("margin","3% 1%").css("text-align","center");
                            container.css("background-size","100% 99%");
                            container.css("position","relative");
                            $(container).tooltip({
                            	position: 'right',
                            	content:'<div>xxx</div>',
                				onShow: function(){
                					$(this).tooltip('tip').css({
                						backgroundColor: '#666',
                						borderColor: '#666'
                					});
                				}
                            });
                            seedImage.css("width","120px").css("height","120px").css("margin-top","10px");
                            buttonDiv.css("position","absolute").css("bottom","25px").css("left","120px");
                            buttonDiv.append(button);
                            container.append(description).append(seedImage).append(buttonDiv);
                            return container.prop("outerHTML");
                        }
                    });
		
		$(function(){
			checkLogin();
            $('#tt').datagrid({
                view: cardview
            });
            $('#tt').edatagrid("getPager").pagination({
                pageSize: 4,
                pageList: [4,8,12]
            });
           	parent.$("#footer").attr("src",'<%=basePath%>bottom.jsp');
           	parent.$("#container").attr("rows",'60,*,158');
        });
		
		function doBuy(rowdata) {
			$.messager.confirm("操作提示", "您确定要购买"+rowdata.seedName+"的种子吗？", function (isTrue) {
					if(isTrue) {
						var data = {seedPrice:rowdata.seedPrice,seedId:rowdata.seedId};
						$.ajax({
							type: 'post',
							url: '<%=basePath%>userSeedAsset/buy',
							data: data,
							success: function (data) {
								console.log(data);
								$.messager.alert({
					                  title : '服务器消息',
					                  msg : data.msg
					            });
								if (data.code == 200) {
									refreshCurrentUserInfo(data.data);
								}
							}
						});
					}
			});
		}
		
		function refreshCurrentUserInfo(user) {
			$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+user.money);
			$.ajax({
				type: 'post',
				url: '<%=basePath%>userSeedAsset/findAll',
				success: function (data) {
					var infoContainer = $(window.parent.frames['footer'].document).find("#userAssetInfo");
					for (var i = 0;i<data.rows.length;i++) {
						// construct the formatter of user info
						var container = $("<div class='infoContainer'></div>");
						var numberOfSeeds = $("<p><span class='info'></span></p>");
						$(numberOfSeeds).find('.info').html(data.rows[i].countOfSeed);
						container.append(numberOfSeeds);
						var image = $("<img/>");
						image.attr("src",'<%=basePath%>images/crops/'+data.rows[i].seedImage);
						image.css("width","100px").css("height","100px");
						container.append(image);
						infoContainer.append(container);
					}
					
				}
			});
		}
		
		function checkLogin() {
			$.ajax({
				type: 'post',
				url: '<%=basePath%>user/getCurrentUser',
				async: false,
				success: function (data) {
					if (data.code == 400) {
						$.messager.alert({
			                  title : '服务器消息',
			                  msg : '请先进行登录!',
			                  fn: function () {
			                	  parent.$("#workspace").attr("src",'<%=basePath%>login.jsp');
			                	  parent.$("#footer").attr("src",'<%=basePath%>tools.jsp');
			                	  parent.$("#container").attr("rows",'60,*,50');
							  }
			            });
					}
				}
			});
		}
</script>
</html>