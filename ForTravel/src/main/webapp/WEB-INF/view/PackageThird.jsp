<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.PackageThirdDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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


<link href="resources/css/mainSerch.css" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> 

	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>
<style type="text/css">
#price1 {
	position: absolute;
	left: 5%;
	top: 5%;
}

#price2 {
	position: absolute;
	left: 25%;
	top: 5%;
}

#term {
	position: absolute;
	left: 5%;
	top: 20%;
}

#term2 {
	position: absolute;
	left: 25%;
	top: 20%;
}

#date1 {
	position: absolute;
	left: 5%;
	top: 36%;
}

#date2 {
	position: absolute;
	left: 25%;
	top: 36%;
}

#contents {
	position: absolute;
	left: 5%;
	top: 52%;
}

#contents2 {
	position: absolute;
	left: 25%;
	top: 52%;
	width: 40%;
}

#remoteButton {
	position: absolute;
	top: 100%;
	width: 100%;
	height: 70%;
}

#prevButton {
	position: absolute;
	left: 26%;
}

#nextButton {
	position: absolute;
	left: 74%;
}

#datespan1 {
	position: absolute;
	left: 31%;
	width: 19%;
	text-align: center;
	border: 1px solid;
}

#datespan2 {
	position: absolute;
	left: 54%;
	width: 19%;
	border: 1px solid;
	text-align: center;
}

#listDayPackage {
	position: absolute;
	top: 15%;
	left: 6%;
	width: 86%;
}

#tablelist {
	width: 100%;
}

.packagelistTable {
	height: 80px;
	padding: 25px 0 25px 0;
	text-align: center;
}

.footer {
	background-color: black;
	position: relative;
	top: 70%;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var dt = new Date();
		//Display the month, day, and year. getMonth() returns a 0-based number.
		var month = dt.getMonth() + 1;
		var day = dt.getDate();
		var year = dt.getFullYear();
		$("#datespan1").text(year + "년" + month + "월");
		$("#datespan2").text(year + "년" + (month + 1) + "월");
		$("body").on("click", "#nextButton", function() {
			month = month + 1;
			if ((month + 1) == 13) {
				month = 1;
				year = year + 1;
			}
			$("#datespan1").text(year + "년" + month + "월");
			$("#datespan2").text(year + "년" + (month + 1) + "월");
			$.ajax({
				type : "get",
				url : "PackageThirdListUpdate",
				 dataType : "json",
				data : {
					packageno : '${Plist[0].packageno}',
					startyear : year,
					startmonth : month,
					term : '${Plist[0].term}'
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					var listHtml="";
					listHtml += '<table id="tablelist">';
					listHtml += '<tr style="text-align: center;">';
					listHtml += '<td>출/도착시간</td><td>항공  </td><td>상품명</td><td> 여행기간 </td><td>상품가격 </td><td> 예약상태 </td>';
					listHtml += '</tr>';
					if(responseData.length!=0){
						$.each(responseData,function(idx,i){ 
							listHtml += '<tr class="packagelistTable">';
							listHtml += '<td>'+i.startdate+'<br>'+'<font color="red">'+i.lastdate+'</font></td><td>'+i.airline+'</td><td><a href="PackageDeteil?packageno='+i.packageno+'&startdate='+i.startdate+'">'+i.packagename+'</a></td>';
							listHtml += '<td>'+i.term+'</td><td><font color="red">'+i.price+'</font></td> <td>'+i.reservationab+'</td>';  
							listHtml += '</tr>';
							listHtml +='</table>';
	 	 				});
						}else{
							listHtml += '<tr class="packagelistTable"><td colspan=6>';
							listHtml +="<center>해당 날짜에는 패키지가 없습니다</center>";
							listHtml +="</td></tr>";
							listHtml +='</table>';
						}
					$("#tablelist").html(listHtml); 
				},
				error : function(error) {
					console.log(error);
				}
			}); //end ajax 
		});//end nextButtonClickEvent

		$("body").on("click", "#prevButton", function() {
			month = month - 1;
			if ((month) == 1) {
				month = 11;
				year = year - 1;
			}
			$("#datespan1").text(year + "년" + month + "월");
			$("#datespan2").text(year + "년" + (month + 1) + "월");
			$.ajax({
				type : "get",
				url : "PackageThirdListUpdate",
				 dataType : "json",
				data : {
					packageno : '${Plist[0].packageno}',
					startyear : year,
					startmonth : month,
					term : '${Plist[0].term}'
				},
				success : function(responseData, status, xhr) {
					console.log(responseData);
					console.log(responseData.length);
					var listHtml="";
					listHtml += '<table id="tablelist">';
					listHtml += '<tr style="text-align: center;">';
					listHtml += '<td>출/도착시간</td><td>항공  </td><td>상품명</td><td> 여행기간 </td><td>상품가격 </td><td> 예약상태 </td>';
					listHtml += '</tr>';
					if(responseData.length!=0){
					$.each(responseData,function(idx,i){ 
						listHtml += '<tr class="packagelistTable">';
						listHtml += '<td>'+i.startdate+'<br>'+'<font color="red">'+i.lastdate+'</font></td><td>'+i.airline+'</td><td><a href="PackageDeteil?packageno='+i.packageno+'&startdate='+i.startdate+'">'+i.packagename+'</a></td>';
						listHtml += '<td>'+i.term+'</td><td><font color="red">'+i.price+'</font></td> <td>'+i.reservationab+'</td>';  
						listHtml += '</tr>';
						listHtml +='</table>';
 	 				});
					}else{
						listHtml += '<tr class="packagelistTable"><td colspan=6>';
						listHtml +="<center>해당 날짜에는 패키지가 없습니다</center>";
						listHtml +="</td></tr>";
						listHtml +='</table>';
					}
					$("#tablelist").html(listHtml); 
				},
				error : function(error) {
					console.log(error);
				}
			}); //end ajax 
		});//end prevButtonClickEvent
	});
