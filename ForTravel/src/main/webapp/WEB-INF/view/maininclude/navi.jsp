<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="resources/css/common.css"/> -->

<script type="text/javascript">
	$(document).ready(function() {
		$("#japans").on("mouseover",function(event) {
			$("#twodiv").toggle().css("display","table");
		});
		$("#japans").on("mouseout",function(event) {
			$("#twodiv").toggle().css("display","none");
		});
		$("#twodiv").on("mouseout",function(event) {
			$("#twodiv").toggle(); 
		});
		
		$(".twoli").css("font-size", "12px");
		$(".twoli").css("color", "black");
		$("#twodiv").css("float", "right");
		$("#twodiv").css("position","absolute");
		$("#twodiv").css("left", "160px");
		$("#twodiv").css("top", "0px");
		$("#twodiv").css("width", "450px");
		$("#twodiv").css("background-color", "white");
		$(".subul").css("list-style-type","none");
		$("#subul").css("text-align","lef	t");
		$(".subul").css("text-align","left");
		$(".subul").css("padding-left","10px");
		$("#subul").css("left","50px");
		$("#subul").css("position","relative");
		$("#firstTr").css("height","300px");
		$("#subul").css("left","50px");
		$("#subul").css("width","600px");
		$("#subul").css("height","600px	");
	
		 $("#navitop").css("top","100px");
	});
	$(window).scroll(function(){
	
		var sc = $(document).scrollTop();
		var dHeight = $("body").height();
		var wHeight = $(window).height();
		if(sc > 10){
			$("#navitop").css("top","0px");
		}else if (sc < 10){
		$("#navitop").attr("style","top:100px");   
		/* $("#navitop").css("top","100"); */
		}
	});
