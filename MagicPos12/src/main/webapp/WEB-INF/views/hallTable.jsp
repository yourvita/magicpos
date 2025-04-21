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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/table.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		setInterval(function(){
			$.ajax({
				url : "http://127.0.0.1:9001/video_motion",
				type: "get",
				success: motionControl,
				error: function() {console.log("삐용")}
			})
		},5000)
		
	})
	function motionControl(data){
	var idx =0
		/* console.log(data) */
		
		if(data == 'unknown') {
			idx=0;			
		} else {
			if(data=='one'){
				idx=1;
				console.log(data)
				document.getElementById('table_'+idx).click();
			}
			else if(data=='two'){
				idx=2;
				console.log(data)
				document.getElementById('table_'+idx).click();
			}
			else if(data=='three'){
				idx=3;
				console.log(data)
				document.getElementById('table_'+idx).click();
			}
			else if(data=='four'){
				idx=4;
				console.log(data)
				document.getElementById('table_'+idx).click();
			}
			else {
				console.log("아무것도아님")
			}
		}		
	}
	
</script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style type="text/css">
	.orderSection {
		width:1300px;
		text-align: center;
		margin: auto;
		border: 1px solid #000000;
		border-radius: 30px;
		height: 592px;
		margin-top: -155px;
		padding: 0;
		padding-top:40px;
	}
	
	.bg-light {
	    --bs-bg-opacity: 0.9;
	}
	
	.datetext{
  		color:#fff;
  		margin-top: 6px;
  		margin-right: 20px;
  		font-weight: 700;
  	}
  	
	.currentTable {
	    width: 300px;
	    height: 50px;
	    background-color: #fbb22c;
	    border: 1px solid #000000;
	    border-radius: 15px;
	    margin: auto;
    	margin-bottom: 50px;
    	text-align: center;
	    font-size: 2rem;
	    color: #ffffff;
	    /* font-family: 'GongGothicMedium'; */
	}
	
	.tableGrp {
		display: flex;
		justify-content: space-evenly;
    	flex-wrap: wrap;
    	margin-top:-20px;
	}
	
	.orderInfoGrp {
		display: flex;
	    justify-content: space-around;
	    text-align: left;
 	    margin-left: 10px;
 	    margin-bottom: 5px;
	}
	
	.tableorderbtn {
	    width: 300px;
	    height: 200px;
	    margin-bottom: 30px;
		background-color: inherit;
	    border-radius: 15px;
	    background-color: #fff;
	    border: 1px solid #000000;
	}
	
	.orderInfoName {
		width: 120px;
	}
	
	.orderInfo {
		width: 90px;
	}
	
	.tableOrderInfo {
		height: 100%;
		display: flex;
	    flex-direction: column;
	    justify-content: revert;
	}
	
	.orderTable{
		margin-top: 10px;
		margin-bottom: 20px;
	}
	
	#webcam-frame {
		margin-top: 100px;
    	margin-left: 45px;
	}
</style>
</head>
<body id="page-top" style="overflow:hidden; font-family: 'Pretendard-Regular';">

	<!-- ----------------------------------페이지 헤드 부분 ------------------------------------- -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="height: 58px;" id="mainNav">
		<div class="container">
			<!-- 매직포스 로고 및 홈버튼 -->
			<a class="navbar-brand" href="${cpath}/magicpos.do">
			<img src="resources/assets/img/logo3.png" alt="magicpos" />
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
						<li class="nav-item"><a class="nav-link" href="${cpath}/magicpos.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/loginPage.do">로그인</a></li>
					</c:otherwise>
				</c:choose>				
			</ul>	
        </div>
		</div>
	</nav>

   <header class="masthead">
     <section class="page-section bg-light orderSection" id="portfolio">
       <div class="container">
         <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
            	<%-- <jsp:include page="camera.jsp"/> --%>
             	<img id="webcam-frame" src="http://127.0.0.1:9001/video_feed" alt="Webcam Stream" width="100%">
            	<iframe src="http://127.0.0.1:9001/motion_feed" style="display:none;"></iframe>
			</div>
           	<div class="col-lg-8 col-sm-6 mb-4">
           		<div class="currentTable" style="font-family: 'GongGothicMedium';">${rvo.shop_name} 테이블 현황</div>
				<div class="tableGrp">
					<c:forEach var="table" begin="1" end="${rvo.shop_table}" varStatus="i">
					<button class="tableorderbtn" id="table_${i.index}" onclick="location.href='${cpath}/order.do?table_num=${table}'">
						<div class="tableOrderInfo">
							<div class="orderTable">${table}번테이블</div>
							<div class="orderInfoList">
								<c:forEach var="order" items="${order_List}" varStatus="i">							
									<c:if test="${table eq order.table_no}">
										<c:if test="${order.payYN eq 'N'}">
											<div class="orderInfoGrp">
												<div class="orderInfoName">${order.menu_name}</div>
												<div class="orderInfo">${order.menu_cnt}</div>
												<div class="orderInfo">${order.menu_price * order.menu_cnt}</div>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</button>
				</c:forEach>
				</div>
          	</div>
          	</div>
         </div>
      </div>
    </section>
	</header>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
</script>
</body>
</html>