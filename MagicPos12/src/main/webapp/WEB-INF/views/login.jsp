<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MAGIC POS</title>
<!-- 타이틀 아이콘 : 파비콘 -->
<link rel="icon" type="image/x-icon" href="resouces/assets/img/pabicon.png" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Pattaya&display=swap" rel="stylesheet">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style type="text/css">
	#login-form {
		width: 50%;
		margin: auto;
		display: block;
	}
	
	#signup-form {
		width: 50%;
		margin: auto;
		display: none;
	}
	
	.datetext {
	    color: #fff;
	    margin-top: 5px;
	    margin-right: 20px;
	    font-weight: 700;
	    font-size: 1.05rem;
	}	
</style>

</head>
<body id="page-top">

	<!-- ----------------------------------페이지 헤드 부분 시작 ------------------------------------- -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="
    																		height: 58px;">
		<div class="container">
			<!-- 매직포스 로고 및 홈버튼 -->
			<a class="navbar-brand" href="${cpath}/">
			<img src="resources/assets/img/logo3.png" alt="magicpos" />
			<span class="brandName">MagicPos</span>
			</a>
<!-- 			<button class="navbar-toggler" 
					type="button"
					data-bs-toggle="collapse" 
					data-bs-target="#navbarResponsive"
					aria-controls="navbarResponsive" 
					aria-expanded="false"
					aria-label="Toggle navigation">Menu<i class="fas fa-bars ms-1"></i>
			</button> -->

			<!-- 네비게이션 바 : 로그인 시 출력-->
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="sysdate">
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
			</c:set>
				<c:choose>
					<c:when test="${!empty rvo}">
						<li class="datetext">${sysdate}</li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/mainPage.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/menuList.do">매장관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/logout.do">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="datetext">${sysdate}</li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/magicpos.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/loginPage.do">로그인</a></li>
					</c:otherwise>
				</c:choose>				
			</ul>
		</div>
	</nav>
	<!-- ----------------------------------페이지 헤드 부분 종료 ------------------------------------- -->



	<!-- -----------------------------------로그인 페이지 시작---------------------------------------- -->
	<header class="masthead">
		<div class="container">
			<div class="row">
					<!-- <div class="masthead-subheading" style="font-family: 'Pattaya', sans-serif; margin-top:-150px;">Welcome To MAGIC POS</div> -->
				 <form id="login-form" class="lf" action="login.do" style="width:524px; height:400px; margin-top:-95px;" method="post">
				 		<div class="logintext">
				 			<label>Login</label>
				 		</div>
				 	<div class="mb-3">
					  <label for="shop_email" class="form-label">매장 이메일</label>
					  <input type="email" class="form-control" style="border-radius:20px; margin:auto; width:375.6px;" name="shop_email" id="shop_email" placeholder="매장 이메일" autofocus="autofocus">
					</div>
					<div class="mb-10">
					  <label for="shop_pw" class="form-label">비밀번호</label>
					  <input type="password" name="shop_pw" id="shop_pw" style="border-radius:20px; margin:auto; width:375.6px;" class="form-control" placeholder="비밀번호">
					</div>
					<div class="buttons">
					    <button type="submit" class="btn-hover color-4" id="login-btn">LOGIN</button><br>
					</div>
					<div class="join-btn1">
					    <button type="button" id="signup-btn" class="join-btn">회원가입</button>
					</div>
<!--  					<div class="btn-btn">
						<button type="submit" class="btn btn-primary">로그인</button>
						<button type="button" class="btn btn-warning" id="signup-btn">회원가입</button>
					</div>	 -->					
				 </form>
	<!-- -----------------------------------로그인 페이지 종료---------------------------------------- -->				 
	
	
	
	<!-- -----------------------------------회원가입 페이지 시작--------------------------------------- -->
				 <form id="signup-form" class="jp" action="signUp.do"  style="width:524px; height:630px; margin-top:-190px;" method="post">
				 <div class="logintext">Sign up</div>
				 <div class="mb" style="margin-top:-20px;">
				 	<div class="mb-3">
					  <label for="shop_email-signup" class="form-label">매장 이메일</label>
					  <input type="email" class="form-control" name="shop_email" style="border-radius:20px; margin:auto; width:375.6px;" id="shop_email-signup" placeholder="매장 이메일">
					</div>			 
				 	<div class="mb-11">
					  <label for="shop_pw-signup" class="form-label">비밀번호</label>
					  <input type="password" class="form-control" name="shop_pw" style="border-radius:20px; margin:auto; width:375.6px;" id="shop_pw-signup" placeholder="비밀번호">
					</div>			 
				 	<div class="mb-11">
					  <label for="shop_name-signup" class="form-label">매장명</label>
					  <input type="text" class="form-control" name="shop_name" style="border-radius:20px; margin:auto; width:375.6px;" id="shop_name-signup" placeholder="매장명">
					</div>			 
				 	<div class="mb-11">
					  <label for="shop_owner-signup" class="form-label">사업자명</label>
					  <input type="text" class="form-control" name="shop_owner" style="border-radius:20px; margin:auto; width:375.6px;" id="shop_owner-signup" placeholder="사업자명">
					</div>
				   	<div class="mb-11">
		              <label for="shop_owner-signup" class="form-label">테이블 수</label>
		              <input type="number" class="form-control" name="shop_table" style="border-radius:20px; margin:auto; width:375.6px;" id="shop_table-signup" placeholder="테이블 수">
               	   	</div>
               	  </div>
					<div class="buttons signBtnGroup">
						<button type="button" class="join-btn joinB" onclick="location.href='${cpath}/login.do'">돌아가기</button>			 
						<button type="submit" class="btn-hover color-4" id="shop_signup">SIGNUP</button>
						<button type="reset" class="join-btn joinB">취소</button>
					</div>
				 </form>
		<!-- -----------------------------------회원가입 페이지 종료---------------------------------------- -->		 	
	</header>
			
					

<script type="text/javascript">
	$(document).ready(function(){
		$("#signup-btn").click(function(){
			if ($("#login-form").css("display") == "block") {
				$("#login-form").css("display", "none");
			}
			if ($("#signup-form").css("display") == "none") {
				$("#signup-form").css("display", "block");
			}
		});
		/* 로그인 유효성 검사 */
		$("#login-btn").click(function(e) {
			if($("#shop_email").val()==''){
				alert("이메일을 입력해 주세요.");
				e.preventDefault();
			} else if($("#shop_pw").val()==''){
				alert("비밀번호를 입력해 주세요.");
				e.preventDefault();
			}
		});
		
		/* 회원가입 유효성 검사 */
		$("#shop_signup").click(function(e) {
			if($("#shop_email-signup").val()==''){
				alert("이메일을 입력해 주세요.");
				e.preventDefault();
			}
			else if($("#shop_pw-signup").val()==''){
				alert("비밀번호를 입력해 주세요.");
				e.preventDefault();
			}
			else if($("#shop_name-signup").val()==''){
				alert("매장명을 입력해 주세요.");
				e.preventDefault();
			}
			else if($("#shop_owner-signup").val()==''){
				alert("사업자명를 입력해 주세요.");
				e.preventDefault();
			}
			else if($("#shop_table-signup").val()==''){
				alert("테이블수를 입력해 주세요.");
				e.preventDefault();
			}
		});
		
	});
	

	

</script>	




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
</script>
</body>
</html>