</script>
</head>
<body>
	<jsp:include page="maininclude/Serch.jsp" flush="true" />
	<jsp:include page="maininclude/navi.jsp" flush="true" />

	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">

				<h1 class="page-header">${Plist[0].packagename}
					<small>${i.city}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="Home">Home</a></li>
					<li><a href="PackageFirstALL?loc=${Plist[0].loc}">${Plist[0].loc}</a>
					<li class="active">${Plist[0].city}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8" style="float: right;">
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->

					<div class="carousel-inner">
						<div class="item active">
							<img class="img-responsive" style="height: 300px;"
								src="resources/images/${Plist[0].image1}.jpg" alt="그림1">
						</div>
						<div class="item">
							<img class="img-responsive" style="height: 300px;"
								src="resources/images/${Plist[0].image2}.jpg" alt="그림2">
						</div>
						<div class="item">
							<img class="img-responsive" style="height: 300px;"
								src="resources/images/${Plist[0].image3}.jpg" alt="그림3">
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>

			<div class="col-lg-12"
				style="width: 60%; height: 361px; position: relative;">

				<span id="price1">상품 가격</span><br> <span id="price2"><font
					color="red" size="2px">${Plist[0].price}원 ~
						${Plist[0].price}원</font></span> <span id="term">여행기간</span><br> <span
					id="term2">${Plist[0].term}</span> <span id="date1">간략일정</span><br>
				<span id="date2">${Plist[0].overview}</span> <span id="contents">상품설명</span>
				<span id="contents2">${Plist[0].detail}</span>

			</div>
		</div>
		<div id="remoteButton">

			<div style="width: 100%; height: 16%;">


				<span id="prevButton"><button type="button">prev</button></span> <span
					id="nextButton"><button type="button">next</button></span>
				<!-- </a> -->
				<span id="datespan1"></span> <span id="datespan2"></span>


				<div id="listDayPackage">
					<table id="tablelist">
						<tr style="text-align: center;">
							<td>출/도착시간</td>
							<td>항공</td>
							<td>상품명</td>
							<td>여행기간</td>
							<td>상품가격</td>
							<td>예약상태</td>
						</tr>
						<%
							Date today = new Date();
							SimpleDateFormat dayform = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
							SimpleDateFormat monthForm = new SimpleDateFormat("MM");
							String todayMonth = monthForm.format(today);
							List<PackageThirdDTO> list = (List<PackageThirdDTO>) request.getAttribute("Plist");
							List<PackageThirdDTO> list2 = new ArrayList<>();
							System.out.println(list.size());
							for (int i = 0; i < list.size(); i++) {
								Date MonDt = dayform.parse(list.get(i).getStartdate());
								String monthString = monthForm.format(MonDt);
								if (Integer.parseInt(todayMonth) <= Integer.parseInt(monthString)
										&& (Integer.parseInt(todayMonth) + 1) > Integer.parseInt(monthString)) {
									list2.add(list.get(i));
								}
							}
						%>
						<c:forEach var="i" items="<%=list2%>">
							<tr class="packagelistTable">
								<td>${i.startdate}<br>
								<font color="red">${i.lastdate}</font></td>
								<td>${i.airline}</td>
								<td><a
									href="PackageDeteil?packageno=${i.packageno}&startdate=${i.startdate}">${i.packagename}</a></td>
								<td>${i.term}</td>
								<td><font color="red">${i.price}</font></td>
								<td>${i.reservationab}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
  </div>
   
   <!-- Footer -->
        <footer class="footer" style="background-color: black;"> 
            <div class="row">
                <div class="col-lg-12">
                   <br><font size="2px" color="gray"><p>ForTravel 대표이사: team M&M 서울 강남구 역삼동  에이콘아카데미(주)에이콘이즈</p>   
						<p>대표전화: 02-000-0000 팩스:02-000-0000</p>
                   		 <p>Copyright &copy; team M&amp;M(Jung MinWoo,Lee Min Sub) All Rights Reserved.</p></font>
                </div>
            </div>
        </footer>

    
    <!-- /.container -->
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
	
	  ga('create', 'UA-97815317-1', 'auto');
	  ga('send', 'pageview');
	
	</script>
    <!-- jQuery -->


 
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>
			<!-- Footer -->

</body>
</html>