<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.entity.PackageThirdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page="maininclude/navi.jsp" flush="true"/>
 <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">패키지
                    <small>${Plist[0].loc}</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">패키지</li>
           
                </ol>
             
            </div>
            
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
     
 	<c:forEach var="i" items="${Plist}">
        <div class="row">
            <div class="col-md-4 img-portfolio"> 
            <%Date today = new Date();
            SimpleDateFormat dayform=new SimpleDateFormat("yyyy/MM");
            %>
                <a href="PackageThirdList?packagename=${i.packagename}&packageno=${i.packageno}&startdate=<%=dayform.format(today)%>&term=${i.term}">
                    <img class="img-responsive img-hover" src="resources/images/${i.doorimg}.jpg" alt="packageimage01">
                </a>
                <h3>
                    <a href="PackageThirdList?packagename=${i.packagename}&packageno=${i.packageno}&startdate=<%=dayform.format(today)%>&term=${i.term}">${i.packagename}</a>
                </h3>
               			<p>여행 지역 : ${i.loc}</p>
               			<p>여행 기간 : ${i.term}</p>
                		<p>가격 : ${i.price}</p>
                		
                		
                
            </div>
           
       
        </div> 
         </c:forEach>
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
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
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