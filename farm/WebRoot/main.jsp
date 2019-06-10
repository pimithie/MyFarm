<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String wsBasePath = "ws://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/green/easyui.css?t=34355">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/easyui/themes/color.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/farm.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>ext/farm/imgPosition.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/my.css">
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script>
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0;
		background-image: url("<%=basePath%>images/background.png");
		background-size:100% 75%;
        background-repeat:no-repeat;
        background-color: transparent;
		border:none;
		width:100%;
		height:800px;
	}
	div.normal {
		width : 150px;
		height: 75px;
		background-image: url("<%=basePath%>images/land/normal.png");
		background-size: 150px 75px;
		position: absolute;
	}
	div.black {
		width : 150px;
		height: 75px;
		background-image: url("<%=basePath%>images/land/black.png");
		background-size: 150px 75px;
		position: absolute;
	}
	div.gold {
		width : 150px;
		height: 75px;
		background-image: url("<%=basePath%>images/land/gold.png");
		background-size: 150px 75px;
		position: absolute;
	}
	div.red {
		width : 150px;
		height: 75px;
		background-image: url("<%=basePath%>images/land/red.png");
		background-size: 150px 75px;
		position: absolute;
	}
	#land0 {
		left: 560px;
		top: 124px;
	}
	#land1 {
		left: 459px;
		top: 169px;
	}
	#land2 {
		left: 361px;
		top: 213px;
	}
	#land3 {
		left: 264px;
		top: 266px;
	}
	/*----------------*/
	#land4 {
		left: 682px;
		top: 188px;
	}
	#land5 {
		left: 585px;
		top: 239px;
	}
	#land6 {
		left: 493px;
		top: 289px;
	}
	#land7 {
		left: 401px;
		top: 339px;
	}
	/*----------------*/
	#land8 {
		left: 821px;
		top: 253px;
	}
	#land9 {
		left: 714px;
		top: 305px;
	}
	#land10 {
		left: 613px;
		top: 357px;
	}
	#land11 {
		left: 516px;
		top: 406px;
	}
	/*----------------*/
	#land12 {
		left: 972px;
		top: 319px;
	}
	#land13 {
		left: 869px;
		top: 373px;
	}
	#land14 {
		left: 771px;
		top: 427px;
	}
	#land15 {
		left: 660px;
		top: 480px;
	}
	.page {
		margin-top: 160px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.content {
		float: left;
		margin-top: 90px;
		margin-left: 23px;
		margin-right: 23px;
	}
	.seedImage:hover {
		cursor: pointer;
	}
	.seed {
		width: 48px;
		height: 92px;
		position: absolute;
		left: 51px;
		top: 8px;
	}
	.end {
		width: 81px;
		height: 195px;
		position: absolute;
		left: 40px;
		top: -20px;
	}
	.insectImg {
		position: absolute;
	    left: -17px;
	    top: -15px;
	    height: 67px;
	    width: 90px;
	}
	
	.empty{
		cursor: url("<%=basePath%>cursor/moshubang.cur"),auto;
	}
	.growing {
		cursor: url("<%=basePath%>cursor/naozhong.cur"),auto;
	}
	.harvest {
		cursor: url("<%=basePath%>cursor/shoutao.cur"),auto;
	}
	.cleanUp {
		cursor: url("<%=basePath%>cursor/chanzi.cur"),auto;
	}
	.insect {
		cursor: url("<%=basePath%>cursor/shachognji.cur"),auto;
	}
	
</style>
</head>
<body>
	    <div id="dd" class="easyui-dialog" title="My Dialog" style="width:600px;height:300px;"
        data-options="iconCls:'icon-save',resizable:true,closed:true">
        		<div class="page" style="float: left;">
        			<img width="20px" height="20px" src="<%=basePath%>images/left.png">
        		</div>
        		<div id="allSeeds" style="float: left;">
        			<%-- <div class="content" style="width: 70px;text-align: center;">
        				<p>
							<span style="border: 1px solid red; border-radius: 20px">10</span>
						</p>
        				<img  width="70px" height="70px" src="<%=basePath%>images/crops/1/5.png">
        			</div>
        			<div class="content" style="width: 70px;text-align: center;">
        				<p>
							<span style="border: 1px solid red; border-radius: 20px">10</span>
						</p>
        				<img width="70px" height="70px" src="<%=basePath%>images/crops/2/5.png">
        			</div>
        			<div class="content" style="width: 70px;text-align: center;">
        				<p>
							<span style="border: 1px solid red; border-radius: 20px">10</span>
						</p>
        				<img width="70px" height="70px" src="<%=basePath%>images/crops/3/5.png">
        			</div>
        			<div class="content" style="width: 70px;text-align: center;">
        				<p>
							<span style="border: 1px solid red; border-radius: 20px">10</span>
						</p>
        				<img width="70px" height="70px" src="<%=basePath%>images/crops/4/5.png">
        			</div> --%>
        		</div>
        		<div class="page" style="float: right;">
        			<img width="20px" height="20px" src="<%=basePath%>images/right.png">
        		</div>
    	</div>
	<div id="land0" class="normal land empty">
		<%-- <img src="<%=basePath%>images/crops/1/5.png" class="easyui-draggable easyui-resizable" style="border: 1px solid red;"> --%>
		<%-- <img src="<%=basePath%>images/crops/1/1.png" class="crop1_1"> --%>
	</div>
	<div id="land1" class="normal land empty" >
	</div>
	<div id="land2" class="normal land empty" >
	</div>
	<div id="land3" class="normal land empty" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land4" class="red land empty" ></div>
	<div id="land5" class="red land empty" ></div>
	<div id="land6" class="red land empty" ></div>
	<div id="land7" class="red land empty" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land8" class="black land empty" ></div>
	<div id="land9" class="black land empty" ></div>
	<div id="land10" class="black land empty" ></div>
	<div id="land11" class="black land empty" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land12" class="gold land empty" ></div>
	<div id="land13" class="gold land empty" ></div>
	<div id="land14" class="gold land empty" ></div>
	<div id="land15" class="gold land empty" ></div>
	<audio id="openBag" src="<%=basePath%>mp3/openBag.mp3"></audio>
	<audio id="cleanUp" src="<%=basePath%>mp3/cleanUp.mp3"></audio>
	<audio id="harvest" src="<%=basePath%>mp3/harvest.mp3"></audio>
	<audio id="Insect" src="<%=basePath%>mp3/Insect.mp3"></audio>
	<audio id="killInsect" src="<%=basePath%>mp3/killInsect.mp3"></audio>
	<audio id="negative" src="<%=basePath%>mp3/negative.mp3"></audio>
	<audio id="plantCrop" src="<%=basePath%>mp3/plantCrop.mp3"></audio>
</body>
	<script type="text/javascript">
		var landId,landType;
		$(document).ready(function () {
			checkLogin();
			$(".land").click(function (e) {
				if (e.target.localName == "div") {
					landId = $(e.target).attr("id").substring(4);
					var className = $(e.target).attr("class");
					landType = className.split(" ")[0];
					$("#allSeeds").html("");
					$("#openBag")[0].play();
					$("#dd").dialog("open");
				}
			});
			// initialize websocket connection
			initWebSocket();
			parent.$("#container").attr("rows",'60,*');
			// init current user land state
			initLandState();
		});
		
		function initLandState() {
			$.ajax({
				type : 'post',
				url : '<%=basePath%>userLand/init',
				dataType: 'json',
				async : true,
				success : function(res) {
					for (var i = 0;i<res.data.length;i++) {
						// seed
						if (res.data[i].growStage.growStageId == 0) {
							var seedStage = $("<img/>");
							$(seedStage).addClass("seed").addClass("growing");
							$(seedStage).attr("src","<%=basePath%>images/crops/basic/0.png");
							var tooltip = "种子名称："+res.data[i].seed.seedName+"\n";
							tooltip = tooltip+"当前阶段：成长阶段\n"+"预期成熟时间："+res.data[i].matureTime+"\n"+"预计收获果实数："+res.data[i].harvestNum+"个";
							$(seedStage).attr("title",tooltip);
							$("#land"+res.data[i].landId).append(seedStage);
							continue;
						}
						// end
						if (res.data[i].growStageId == 6) {
							var endImg = $("<img />");
							$(endImg).addClass("cleanUp");
							$(endImg).attr("src","<%=basePath%>images/crops/basic/9.png").addClass("end");
							var cleanUpInfo = {landId:res.data[i].landId};
							$(endImg).click(function () {
								$.ajax({
									type : 'post',
									url : '<%=basePath%>userLand/cleanUp',
									data: cleanUpInfo,
									dataType: 'json',
									async : true,
									success : function(res) {
										$.messager.show({
						                	title : '服务器消息',
						                	msg : res.msg
						                });
										$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
										$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
										$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
										$("#cleanUp")[0].play();
									}
								});
							});
							$("#land"+res.data[i].landId).append(endImg);
							continue;
						}
						//--------------------
						var imgUrl = "<%=basePath%>images/crops/"+data.data[i].seed.seedId+"/"+data.data[i].growStage.growStageId+".png";
				    	var image = $("<img />")
				    	var className = "crop"+res.data[i].seed.seedId+"_"+res.data[i].growStage.growStageId;
				    	$(image).attr("id","theCrop");
				    	$(image).attr("src",imgUrl).addClass(className).addClass("growing");
				    	var tooltip = "种子名称："+res.data[i].seed.seedName+"\n";
						tooltip = tooltip+"当前阶段："+res.data[i].growStage.cropStage+"\n"+"预期成熟时间："+res.data[i].matureTime+"\n"+"预计收获果实数："+res.data[i].harvestNum+"个";
						$(image).attr("title",tooltip);
						if (res.data[i].growStage.growStageId == 5) {
							$(image).removeClass("growing").addClass("harvest");
							$(image).click(function () {
								var harvestInfo = {landId:res.data[i].landId};
								$.ajax({
									type : 'post',
									url : '<%=basePath%>userLand/harvest',
									data: harvestInfo,
									dataType: 'json',
									async : true,
									success : function(res) {
										$.messager.show({
						                	title : '服务器消息',
						                	msg : res.msg
						                });
										$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
										$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
										$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
										$("#harvest")[0].play();
									}
								});
							});
						}
						if (res.data[i].hasInsect) {
							var insectImg = $("<img />");
				    		$(insectImg).attr("src","<%=basePath%>images/Insect.png").addClass("insectImg");
				    		$(insectImg).addClass("insect");
				    		$(insectImg).click(function () {
								var killInsectInfo = {landId:res.data[i].landId};
								$.ajax({
									type : 'post',
									url : '<%=basePath%>userLand/killInsect',
									data: killInsectInfo,
									dataType: 'json',
									async : true,
									success : function(res) {
										$.messager.show({
						                	title : '服务器消息',
						                	msg : res.msg
						                });
										$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
										$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
										$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
										$(insectImg).remove();
										$("#killInsect")[0].play();
									}
								});
							});
				    		$("#land"+res.data[i].landId).append(insectImg);
				    		$("#land"+res.data[i].landId).append(image);
				    		continue;
						}
						$("#land"+res.data[i].landId).append(image);
					}
				}
			});
		}
		
		var websocket = null; 
	    function initWebSocket(){    	     
		    if ('WebSocket' in window) {  
		        //Websocket的连接  
		        websocket = new WebSocket("<%=wsBasePath%>land/monitor");//WebSocket对应的地址  
		    }  
		    else if ('MozWebSocket' in window) {  
		        //Websocket的连接  
		        websocket = new MozWebSocket("<%=wsBasePath%>land/monitor");//SockJS对应的地址  
		    }  
		    else {  
		        //SockJS的连接  
		        websocket = new SockJS("<%=wsBasePath%>land/monitor");//SockJS对应的地址    
		    }  
		    websocket.onopen = onOpen;  
		    websocket.onmessage = onMessage;  
		    websocket.onerror = onError;  
		    websocket.onclose = onClose;
	    }
	    
	    function onOpen(evt) {
		}
	    
	    function onMessage(evt) {
	    	var data = eval('(' + evt.data + ')');
	    	// end 
	    	if (data.code == 101) {
				var endImg = $("<img />");
				$(endImg).addClass("cleanUp");
				$(endImg).attr("src","<%=basePath%>images/crops/basic/9.png").removeClass("harvest").addClass("end");
				var cleanUpInfo = {landId:data.data};
				$(endImg).click(function () {
					$.ajax({
						type : 'post',
						url : '<%=basePath%>userLand/cleanUp',
						data: cleanUpInfo,
						dataType: 'json',
						async : true,
						success : function(res) {
							$.messager.show({
			                	title : '服务器消息',
			                	msg : res.msg
			                });
							$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
							$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
							$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
							$("#cleanUp")[0].play();
						}
					});
				});
				$("#land"+data.data).html("");
				$("#land"+data.data).append(endImg);
				return;
	    	}
	    	// restart quarter
	    	if (data.code == 102) {
	    		var seedStage = $("<img/>");
				$(seedStage).addClass("seed").removeClass("cleanUp").addClass("growing");
				$(seedStage).attr("src","<%=basePath%>images/crops/basic/0.png");
				var tooltip = "种子名称："+data.data[1].seedName+"\n";
				tooltip = tooltip+"当前阶段：成长阶段\n"+"预期成熟时间："+data.data[2].matureTime+"\n"+"预计收获果实数："+data.data[1].harvestNum+"个";
				$(seedStage).attr("title",tooltip);
				$("#land"+data.data[0]).html("");
				$("#land"+data.data[0]).append(seedStage);
				return;
	    	}
	    	// resume to empty
	    	if (data.code == 103) {
	    		$("#land"+data.data).html("");
	    		return;
	    	}
	    	// produce the insect
	    	if (data.code == 104) {
	    		var insectImg = $("<img />");
	    		$(insectImg).attr("src","<%=basePath%>images/Insect.png").addClass("insectImg");
	    		$(insectImg).addClass("insect");
	    		$(insectImg).click(function () {
					var killInsectInfo = {landId:data.data};
					$.ajax({
						type : 'post',
						url : '<%=basePath%>userLand/killInsect',
						data: killInsectInfo,
						dataType: 'json',
						async : true,
						success : function(res) {
							$.messager.show({
			                	title : '服务器消息',
			                	msg : res.msg
			                });
							$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
							$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
							$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
							$(insectImg).remove();
							$("#killInsect")[0].play();
						}
					});
				});
	    		$("#Insect")[0].play();
	    		$("#land"+data.data).append(insectImg);
	    		return;
	    	}
	    	// update the infomation of the number of friuts
	    	if (data.code == 105) {
	    		var tooltip = "种子名称："+data.data[3].seedName+"\n";
				tooltip = tooltip+"当前阶段："+data.data[4].cropStage+"\n"+"预期成熟时间："+data.data[2]+"\n"+"预计收获果实数："+data.data[0]+"个";
				$("#land"+data.data[1]).find("#theCrop").attr("title",tooltip);
	    		return;
	    	}
	    	var imgUrl = "<%=basePath%>images/crops/"+data.data[0].seedId+"/"+data.data[0].growStageId+".png";
	    	var image = $("<img />")
	    	var className = "crop"+data.data[0].seedId+"_"+data.data[0].growStageId;
	    	$(image).attr("id","theCrop");
	    	$(image).attr("src",imgUrl).addClass(className).addClass("growing");
	    	var tooltip = "种子名称："+data.data[2].seedName+"\n";
			tooltip = tooltip+"当前阶段："+data.data[0].cropStage+"\n"+"预期成熟时间："+data.data[3]+"\n"+"预计收获果实数："+data.data[4]+"个";
			$(image).attr("title",tooltip);
			if (data.data[0].growStageId == 5) {
				$(image).removeClass("growing").addClass("harvest");
				$(image).click(function () {
					var harvestInfo = {landId:data.data[1]};
					$.ajax({
						type : 'post',
						url : '<%=basePath%>userLand/harvest',
						data: harvestInfo,
						dataType: 'json',
						async : true,
						success : function(res) {
							$.messager.show({
			                	title : '服务器消息',
			                	msg : res.msg
			                });
							$(window.parent.frames["menu"].document).find('#userExp').html("经验:"+res.data.userExp);
							$(window.parent.frames["menu"].document).find('#userMoney').html("金币:"+res.data.money);
							$(window.parent.frames["menu"].document).find('#userPoint').html("积分:"+res.data.point);
							$("#harvest")[0].play();
						}
					});
				});
			}
	    	$("#land"+data.data[1]).html("");
	    	$("#land"+data.data[1]).append(image);
		}
	    
	    function onError(evt) {
	    	console.log("onError--->"+evt);
		}
	    function onClose(evt) {
	    	console.log("onClose--->"+evt);
		}
	    
		window.onunload = function () {
			websocket.onclose();
			parent.$("#container").attr("rows",'60,*,50');
		};
		
		$("#dd").dialog({
			onOpen: function() {
				$.ajax({
					type : 'post',
					url : '<%=basePath%>userSeedAsset/findAll',
					async : true,
					success : function(data) {
						//<div class="content" style="width: 70px;text-align: center;">
        				<%-- <p>
							<span style="border: 1px solid red; border-radius: 20px">10</span>
						</p>
    					<img  width="70px" height="70px" src="<%=basePath%>images/crops/1/5.png">
    					</div> --%>
    					/* console.log(data); */
    					for (var i = 0;i < data.rows.length;i++) {
	    					var contentDiv = $("<div></div>");
	    					var p = $("<p></p>");
	    					var span = $("<span></span>");
	    					var img = $("<img/>")
	    					$(contentDiv).addClass("content").css("width","70px").css("text-align","center");
	    					$(span).css("border","1px solid red").css("border-radius","20px");
	    					$(span).html(data.rows[i].countOfSeed);
	    					p.append(span);
	    					var url = "<%=basePath%>/images/crops/"+data.rows[i].seedImage;
	    					$(img).css("width","70px").css("height","70px").attr("src",url).attr("seedId",data.rows[i].seedId);
	    					$(img).addClass("seedImage");
	    					$(img).click(function (e) {
	    						var seedId = $(e.target).attr("seedId");
	    						var plantInfo = {seedId:seedId,landId:landId,landType:landType};
								$.ajax({
									type : 'post',
									url : '<%=basePath%>userLand/plant',
									data: JSON.stringify(plantInfo),
									dataType: 'json',
									contentType: 'application/json;charset=UTF-8',
									async : true,
									success : function(res) {
										console.log(res);
										$.messager.show({
						                	title : '服务器消息',
						                	msg : res.msg
						                });
										<%-- <img src=""> --%>
										if (res.code == 200) {
											var seedStage = $("<img/>");
											$(seedStage).addClass("seed").addClass("growing");
											var tooltip = "种子名称："+res.data.seed.seedName+"\n";
											tooltip = tooltip+"当前阶段：成长阶段\n"+"预期成熟时间："+res.data.matureTime+"\n"+"预计收获果实数："+res.data.seed.harvestNum+"个";
											$(seedStage).attr("title",tooltip);
											$(seedStage).attr("src","<%=basePath%>images/crops/basic/0.png");
											$("#plantCrop")[0].play();
											$("#land"+res.data.landId).append(seedStage);
										} else {
											$("#negative")[0].play();
										}
										$("#dd").dialog("close");
									}
								});
							});
	    					$(contentDiv).append(p).append(img);
    						$("#allSeeds").append(contentDiv);
    					}
					}
				});
			}
		});
		
		
		function checkLogin() {
			$.ajax({
				type : 'post',
				url : '<%=basePath%>user/getCurrentUser',
				async : false,
				success : function(data) {
					if (data.code == 400) {
						$.messager.alert({
							title : '服务器消息',
							msg : '请先进行登录!',
							fn : function() {
								parent.$("#workspace").attr("src",
										'<%=basePath%>login.jsp');
							}
						});
					}
				}
			});
		}
	</script>
</html>