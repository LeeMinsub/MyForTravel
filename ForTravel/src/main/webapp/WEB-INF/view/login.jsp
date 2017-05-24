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
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
   <link href="resources/css/mainSerch.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page="maininclude/navi.jsp" flush="true" />
<script type="text/javascript">
	$(document).ready(function() {
		$(".content").css("text-align","center");
		
		$(".title").css("text-align","center");
		
		$("#signup").css("position","absolute");
		$("#signup").css("top","83%"); 
		$("#signup").css("left","620px");
		
		$("#login").css("position","absolute");
		$("#login").css("left","540px");
		
	});
	</script>

<c:if test="${loginFail != null }">
  <script type="text/javascript">
  var x= '${loginFail}';
    alert(x);
  </script>
</c:if>
<c:if test="${sessionScope.loginFail != null }">

  <%
  HttpSession sess=request.getSession();
  sess.removeAttribute("loginFail");
  %>
</c:if>
  <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
            <div class = title>
                <h1 class="page-header">LOGIN
                    <small>4Travel</small>
                </h1>
                </div>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li> 
                    <li class="active">4travel 회원 로그인</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
            <div class = content>
 <form action="Login" method="post">
 
 <pre width="500px">
 <center> 아이디  <input type ="text" name="userid"></center>
<center> 비밀번호<input type ="password" name="passwd"></center>
</pre> 	<!-- <input type="checkbox" name="idsave">아이디 저장 -->
 		<input type = "submit" size="10" value="로그인" id ="login"><br>
 	</form>
 	<form action ="SignUP">
 	<input type="submit" value="회원가입" id = "signup">
 	</form>
 	</div>
            </div>
        </div>
        <!-- /.row -->

        <hr>
  </div>
        <!-- Footer -->
         <jsp:include page="maininclude/forcopy.jsp" flush="true" />
  
    <!-- /.container -->

    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>


 
</body>
</html>