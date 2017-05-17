<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jquery mobile</title>
 
<link rel="stylesheet" href="./jqueryMobile/jquery.mobile-1.4.5.css">
<script src="./jquery/jquery.js"></script>
<script src="./jqueryMobile/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
<link rel="stylesheet" href="css/jqueryMobile.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<!-- <script src="css/swiper.min.js"></script> -->

    <!-- Swiper JS -->
    <script src="js/swiper.min.js"></script>

    <!-- Initialize Swiper -->
    <script type="text/javascript">
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        paginationClickable: true,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    });
    </script>
</head>
<body>
<div data-role ="header" style="background-color: #ffa70b;"> 
<h1>4Trevel</h1>
<a herf = "#" data-icon = "arrow-L" class = "ui-btn ui-btn-b">Back</a>
<a herf = "#" data-icon = "home" class = "ui-btn ui-btn-b">Home</a>
<div data-role = "controlgroup" data-type="horizontal" style="margin-left:20%; margin-right:10%;" >  
<a herf = "#" data-role = "button"  >패키지</a> 
<a herf = "#" data-role = "button" >여행후기</a>
<a herf = "#" data-role = "button" >로그인</a> 


</div>
</div>
<div data-role ="content">
<!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src=imeage/op1.jpg></div> 
            <div class="swiper-slide"><img src=imeage/op2.jpg></div>
            <div class="swiper-slide"><img src=imeage/op3.jpg></div>
        
        </div>
 
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</div>
<div data-role ="footer" data-position="fixed">
<h1>footer</h1>
</div> 
</body>
</html>


