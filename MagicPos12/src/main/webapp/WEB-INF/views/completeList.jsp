<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>MAGIC POS MAIN</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="resources/css/orderList.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style type="text/css">
    @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}

  	.bg-light{
  		--bs-bg-opacity: 0.9;
  	}
  	.card-header{
  		color:#fff;
  		background-color: #7d8690;
  	}
  	
  	.card{
  		border-radius: 15px;
  		width: 20%;
  		margin-right: 50px;
    	margin-bottom: 25px;
  	}
  	
  	.nav-link:hover{
  		text-decoration: none;
  	}
  	
  	.datetext{
  		color:#fff;
  		margin-top: 13px;
  		margin-right: 20px;
  	}
  	
  	.row{
  		margin-top:50px;
  	}
  	
  	.panel-heading{
  		color: #fff;
  		font-family: 'Pretendard-Regular';
  	}
  	
  	.orderSection{
  		border-radius: 0px 0px 20px 20px;
  	}
  	
  	.taxGroup {
  		display: flex;
    	flex-wrap: wrap;
        margin-left: 80px;
     }
     
     .card-text {
	    display: flex;
	    flex-direction: column;
     }
     
     .taxinfo {
     	display: flex;
  		justify-content: space-around;
     }
     
     .taxinfolist {
     	display: flex;
	    justify-content: space-around;
	    flex-direction: column;
     }
     
     .taxmenuinfo {
	    display: flex;
	    width: 100%;
	    justify-content: inherit;
     }
     
  	
  </style>
</head>
<body  id="page-top" style="font-family: 'Pretendard-Regular';">
	<!-- ----------------------------------페이지 헤드 부분 ------------------------------------- -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="height: 58px;" id="mainNav">
		<div class="container">
			<!-- 매직포스 로고 및 홈버튼 -->
			<a class="navbar-brand" href="${cpath}/magicpos.do">
			<img src="resources/assets/img/logo3.png" alt="magicpos" />
			<div class="brandName">MagicPos</div>
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
        <div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="sysdate">
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>
			</c:set>
				<c:choose>
					<c:when test="${!empty rvo}">
						<h3 class="datetext">${sysdate}</h3>
						<li class="nav-item"><a class="nav-link" href="${cpath}/mainPage.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/menuList.do">매장관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/orderComplete.do">주문관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/logout.do">Logout</a></li>
					</c:when>
					<c:otherwise>
						<h3 class="datetext">${sysdate}</h3>	
						<li class="nav-item"><a class="nav-link" href="${cpath}/magicpos.do">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="${cpath}/loginPage.do">로그인</a></li>
					</c:otherwise>
				</c:choose>				
			</ul>	
        </div>
		</div>
	</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<header class="masthead">
		<div class="container">
  			<div class="page-section bg-light orderSection">
   			 <div class="panel-heading"><h3 style="font-family: 'Pretendard-Regular';">완료된 주문입니다</h3></div>
    		<div class="panel-body">
    		
				<!-- order_info 테이블에 주문 접수 상태(접수 / 완료) 컬럼 추가해서 
				container div 묶어서 조건문 돌리기
				- 접수 3개 이상이면 컨테이너 하나 더 생성 / 6개 이상이면 다음페이지로 페이징 처리까지 하는 컬럼
				
				주문번호 오름차순으로 정렬해서 뽑는 세션 받아와서 주문번호 빠른 순으로 정렬하고
				주문완료 누르면 사라지고 그 다음 빠른 번호가 맨 앞으로 오게 하기  	-->
				

						<div class="container">
							<div class="row">
								<div class="col-12">
									<div class="taxGroup">
										<c:forEach var="order_idx" items="${orderIdx_Y}" varStatus="status" begin="0" step="1">
									<c:set var="orderDate">
										<fmt:formatDate value="${no_Date_YN_Y[status.index].order_date}"
											pattern="yyyy-MM-dd" />
									</c:set>
									<c:if test="${no_Date_YN_Y[status.index].payYN == 'Y'}">
											<div class="card">
												<div class="card-header">주문번호 :${orderIdx_Y[status.index]}</div>
												<div class="card-body">
													<h5 class="card-title">${no_Date_YN_Y[status.index].table_no }번 테이블</h5>
													<div class="card-text">
														<div class="taxinfo">
															<div>메뉴 명</div>
															<div>가격</div>
															<div>수량</div>
														</div>
														<div class="taxinfolist">
															<c:forEach var="info" items="${loginResOrder_Y}" varStatus="i" begin="0" step="1">
																<c:if test="${order_idx == info.order_idx }">
																	<div class="taxmenuinfo">
																		<div>${info.menu_name}</div>
																		<div>${info.menu_price}</div>
																		<div>${info.menu_cnt}</div>
																	</div>
																</c:if>
															</c:forEach>
														</div>
																<div>
																	<h4>총계 : ${totalPrice_Y[status.index]} 원</h4>
																</div>
													</div>
												</div>
											</div>
									</c:if>
								</c:forEach>
									</div>
								
								</div>

							</div>
						</div>
					
				<nav aria-label="...">
					<!-- 페이징 처리 -->
							<ul class="pagination justify-content-center" style="margin:20px 0">
							
							<!-- 이전번호 버튼 - 1일때는 안나오게 -->
								<c:if test="${pm.prev}">
									<li class="page-item"><a class="page-link" href="${pm.startPage-1}">Prev</a></li>
								</c:if>
								
							<!-- 시작페이지부터 끝페이지까지 출력되게 -->
								<c:forEach var="page" begin="${pm.startPage}" end="${pm.endPage}">
									<li class="page-item ${pm.cri.page==page ? 'active': ''}"><a class="page-link" href="${page}">${page}</a></li>
								</c:forEach>
								
							<!-- 다음번호 버튼 - 마지막 페이지일 때는 안나오게 -->
								<c:if test="${pm.next}"> 
									<li class="page-item"><a class="page-link" href="${pm.endPage+1}">Next</a></li>
								</c:if>
								
							</ul>
				</nav>

				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
					<script
						src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
					<script
						src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
				</div>

			
</div></div>
<form id="frm" action="${cpath}/orderComplete.do" method="post">
		<input type="hidden" id="page" name="page" value="${pm.cri.page}">
</form>

<script type="text/javascript">
		$(document).ready(function() {
			$(".page-link").click(function(e){
				e.preventDefault();
				var page = $(this).attr("href");
				$("#page").val(page);
				$("#frm").submit();
				//location.href="${cPath}/list.do?page="+page; //=><form>
			});
		});
			
</script>
</header>
</body>
</html>