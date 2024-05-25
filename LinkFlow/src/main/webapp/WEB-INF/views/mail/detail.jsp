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
#boardList{text-align: center;}
#boardList>tbody>tr:hover{cursor:pointer;}
.LinkFlowMainContent section{
      padding-left: 8%;
      padding-right: 8%;
    }
.reply_modifyinput {
  width: 80%;
  border: none;
  background-color: transparent;
}

i {
    cursor: pointer;
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
                        <h1 class="m-0">메일</h1>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>
           
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid" style="display: flex; justify-content: center;">
                    <div class="contentArea">
                        <div class="contentInElement">
                            <div class="btnArea">
                            </div>
                            <div class="form-inline">
                                <div class="input-group">
                                	<c:if test="${ board.regId == loginUser.userId or loginUser.superRight == 'Y' or loginUser.boardRight == 'Y'}">
                                    <a href="#" onclick="confirmDelete('${contextPath}/mail/delete.do?no=${mail.mailNo}')">삭제</a>
                                  </c:if>
                                </div>
                            </div>
                        </div>
                        <div style="min-height: 500px; min-width: 100%;">
                            <table id="contentArea" align="center" class="table">
                                <tr style="font-size: larger;">
                                		<th width="100">제목</th>
                                    <th colspan="3">${ mail.mailTitle }</th>
                                </tr>
                                <tr>
                                    <th>보낸 사람</th>
                                    <td width="800">${mail.userName } &lt;${mail.regId }@linkflow.com &gt;</td>
                                    <th width="150" style="text-align: center;">작성일</th>
                                    <td width="150" style="text-align: center;">${mail.transTime }</td>
                                </tr>
                                <tr>
                                    <th>첨부파일</th>
                                    <td colspan="3">
                                        <c:forEach var="at" items="${mail.attachList }">
									                       <a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originName }">${ at.originName }</a> <br>
									                      </c:forEach>
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td colspan="3"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" >
                                    	<div class="boardContent"style="min-height:500px; margin:10px">
                                    		 ${mail.mailContent }
                                    	</div>
                                    </td>
                                </tr>
                            </table>
                            <br>

                        </div>
                    </div>
                </div>
            </section>
            
            <script>
						    function confirmDelete(url) {
						        if (confirm('게시글을 삭제하시겠습니까?')) {
						            window.location.href = url;
						        }
						    }
						</script>
        </div>
    </div>
</div>
</body>
</html>