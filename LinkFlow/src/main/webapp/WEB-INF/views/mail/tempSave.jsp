<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper{
 min-height: 100%;
 width: 100%;
}
.LinkFlowMainSection{
    width: 100%;
    min-height: 1500px;
   
    display: flex;
}
.LinkFlowMainContent{
    width: 100%;
    min-width: 1260px;
    background-color: #f4f6f9;
    min-height: 400px;
    padding: 30px;
}
.contentArea{ 
 width: 100%;
}
.contentInElement{display: flex; justify-content: space-between; margin-bottom: 30px;}
.dmovePage {
   padding: .0rem 0rem;
 }
 /*여기까지 메인 영역 요소  공용 스타일임 */
 #boardList{text-align: center;}
 #boardList>tbody>tr:hover{cursor:pointer;}
 #pagingArea{width:fit-content;margin:auto;}
 .readUser{
   border-radius: 10px;
 }
input[type="checkbox"] {
  height: 20px;
  width: 20px;
  vertical-align: middle;
}
</style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="LinkFlowMainSection">
        <jsp:include page="/WEB-INF/views/common/sidebar/mail/MailSidebar.jsp"/>
        <div class="LinkFlowMainContent">

            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">임시저장</h1>
                    </div>
                </div>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid" style="display: flex; justify-content: center;">
                    <div class="contentArea">
                        <div class="contentInElement">
                            <div class="btnArea">
                                <button class="btn btn-primary btn-lg" style="margin-right: 6px;">삭제하기</button>
                            </div>
                            <div class="form-inline">
                                <div class="input-group">
                                    <div class="select" style="margin-right: 15px;">
                                        <select name="" id="bottom-menu" class="form-control bottom-menu" style="width: 120px;">
                                            <option value="all">작성자</option>
                                            <option value="wait">제목</option>
                                            <option value="complete">내용</option>
                                        </select>
                                    </div>
                                    <input class="form-control form-control-sidebar" type="search" placeholder="검색하기" aria-label="Search">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary">
                                            <i class="fas fa-search fa-fw"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="min-height: 500px; min-width: 100%;">
                            <div class="card">
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap" style="text-align: center;">
                                        <thead>
                                            <tr>
                                                <th width="100"><input type="checkbox" id="checkAll" onclick="checkAllBoxes()"></th>
                                                <th width="150">읽기</th>
                                                <th width="150">작성자</th>
                                                <th>제목</th>
                                                <th width="200">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                        		<c:when test="${empty tempSaveList }">
                                        			<tr>
											                					<td colspan="5"> 조회된 메일이 없습니다 </td>
											                				<tr>
                                        		</c:when>
                                        		<c:otherwise>
                                            <c:forEach var="m" items="${tempSaveList}">
                                     					<tr onclick="location.href='${contextPath}/mail/tempSaveDetail.page?&no=${ m.mailNo }';">
                                                <td><input type="checkbox" class="checkBox"></td>
                                                <td><i class="fa-solid fa-envelope-open fa-xl"></i></td>
                                                <td>${m.userName }</td>
                                                <td>${m.mailTitle }</td>
                                                <td>${m.transTime }</td>
                                            	</tr>
                                        			</c:forEach>
                                    				</c:otherwise>
                                      		</c:choose>
                                        </tbody>
                                    </table>
                                    <hr style="margin-top: 0px;">
                                    <div class="pagination" style="display: flex; justify-content: center;">
                                        <ul class="pagination">
                                        		<li class="page-item ${pi.currentPage == 1 ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/mail/tempSave.page?page=${pi.currentPage -1}">&laquo;</a></li>
                    
														                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
														                	<li class="page-item ${pi.currentPage == p ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/mail/tempSave.page?page=${p}">${p}</a></li>
														                </c:forEach>
														                
														                <li class="page-item ${pi.currentPage == pi.maxPage ? 'disabled' : '' }"><a class="page-link" href="${contextPath}/mail/tempSave.page?page=${pi.currentPage +1}">&raquo;</a></li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script>
                function checkAllBoxes() {
                    var checkAll = document.getElementById('checkAll');
                    var checkBoxes = document.getElementsByClassName('checkBox');

                    for (var i = 0; i < checkBoxes.length; i++) {
                        checkBoxes[i].checked = checkAll.checked;
                    }
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>