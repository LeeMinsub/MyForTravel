<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form  id="BannerUpdateform" name="form1" method="post" enctype="multipart/form-data" action="AdminBannerUpdateController">

		<!-- Preview Image -->
			<c:forEach var="image" items="${imageList}" varStatus="image_status">
				<div class="blah">
				<img src="file/${image}" height="300px" class="existingImages"/>
				<img class="buttonx" src="resources/images/buttonx.png" width="20px" style="cursor: pointer;">	
					<c:if test="${captionList.size()!=0}">
						<c:forEach var="caption" items="${captionList}" varStatus="caption_status">
							<c:if test="${image_status.index==caption_status.index}">
							<textarea id="content" name="content" class="content">${caption}</textarea>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<input type="hidden" class="InputexistingImages" name="existingImages" value="${image}">
			</c:forEach>
					<div class="blah"></div>
					<input type="file" name="theFile" class="InputexistingImages" ><br />
					<div id="preview" class="btn btn-primary">미리보기</div>&nbsp;<button id="bansubmit" class="btn btn-primary">변경사항저장</button>
</form>
					<br/>
					<br/>
					<div id="previewDiv" style="display: none;">
					
						<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		 $("#myCarousel").css("height","300px");
		 $(".item").eq(0).addClass("active");
	});
</script>
<header id="myCarousel" class="carousel slide" >
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<!-- Preview Image -->
			<c:forEach var="image" items="${imageList}" varStatus="image_status">
				<div class="item">
						<div class="fill"
							style="background-image:url('file/${image}');"></div>
						<c:if test="${captionList.size()!=0}">
						<c:forEach var="caption" items="${captionList}" varStatus="caption_status">
							<c:if test="${image_status.index==caption_status.index}">
							<div class="carousel-caption">${caption}</div>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
			</c:forEach>

	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a>
</header>
					
					</div>
	<!-- Controls -->
