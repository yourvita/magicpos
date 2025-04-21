<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>매장관리</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/images/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script
            src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <!-- Google fonts-->
        <link
            href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
            rel="stylesheet"
            type="text/css" />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
            rel="stylesheet"
            type="text/css" />
            <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.3/dist/chart.umd.min.js"></script>
            
        <!-- Core theme CSS (includes Bootstrap)-->
       <link href="resources/css/styles.css" rel="stylesheet" />
       <style type="text/css">
       		body {
       			height:100%;
       			overflow:hidden;
       		}
       		
       		.labellabel{
       			margin-top:10px;
       			font-family: 'Pretendard-Regular';
       		}
       
       		.btnbtn{
       			margin-top: 10px;
       			font-family: 'Pretendard-Regular';
       		}
       
       		.btn-primary2{
       			background-color: #FF0000;
       			border-color: #FF0000;
       			color:#fff;
       		}
       
       		.menuRegister{
       			font-family: 'Pretendard-Regular';
       		}
       
       		.table-hover{
       			margin-top:10px;
       			text-align: center;
       			font-family: 'Pretendard-Regular';
       		}
       
			.statis-content {
				background-color:white;
				box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
				margin-top: -8%;	
				border-radius: 15px;	
			}
			
			.title-name{
			padding-top: 35px;
			}
			
			.page_title, .store_name {
				color: black;
				font-family: 'GongGothicMedium';
			}
			
			.row {
				height: 79.5vh;
			}
					
			.store_name {
			    text-align: left;
			    margin-bottom: 2%;
			    margin-top: 2%;
   			}
   			
   			.btngroup {
   			    display: flex;
    			justify-content: space-around;
    			margin-bottom: 3%;
   			}
   			
   			.statis-btngroup {
   				display: flex;
   				justify-content: flex-start;
   				flex-wrap: wrap;
   				margin-top:40px;
   				font-family: 'Pretendard-Regular';
   				margin-left:57px;
   			}
   			
   			.statbtn {
   				width: 150px;
   				height: 50px;
 				margin-right: 1%;
 				margin-bottom: 10px;
   			}
   			
   			.stabtn:last-child {
   				margin-right: 0;
   			}
   			
			canvas {
				margin: auto;
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
        <!-- Masthead-->
        <div class="bg-overlay"></div>
        <header class="masthead" style="max-height:100vh; min-height:100vh;">
            <div class="container statis-content">
				<div class="content-section">
					        <div class="title-name">
						        <h2 class="page_title">${rvo.shop_name}매장 관리</h2>
					        </div>
            	<div class="row">
						<div class="col-lg-8 col-sm-6 mb-4">
							<!-- 통계 출력 -->
							<div id="storeStatis">
			    				<div id="printArea">
									<div>
										<button type="button" id="menuRegister" class="btn btn-primary btn-sm menuRegister">메뉴등록</button>
									</div>
									
									<table id="menuList" class="table table-bordered table-hover">
										<tr>
											<td>메뉴번호</td>
											<td>메뉴명</td>
											<td>가격</td>
											<td></td>
											<td></td>											
										</tr>
										<c:forEach var="menu_vo" items="${menuList}" varStatus="ol">
											<tr class="menuItem">
												<td id="menu_idx${ol.index}">${menu_vo.menu_idx}</td>
												<td id="menu_name${ol.index}">${menu_vo.menu_name}</td>
												<td id="menu_price${ol.index}">${menu_vo.menu_price}</td>
												<td>
													<button type="button" id="menuModifyBtn${ol.index}" class="btn btn-primary btn-sm modifyBtn" onclick="modifyBtn_Click(${ol.index});">수정</button>
												</td>
												<td>
													<button type="button" class="btn btn-primary2 btn-sm" onclick="location.href='${cpath}/menuRemove.do?menu_idx=${menu_vo.menu_idx}'">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</table>
									
									<!-- 메뉴등록 FORM -->
									<div>
										<form action="menuRegister.do" method='post' id="menuRegisterForm" style="display:none;">
											<input type="hidden" name="shop_email" value="${rvo.shop_email}">
											<div class="labellabel">
											<label>메뉴이름</label>
											<input type="text" name="menu_name" class="form-control" style="border-radius: 20px;">
											<label>가격</label>
											<input type="text" name="menu_price" class="form-control" style="border-radius: 20px;">
											</div>
											<div class="btnbtn">
											<button type="submit" class="btn btn-primary btn-sm">등록</button>
											<button type="reset" class="btn btn-primary btn-sm">초기화</button>
											<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${cpath}/menuList.do'">뒤로가기</button>
											</div>
										</form>
									</div>
									
									<!-- 메뉴수정 FORM -->
									<div>
										<form action='modify.do' method='get' id="menuModifyForm" style="display:none;">
											<input type='hidden' id="modify_idx" name='menu_idx'>
											<label>메뉴 이름</label>
											<input type='text' id="modify_name" name='menu_name' class='form-control'/>
											<label>가격</label>
											<input type='text' id="modify_price" name='menu_price' class='form-control'/>
											<button type='submit' class='btn btn-primary btn-sm'>수정</button>
											<button type='button' class='btn btn-primary btn-sm' onclick="location.href='${cpath}/menuList.do'">목록</button>
											<button type='reset' class='btn btn-warning btn-sm'>취소</button>
										</form>
									</div>
									
									<!-- 일별 매출표 -->
									<!-- <table id='CurrentSales' class='table table-bordered' style="display:none;">
										<thead>
											<tr>
												<th>일 별 매출</th>
		    									<th>매출액</th>
											</tr>
										</thead>
    									<tbody id="CurrentSalesData">
    				
    									</tbody>
    									<tfoot>
    										<tr>
    											<th colspan="2">
				    								<button class='btn btn-primary print-btn statbtn printbtn' onclick="startPrint('storeStatis');">출력</button>
    											</th>
    										</tr>
    									</tfoot>
									</table> -->
									
									<!-- 일별 매출표 차트 영역 -->
										<canvas id="CurrentSales_Chart" width="600" height="350" style="display:none;"></canvas>
									<!-- 메뉴 별 매출액 -->
									<!-- <table id='SalesStatus' class='table table-bordered' style="display:none;">
					    				<thead>
						    				<tr>
							    				<th>메뉴 별 매출액</th>
							    				<th>매출액</th>
						    				</tr>
					    				</thead>
					    				<tbody id="SalesStatusData">
					    				</tbody>
    									<tfoot>
    										<tr>
    											<th colspan="2">
				    								<button class='btn btn-primary print-btn statbtn printbtn' onclick="startPrint('storeStatis');">출력</button>
    											</th>
    										</tr>
    									</tfoot>
					    			</table> -->
					    			
					    			<!-- 메뉴 별 매출액 차트 영역 -->
					    				<canvas id="SalesStatus_Chart" width="600" height="350" style="display:none"></canvas>
					    			
					    			<!-- 월별 매출현황 -->
					    			<!-- <table id='SalesMonthly' class='table table-bordered' style="display:none;">
					    				<thead>
						    				<tr>
							    				<th>메뉴 별 매출액</th>
							    				<th>매출액</th>
						    				</tr>
					    				</thead>
					    				<tbody id="SalesMonthlyData">
					    				</tbody>
    									<tfoot>
    										<tr>
    											<th colspan="2">
				    								<button class='btn btn-primary print-btn statbtn printbtn' onclick="startPrint('storeStatis');">출력</button>
    											</th>
    										</tr>
    									</tfoot>
					    			</table> -->
					    			
									<!-- 월별 매출현황 차트 영역 -->
										<canvas id="SalesMonthly_Chart" width="600" height="350" style="display:none;"></canvas>
								</div>
		                   	</div>
                   		</div>
                   		<div class="col-4">
                   			<!-- 통계 메뉴 버튼 -->
							<div class="btngroup">
								<div class="statis-btngroup">
									<button type="button" id= "menutap" class="btn btn-secondary statbtn">메뉴 관리</button>
									<button type="button" id="currentSales" class="btn btn-secondary statbtn">일별 매출</button>
									<button type="button" id="salesStatus" class="btn btn-secondary statbtn">메뉴별 판매현황</button>
									<button type="button" id="salesMonthly" class="btn btn-secondary statbtn">월별 매출 정산</button>
								</div>
							</div>
                   		</div>
                   		
                </div>
				</div>
            </div>
        </header>
   <script type="text/javascript">
	var registerBtn = document.getElementById('menuRegister');
	$(document).ready(function() {
               /* 메뉴 등록 비동기 처리 */                   
                $(".menuRegister").click(function(){
                   $("#menuList").css("display","none")
                   $("#menuModifyForm").css("display", "none")
                   $("#CurrentSales_Chart").css("display", "none")
                  $("#SalesStatus_Chart").css("display", "none")
                  $("#SalesMonthly_Chart").css("display", "none")
                   $("#menuRegisterForm").css("display", "block")
                   var ajaxOption = {
                         url : "menuList.do",
                         async: "true",
                         type : "POST",
                         dataType : "JSON",
                         cache: false
                   };
                   
                   $.ajax(ajaxOption).done(function(data){
                      $("#printArea").children().remove();
                      $("#printArea").html(data);
                   });
                })
                
                /* 일별 매출 */
                  $("#currentSales").click(function () {
                       $.ajax({
                          url: "${cpath}/currentSales.do",
                          type : "get",
                          dataType: "json",
                          success : ajaxCurrentSales,
                          error: function() {alert("currentSales ERROR");}
                       })
               })
                  
                  /* 메뉴별 매출 */
                  $("#salesStatus").click(function() {
                   $.ajax({
                      url: "${cpath}/salesStatus.do",
                      type : "get",
                      dataType: "json",
                      success : ajaxSalesStatus,
                      error: function() {alert("salesStatus ERROR");}
                   })
                  })
                  
                  /* 월별 매출 */
                  $("#salesMonthly").click(function(){
                     $.ajax({
                        url : "${cpath}/salesMonthly.do",
                         type : "get",
                         dataType : "json",
                         success : ajaxSalesMonthly,
                         error : function(){alert("salesMonthly ERROR")}
                     })
                  })
                  
                  $("#salesWeekly").click(function(){
                     $.ajax({
                        url : "${cpath}/salesWeekly.do",
                        type : "get",
                        dataType : "json",
                        success : ajaxSalesWeekly,
                        error : function(){alert("salesWeekly ERROR")}
                     })
                  })
                            
             
                  $("#menutap").click(function() {
                	  registerBtn.setAttribute("style", "display:block;")
	                  $("#menuList").css("display", "table")
	                  $("#SalesWeekly").css("display", "none")
	                  /* $("#SalesStatus").css("display", "none")
	                  $("#CurrentSales").css("display", "none") */
	                  $("#CurrentSales_Chart").css("display", "none")
	                  $("#SalesStatus_Chart").css("display", "none")
	                  $("#SalesMonthly_Chart").css("display", "none")
	                  $("#menuRegisterForm").css("display", "none")
	                  $("#menuModifyForm").css("display", "none")
                  })
                  
                  /* 메뉴 등록 유효성 검사 */
                  $(".btn-register").click(function (e) {
                  if($("[name = menu_name]").val() == ''){
                     alert("메뉴 이름을 입력해 주세요.");
                     e.preventDefault();
                  } else if($("[name = menu_price]").val() == '') {
                     alert("메뉴 가격을 입력해 주세요.");
                     e.preventDefault();
                  }
               })
                  /* 메뉴 수정 유효성 검사 */
                  $(".btn-modify").click(function (e) {
                  if($("#modify_name").val() == ''){
                     alert("메뉴 이름을 입력해 주세요.");
                     e.preventDefault();
                  } else if($("#modify_price").val() == '') {
                     alert("메뉴 가격을 입력해 주세요.");
                     e.preventDefault();
                  }
               })
             })
             
             
             var modifyBtns = document.querySelectorAll(".modifyBtn")
             /* 수정 FORM */
               function modifyBtn_Click(idx) {
                	registerBtn.setAttribute("style", "display:none;")
                   	var modify_Idx = document.getElementById('menu_idx'+idx).innerText
                   	var modify_Name = document.getElementById('menu_name'+idx).innerText
                   	var modify_Price = document.getElementById('menu_price'+idx).innerText
                   	document.getElementById('menuList').setAttribute("style", "display:none;")
                   	document.getElementById('menuRegisterForm').setAttribute("style", "display:none;");
                   	document.getElementById('menuModifyForm').setAttribute("style", "display:block;")
                   	var menu_Price = document.getElementById('menu_price'+idx);
                   	var menu_Name = document.getElementById('menu_name'+idx);
                   	document.getElementById('modify_idx').setAttribute("value", modify_Idx)
                   	document.getElementById('modify_name').setAttribute("value", modify_Name)
                   	document.getElementById('modify_price').setAttribute("value", modify_Price)
             }
             
             /* 일별 매출 */
             function ajaxCurrentSales(data) {
                /* var currentForm = document.getElementById("CurrentSalesData") */
                registerBtn.setAttribute("style", "display:none;")
                document.getElementById('menuList').setAttribute("style", "display:none;")
                document.getElementById('SalesMonthly_Chart').setAttribute("style", "display:none;");
                document.getElementById('SalesStatus_Chart').setAttribute("style", "display:none;");
                document.getElementById('menuRegisterForm').setAttribute("style", "display:none;");
                document.getElementById('menuModifyForm').setAttribute("style", "display:none;")
                document.getElementById('CurrentSales_Chart').setAttribute("style", "display:block;");
                var element = document.getElementById("CurrentSales_Chart"); // 요소 선택
                element.style.width = "100vw !important"; // width 속성 변경
                element.style.height = "100vh !important"; // height 속성 변경
                /* document.getElementById('CurrentSales').setAttribute("style", "display:block;") */
                /* document.getElementById('SalesMonthly').setAttribute("style", "display:none;") */
                let dateList = [];
                   let takeList= [];
                for(let i = 0; i < data.length; i++){
                   dateList.push(data[i].date);
                  takeList.push(data[i].menu_amount);
               }
               <!-- 차트 표시를 위한 스크립트 -->
               new Chart(document.getElementById("CurrentSales_Chart"), {
                  type : 'line',
                  data :{
                     labels: dateList,
                     datasets :[
                        {
                        data:  takeList,
                        label: "매출액",
                        fill: true,
                        borderColor: "rgba(254, 192, 31, 0.5)", // 그래프 색상
                        backgroundColor :"rgba(0, 0, 0, 0.001)"
                           }
                        ]
                  },
                  options: {
                	 responsive : false,
                	 maintainAspectRatio :false,
                     title: {
                        display:true,
                        text: '일별매출'
                     },
                       plugins: {
                              legend: {
                                  display: true,
                                  labels: {
                                      font: {
                                          size: 16, // 라벨 폰트 크기 변경
                                          weight: 'bold' // 라벨 폰트 굵기 변경
                                      },
                                      color: 'black' // 라벨 텍스트 색상 변경
                                  }
                              }
                          }
                  }
               })
            
                /* var table = "<div id=printArea>"
                $.each(data, function(idx, obj){
                   var date = obj.date
                   var menu_amount = obj.menu_amount
                table += "<tr>"
                table += "<td>"+date+"</td>"   
                table += "<td>"+menu_amount+"</td>"   
                table += "</tr>"   
                }) */
                // table += "<button class='btn btn-primary print-btn statbtn printbtn' onclick='startPrint('storeStatis');'>출력</button>";
                /* currentForm.innerText = '';
                currentForm.innerHTML += table */
             }
             
             /* 메뉴별 매출 */
             function ajaxSalesStatus(data) {
                //var currentForm = document.getElementById("SalesStatusData")
                registerBtn.setAttribute("style", "display:none;")
                document.getElementById('menuList').setAttribute("style", "display:none;")
                document.getElementById('CurrentSales_Chart').setAttribute("style", "display:none;")
                document.getElementById('SalesMonthly_Chart').setAttribute("style", "display:none;")
                document.getElementById('menuRegisterForm').setAttribute("style", "display:none;");
                document.getElementById('menuModifyForm').setAttribute("style", "display:none;")
                /* document.getElementById('CurrentSales').setAttribute("style", "display:none;") */
                document.getElementById('SalesStatus_Chart').setAttribute("style", "display:block;")
                /* var table = "<div id=printArea>" */
                let nameList = [];
                   let takeList= [];
                for(let i = 0; i < data.length; i++){
                   nameList.push(data[i].menu_name);
                  takeList.push(data[i].menu_amount);
               }
               <!-- 차트 표시를 위한 스크립트 -->
               new Chart(document.getElementById("SalesStatus_Chart"), {
                  type : 'bar',
                  data :{
                     labels: nameList,
                     datasets :[
                        {
                        data:  takeList,
                        label: "매출액",
                        fill: true,
                        backgroundColor: "rgba(254, 192, 31, 0.5)", // 그래프 색상
                           }
                        ]
                  },
                  options: {
                	  responsive : false,
                	  maintainAspectRatio :false,
                     title: {
                        display:true,
                        text: '메뉴별 매출'
                     },
                       plugins: {
                              legend: {
                                  display: true,
                                  labels: {
                                      font: {
                                          size: 16, // 라벨 폰트 크기 변경
                                          weight: 'bold' // 라벨 폰트 굵기 변경
                                      },
                                      color: 'black' // 라벨 텍스트 색상 변경
                                  }
                              }
                          }
                  }
               })
                /* table += "<tbody>"
                $.each(data, function(idx, obj){
                   var menu_name = obj.menu_name;
                   var menu_amount = obj.menu_amount;
                   table += "<tr>"      
                   table += "<td>"+menu_name+"</td>"   
                   table += "<td>"+menu_amount+"</td>"   
                   table += "</tr>"   
                })
                table += "</tbody>"
                 currentForm.innerText = '';
                currentForm.innerHTML += table */
             }
             
             /* 월간 매출 */
             function ajaxSalesMonthly(data) {
                //var currentForm = document.getElementById("SalesMonthlyData")
                registerBtn.setAttribute("style", "display:none;")
                document.getElementById('menuList').setAttribute("style", "display:none;")
                document.getElementById('CurrentSales_Chart').setAttribute("style", "display:none;")
                document.getElementById('SalesStatus_Chart').setAttribute("style", "display:none;")
                document.getElementById('menuRegisterForm').setAttribute("style", "display:none;");
                document.getElementById('menuModifyForm').setAttribute("style", "display:none;")
                /* document.getElementById('CurrentSales').setAttribute("style", "display:none;")
                document.getElementById('SalesStatus').setAttribute("style", "display:none;") */
                document.getElementById('SalesMonthly_Chart').setAttribute("style", "display:block;")
                let dateList = [];
                   let takeList= [];
                for(let i = 0; i < data.length; i++){
                   dateList.push(data[i].date);
                  takeList.push(data[i].menu_amount);
               }
               <!-- 차트 표시를 위한 스크립트 -->
               new Chart(document.getElementById("SalesMonthly_Chart"), {
                  type : 'line',
                  data :{
                     labels: dateList,
                     datasets :[
                        {
                        data:  takeList,
                        label: "매출액",
                        fill: true,
                        borderColor: "rgba(254, 192, 31, 0.5)", // 그래프 색상
                        backgroundColor :"rgba(0, 0, 0, 0.001)" 
                           }
                        ]
                  },
                  options: {
                	 responsive : false,
                	 maintainAspectRatio :false,
                     title: {
                        display:true,
                        text: '월별 매출'
                     },
                       plugins: {
                              legend: {
                                  display: true,
                                  labels: {
                                      font: {
                                          size: 16, // 라벨 폰트 크기 변경
                                          weight: 'bold' // 라벨 폰트 굵기 변경
                                      },
                                      color: 'black' // 라벨 텍스트 색상 변경
                                  }
                              }
                        }
                  }
               })
                /* var table = "<div id=printArea>"
                table += "<tbody>"
                $.each(data, function(idx, obj){
                   var date = obj.date;
                   var menu_amount = obj.menu_amount;
                   table += "<tr>"      
                   table += "<td>"+date+"</td>"   
                   table += "<td>"+menu_amount+"</td>"   
                   table += "</tr>"   
                })
                table += "</tbody>"
                  currentForm.innerText = '';
                currentForm.innerHTML += table */
             }
             
             // 프린트하고 싶은 영역의 id 값을 통해 출력 시작
             function startPrint (div_id) {
                prtContent = document.getElementById("storeStatis");
                window.onbeforeprint = beforePrint;
                window.onafterprint = afterPrint;
                window.print();
             }
             
             // 웹페이지 body 내용을 프린트하고 싶은 내용으로 교체
             function beforePrint(){
                initBody = document.body.innerHTML;
                document.body.innerHTML = prtContent.innerHTML;
             }

             // 프린트 후, 웹페이지 body 복구
             function afterPrint(){
                document.body.innerHTML = initBody;
             }

</script>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>