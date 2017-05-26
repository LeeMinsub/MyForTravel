<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
   <link href="resources/css/mainSerch.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
        <script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script> 
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page="maininclude/navi.jsp" flush="true"/>
  <style>
  
      #map {
        height: 30%;
        width: 65%;
        position:absolute;
        left: 27%; 
        top:61%;
      }
      #location{
      position: absolute;
      	top:54%;
      	left:26%;  
      }
      #company{
      position: absolute;
      	top:16%;
      	left:26%; 
      	width: 70%;
      }
      #companyintroduce2{
      position:absolute;
      left : 500px;
      top:29%; 
      width : 350px;
      }
    
    </style>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	 
		  /* $("#package").on("mouseover",function(event) {	
			$(".siteMapList").toggle();
			$(".siteMapList").css("display","block"); 
		});
		$("#siteMapList").on("mouseover",function(event) {	
			$(".list-group-item").toggle();
			$(".list-group-item").css("display","block"); 
		});   
		$(".siteMapList").css("padding","0px;"); */

	});
	function initMap() {
		  var map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 17,
		    center: {lat: 37.49939, lng: 127.028997}
		  });

		  var marker = new google.maps.Marker({
		    map: map,
		    // Define the place with a location, and a query string.
		    place: {
		      location: {lat: 37.49939, lng: 127.028997},
		      query: 'Google, Sydney, Australia'

		    },
		    // Attributions help users find your site again.
		    attribution: {
		      source: 'Google Maps JavaScript API',
		      webUrl: 'https://developers.google.com/maps/'
		    }
		  });

		  // Construct a new InfoWindow.
		  var infoWindow = new google.maps.InfoWindow({
		    content: '4Travel' 
		  });

		  // Opens the InfoWindow when marker is clicked.
		  marker.addListener('click', function() {
		    infoWindow.open(map, marker);
		  });
		}
			</script>
  <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><font color="#ffa70b">|</font> 회사소개
                    <small>Site Map</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">Site Map</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
                <div class="list-group">
                    <a href="Home" class="list-group-item">Home</a>
                    <a href="#" class="list-group-item" id = "package">패키지</a>
                    <ul class="siteMapList"> 
                    <a href ="PackageFirstALL?loc=동남아"><li class="list-group-item">동남아/대만</li></a>
                    <a href ="PackageFirstALL?loc=중국"><li class="list-group-item">중국/홍콩</li></a>
                    <a href ="PackageFirstALL?loc=일본"><li class="list-group-item">일본</li></a>
                    <a href ="PackageFirstALL?loc=유럽"><li class="list-group-item">유럽</li></a>
                    <a href ="PackageFirstALL?loc=괌"><li class="list-group-item">괌/사이판</li></a>
                    <a href ="PackageFirstALL?loc=남태평양"><li class="list-group-item">남태평양</li></a>
                    <a href ="PackageFirstALL?loc=미국"><li class="list-group-item">미국/캐나다</li></a>
                    <a href ="PackageFirstALL?loc=서남아"><li class="list-group-item">서남아/중앙아시아</li></a>
                    <a href ="PackageFirstALL?loc=중동"><li class="list-group-item">중동/아프리카</li></a>
                    <a href ="PackageFirstALL?loc=중남미"><li class="list-group-item">중남미</li></a>
                    </ul>
                    <a href="ReviewBoard" class="list-group-item">여행후기</a>
                    <a href="NoticeUI" class="list-group-item">공지사항</a>
                    <a href="QABoardList" class="list-group-item">FAQ</a>
                    <a href="SignUP" class="list-group-item">회원가입</a>
                </div>
            </div>
            <!-- Content Column -->
            <span id="company">
             <h2><font color="#ffa70b">|</font> 4Travel 회사소개</h2> 
              <hr>
             <span id = "companyintroduce1">
             	<strong>회사명  :</strong> ForTravel(4Travel)<br><br>
             	<strong>URL  :</strong> www.4travel.co.kr<br><br>
             	<strong>업 종  :</strong> 국외 여행정보 서비스 / 국외 여행상품 판매<br><br>
             	<strong>자본금  :</strong> ??원<br><br>
             	<strong>회사주소  :</strong> 서울특별시 강남구 에이콘아카데미빌딩 4층
             </span>
            
             <span id ="companyintroduce2">
             	<strong>대표이사  :</strong> 정민우/이민섭<br><br>
             	<strong>상근종업원  :</strong> ??명<br><br>
             	<strong>등록분야  :</strong> 일반여행업 서울??호<br><br>
             	<strong>창 립 일  :</strong> 2017 년 3월 01일<br><br>
             	<strong>대표전화  :</strong> 02-000-0000
             </span>
             <hr>
             </span> 
            <div id="location">
             <h2><font color="#ffa70b">|</font> 위치안내</h2>
             </div> 
             <div id="map"></div>
        </div>
        
        
        <!-- /.row -->

        <hr>

    </div>
        <!-- Footer -->
      <jsp:include page="maininclude/forcopy.jsp" flush="true"/> 

    <!-- /.container -->
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9pjYyBZSV-jNs6d8o58mEXsgqe4ecpCA&libraries=places&callback=initMap"></script>


    <script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script> 

</body>
</html>