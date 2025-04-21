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
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<style type="text/css">
	button {
		background-color: inherit;
		border: none;
	}
	
	input {
		background-color: inherit;
		border: none;
	}
	
	.page-section {
		padding:0;
	}
	
	.menuGroup {
		display: flex;
		flex-direction: column;
	    height: 450px;
	}
	
	.orderSection {
		width: 1300px;
	    text-align: center;
	    margin: auto;
	    border: 1px solid #000000;
	    border-radius: 30px;
	    height: 592px;
	    margin-top: -155px;
	    padding: 0;
	    padding-top: 40px;
	}
	
	.shopName {
	    background-color: #fbb22c;
	    height: 70px;
	    width: 100%;
	    border: 1px solid #000000;
	    border-radius: 15px;
	    margin-bottom: 15px;
	    padding: 15px 0;
	    color: #ffffff;
	    font-size: 2rem;
    	font-weight: 700;
	}
		
	.bg-light {
		--bs-bg-opacity: 0.9;
	}
	
	.menuSelectBtn {
		display: flex;
	    width: 362px;
	    height: 50px;
	    flex-direction: row;
	    text-align: center;
	    margin-left: 20px;
	    margin-top: 20px;
	    font-size: 1.25rem;
	}
	
	.menuInfo {
		width: 100%;
		display: flex;
		flex-direction: row;
	}
	
	.menuCount {
		width: 5%;
		margin-right:5px;
		font-size: 1.5rem;
	}
	
	.menuName {
		width: 300px;
		text-align: left;
		font-size: 1.5rem;
	}
	
	.menuPrice {
		width:80px;
		text-align: left;
	    font-size: 1.5rem;
	}
	
	.orderList {
		display: flex;
		margin-left: 30px;
		margin-top: 15px;
   	 	margin-bottom: 15px
	}
	
	.orderListHead {
		display: flex;
		margin-left: 30px;
		margin-top: 15px;
   	 	margin-bottom: 15px
	}
	
	.orderInputName {
		width:60%;
		text-align: left;
		font-size: 1.3rem;
	}
	
