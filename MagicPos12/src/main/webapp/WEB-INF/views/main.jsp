<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/mainPage.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style>
	.btn-primary {
		--bs-btn-bg: #f29661;
		--bs-btn-border-color: #f29661;
		--bs-btn-hover-bg: #bf764c;
		--bs-btn-hover-border-color: #bf764c;
		--bs-btn-active-bg: #bf764c;
		--bs-btn-active-border-color: #bf764c;
	}
	
	.btn {
		padding: 3%;
	}
	
	.mainbtn {
		width: 150px;
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
   	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="height: 58px;">
      <div class="container">
        <a class="navbar-brand" href="${cpath}/">
        <img src="resources/assets/img/logo3.png" alt="..." />
        <span class="brandName">MagicPos</span>
        </a>
        <button class="navbar-toggler"
          		type="button"
          		data-bs-toggle="collapse"
          		data-bs-target="#navbarResponsive"
          		aria-controls="navbarResponsive"
          		aria-expanded="false"
          		aria-label="Toggle navigation">Menu<i class="fas fa-bars ms-1"></i>
        </button>
        
        <!-- 네비게이션 바 : 로그인 시 출력-->
        <div class="collapse navbar-collapse" id="navbarResponsive">
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
						<li class="nav-item"><a class="nav-link" href="${cpath}/orderComplete.do">주문관리</a></li>
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
      </div>
    </nav>
    <!-- ----------------------------------페이지 헤드 부분 종료 ------------------------------------- -->
    
    
    
    <!-- -----------------------------------페이지 본문 시작---------------------------------------- -->
    <header class="masthead">
      <div class="container" style="margin-top: -35px;">
        <div class="masthead-heading text-uppercase" style="font-family: 'Pretendard-Regular';">${rvo.shop_name}</div>
        <div class="masthead-subheading" style="font-family: 'Pretendard-Regular';">${rvo.shop_owner}님 환영합니다</div>
        <div class="shopbtn">
	        <!-- 모션인식 매장업무 페이지로 이동 -->
	       	<button class="btn btn-primary btn-lg text-uppercase mainbtn" onclick="location.href='${cpath}/hallTable.do'">매장업무</button> 
	        <!-- 관리메뉴 서비스로 이동 -->
	        <button class="btn btn-primary btn-lg text-uppercase mainbtn" onclick="location.href='${cpath}/menuList.do'">매장관리</button> 
		</div>        
      </div>
    </header>
    
    
    
    
    
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>