<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${ contextPath}/resources/ckeditor5/board/build/ckeditor.js"></script>
<style>
	.LinkFlowMainContent section{
    padding-left: 8%;
    padding-right: 8%;
  }
  .registTitle{
    padding-right: 10px; 
    font-size: larger;
    align-items: center;
  }
  table{width:100%;}
  table *{ margin:10px;}
  #updateForm input[type="text"]{
    width: 500px;
    display: inline-block;
    vertical-align: middle;
  }
  .form-check-inline{ vertical-align: middle;}
  #updateForm input[type="checkbox"]{
    height: 20px; 
    width: 20px;
  }
  #updateForm input[type="file"]{
    display: none;
    vertical-align: middle;
  }
  
  #updateForm span {
    text-align: center;
    align-self: center;
  }
  .ck-editor{ 
  	margin:10px;
  }
  .ck-editor__editable{
    min-height: 600px;
  }
  .ck-editor__main{
  	margin:0;
  }
  .ck-content {
  	margin:0;
  }
  
  .drop-area {
    border: 1px dotted gray;
    display: flex; 
    flex-direction: column;
    min-height: 200px;
  }
</style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="LinkFlowMainSection">
        <jsp:include page="/WEB-INF/views/common/sidebar/board/boardSidebar.jsp"/>
        <div class="LinkFlowMainContent">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">게시물 수정</h1>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid" style="display: flex; justify-content: center;">
                    <div class="contentArea">
                        <form id="updateForm" method="post" action="${contextPath }/board/modify.do" enctype="multipart/form-data">
                            <input type="hidden" name="boardNo" value="${board.boardNo }"> 
                            <div class="contentInElement">
                                <div class="btnArea">
                                    <button type="submit" class="btn btn-primary btn-sm" style="margin-right: 6px;" id="enrollForm-submit">수정하기</button>
                                    <button class="btn btn-primary btn-sm" onclick="javascript:history.go(-1);">취소</button>
                                </div>
                            </div>
                            <div style="min-height: 500px; min-width: 100%;">
                                <table align="center">
                                    <tr>
                                        <th style="text-align: center;" width=111>게시판</th>
                                        <td>
                                            <select id="select" class="custom-select" name="boardCategory" style="width: 200px;">
                                                <c:if test="${loginUser.superRight == 'Y' or loginUser.boardRight == 'Y' }">
                                                    <option value="CATEGORY-8">사내공지</option>
                                                <c:forEach var="c" items="${categoryList}">
                                                	<c:choose>
	                                                  <c:when test="${ board.boardCategory == c.boardCategory }">
	                                                    <option value="${c.boardCategory }" selected="selected" >${c.categoryName }게시판</option>
	                                                  </c:when>
	                                                  <c:otherwise>
	                                                  	<option value="${c.boardCategory }">${c.categoryName }게시판</option>
	                                                  </c:otherwise>
                                                  </c:choose>
                                                </c:forEach>
                                               </c:if>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="text-align: center;"><label for="title">제목</label></th>
                                        <td>
                                            <input type="text" id="title" class="form-control" name="boardTitle" required value="${board.boardTitle }">
                                            <c:if test="${loginUser.superRight == 'Y' or loginUser.boardRight == 'Y' }">
                                                <label class="form-check-label form-check-inline" for="noticeCheckbox" style="margin:0; margin-left:10px">
                                                    <input type="checkbox" name="noticeYN" value="N" class="form-check-input" id="noticeCheckbox" <c:if test="${ board.noticeYN == 'Y' }"> checked </c:if>>
                                                    <b>공지로 등록</b>
                                                </label>
                                             <script src="${contextPath }/resources/js/board/BoardNoticeCheckBox.js"></script>
                                            </c:if>
                                        </td>
                                    </tr>
                                    
                                    <c:if test="${ not empty board.attachList[0].originName  }">
	                                    <tr id="oringFileTr">
	                                    	<th style="text-align: center; vertical-align: top; padding-top : 15px;">기존 첨부파일</th>
	                                    	<td>
	                                    			<c:forEach var="at" items="${board.attachList }">
			                                    		<div>
											                       		<a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originName }">${ at.originName }</a>
											                      		<i class="fa-solid fa-xmark fa-lg origin_del" data-fileno="${ at.fileNo }"></i>
	                                    				</div>
										                      	</c:forEach>
	                                    	</td>
	                                    </tr>
                                    </c:if>
                                    
                                    <tr>
                                        <td colspan="3" style="vertical-align: center;">
                                            <div class="drop-area" style="margin:0; margin-bottom:10px; margin-top:10px">
                                                <div class="file-header" style="width: 100%;">
                                                    <label for="file-upload" style=" width: 15%;">
                                                        <div class="fileSection">
                                                            <span>파일첨부</span>
                                                        </div>
                                                        <input name="uploadFiles" type="file" id="file-upload" multiple>
                                                    </label>
                                                    <span class="fileSize" id="totalFileSize" style=" width: 80%; display: inline-block; text-align: right;">0.00 KB / 200MB</span>
                                                </div>
                                                <div class="fileFooter" style="margin: 0;">
                                                    <span class="drop-message" style="display: inline-block; width:100%; text-align: center;">여기로 파일을 끓어 놓으세요</span>
                                                </div>	
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                    	<td colspan="3">
                                    		<textarea name="boardContent" id="editor"></textarea>
                                    	</td>
                                    </tr>
                                </table>
                                <br>
                           		</div>
                        
                        <script src="${contextPath }/resources/js/board/DragAndDrop.js"></script>
                        <!-- ckeditor 함수-->
                        <script>
                            let editor;

                            ClassicEditor
                                .create(document.querySelector('#editor'))
                                .then(newEditor => {
                                  editor = newEditor;
                                	editor.setData('${board.boardContent}');
                                })
                                .catch(error => {
                                    console.error(error);
                                });

                        </script>
                        <script>
					                	$(document).ready(function(){
					                		$(".origin_del").on("click", function(){
					                			// 삭제하고자 하는 해당 첨부파일 번호를 form submit시 넘기기 위한 작업
					                			// => 해당 form요소내에 input type="hidden" 만들어서 append
					                			let inputEl = document.createElement("input");
					                			inputEl.type = "hidden";
					                			inputEl.name = "delFileNo";
					                			inputEl.value = $(this).data("fileno")
					                			
					                			document.getElementById("updateForm").append(inputEl);
					                			
					                			// 화면으로부터 사라지도록 작업
					                			$(this).parent().remove();
					                			
					                			if ($('#oringFileTr td').children().length === 0) {
					                	            $('#oringFileTr').remove();
					                	    }
					                		})
					                	})
					                </script>
                        
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>