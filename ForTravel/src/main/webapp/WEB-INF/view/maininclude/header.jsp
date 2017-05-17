<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myCarousel").css("top", "81px");
		 $(".item").eq(0).addClass("active");
	});
</script>
<header id="myCarousel" class="carousel slide">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<!-- Preview Image -->
		<c:if test="${bannerdto.imageName != null}">
			<c:set var="image_array" value="${fn:split(bannerdto.imageName,'/')}" />
			<c:forEach var="image" items="${image_array}" varStatus="image_status">
				<div class="item">
					<a href="#">
						<div class="fill"
							style="background-image:url('/4Travel/images/${image}');"></div>
					<c:if test="${bannerdto.imageCaption != null}">
						<c:set var="caption_array"
							value="${fn:split(bannerdto.imageCaption,'/')}" />
						<c:forEach var="caption" items="${caption_array}" varStatus="caption_status">
							<c:if test="${image_status.index==caption_status.index}">
							<div class="carousel-caption">${caption}</div>
							</c:if>
						</c:forEach>
					</c:if>
					 </a>
				</div>
			</c:forEach>
		</c:if>

	</div>

	<!--  <div class="item active">
            <a href = "#">
                <div class="fill" style="background-image:url('/4Travel/images/배너1.jpg');"></div>
                <div class="carousel-caption">
                    
                </div></a> 
            </div>
            <div class="item">
            <a href = "#">
                <div class="fill" style="background-image:url('/4Travel/images/배너2.jpg');"></div>
                <div class="carousel-caption">
                  
                </div></a>
            </div>
            <div class="item">
            <a href = "#">
                <div class="fill" style="background-image:url('/4Travel/images/배너3.jpg');"></div>
                <div class="carousel-caption">
                     
                </div></a>
            </div> -->

	<!-- Controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a>
</header>