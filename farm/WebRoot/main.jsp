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
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/plugins/jquery.edatagrid.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>ext/farm/helper.js?346t"></script>
		<script type="text/javascript" src="<%=basePath%>ext/my/my.js"></script>
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
	#land1 {
		left: 560px;
		top: 124px;
	}
	#land2 {
		left: 459px;
		top: 169px;
	}
	#land3 {
		left: 361px;
		top: 213px;
	}
	#land4 {
		left: 264px;
		top: 266px;
	}
	/*----------------*/
	#land5 {
		left: 682px;
		top: 188px;
	}
	#land6 {
		left: 585px;
		top: 239px;
	}
	#land7 {
		left: 493px;
		top: 289px;
	}
	#land8 {
		left: 401px;
		top: 339px;
	}
	/*----------------*/
	#land9 {
		left: 821px;
		top: 253px;
	}
	#land10 {
		left: 714px;
		top: 305px;
	}
	#land11 {
		left: 613px;
		top: 357px;
	}
	#land12 {
		left: 516px;
		top: 406px;
	}
	/*----------------*/
	#land13 {
		left: 972px;
		top: 319px;
	}
	#land14 {
		left: 869px;
		top: 373px;
	}
	#land15 {
		left: 771px;
		top: 427px;
	}
	#land16 {
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
</style>
</head>
<body>
	<button onclick="openOrCloseDialog()">show dialog</button>
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
	<div id="land1" class="normal" >
	</div>
	<div id="land2" class="normal" >
	</div>
	<div id="land3" class="normal" >
	</div>
	<div id="land4" class="normal" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land5" class="red" ></div>
	<div id="land6" class="red" ></div>
	<div id="land7" class="red" ></div>
	<div id="land8" class="red" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land9" class="black" ></div>
	<div id="land10" class="black" ></div>
	<div id="land11" class="black" ></div>
	<div id="land12" class="black" ></div>
	<!-- easyui-draggable -------------- -->
	<div id="land13" class="gold" ></div>
	<div id="land14" class="gold" ></div>
	<div id="land15" class="gold" ></div>
	<div id="land16" class="gold" ></div>
</body>
	<script type="text/javascript">
		$(document).ready(function () {
			checkLogin();
			// initialize websocket connection
			initWebSocket();
			parent.$("#container").attr("rows",'60,*');
		});
		
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
	    	console.log("onOpen--->"+evt);
	    	if (websocket.readyState == websocket.OPEN) {
		    	var data = {"msg":"hello server!"};
		    	websocket.send(JSON.stringify(data));
		    	alert("send success!");
	    	} else {
	    		alert("send fail!");
	    	}
		}
	    
	    function onMessage(evt) {
	    	alert(evt.data);
	    	console.log("onMessage--->"+evt);
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
    					console.log(data);
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
	    					$(img).css("width","70px").css("height","70px").attr("src",url);
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
		
		var isOpen = false;
		
		function openOrCloseDialog() {
			if (isOpen) {
				$("#dd").dialog("close");
				isOpen = false;
			} else {
				$("#dd").dialog("open");
				isOpen = true;
			}
		}
	</script>
</html>