/* 	.orderInputPrice {
		width:20%;
		text-align: center;
		font-size: 1.3rem;
	} */
	
	.orderInputCnt {
		width:40%;
		text-align: center;
		font-size: 1.3rem;
	}
	
	.orderInputAmount {
		width:40%;
		text-align: center;
		font-size: 1.3rem;
	}
	
	.menuTitle {
		display: flex;
		margin-left:30px;
		margin-top: 20px;
	}
	
	.horizon {
		border: 1px solid gray;
	    width: 90%;
	    margin-left: 20px;
	    margin-top: 8px;
    	margin-bottom: 8px
	}
	
	.orderAmountGrp {
		width:100%;
		display: flex;
	    flex-direction: row;
	    justify-content: space-around;
	    margin: auto;
	    margin-bottom: 12px;
	}
	
	.orderAmount {
		font-size: 1.3rem;
		margin-right: 25px;
	}
	
	.orderInputResult {
		width: 90px;
		font-size: 1.3rem;
	}
	.payBtnGroup {
		width: 345px;
	}
	.payBtn {
		background-color: #fbb22c;
		color: white;
		width: 48%;
		height:50px;
	    font-size: 1.5rem;
	    font-weight: 700;
	    border: 1px solid black;
	    border-radius: 15px;
	    margin: auto;
   		margin-bottom: 10px;
   		font-family: 'GongGothicMedium';
	}
	
	.formSection {
		height: 92%;
	}
	
	.formInfo {
		height: 450px;
		background-color:#fff;
		border: 1px solid #000000;
	    border-radius: 25px;
	}
	
	.resultgroup {
	    position: fixed;
	    top: 590px;
	    left: 1014px;
	}
	
	.datetext {
	    color: #fff;
	    margin-top: 5px;
	    margin-right: 20px;
	    font-weight: 700;
	    font-size: 1.05rem;
	}
	
	#webcam-frame {
		margin-top: 100px;
    	margin-left: 45px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
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

   <header class="masthead">
     <section class="page-section bg-light orderSection" id="portfolio">
       <div class="container">
         <div class="row">
         	<div class="col-lg-4">
         		<img id="webcam-frame" src="http://127.0.0.1:9001/video_feed" alt="Webcam Stream" width="100%">
            	<iframe src="http://127.0.0.1:9001/motion_feed" style="display:none;"></iframe>
         	</div>
           	<div class="col-lg-4 col-sm-6 mb-4">
				<div class="orderBtnGroup">
					<h3 class="shopName">${rvo.shop_name} 메뉴</h3>
					<div class="menuGroup formInfo">
						<c:forEach var="menu" items="${menuList}" varStatus="ol">
		           			<button class="menuSelectBtn menu_${ol.index+1}" id="menu_${menu.menu_idx}" onclick="button_click(${ol.index})">
								<div class="menuInfo">
									<div class="menuCount">${ol.count}.</div>
			           				<div class="menuName" id="name_${menu.menu_idx}">${menu.menu_name}</div>
			           				<div class="menuPrice" id="price_${menu.menu_idx}">${menu.menu_price}</div>
								</div>
		           			</button>
	           			</c:forEach>
           			</div>
				</div>
          	</div>
          
          	<div class="col-lg-4 col-sm-6 mb-4" style="padding-right: 40px;">
          		<h3 class="shopName">${table_num} 번 테이블</h3>
				<div class="formSection">
					<form action="insertOrder.do" method="POST" id="orderForm">
						<div class="formInfo">
							<c:if test="${empty orderList}">
								<div class="menuGroup">
									<div class="orderListHead">
										<div class="orderInputName">메뉴</div>
										<div class="orderInputCnt">수량</div>
										<div class="orderInputAmount">합계</div>
									</div>
									<div class="horizon"></div>
									<c:forEach var="menu" items="${menuList}" varStatus="ol">
										<div class="orderList" id="order_${ol.index}" style="display:none;">
											<input type="hidden" class="orderInput" name="order_list[${ol.index}].menu_idx" value="${menu.menu_idx}" readonly="readonly">
											<input type="hidden" class="orderInput" name="order_list[${ol.index}].table_no" value="${table_num}" readonly="readonly">
											<input type="text" class="orderInputName" name="order_list[${ol.index}].menu_name" value="${menu.menu_name}" readonly="readonly">
											<input type="hidden" class="orderInputPrice" id="mp_${ol.index}" name="order_list[${ol.index}].menu_price" value="${menu.menu_price}" readonly="readonly">
											<input type="number" class="orderInputCnt" id="mc_${ol.index}" name="order_list[${ol.index}].menu_cnt" value="0" readonly="readonly">
											<input type="number" class="orderInputAmount" id="pa_${ol.index}" name="order_list[${ol.index}].menu_total_amount" value="${menu.menu_price}" readonly="readonly">
										</div>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${!empty orderList}">
								<div class="menuGroup">
									<div class="menuTitle">
										<div class="orderInputName">메뉴</div>
										<div class="orderInputCnt">수량</div>
										<div class="orderInputAmount">합계</div>
									</div>
										<div class="horizon"></div>
									<c:forEach var="menu" items="${orderList}" varStatus="ol">
										<div class="orderList" id="order_${ol.index}">
											<input type="hidden" class="orderInput" name="order_list[${ol.index}].menu_idx" value="${menu.menu_idx}" readonly="readonly">
											<input type="hidden" class="orderInput" name="order_list[${ol.index}].table_no" value="${table_num}" readonly="readonly">
											<input type="text" class="orderInputName" name="order_list[${ol.index}].menu_name" value="${menu.menu_name}" readonly="readonly">
											<input type="hidden" class="orderInputPrice" id="mp_${ol.index}" name="order_list[${ol.index}].menu_price" value="${menu.menu_price}" readonly="readonly">
											<input type="number" class="orderInputCnt" id="mc_${ol.index}" name="order_list[${ol.index}].menu_cnt" value="${menu.menu_cnt}" readonly="readonly">
											<input type="number" class="orderInputAmount" id="pa_${ol.index}" name="order_list[${ol.index}].menu_total_amount" value="${menu.menu_price * menu.menu_cnt}" readonly="readonly">
										</div>
									</c:forEach>
								
							</c:if>
							<div class="resultgroup">
								<div class="orderAmountGrp">
									<div class="orderAmount">총 주문 금액</div>
									<input type="number" class="orderInputResult" id="order_total_amount" name="order_total_amount" value="${orderList[0].order_total_amount}" readonly="readonly">
								</div>
								<div class="payBtnGroup">
									<button type="submit" id="orderBtn" class="payBtn">주문</button>
									<button type="button" id="payBtn" class="payBtn" onclick="location.href='${cpath}/payNY.do?table_num=${table_num}'">결제</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
         </div>
      </div>
    </section>
	</header>
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
				console.log(document.getElementsByClassName('menu_'+idx))
				//document.getElementById('menu_53').click();
				document.getElementsByClassName('menu_'+idx)[0].click();
				//var btnclick = document.getElementsByClassName('menu_'+idx);
				//btnclick.click(); 
			}
			else if(data=='two'){
				idx=2;
				document.getElementsByClassName('menu_'+idx)[0].click();
			}
			else if(data=='three'){
				idx=3;
				document.getElementsByClassName('menu_'+idx)[0].click();
			}
			else if(data=='four'){
				idx=4;
				document.getElementsByClassName('menu_'+idx)[0].click();
			}
			else if(data=='select'){
				document.getElementById('orderBtn').click();
			}
			else if(data=='up') {
				document.getElementById('payBtn').click();
			}
		}		
}

		var button = document.querySelectorAll('.orderBtnGroup > button');
		var order = document.querySelectorAll(".orderList > input:not([type='hidden'])")
		var orderList = document.querySelectorAll(".orderList")
		console.log(orderList)
		
		for(var i=0;i<${menu_cnt}; i++) {
			eval("var menu_cnt" + i + "=" + 1)
		}
		
		function button_click(idx) {
			var menu_Price = document.getElementById('mp_'+idx)
			var order_total = document.getElementById('order_total_amount').value
			
			menu_Price = Number(menu_Price.value)
			orderList[idx].style.display = 'flex';
			document.getElementById('mc_'+idx).setAttribute("value", eval("menu_cnt"+idx))
			document.getElementById('pa_'+idx).setAttribute("value", eval("menu_cnt"+idx)*menu_Price)
			//document.getElementById('order_total_amount').setAttribute("value", 0)
			order_total = Number(order_total)
			order_total += Number(document.getElementById('mp_'+idx).value)
			//order_total += eval("menu_cnt"+idx)*menu_Price
			document.getElementById('order_total_amount').setAttribute("value", order_total)
			//document.getElementById('order_total_amount').setAttribute("name", "order_total_amount"+idx)
			eval("menu_cnt"+idx+"+="+1)
		}
</script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
</script>
</body>
</html>