</script>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="navitop"> 
	<div class="container">
		
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" style="color:white;">패키지 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="PackageFirstALL?loc=대만">동남아/대만</a></li>
						<li><a href="PackageFirstALL?loc=중국">중국/홍콩</a></li>
						<li><a href="PackageFirstALL?loc=일본" id="japans">일본</a> 
						  <div id="twodiv" style="display: none;">
							<table id="subul">
							<tr id="firstTr">
							<td colspan="1"><b>간토(관동)</b><br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=도쿄">도쿄</a></li>
									<li><a class="twoli" href="PackageFirst?city=요코하마">요코하마</a></li>
									<li><a class="twoli" href="PackageFirst?city=하코네">하코네</a></li>
									<li><a class="twoli" href="PackageFirst?city=닛코">닛코</a></li>
									<li><a class="twoli" href="PackageFirst?city=가마쿠라">가마쿠라</a></li>
									<li><a class="twoli" href="PackageFirst?city=쿠사츠">쿠사츠</a></li>
									<li><a class="twoli" href="PackageFirst?city=가와고에">가와고에</a></li>
									<li><a class="twoli" href="PackageFirst?city=야마나시">야마나시</a></li>
									<li><a class="twoli" href="PackageFirst?city=시즈오카">시즈오카</a></li>
									<li><a class="twoli" href="PackageFirst?city=후지산">후지산</a></li>
							</ul>
							</td>
							<td><b>간사이(관서)</b>
							<br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=오사카">오사카</a></li>
									<li><a class="twoli" href="PackageFirst?city=교토">교토</a></li>
									<li><a class="twoli" href="PackageFirst?city=나라">나라</a></li>
									<li><a class="twoli" href="PackageFirst?city=고베">고베</a></li>
									<li><a class="twoli" href="PackageFirst?city=시라하마">시라하마</a></li>
									<li><a class="twoli" href="PackageFirst?city=와카야마">와카야마</a></li>
									
									
									
							</ul>
							<br>
									<br>
									<br>
									<br>
									<br>
							</td>
							<td><b>규슈/오키나와</b>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=훜오카">후쿠오카</a></li>
									<li><a class="twoli" href="PackageFirst?city=구마모토">구마모토</a></li>
									<li><a class="twoli" href="PackageFirst?city=나가사키">나가사키</a></li>
									<li><a class="twoli" href="PackageFirst?city=벳부">벳부</a></li>
									<li><a class="twoli" href="PackageFirst?city=유후인">유후인</a></li>
									<li><a class="twoli" href="PackageFirst?city=구로카와">구로카와</a></li>
									<li><a class="twoli" href="PackageFirst?city=사카">사가/우레시노</a></li>
									<li><a class="twoli" href="PackageFirst?city=야소">아소</a></li>
									<li><a class="twoli" href="PackageFirst?city=운젠">운젠</a></li>
									<li><a class="twoli" href="PackageFirst?city=가고시마">가고시마</a></li>
									<li><a class="twoli" href="PackageFirst?city=미야자키">미야자키</a></li>
									<li><a class="twoli" href="PackageFirst?city=오키나와">오키나와</a></li>
							</ul>
							</td>
							<td><b>훗카이도/토호쿠</b><br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=삿포로">삿포로</a></li>
									<li><a class="twoli" href="PackageFirst?city=오타루">오타루</a></li>
									<li><a class="twoli" href="PackageFirst?city=하코다테">하코다테</a></li>
									<li><a class="twoli" href="PackageFirst?city=노보리벳츠">노보리벳츠</a></li>
									<li><a class="twoli" href="PackageFirst?city=도야">도야</a></li>
									<li><a class="twoli" href="PackageFirst?city=죠잔케이">죠잔케이</a></li>
									<li><a class="twoli" href="PackageFirst?city=기타유자와">기타유자와</a></li>
									<li><a class="twoli" href="PackageFirst?city=후라노">후라노/비에이</a></li>
									<li><a class="twoli" href="PackageFirst?city=아오모리">아오모리</a></li>
									<li><a class="twoli" href="PackageFirst?city=아키타">아키타</a></li>
										
							</ul>
							<br>
							</td>
							</tr>
							<tr>
							<td><b>호쿠리쿠</b><br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=니가타">니가타</a></li>
									<li><a class="twoli" href="PackageFirst?city=나고야">나고야</a></li>
									<li><a class="twoli" href="PackageFirst?city=도야마">도야마</a></li>
									<li><a class="twoli" href="PackageFirst?city=고마츠">고마츠</a></li>
									<li><a class="twoli" href="PackageFirst?city=가나자와">가나자와</a></li>
									<li><a class="twoli" href="PackageFirst?city=게로">게로</a></li>
									<li><a class="twoli" href="PackageFirst?city=타카야마">타카야마</a></li>
									<li><a class="twoli" href="PackageFirst?city=이세">이세</a></li>
							
							</ul>
							<br>
							<br>
							<br>
							<br>
							</td>
							<td><b>주고쿠</b><br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=요나고">요나고</a></li>
									<li><a class="twoli" href="PackageFirst?city=돗토리">돗토리</a></li>
									<li><a class="twoli" href="PackageFirst?city=히로시마">히로시마</a></li>
									<li><a class="twoli" href="PackageFirst?city=오키야마">오키야마</a></li>
									<li><a class="twoli" href="PackageFirst?city=야마구치">야마구치</a></li>
							
							</ul>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							</td>
							<td><b>시코쿠</b><br>
							<ul class="subul">
									<li><a class="twoli" href="PackageFirst?city=마츠야마">마츠야마</a></li>
									<li><a class="twoli" href="PackageFirst?city=다카마츠">다카마츠</a></li>
									<li><a class="twoli" href="PackageFirst?city=나오시마">나오시마</a></li>
							
							</ul>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							</td>
							<td>
							</td>
							</tr>
							</table>
						</div></li>
						<li><a href="PackageFirstALL?loc=유럽">유럽</a></li>
						<li><a href="PackageFirstALL?loc=괌">괌/사이판</a></li>
						<li><a href="PackageFirstALL?loc=남태평양">남태평양</a></li>
						<li><a href="PackageFirstALL?loc=미국">미국/캐나다</a></li>
						<li><a href="PackageFirstALL?loc=서남아">서남아/중앙아시아</a></li>
						<li><a href="PackageFirstALL?loc=아프리카">중동/아프리카</a></li>
						<li><a href="PackageFirstALL?loc=중남미">중남미</a></li>
					</ul></li>
					 
				<li class="dropdown">
                        <a href="ReviewBoard" class="dropdown-toggle" style="color:white;">여행후기 </a>
                    </li>		
                     <li class="dropdown">
                        <a href="NoticeUI" class="dropdown-toggle" style="color:white;">공지사항 </a> 
                    </li>
                    <li class="dropdown">
                        <a href="QABoardList" class="dropdown-toggle" style="color:white;">FAQ</a>
                    </li>
                    <c:if test="${login == null }">
                     <li class="dropdown">
                        <a href="LoginUI" class="dropdown-toggle" style="color:white;">로그인 </a>
                    </li>
                    </c:if>
                    <c:if test="${login != null }">
                     <li class="dropdown">
                        <a href="LogOut" class="dropdown-toggle" style="color:white;">로그아웃 </a>
                    </li>
                    </c:if>
                     <li class="dropdown">
                        <a href="SignUP" class="dropdown-toggle" style="color:white;">회원가입 </a>
                    </li>
                     <li class="dropdown">
                        <a href="SiteMap" class="dropdown-toggle" style="color:white;"><!-- data-toggle="dropdown" -->회사소개 </a>  
                    </li>
                 
			</ul> 
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>