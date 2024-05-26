<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>booking sidebar</title>

<style>
.LinkFlowSidebar {
	width: 15%;
	min-width: 300px;
	min-height: 400px;
}

.sidebarName {
	font-size: 32px;
	font-weight: bold;
	color: #d0d4db;
}

.middleName {
	font-size: 20px;
	font-weight: bold;
}

.linkfoiwsideMenu {
	padding: 0px 20px 0px 20px;
	margin-top: 38px;
}

.LinkFlowInsertBtnArea {
	margin-bottom: 20%;
}

.sideSmall {
	padding-left: 20px;
}

/* 모달 */
.md-header {
	padding-top: 20px;
	padding-left: 40px;
	display: flex;
	align-items: center;
}

.md-header p {
	padding: 10px;
	margin-top: 10px;
	font-size: larger;
}

.md-type {
	width: 70px;
	padding-left: 12px;
	height: 40px;
}

.md-list {
	color: rgb(203, 200, 200);
	padding-left: 25px;
	font-size: small;
	padding-top: 15px;
}

.md-select {
	text-align: center;
	width: 60px;
}

.md-div {
	display: flex;
	padding-left: 40px;
}

.bk-coment {
	border: none;
	border-bottom: 1px solid steelblue;
	width: 80%;
	height: 50px;
	margin-left: 20px;
}

.modal-body {
	margin-left: 13px;
	padding-bottom: 20px;
}

.modal-body h6 {
	padding-top: 12px;
}

.modal-content {
	width: 400px;
}
.carTime{
	display:flex;
}
.timeH4{
	padding-right:70px;
	text-align :center;
}
select{
	height:100px;
}

