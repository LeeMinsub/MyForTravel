<%@page import="com.entity.PackageThirdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="resources/css/mainSerch.css" rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="resources/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>

<style>
#addcon {
	width: 100%;
	height: 500px;
	border: 1px solid gray;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<script src="resources/js/myScript.js"></script>
<script type="text/javascript">
 var imageNameList;
 var imageCaptionList;
	$(document).ready(function() {
						var beginDate = $("#beginDate").val();
						var endDate = $("#endDate").val();
						var today = new Date();

						$("body").on("click","#adminLog",function() {
									$("#dateTr").css("display", "block");
									myAjax('admin', true, 'html', '','.addcontent');
								});//end adminLog click

						$("body").on("click", "#changeDateButton", function() {
							beginDate = $("#beginDate").val();
							endDate = $("#endDate").val();
						});//end changeDateButton click

						$("body").on("click", "#reviewboardStatic", function() {
							console.log(beginDate == '');
							console.log(today.getFullYear());
							console.log((today.getMonth() + 1));
							console.log(today.getDate());
							if (endDate == '' && beginDate == '') {
								endDate += today.getFullYear() + "-";
								endDate += (today.getMonth() + 1) + "-";
								endDate += today.getDate();
								beginDate += today.getFullYear() + "-";
								beginDate += (today.getMonth() + 1) + "-";
								beginDate += today.getDate();
							}
							console.log(endDate + "::::::::" + beginDate);
						});//end 

						$("body").on("click","#adminMain",function() {
									$("#dateTr").css("display", "none");
									$.ajax({
									type : "get",
									url : "adminMain",
									success : function(responseData, status, xhr) {
										var plusHtml=$.parseHTML(responseData);
											$(".addcontent").html(plusHtml);
									},//end success
									error : function(error) {
										console.log(error);
									}
								}); //end ajax 
									
						});//end adminUI 
								

						$("body").on("click","#preview",function() {
							 $("#myCarousel").css("height","300px");
								$(".item").eq(0).addClass("active");
											var imageLength = $("img.existingImages").length;

											$("header").find(".fill").each(function(idx, obj) {
																var imgsrc = $("img.existingImages").eq(idx).attr("src");
																$(this).css("background-image","url("+ imgsrc+")");
															});
											$("header").find(".carousel-caption").each(function(idx, obj) {
																var precaption = $("textarea.content").eq(idx).val();
																$(this).text(precaption);
															});
											$("#previewDiv").css("display","block");
										});//end previewEvent

						function readURL(input, inputIndex) {
							if (input.files && input.files[0]) {
								var reader = new FileReader();
								var state = FileReader.readyState;
								reader.onload = function(e) {
									$('.blah').eq(inputIndex).append($('<img/>',
															{
																class : 'buttonx',
																src : 'images/buttonx.png',
																style : 'cursor: pointer; width:20px',
															}));

									$('.blah').eq(inputIndex).append(
											$('<img/>', {
												src : e.target.result,
												class : 'existingImages',
											}));
									$('.blah')
											.eq(inputIndex)
											.append("<textarea id='content' name='content' class='content'></textarea>");

								}
								reader.readAsDataURL(input.files[0]);
							}//readURL()--
						}
						$("body").on("change",".InputexistingImages",function() {
											var fileNm = this.value;
											if (fileNm != "") {
												var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
												if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
													alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
													return false;
												} else {
													inputIndex = $(".InputexistingImages").index(this);
													$(this).after("<div class='blah'></div>");
													$(this).css("display","none");
													$(this).after("<input type='file' name='theFile' class='InputexistingImages' ><br />")
													readURL(this, inputIndex);
												}

											}

										});
						$("body").on("click", ".buttonx", function() {
							imageIndex = $(".buttonx").index(this);
							console.log(imageIndex);
							$(".InputexistingImages").eq(imageIndex).remove();
							$(".blah").eq(imageIndex).remove();
							$(this).remove();
						});
					}); /* endDoucumentReady */
</script>

</head>
<body>
	<jsp:include page="maininclude/Serch.jsp" flush="true" />
	<jsp:include page="maininclude/navi.jsp" flush="true" />



	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					관리자페이지 <small>4Travel</small>
				</h1>
			</div>
			<div class="col-md-12">
				<ol class="breadcrumb">
					<li><a id="adminLog" style="cursor: pointer;">통계/로그분석</a></li>
					<li><a id="adminMain" style="cursor: pointer;">메인화면 수정</a></li>
					<li><a id="adminPackage" style="cursor: pointer;">패키지목록수정</a>
					</li>
					<li><a id="adminMember" style="cursor: pointer;">회원목록
							보기/수정</a></li>
					<li><a id="adminReservation" style="cursor: pointer;">예약목록
							보기/수정</a></li>
					<li><a id="adminReviewBoard" style="cursor: pointer;">여행후기/답글
							삭제</a></li>
				</ol>
			</div>
		</div>
		<table id="addcon">
			<tr id="dateTr" style="display: none;">
				<td id="dateTd">시작날짜<input name="beginDate" type="date"
					id="beginDate" min="2000-01-01">&nbsp; 마지막 날짜<input
					type="date" name="endDate" id="endDate" min="2000-01-01">
					&nbsp;
					<button id="changeDateButton">날짜변경</button>
					<br />
				<br />
				<br />
					<button id="reviewboardStatic">여행후기통계</button>&nbsp;
					<button id="reservationStatic">예약통계</button>&nbsp;
					<button id="memberStatic">회원통계</button></td>
			</tr>
			<tr>
				<td class="addcontent"></td>
			</tr>
		</table>
	</div>

	<!-- jQuery -->
	<script src="resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="resources/js/bootstrap.min.js"></script>

</body>
</html>