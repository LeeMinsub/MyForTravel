<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.entity.PackageThirdDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap Core CSS -->
       <link href="resources/css/mainSerch.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
   <!--  <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
        <script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
     <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".packagelayout").css("width","30%");
		$(".packagelayout").css("height","30%");
		$(".packagelayout").css("position","relative");
		});

		</script> 
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page="maininclude/navi.jsp" flush="true"/>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        
        <div class="row">
            <div class="col-lg-12">
  
                <h1 class="page-header">패키지
                
                    <small>${PL.loc}</small>
                </h1>
                  
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">${Plist[0].loc}</li>
				        
                </ol>
 
            </div>

        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        
      
      
        <div class="packagediv">
        <c:forEach var="i" items="${Plist}">
            <div class ="packagelayout">
             <%Date today = new Date();
             SimpleDateFormat dayform=new SimpleDateFormat("yyyy/MM"); 
             %>
       			<a href="PackageThirdList?&packageno=${i.packageno}&startdate=<%=dayform.format(today)%>">
                    <img class="packageimg" src="resources/images/${i.image}.jpg" alt="package01">
                </a>
                <h3 class = "title">
                    <a href="PackageThirdList?&packageno=${i.packageno}&startdate=<%=dayform.format(today)%>">${i.packagename}</a>
                </h3>
               			<p class = "loc">여행 지역 : ${i.loc}</p>
               			<p class = "term">여행 기간 : ${i.term}</p>
                		<p class = "price">가격 :${i.price}</p>
            </div>
            </c:forEach> 
            </div>
           <a href="HelloAnalytics.html">트래킹 테스트</a>
            
     
        <!-- /.row -->

        <hr>

        <!-- Pagination -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="PackageFirstALL?loc=${PL.loc}&page=${page}">1</a>
                    </li>
                    <li>
                        <a href="PackageFirstALL?loc=${PL.loc}&page=${page}">2</a>
                    </li>
                    <li>
                        <a href="PackageFirstALL?loc=${PL.loc}&page=${page}">3</a>
                    </li>
                    <li>
                        <a href="PackageFirstALL?loc=${PL.loc}&page=${page}">4</a>
                    </li>
                    <li>
                        <a href="PackageFirstALL?loc=${PL.loc}&page=${page}">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->

        <hr>
    </div>

        <!-- Footer -->

 <jsp:include page="maininclude/forcopy.jsp" flush="true" />
     <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>