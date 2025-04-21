<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>MAGIC POS</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/index.css" />
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Cookie&family=Orelega+One&display=swap" rel="stylesheet">
		<style type="text/css">
			body {
				background-image: url("https://i.ibb.co/Mn7Bg9B/food26.png");
				background-size: cover;
			}
		</style>
</head>
	<body class="is-preload">
	<header class="nbar">
		<a href="${cpath}/magicpos.do">
			<img src="resources/assets/img/logo3.png" style="margin-right:15px; height: 2rem; margin-left:108px; margin-top:-2px" alt="magicpos" />
			<span class="nbartitle">MagicPos</span>
		</a>
	</header>
			<section id="header" class="dark">
				<header style="margin-top:-20px;">
					<h1 class="wtmp">Welcome To MAGIC POS</h1>
				</header>
				<footer class="bs" style="font-family: 'Orelega One', cursive;">
					<!-- <a href="#first" class="button scrolly">Proceed to phase</a> -->
					<%-- <a onclick="location.href='${cpath}/loginPage.do'" class="button scrolly">Login</a> --%>
					<div class="buttons">
						<c:choose>
							<c:when test="${empty rvo}">
								<button class="btn-hover color-2" onclick="location.href='${cpath}/login.do'">LOGIN</button>
							</c:when>	
							<c:otherwise>
								<button class="btn-hover color-2" onclick="location.href='${cpath}/mainPage.do'">START</button>
							</c:otherwise>					
						</c:choose>							
					</div>				
				</footer>
			</section>
		<!-- Scripts -->
			<script src="resources/js/jquery.min.js"></script>
			<script src="https://kit.fontawesome.com/652d42f858.js" crossorigin="anonymous"></script>
			<script src="resources/js/jquery.scrolly.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>

	</body>
</html>