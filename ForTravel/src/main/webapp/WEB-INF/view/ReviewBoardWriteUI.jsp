<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include  page="maininclude/navi.jsp" flush="true"/>
<script>
var imageIndex='';
        $(document).ready(function(){
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) {
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        $('.blah').append($('<img/>', {
							class:'buttonx',
                        	src: 'resources/images/buttonx.png',
                            style:'cursor: pointer; width:20px',
                        }));
                    	
                    	$('.blah').append($('<img/>', {
                            src: e.target.result,
                        }));
                        
                    }                   
                    //File내용을 읽어 dataURL형식의 문자열로 저장
                    reader.readAsDataURL(input.files[0]); 
                }
            }//readURL()--
   
            //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
            $("body").on("change",".imgInp",function(){
                var fileNm = this.value;
				console.log(fileNm);
                if (fileNm != "") {
 			
				    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
 
    			if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
        			alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
       				 return false;
    				}else{
    					 readURL(this);
    		                
    		                $(this).after("<input type='file' name='theFile' class='imgInp' ><br />");
    		                
    		                $(this).css("display","none");
    				}
 
				}
            });
            
            $("body").on("click",".buttonx",function(){
            	imageIndex=$(".buttonx").index(this);
				$(this).next().remove();
            	$(this).remove();
            	$(".imgInp").eq(imageIndex).remove();
            
            });
        });
  </script>    
  <div class="container">
<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				여행 후기 작성<small>For Travel</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="ReviewBoard">목록가기</a></li>
				<li class="active">여행 후기
				
			</ol>
		</div>
	</div>
	<!-- /.row -->
	
	<!-- Blog Post Row -->
		<div class="row">
		<form  id="form1" name="form1"method="POST" enctype="multipart/form-data" action="ReviewBoardWrite">
			<div class="col-lg-12">
		<select name="travelNation">
		<option value="일본">일본</option>
		<option value="미국">미국</option>
		</select> 
		<select name="travelLoc">
		<option value="오사카">오사카</option>
		<option value="교토">교토</option>
		</select><br/><br/>
		 제목:  <input type="text" name="title" size="124"><br /> <br />
		  
		 <div class="blah"></div>
					<!-- <img id="blah" src="#" alt="사진도 같이 올려보세요" /> -->
					<input type="file" name="theFile" class="imgInp" ><br />
			</div>
			<div class="col-md-6">
				<p><textarea rows="20" cols="130" id="content" name="content" ></textarea></p>
				<a class="btn btn-primary" href="javascript:form1.submit();">글작성 <i
					class="fa fa-angle-right"></i></a>
			</div>
			</form>
		</div>
		<!-- /.row -->
		<hr>
		
    </div>
        <!-- Footer -->
       
<jsp:include page="maininclude/forcopy.jsp" flush="true" />
    <!-- /.container -->

    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>
</body>
</html>