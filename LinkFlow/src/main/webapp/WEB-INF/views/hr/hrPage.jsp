<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사관리</title>
	<style type="text/css">
    .HRArea{
      width: 100%;
      margin-top: 15px;
    }
      .HRTable td {
        cursor: pointer;
    }
	</style>
</head>
<body>
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="LinkFlowMainSection">

        <jsp:include page="/WEB-INF/views/common/sidebar/hr/hrSidebar.jsp"/>

        <div class="LinkFlowMainContent" style="padding: 30px;">
        
 				 <!-- Content Header (Page header) -->      <!-- Content Header (Page header) -->
                    <section class="content-header">
                            <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1 class="m-0">구성원 조회</h1>
                            </div>
                        
                        </div>
                    <!-- /.container-fluid -->
                    
                    </section>
                   
                    <!-- Main content -->
                    <section class="content">
                    <div class="container-fluid" style="display: flex; justify-content: center;"> 
                      <div class="contentArea">
                            <!--
                            <div class="contentInElement">
                            <div class="btnArea">
                                <button class="btn btn-primary btn-sm">기안하기</button>
                                <button class="btn btn-primary btn-sm">임시저장</button>  
                            </div>
                            <div class="form-inline">
                                <div class="input-group" data-widget="sidebar-search">
                                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                                <div class="input-group-append">
                                    <button class="btn btn-primary">
                                    <i class="fas fa-search fa-fw"></i>
                                    </button>
                                </div>
                                </div>
                            </div>
                            </div>
                            -->

                            <div class="HRArea">
                                <div class="row">
                                    <div class="col-12">
                                      <div class="card">
                                        <div class="card-header">
                                          <h3 class="card-title">전체 조직원</h3>
                                            
                                          

                                          <div class="card-tools">
                                            <form action="" method="get">
                                            <div class="input-group input-group-sm" style="width: 200px;">
                                              <input type="search" name="" class="form-control float-right" placeholder="이름으로 검색">
                          
                                              <div class="input-group-append">
                                                <button type="submit" class="btn btn-default">
                                                  <i class="fas fa-search"></i>
                                                </button>
                                              </div>
                                            </div>
                                            </form>
                                          </div>

                                          
                                        </div>
                                        
                                        <!-- /.card-header -->
                                        <div class="card-body table-responsive p-0" style="height: 500px;">
                                          <table class="table table-hover table-head-fixed HRTable">
                                            <colgroup>
                                             <col width="20px"/>
                                             <col width="30px"/>
                                             <col width="50px"/>
                                             <col width="50px"/>
                                             <col width="50px"/>
                                             <col width="50px"/>
                                             <col width="80px"/>
                                             <col width="200px"/>
                                             <col width="20px"/>
                                            </colgroup>
                                            <thead style="text-align: center;">
                                              <tr>
                                                <th>사원번호</th>
                                                <th>성함</th>
                                                <th>ID</th>
                                                <th>입사일</th>
                                                <th>부서</th>
                                                <th>직책</th>
                                                <th>연락처</th>
                                                <th>주소</th>
                                                <th>상태</th>
                                               
                                              </tr>
                                            </thead>
                                            <tbody style="text-align: center;">
                                              <tr>
                                                <td>1</td>
                                                <td>김대표</td>
                                                <td>admin01</td>
                                                <td>2021-02-31</td>
                                                <td>CEO</td>
                                                <td>대표이사</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>2</td>
                                                <td>김사원</td>
                                                <td>user01</td>
                                                <td>2021-02-31</td>
                                                <td>개발팀</td>
                                                <td>사원</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>
                                              <tr>
                                                <td>3</td>
                                                <td>김일꾼</td>
                                                <td>user02</td>
                                                <td>2021-02-31</td>
                                                <td>영업부</td>
                                                <td>대리</td>
                                                <td>010-1111-2222</td>
                                                <td>서울 강서구</td>
                                                <td>재직</td>
                                                
                                              </tr>

                                              
                                            </tbody>
                                          </table>
                                        </div>
                                        <!-- /.card-body -->
                                      </div>
                                      <!-- /.card -->
                                    </div>
                                  </div>


                                  <div class="row">
                                    <div class="col-12">
                                      <!-- Default box -->
                                      <div class="card">
                                        <div class="card-header">
                                          <h3 class="card-title card-primary">사원 정보 변경하기</h3>
                          
                                          <div class="card-tools">
                                            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                              <i class="fas fa-minus"></i>
                                            </button>
                                            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                              <i class="fas fa-times"></i>
                                            </button>
                                          </div>
                                        </div>
                                        <div class="card-body">
                                          사원을 클릭하면 정보를 변경 할 수 있습니다.
                                        </div>
                                        <!-- /.card-body -->
                                    
                                        <!-- /.card-footer-->
                                      </div>
                                      <!-- /.card -->
                                    </div>
                                  </div>

                            </div><!--HRArea 끝-->
                

                            
                     </div><!-- /.card -->     
                             
                    </div> <!-- /.content-wrapper -->
                    </section>
            </div>
        </div>
      
   

    </div><!--전체영역 끝-->
</body>
</html>