</style>
</head>
<body>

	<div class="LinkFlowSidebar">
		<!-- Main Sidebar Container -->
		<aside class="sidebar-mini sidebar-dark-primary elevation-4 "
			style="height: 100%;">

			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar Menu -->
				<nav class="linkfoiwsideMenu">

					<!--프로젝트 등록이나 휴가 신청등 버튼등 보여지는 요소 필요없음 지우거나~-->
					<div class="LinkFlowInsertBtnArea">
						<button type="button" class="btn btn-block bg-primary btn-lg"
							data-toggle="modal" data-target="#booking" onclick="bookingSet();">+ 예약하기</button>
					</div>

					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
						<li class="sidebarName">시설/비품 예약</li>
						<br>

						<li class="nav-item">
							<a href="${contextPath }/booking/room.bk" class="nav-link middleName"> 
								<i class="nav-icon far-2xl fa-solid fa-book"></i>
								<p>시설 예약</p>
							</a>
						</li>

						<li class="nav-item">
							<a href="${contextPath }/booking/supplies.bk" class="nav-link middleName"> 
								<i class="nav-icon fa-2xl fa-solid fa-book"></i>
								<p>비품 예약</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="${contextPath }/booking/mylist.bk" class="nav-link middleName"> 
								<i class="nav-icon far-2xl fa-solid fa-book-bookmark"></i>
								<p>나의 예약 목록</p>
							</a>
						</li>

						<br>
						<br>
						<c:if test="${ loginUser.spRight eq 'Y' }">
						<li class="nav-item"><a href="#" class="nav-link middleName">
								<i class="nav-icon far-2xl fa-solid fa-gear"></i>
								<p>
									예약 관리 <i class="fas fa-angle-left right"></i>
								</p>
						</a>

							<ul class="nav nav-treeview" style="padding-left: 20px;">
								<li class="nav-item"><a
									href="${contextPath }/booking/room.mng" class="nav-link"> <i class="far far-2xs fa-circle nav-icon"></i>
										<p>시설 예약 관리</p>
								</a></li>
								<li class="nav-item">
									<a href="${contextPath }/booking/sup.mng" class="nav-link">
										<i class="far far-2xs fa-circle nav-icon"></i>
										<p>비품 예약 관리</p>
									</a>
								</li>
								
							</ul>
						</li>
						<li class="nav-item">
							<a href="${ contextPath }/booking/ass.list" class="nav-link middleName"> 
								<iclass="nav-icon far-2xl fa-solid fa-wallet"></i>
								<p>자산 관리</p>
							</a>
						</li>
						</c:if>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- 예약하기 -->
		<div class="modal fade" id="booking">
			<div class="modal-dialog">
				<div class="modal-content">
				<form id="insertBooking" action="${contextPath }/booking/insert.bk" method="post">
					<div class="md-header">
						<select name="mainName" id="bk-name" class="md-type form-control" style="width:80px;" onchange="changeBody();">
							<option value="시설">시설</option>
							<option value="비품">비품</option>
						</select> &nbsp;&nbsp;
						<p style="float: left;">예약하기</p>
					</div>
							           
		            <!-- Modal body for room -->
		            <div id="room-content" class="modal-body-content">
		               <%-- 
		                <c:set var="ymd" value="${bk.bkStartDate}" />
						<c:set var="ymdArr" value="${fn:split(ymd, '/')}" />
						 --%>
			        	<p class="md-list">예약 날짜</p>
		                <div class="md-div">
		               		<select name="year" class="form-control setYear" style="width:100px;" class="md-select"></select> &nbsp;
				        	<select name="month" class="form-control setMonth" style="width:80px;" class="md-select"></select>&nbsp;
				        	<select name="day" class="form-control setDay" style="width:100px;" class="md-select"></select>&nbsp;
		                </div>
		                <p class="md-list">이용 시간</p>
		                <div class="md-div">
		                    <select name="bkStartTime" id="bk-sTime" style="width:90px;" class="md-select form-control">
		                        <c:forEach var="hour" begin="9" end="17">
                                    <c:forEach var="minute" begin="0" end="30" step="30">
                                        <option value="${hour < 10 ? '0' : ''}${hour}:${minute == 0 ? '00' : minute}">
                                            ${hour < 10 ? '0' : ''}${hour}:${minute == 0 ? '00' : minute}
                                        </option>
                                    </c:forEach>
                                </c:forEach>
		                    </select> &nbsp;&nbsp;
		                    <p>~</p>&nbsp;&nbsp;
		                    <select name="bkEndTime" id="bk-eTime" style="width:90px;" class="md-select form-control">
		                        <c:forEach var="hour" begin="10" end="18">
                                    <c:forEach var="minute" begin="0" end="30" step="30">
                                        <option value="${hour}:${minute == 0 ? '00' : minute}">
                                            ${hour}:${minute == 0 ? '00' : minute}
                                        </option>
                                    </c:forEach>
                                </c:forEach>
		                    </select> &nbsp;&nbsp;
		                </div>
		                <p class="md-list">이용 시설</p>
		                <div class="md-div">
		                    <select name="assetsName" id="bk-room" style="width:auto;" class="md-select form-control">
		                        <option value="A">회의실A</option>
		                        <option value="B">회의실B</option>
		                        <option value="C">회의실C</option>
		                    </select>
		                </div>
		            </div>
		            
		            <!-- Modal body for supplies -->
		            <div id="supplies-content" class="modal-body-content" style="display: none;">
		                <p class="md-list">상품 명</p>
		                <div class="md-div">
		                    <select name="subName" id="bk-subName" style="width: 100px;" class="md-select form-control" onchange="changeSup();">
		                        <option value="노트북">노트북</option>
		                        <option value="차량">차량</option>
		                        <option value="키보드">키보드</option>
		                        <option value="마우스">마우스</option>
		                    </select> &nbsp;&nbsp;&nbsp;
		                    <select name="assetsName" id="bk-assName" style="width: auto;" class="md-select form-control"></select>
		                </div>
		                <p class="md-list">이용 시간</p>
		                <div id="notCar" class="md-div" > <h4> - </h4></div>
		                <div class="md-div bkTime" id="sup-car" style="display:none;">
		                	<div class="carTime">
			                	<select name="startYear" class="form-control setYear" style="width:100px;" class="md-select"></select> &nbsp;
					        	<select name="startMonth" class="form-control setMonth" style="width:80px;" class="md-select"></select>&nbsp;
					        	<select name="startDay" class="form-control setDay" style="width:100px;" class="md-select"></select>&nbsp;
		                	</div>
		                   
		                     <div class="timeH4"><h2> - </h2></div>
		                    <div class="carTime">
			                	<select name="endYear" class="form-control setYear" style="width:100px;" class="md-select"></select> &nbsp;
					        	<select name="endMonth" class="form-control setMonth" style="width:80px;" class="md-select"></select>&nbsp;
					        	<select name="endDay" class="form-control setDay" style="width:100px;" class="md-select"></select>&nbsp;
		                	</div>
		                </div>
		            </div>
		            
					<div class="modal-body">
						<h6>사유</h6>
						<input type="text" class="bk-coment" name="bkContent" placeholder="예약 사유" required>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
						<button type="submit" class="btn btn-outline-primary">SUBMIT</button>
					</div>
				</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--사이드바 끝-->
	</div>
	<script>
	    $(document).ready(function () {
	      $('.dropdown-item').click(function () {
	        var selectedText = $(this).find('.spanCss').text();
	        $('.resultArea').text(selectedText);
	      });
		})
		
		
		function bookingSet(){
	    	dateSet();
	    	setDto();
	    }
	    
	    function dateSet() {
	        var now = new Date();
	        console.log(now);
	        /***************************** 날짜 초기화 ***********************************/
	        $(".setYear").empty();
	        $(".setMonth").empty();
	        $(".setDay").empty();
	        
	        var setDate = new Date(now.getFullYear(), now.getMonth() + 1, 0);
	        // 년도 셋팅
	        $(".setYear").append("<option value='" + now.getFullYear() + "'>" + now.getFullYear() + "</option>");
	        if (now.getMonth() == 11) {
	            var nextYear = Number($(".setYear").val()) + 1;
	            $(".setYear").append("<option value='" + nextYear + "'>" + nextYear + "</option>");
	        }
	        
	        // 월 셋팅
	        var currentMonth = String(now.getMonth() + 1).padStart(2, '0');
	        var nextMonth = String(now.getMonth() + 2).padStart(2, '0');
	        $(".setMonth").append("<option value='" + currentMonth + "'>" + currentMonth + "</option>");
	        $(".setMonth").append("<option value='" + nextMonth + "'>" + nextMonth + "</option>");
	        
	        // 일 셋팅
	        var currentDay = String(now.getDate()).padStart(2, '0');
	        $(".setDay").append("<option value='" + currentDay + "'>" + currentDay + "</option>");
	        
	        for (var i = now.getDate(); i <= setDate.getDate(); i++) {
	            if (i != now.getDate()) {
	                var day = String(i).padStart(2, '0');
	                $(".setDay").append("<option value='" + day + "'>" + day + "</option>");
	            }
	        }
	        /***************************** 날짜 초기화 ***********************************/
	        
	        $(".setYear").change(function() {
	            $(".setDay").empty();
	            var tempDate = new Date($(this).val(), $(".setMonth").val() - 1, 0);
	            for (var i = 1; i <= tempDate.getDate(); i++) {
	                var day = String(i).padStart(2, '0');
	                $(".setDay").append("<option value='" + day + "'>" + day + "</option>");
	            }
	        });
	        
	        $(".setMonth").change(function() {
	            $(".setDay").empty();
	            var tempDate = new Date($(".setYear").val(), $(this).val(), 0);
	            
	            if (tempDate.getMonth() != now.getMonth()) {
	                for (var i = 1; i <= tempDate.getDate(); i++) {
	                    var day = String(i).padStart(2, '0');
	                    $(".setDay").append("<option value='" + day + "'>" + day + "</option>");
	                }
	            } else {
	                var currentDay = String(now.getDate()).padStart(2, '0');
	                $(".setDay").append("<option value='" + currentDay + "'>" + currentDay + "</option>");
	                
	                for (var i = now.getDate(); i <= tempDate.getDate(); i++) {
	                    if (i != now.getDate()) {
	                        var day = String(i).padStart(2, '0');
	                        $(".setDay").append("<option value='" + day + "'>" + day + "</option>");
	                    }
	                }
	            }
	        });
	    }

	    function setDto(){
	    	let supplies = $("#bk-subName").val();
	    	$("#bk-room").empty();
	    	$("#bk-assName").empty();
	    	
	    	$.ajax({
	    		url : '${contextPath}/booking/setDto.bk',
	    		success:function(result){
	    			
	    			for(let i=0; i<result.length; i++){
    					if(result[i].mainName === '시설'){
	    					 /* room += "<option value='"+ result[i].assetsName +"'>"+ result[i].subName + result[i].assetsName +"</option>"; */
	    					$("#bk-room").append("<option value='"+ result[i].assetsName +"'>"+ result[i].subName + result[i].assetsName +"</option>");
    					}else if(result[i].subName === supplies){
    						$("#bk-assName").append("<option value='"+ result[i].assetsName +"'>"+ result[i].assetsName +"</option>")
    					
    					}
    				}
	    			
	    		}
	    	})
	    }
	    
	    function changeSup(){
	    	setDto();
	    	dateSet();
	    	
	    	let supplies = $("#bk-subName").val();
	    	if(supplies === '차량'){
	    		$("#notCar").css('display','none');
	    		$("#sup-car").css('display','block');
	    	}else{
	    		$("#notCar").css('display','block');
	    		$("#sup-car").css('display','none');
	    	}
	    }
	    
	    function changeBody() {
	        var selectedValue = document.getElementById('bk-name').value;
	        var roomContent = document.getElementById('room-content');
	        var suppliesContent = document.getElementById('supplies-content');

	        if (selectedValue === '시설') {
	            roomContent.style.display = 'block';
	            suppliesContent.style.display = 'none';
	        } else if (selectedValue === '비품') {
	            roomContent.style.display = 'none';
	            suppliesContent.style.display = 'block';
	        }
	    }
	    
	    function submit(){
	    	
	    }
	  </script>
</body>
</html>