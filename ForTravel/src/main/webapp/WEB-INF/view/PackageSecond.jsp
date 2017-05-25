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
 <!--    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
     <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
	$(document).ready(function() {
		$(window).scroll(function(){
			
			var sc = $(document).scrollTop();
			var dHeight = $("body").height();
			var wHeight = $(window).height();
			if(sc > 292){ 
				$("#DefoultBar").css("top","30px");
				$("#DefoultBar").css("left","68%");      
				$("#DefoultBar").css("width","18%");      
				$("#DefoultBar").css("position","fixed");
			}else if (sc < 292){
				$("#DefoultBar").css("position","absolute"); 
				$("#DefoultBar").css("left","74%");  
				$("#DefoultBar").css("width","23%"); 
				$("#DefoultBar").css("top","5%");   
			
			};
		});
		$("#popup").on("click",function(event){
			
			var popUrl = "Reservation.jsp?packagename="+$(".page-header").text();	//팝업창에 출력될 페이지 URL

			var popOption = "top=300, left=500, width=380, height=150, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

				window.open(popUrl,"",popOption);
			});
	});
	</script>
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page= "maininclude/navi.jsp" flush="true" />


<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
       
            <div class="col-lg-12">
            
                <h1 class="page-header">${Plist[0].packagename}
                </h1>
                <small>${Plist[0].city}</small>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li><a href="PackageFirstALL?loc=${Plist[0].loc}">${Plist[0].loc}</a>
                    <li class="active">${Plist[0].city}</li>
                </ol>
            </div>
        </div> 
         <div class="col-lg-12" style="bottom: 23px; position: relative; width: 66%; height:275px;">       
                <h3>${Plist[0].detail}</h3>
                <table style="text-align: center; width: 41%;"> 
                <tr style="border-bottom: 1px dotted; border-top: 1px solid; height: 35px;">
                <td style="border-right: 1px dotted; background-color:#e6edf8">출발일</td><td>${Plist[0].startdate}</td>
                </tr>
                <tr style="border-bottom: 1px dotted; height: 35px;">
                <td style="border-right: 1px dotted; background-color:#e6edf8">도착일</td><td>${Plist[0].lastdate}</td>
                </tr>
                <tr style="border-bottom: 1px dotted; height: 35px;">
                <td style="border-right: 1px dotted; background-color:#e6edf8">이용항공</td><td>${Plist[0].airline}</td>
                </tr>
                <tr style="border-bottom: 1px solid; height: 35px;"> 
                <td style="border-right: 1px dotted; background-color:#e6edf8">예약</td><td>${Plist[0].reservationab}(최소출발 ${Plist[0].minpersonnel}명)</td>
                </tr>
                <tr style="border-bottom: 1px solid; height: 35px;"> 
                <td style="border-right: 1px dotted; background-color:#e6edf8">여행사</td><td>${Plist[0].company}</td>
                </tr>
                </table>
                 
 				<table style="text-align: center; width: 50%; position:relative; left:45%; bottom:177px;"> 
                <tr style="border-bottom: 1px dotted; border-top: 1px solid; height: 45px;">
                <td style="border-right: 1px dotted; background-color:#e6edf8">이용자구분</td><td style="border-right: 1px dotted; background-color:#e6edf8">성인<br><font size="2px">만12세이상</font></td>
                <td style="border-right: 1px dotted; background-color:#e6edf8">아동<br><font size="2px">만12세이상</font></td><td style="background-color:#e6edf8">유아<br><font size="2px">만12세이상</font></td>
                </tr>
                <tr style="border-bottom: 1px dotted; height: 45px;">  
                <td style="border-right: 1px dotted; background-color:#e6edf8">기본상품가</td><td style="border-right: 1px dotted;">${Plist[0].price - Plist[0].tax}원</td>
                <td style="border-right: 1px dotted; ">${Plist[0].childprice - Plist[0].tax}원</td><td>${Plist[0].babyprice}원</td>
                </tr>
                <tr style="border-bottom: 1px dotted; height: 45px;">
                <td style="border-right: 1px dotted; background-color:#e6edf8">유류할증료</td><td style="border-right: 1px dotted;">${Plist[0].tax}원</td>
                <td style="border-right: 1px dotted; ">${Plist[0].tax}원</td><td>0원</td>
                </tr>
                <tr style="border-bottom: 1px solid; height: 45px;">  
                <td style="border-right: 1px dotted; background-color:#e6edf8;">총상품가</td><td style="border-right: 1px dotted;  color:red;">${Plist[0].price}원</td> 
                <td style="border-right: 1px dotted;  color:red;">${Plist[0].childprice}원</td><td style=" color:red;">${Plist[0].babyprice}원</td> 
                </tr> 
                </table>
            </div> 
            <div id = DefoultBar style="position: absolute; left:74%; width: 25%; top:5%;">
            	<div style="background-color:#ffa70b; height:125px; font-size:20px; width: 82%;"> 
            	<br>
            	<h5 style="margin-left: 6%;">총 상품가격(성인 1인 기준)</h5> 
            	<h2 style="margin-left: 6%;">${Plist[0].price}원</h2>  
            	</div>
            	<br> 
            	<div style="margin-left: 5%;">
            	<span>
            	상품명<br> 
            	 ${Plist[0].packagename}
            	 </span>
            	<br>
            	<br>
            	출발일  <br>
            	<font color="red">${Plist[0].startdate}<br></font>
            	<br> 
            	도착일<br>
            	<font color="red">${Plist[0].lastdate}<br></font>
            	<br>
            	<br>
            	여행기간<br> 
            	${Plist[0].term}
            	<br>
            	<br>
            	항공사<br>
            	${Plist[0].airline}
            	<br>
            	<br>
            	예약현황<br>
            	${Plist[0].presentreservation}/${Plist[0].personnel}명<font color="red" size="3px">(최소출발인원 ${Plist[0].minpersonnel}명)</font>
            	<br><br> 
            	<!-- <form action="packageInclude/reservation.jsp"> -->
            	<!-- <form action="packageInclude/reservation.jsp?packagename=ccc"> -->
            	<button id ="popup">상담예약하기</button>
            	<!-- </form> -->
            	<!-- </form> -->
            	</div>
            	
            </div>
        <!-- /.row -->
<br>
        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8" style="margin-left: 1%; width: 61%; height: 320px;" > 
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="img-responsive" src="resources/images/${Plist[0].image1}.jpg" alt="그림1" style="height:315px;">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="resources/images/${Plist[0].image2}.jpg" alt="그림2" style="height:315px;">
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="resources/images/${Plist[0].image3}.jpg" alt="그림3" style="height:315px;"> 
                        </div>
                    </div>

                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
			<div style="width:59%; position: relative; top:23px; left:2%;overflow: hidden;"> 
			<span style="position:relative;"><font color="#ffa70b">|</font> 상품안내</span>  
				<img src="resources/images/${Plist[0].imgdetail}.jpg" style="width: 100%; position: relative; height:100%;"> 
			</div>	
</div>
</div>			
	  <!-- Footer -->

 <jsp:include page="maininclude/forcopy.jsp" flush="true" />
     <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>