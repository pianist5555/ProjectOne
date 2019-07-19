<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

<body class="layout-boxed skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="../include/main_header.jsp"%>

		<!-- Left Column(사이드바) -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Page Header <small>Optional description</small>
				</h1>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

		<h1>1:1 상담(고객)</h1>


	<br />
	<div id="chatContainer"></div>

	<div id="chatArea"
		style="width: 500px; height: 500px; overflow-y: scroll; margin-top: 30px;"></div>

	<br />

	<input id="message">
	<span id="sendBtn"
		style="border: 1px solid red; padding: 5px; width: 30px; background-color: red; color: white; cursor: pointer;">
		Send</span>


	<div>
		Signed In as : <span id="">${sessionScope.userid}</span>
	</div>
	<div>
		Send To : <span id="sendTo">ADMIN</span>
	</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- JS 스크립트모음 -->
	<%@ include file="../include/plugin_js.jsp"%>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
<script>
	/*
	$.ajax({
		url : '/sessList.do',
		success : function(data) {
			$.each(data, function(index, value) {
				$("#chatContainer").append(
						"<div style='width:100px;border:1px solid black;' onclick='sendToCng(\""
								+ value + "\");'>" + value + "</div>")
			});
		}
	});
	 */
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		$("#message").keydown(function(key) {
			if (key.keyCode == 13) {// 엔터
				sendMessage();
				$('#message').val('');
			}
		});
	});

	//Init WebSocket.
	var webSocket = new WebSocket("ws://192.168.5.124:8888/projectOne/broadsocket");

	var messageTextArea = document.getElementById("chatArea");


	webSocket.onmessage = function processMessge(message) {
		//Json parse
		var jsonData = JSON.parse(message.data);
		if (jsonData.message != null) {
			$("#chatArea")
					.append(
							"<div style='float:left;border:1px solid red;background-color:red;border-radius:6px;margin-bottom:10px;'>"
									+ jsonData.message
									+ "</div><div style='clear:both;'></div>");

			if ($("#newmsg").length < 1) {
				$("body")
						.append(
								"<div id='newmsg' style='position:absolute;bottom:0;right:0;'>New Message!</div>");
			}
			setTimeout(function() {

				$("#newmsg").css("opacity", 0);

			}, 3000);
			setTimeout(function() {

				$("#newmsg").remove();

			}, 4000);
		}
		;
	}

	//Send Message.
	function sendMessage() {
		var messageText = document.getElementById("message");

		messageText.value = messageText.value.replace('"', '&#34;');

		webSocket.send('{ \"sendTo\" : \"' + $("#sendTo").text() + '\", \"message\" : \"' + messageText.value + '\"}');

		$("#chatArea").append("<div style='float:right;border:1px solid cornflowerblue;background-color:cornflowerblue;border-radius:6px;margin-bottom:10px;'>" + 
							   messageText.value + 
							   "</div><div style='clear:both;'></div>");
		
		messageText.value = "";
	}


</script>
</html>