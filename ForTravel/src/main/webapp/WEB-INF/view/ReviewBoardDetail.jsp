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
 <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
 <link href="resources/css/mainSerch.css" rel="stylesheet">
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include  page="maininclude/navi.jsp" flush="true"/>
<style>
.arrowdiv{
width:10px;
height:10px;
background-image: url('images/arrow.png');
background-size: 10px;
padding:0;
}
</style>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 <small><a href="#">For Travel</a> </small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="ReviewBoard">목록가기</a></li>
				<li class="active">${boardRetrieve.title}</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->

	<!-- Content Row -->
	<div class="row">

		<!-- Blog Post Content Column -->
		<div class="col-lg-8">

			<!-- Blog Post -->

			<hr>

			<!-- Date/Time -->
			<p><p class="lead">${boardRetrieve.title}</p>	<i class="fa fa-clock-o"></i> Posted on ${boardRetrieve.writeday}</p>


			<!-- Preview Image -->
			<c:if test="${boardRetrieve.image1 != null}">
			<hr>
			<c:set var="image_array" value="${fn:split(boardRetrieve.image1,'/')}" />
			<c:forEach var="image" items="${image_array}" varStatus="s">
			<img class="img-responsive"
				src="file/${image}" alt=""><br/><br/>
				</c:forEach>
			</c:if>

			<!-- Post Content -->
			
			<p>
			<pre>${boardRetrieve.content}</pre>
			</p>

			<hr>
			
			<!-- Blog Comments -->

			<!-- Comments Form -->
			<div class="well">
				<h4>Leave a Comment:</h4>
				<form action="ReviewReplyWrite" role="form" method="post">
					<div class="form-group">
						<textarea name="rpContent"class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" name="num" value="${boardRetrieve.num}">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<hr>


	
</div>
<style>
#reple{
width: 700px;
height: 200px;
margin: auto;
}
.arrowdiv{
width:15px;
height:15px;
background-image: url('images/arrow.png');
background-size: 15px;
padding:0;
}
.showtoggle{
display:block;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
		
	$("body").on("click",".replebutton",function(event){
		if(${login==null}){
				alert('로그인 후 시도 해주세요');
			}else if($(this).next().next().next(".reple").attr("style")=='display: block;'){
			$(this).next().next().next(".reple").css("display","none");
		}else{
			$(this).next().next().next(".reple").css("display","block");
		}
			console.log($(this).next().next().next(".reple").attr("style"));
			console.log($.trim($(this).next().next().next(".reple").attr("style"))=='display: block;');
		});//end rdeplebutton event
		
		$("body").on("click",".rprpformButton",function(event){
			console.log($(this).closest(".rprpform"));
			var queryString = $(this).closest(".rprpform").serialize();
			console.log(queryString);
		
		$.ajax({
				type:"get",
				url:"ReviewReplyInsert",
				dataType:"html",
				data:queryString,
				success:function(responseData,status,xhr){
					console.log(responseData);
					$("#replyDiv").html(responseData);
				},
				error:function(error){
					console.log(error);
				}
			}); //end ajax 
		});	
});	
		</script>
<div id="replyDiv" class="container">
<!-- Comment -->
	<c:forEach var="list" items="${rpList}">
		<div class="media">
			<c:forEach begin="0" end="${list.repIndent}">

			<a class="pull-left" href="#">
					<div class="media-object" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</a>
				</c:forEach>
			<a class="pull-left" href="#">
					<div class="media-object arrowdiv" ></div>
			</a>
			<div class="media-body">
			
				<h4 class="media-heading">
					By ${list.userid} <small>${list.writeday}</small>
				</h4>
				<pre style="background: none; border: 0;">${list.content}</pre>
				<span class="replebutton label label-success" style="cursor: pointer;">답글 달기</span>
			<br/><br/>
			<div class="reple well" style="display: none;">
				<h4>Leave a Comment:</h4>
				<form class="rprpform" name="rprpform" role="form" method="post">
					<div class="form-group">
						<textarea name="rprpContent"class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" name="userid" value="${sessionScope.login.userid}">
					<input type="hidden" name="num" value="${list.num}">
					<input type="hidden" name="repRoot" value="${list.repRoot}">
					<input type="hidden" name="repStep" value="${list.repStep}">
					<input type="hidden" name="repIndent" value="${list.repIndent}">
					<input type="hidden" name="reviewNum" value="${boardRetrieve.num}">
					<button type="button" class="rprpformButton btn btn-primary">Submit</button>
				</form>
			</div>
			</div>
		</div>
	</c:forEach>
	<!-- Comment -->
		<hr>
</div>
<jsp:include page="maininclude/forcopy.jsp" flush="true" />
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>