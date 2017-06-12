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
 $(document).ready(function(){ 
console.log("sadasd");
$.ajax({
	url : 'reviewBoard.jsp',
	Type : 'get',
	success : function(t2) {
			var lochtml="";
			var cityhtml="";
			var resulthtml="";
		$(t2).find("person2").each(function(i) {
				console.log(t2);
				 var imeage = "imeage/"
				var image1 = $(t2).find('image1#1').text(); 
				
			/* review board title image */
			 $("#reviewBoard_img1").attr({src : imeage + image1 });
			
			
			/* review board title text */
			 $("#loc").text('나라 :' +$(t2).find('loc#1').text() );
			$("#city").text('도시:' +$(t2).find('travelnation#1').text());
			$("#readcnt").text('조회수 : '+$(t2).find('readcnt#1').text());
			$("#date").text('작성일 :'+ $(t2).find('writeday#1').text());
			$("#title").text($(t2).find('title#1').text());
			$("#userid").text($(t2).find('userid#1').text())
			
	
})
	}
});//end ajax
}); 
</script>
</head>
<body>
<%String strXML2 = "";
try {
	String driver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(driver);
	String url = "jdbc:oracle:thin:@192.168.1.14:1521:orcl";
	String userName = "fortravel";
	String passWord = "fortravel";
	Connection con = DriverManager.getConnection(url, userName, passWord);
	Statement st2 = con.createStatement();
	String sql2 = "select * from reviewboard";
	st2.executeUpdate(sql2);
	ResultSet rs2 = st2.executeQuery(sql2);
	
	int numid = 1;
	int titleid = 1;
	int contentid = 1;
	int useridid = 1;
	int writedayid = 1;
	int readcntid = 1;
	int travelnationid = 1;
	int tavellocid = 1;
	int image1id = 1;
	int image2id = 1;
	int image3id = 1;
	strXML2 += "<reviewboard style='display:none;'>"; 
	while (rs2.next()) {
	
	strXML2 += "<person2>";
	strXML2 += "<num id=" + numid + ">" + rs2.getString("num") + "</num>";
	strXML2 += "<title id=" + titleid + ">" + rs2.getString("title") + "</title>";
	strXML2 += "<content id=" + contentid + ">" + rs2.getString("content") + "</content>";
	strXML2 += "<userid id=" + useridid + ">" + rs2.getString("userid") + "</userid>";
	strXML2 += "<writeday id=" + writedayid + ">" + rs2.getString("writeday") + "</writeday>";
	strXML2 += "<readcnt id=" + readcntid + ">" + rs2.getString("readcnt") + "</readcnt>";
	strXML2 += "<travelnation id=" + travelnationid + ">" + rs2.getString("travelnation") + "</travelnation>";
	strXML2 += "<travelloc id=" + tavellocid + ">" + rs2.getString("travelloc") + "</travelloc>";
	strXML2 += "<image1 id=" + image1id + ">" + rs2.getString("image1") + "</image1>";
	strXML2 += "<image2 id=" + image2id + ">" + rs2.getString("image2") + "</image2>";
	strXML2 += "<image3 id=" + image3id + ">" + rs2.getString("image3") + "</image3>";
	strXML2 += "</person2>" + ",";
	
	numid++;
	titleid++;
	contentid++;
	useridid++;
	writedayid++;
	readcntid++;
	travelnationid++;
	tavellocid++;
	image1id++;
	image2id++;
	image3id++;
}
strXML2 += "</reviewboard>";
out.write(strXML2);
	
} catch (Exception e) {
	System.out.println(e);
}
%>
<div id="review" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			<a id="#main_button_home" data-icon="home" href="JQueryMobile.jsp" data-ajax="false" 
				style="background-color: #ffffff;">Home</a> <a id="main_button_login"
				href="JQueryMobile.jsp" data-ajax="false" data-transition="slide" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package" data-transition="slide">패키지</a> <a id="header_naviBar_review" href="reviewBoard.jsp" data-transition="slide">여행
					후기</a> <a id="header_naviBar_login" href="#sign-up" data-transition="slide">회원가입</a>
			</span>
		</div>
		<div data-role="content" style="background-color: #ffffff;">
		<div style="height:61px;"> 
		<a id ="reviewBoard_img_aTag" href = "#review_deteil"><img id = "reviewBoard_img1"></a>
		<div class = "review_title_text">
		<h4 id = "loc"></h4>
		<h4 id = "city"></h4>
		<h4 id = "readcnt"></h4>
		<h4 id = "date"></h4>
		</div>
		<div class = "reviewBoard_title_text2">
		<h4 id = "title"></h4>
		<h4 id = "userid"></h4>
		</div>
		
		</div>
		
		</div>
		<div data-role="footer">
			<h3>footer</h3>
		</div>
	</div> <!-- review page 영역 종료 -->
	
	<div id="review_deteil" data-role="page">
		<div data-role="header" style="background-color: #E6E9ED;">
			<h1>4Trevel</h1>
			<a id="#main_button_home" data-icon="home" href="JQueryMobile.jsp" data-ajax="false" 
				style="background-color: #ffffff;">Home</a> <a id="main_button_login"
				href="JQueryMobile.jsp" data-ajax="false" data-transition="slide" style="background-color: #ffffff;">로그인</a>
			<hr>
			<span class="header_naviBar"> <a id="header_naviBar_package"
				href="#package" data-transition="slide">패키지</a> <a id="header_naviBar_review" href="reviewBoard.jsp" data-transition="slide">여행
					후기</a> <a id="header_naviBar_login" href="#sign-up" data-transition="slide">회원가입</a>
			</span>
		</div>
		</div>

</body>
</html>