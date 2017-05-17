<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".content").css("text-align","center");
		
		$(".title").css("text-align","center");
		
		$("#signup").css("position","absolute");
		$("#signup").css("top","66%"); 
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
 <form action="LoginController" method="post">
 
 <pre width="500px">
 <center> 아이디  <input type ="text" name="userid"></center>
<center> 비밀번호<input type ="password" name="passwd"></center>
</pre> 	<!-- <input type="checkbox" name="idsave">아이디 저장 -->
 		<input type = "submit" size="10" value="로그인" id ="login"><br>
 	</form>
 	<form action ="SignUPController">
 	<input type="submit" value="회원가입" id = "signup">
 	</form>
 	</div>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
         <footer>
            <div class="row">
                <div class="col-lg-12">
                    <font color="gray"><p>ForTravel 대표이사: team M&M 서울 강남구 역삼동  에이콘아카데미(주)에이콘이즈</p>
						<p>대표전화: 02-000-0000 팩스:02-000-0000</p>
                   		 <p>Copyright &copy; team M&amp;M(Jung MinWoo,Lee Min Sub) All Rights Reserved.</p></font>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
