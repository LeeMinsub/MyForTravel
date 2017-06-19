<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="jqueryMobile/jquery.mobile-1.4.5.css">
<script src="./jquery/jquery.js"></script>
<script src="./jqueryMobile/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/jqueryMobile.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<!-- Jquery source -->
<script>
$(function(){
	$("#btn1").on("click",function(){
		alert("데이터 전송");
		
		$.ajax({
			url:'reviewwrite.jsp',
			type:'post',
			data:{
				title:$('#review_input_title').val(),
				travelnation:$('#review_input_travelnation').val(),
				travelloc:$('#review_input_travelloc').val(),
				content:$('#review_input_content').val()
			},
			success:function(t){
				alert("성공");
			},
			error:function(){
				alert("실패");
			}
			});
		});
	});
</script>
</head>
<body>
<%
String userid = (String)session.getAttribute("id");
System.out.println(userid);
try{
	String driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(driver);
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userName = "Fortravel";
	String passWord = "Fortravel";
	Connection con = DriverManager.getConnection(url, userName, passWord);
	Statement st3 = con.createStatement();
	String sql3 = "insert into  reviewboard (num,title,userid,readcnt,travelnation,travelloc,content) values(fortravel_seq.nextval,'"
	+request.getParameter("title")+"','"+userid+"',0,'"+request.getParameter("travelnation")+"','"+request.getParameter("content")+"','"+request.getParameter("travelloc")+"')";
	st3.executeUpdate(sql3);
	con.close();
	st3.close();
} catch(Exception e) {
	System.out.println(e);
}
%>
		<div id="review_write" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
		<h1>4Trevel</h1>
		<a class="main_button_home" href="reviewBoard.jsp" data-ajax="false"
				style="background-color: #ffffff;">목록가기</a> <a class="main_button_login"
				href="JQueryMobile.jsp" data-ajax="false" data-transition="slide" style="background-color: #ffffff;">로그인</a>
				<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package" data-transition="slide">패키지</a> <a id="header_naviBar_review" href="reviewBoard.jsp" data-transition="slide">여행
					후기</a>
		</div>
		<div data-role="content" style="background-color: #ffffff;">
		<div>
		<h3>여행 후기 작성</h3>
		<hr><br>
		여행 국가 : <input type = "text" id = "review_input_travelnation" name ="travelnation"> 
		여행 도시 : <input type = "text" id = "review_input_travelloc" name="city">
		제목 : <input type = "text" id = "review_input_title" name="title">
		내용 : <p><textarea rows="20" cols="130" id="review_input_content" name="content"></textarea></p>
		<button id ="btn1">전송</button>
			
		</div>
		</div>
		</div>

</body>
</html>