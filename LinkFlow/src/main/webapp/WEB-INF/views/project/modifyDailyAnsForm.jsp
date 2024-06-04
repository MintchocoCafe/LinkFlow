<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Linkflow 일일작업피드백</title>
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


</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		
		<div class="LinkFlowMainSection">
			<jsp:include page="/WEB-INF/views/common/sidebar/project/projectSidebar.jsp"/>
			
			<div class="LinkFlowMainContent">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">일일작업 피드백</h1>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="container-fluid" style="display: flex; justify-content: center;">
                        <div class="contentArea">
                        	<form action="${contextPath}/project/modifyLead.dai" method="post">
                        		<input type="hidden" name="daiNo" value="${dai.daiNo}">
                        		<input type="hidden" name="modId" value="${loginUser.userId}">
	                            <div class="contentInElement">
	                                <div class="btnArea">
	                                    <button type="submit" class="btn btn-primary btn-sm">피드백 등록</button>
	                                    <a href="${contextPath}/project/detailLead.dai?no=${dai.daiNo}" class="btn btn-danger btn-sm">등록취소</a>
	                                </div>
	                            </div>
	                            <div class="card" style="min-height: 500px; min-width: 100%;">
	                                <table class="table" style="text-align: center; font-size: 17px; margin-top: 20px; width: 1300px; margin-left: 100PX;">
	                                    <tr>
	                                        <td><b>성명</b></td>
	                                        <td>${dai.userName}</td>
	                                        <td><b>프로젝트명</b></td>
	                                        <td>${dai.proTitle}</td>
                                    	</tr>
	                                    <tr>
	                                        <td colspan="4">
	                                            <div style="transform: translateX(-550px);"><h5 style="font-weight: bold;">작업내용</h5></div>
	                                            <textarea name="daiContent" style="width: 1100px; height: 400px; margin-top: 20px; overflow: auto; resize: none;" readonly>${dai.daiContent}</textarea>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td colspan="4">
	                                            <div style="transform: translateX(-550px);"><h5 style="font-weight: bold;">피드백</h5></div>
	                                            <textarea name="daiAns" style="width: 1100px; height: 400px; margin-top: 20px; overflow: auto; resize: none;">${dai.daiAns}</textarea>
	                                        </td>
                                    	</tr>
	                                </table>
	                            </div>
                            </form>
                        </div>
                    </div>
                </section>
            </div>
		</div>
	</div>
</body>
</html>