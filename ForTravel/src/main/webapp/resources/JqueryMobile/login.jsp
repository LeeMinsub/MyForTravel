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
/* login 유효성 검사 */
function checkLogin(){
    
    if( $.trim($("#userId").val()) == '' ){
        alert("아이디를 입력해 주세요.");
        $("#userId").focus();
        return;
    }
    if( $.trim($("#userPw").val()) == '' ){
        alert("비밀번호를 입력해 주세요.");
        $("#userPw").focus();
        return;
    }
    $.ajax({
        type: 'post'
        , async: true
        , url: ''
        , data: $("#frm").serialize() 
        , beforeSend: function() {
             $('#ajax_load_indicator').show().fadeIn('fast'); 
          }
        , success: function(data) {
        		console.log("success login ");
           var response = $(data).find('userid').text();
           console.log($("#userId").val());
          
           if(response == $("#userId").val()){
        	   alert("로그인에 성공하셨습니다.");
        	   alert("메인화면으로 전환됩니다.");
        	   window.location.href ="JQueryMobile.jsp?id="+response;
        	  
           }else {
        	   alert("로그인에 실패 하였습니다.");
           }
           	console.log("data forward : "+response);
          
          }
        , error: function(data, status, err) {
        	console.log("error forward : "+data);
            alert('서버와의 통신이 실패했습니다.');
          }
        , complete: function() { 
        	$('#ajax_load_indicator').fadeOut();
          }
	});
}
</script>

</head>
<body>
<%
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String userName = "Fortravel";
			String passWord = "Fortravel";
			Connection con = DriverManager.getConnection(url, userName, passWord);
			Statement st = con.createStatement();
			String userid = request.getParameter("userid");
			String userPw = request.getParameter("passwd");
			  String sql = "select * from member where userid = '"+request.getParameter("userid")+ "'and passwd = '"+request.getParameter("passwd")+"'";
		
			st.executeUpdate(sql);
			ResultSet rs = st.executeQuery(sql);
			String strXML = "";
		
			strXML += "<member>"; 
			while (rs.next()) {
				strXML += "<login>";
				strXML += "<userid>" + rs.getString("userid") + "</userid>";
				strXML += "<passwd>" + rs.getString("passwd") + "</passwd>";
				strXML += "<username>" + rs.getString("username") + "</username>";
				strXML += "</login>";
			}
			strXML += "</member>";
			out.write(strXML);
			System.out.println(strXML);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	
	%>
<!-- login page 영역 -->

	<div id="login" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			
			<hr>
			<span class="header_naviBar">
			</span>
		</div>
		<div data-role="content" style="background-color: #ffffff;">
		<form id ="frm" action = "login.jsp" method="get" data-ajax="false">
		<fieldset>
		 <div class="login_item mg_top34"> 
            <label>아이디</label> 
            <input id="userId" name="userid" type="text" class="i_login"/>
        </div>

        <div class="login_item mg_top10"> 
            <label>비밀번호</label> 
            <input id="userPw" name="passwd" type="password" class="i_login" />
        </div>
        <span class="btn_login">
            <input type="image" src = "imeage/login.jpg" title="로그인" onclick="checkLogin();return false;" style="width: 30%;position: relative;left: 33%;">
        </span>
        </fieldset>
        </form>
		</div>
		<div data-role="footer">
			<a class="ui-btn" href="#sign-up" data-role="button" data-transition="slide"
				style="background-color: #E6E9ED;">회원가입</a> 
		</div>
	</div> <!-- login page 영역 종료 -->


</body>
</html>