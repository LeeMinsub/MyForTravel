<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <style type="text/css">
  .inputSize{
  width: 16%;
  height: 25px;
  }
  .phoneinputSize{
      width: 4%;
    height: 25px;
  	}
  #emailSelect,#phone1{ 
  height: 25px;
  }
  #name{
    position: relative;
    left: 30%;
  }
  #birthday{
      position: relative;
    left: 30%;
    top: 20px;
  }
  #userid1{
      position: relative;
    top: 34px;
    left: 30%;
  }
  #passwd1{
     position: relative;
    top: 31px;
    left: 30%;
  }
#reg_id{
color: red;
position: relative;
left: 15%;
top : 20px; 
}
#passwd2{
    position: relative;
    bottom: 14px;
    left: 66%; 
}
#emaildiv{
position: relative;
    top: 19px;
    left: 30%; 
}
#addres{
    position: relative;
    top: 35px;
    left: 30%;
}
#phonenum{
    position: relative;
    bottom: 351px;
    left: 66%;
}
#submitbutton{
    position: relative;
    bottom: 35px;
    left: 70%;
    width: 39%;
}
  </style>
  <script type="text/javascript">
$(document).ready(function(){
		var check=false;
		var reg_id = /^[a-z0-9_-]{4,12}$/; 
        var reg_pw = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; 
        var reg_email1 = /([\w-\.]+)/;
		var reg_email2 = /((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regPhone = /^\d{4}$/; 
		
		$("#phone2").on("blur",function(){
			
			console.log(!regPhone.test(parseInt($("#phone2").val())));
			if ((!regPhone.test(parseInt($("#phone2").val())))) {
			$("#phone2").focus();
			$("#phone2").val("");
			}
		});
		
		$("#phone3").on("blur",function(){
			if ((!regPhone.test(parseInt($("#phone3").val())))) {
			$("#phone3").focus();
			$("#phone3").val("");
			}
		}); 
		
		
		$("#userid").on("keyup",function(){
			if(!reg_id.test($("#userid").val())){ 
				$("#reg_id").text("아이디는 3-15자 영문이여야 하며 \n" 
                        +"마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.");
				$("#reg_id").css("color","red");
    		}else{
    			$("#reg_id").empty();
    		}
			//ajax 통신
			$.ajax({
				type:"get",
				url:"maininclude/idCheck.jsp",
				datatype:"text",
				data:{
					userid:$("#userid").val()
				},
				success:function(responseData,status,xhr){
					$("#result").text(responseData);
					if($.trim(responseData)=="아이디 사용 가능"){
						$("#result").css("color","blue");
						$("#result").css("position","relative");
						$("#result").css("left","35%");
						$("#result").css("bottom","11px"); 
						
					}else{
						$("#result").css("color","red");
						$("#result").css("position","relative");
						$("#result").css("left","35%");
						$("#result").css("bottom","11px"); 
					}
				},
				error:function(error){
					console.log(error);
				}
			}); //end ajax
		});//end userid event
		$("#passwd").on("keyup",function(){
			if(!reg_pw.test($("#passwd").val())){ 
				$("#reg_pw").text('비밀번호 형식이 잘못되었습니다.\n' 
	                    +'(영문,숫자를 혼합하여 6~20자 이내)');
				$("#reg_pw").css("color","red");
				$("#reg_pw").css("position","relative");
				$("#reg_pw").css("top","49px");
				$("#reg_pw").css("right","5%");  
			}else{
				$("#reg_pw").empty();
			} 

		});//end pw event
		
		$("#passwdconfirm").on("keyup",function(){
			if($("#passwd").val()==$("#passwdconfirm").val()){
					$("#confirm").text("비밀 번호 일치");
					$("#confirm").css("color","blue");
					$("#confirm").css("position","relative");
					$("#confirm").css("top","14px");
					$("#confirm").css("left","30%");
			}else{
				$("#confirm").text("비밀 번호 불일치 비밀번호를 확인해주세요.");
					$("#confirm").css("color","red");
					$("#confirm").css("position","relative");
					$("#confirm").css("top","14px");
					$("#confirm").css("left","30%"); 
			}
		});//end pw confirm event
		
		$("#emailSelect").on("change",function(){
		if($("#emailSelect").val()=='직접입력'){
			$("#email2").focus();	
			$("#email2").val("");
			$("#email2").removeAttr("readonly");
		}else{
			$("#email2").blur();
			$("#email2").val($("#emailSelect").val());
			$("#email2").attr("readonly","readonly");
		}
	});//end email event
	$("form[name='sinupForm']").on("submit",function(event){
		$("form[name='sinupForm'] input").each(function(idx,obj){
			if($.trim($(this).val())==''){
				alert("공란 없이 입력해주세요");
				$(this).focus();
				check=false;
			}else if(!$.isEmptyObject($("#reg_id").text())){
				alert("유효하지 않는 ID 입니다");	
				$("#userid").focus();
				check=false;
			}else if($.trim($("#result").text())=="아이디 중복 사용불가"){
				alert("중복된 ID 입니다");
				$("#userid").focus();
				check=false;
			}else if(!$.isEmptyObject($("#reg_pw").text())){
				alert("유효하지 않는 비밀번호 입니다");	
				$("#passwd").focus();
				check=false;
			}else if($("#passwd").val()!=$("#passwdconfirm").val()){
				alert("비밀번호를 확인해주세요");
				$("#passwdconfirm").focus();
				check=false;
			}else if(!reg_email1.test($("#email1").val())){ 
				alert("유효하지 않은 email 형식 입니다");
				$("#email1").focus();
				check=false; 
			}else if(!reg_email2.test($("#email2").val())){ 
				alert("유효하지 않은 email 형식 입니다");
				$("#email2").focus();
				check=false; 
			}else if(!$.isNumeric($("#phone2").val())){
				alert("전화번호는 숫자만 입력해주세요.");
				$("#phone2").focus();
				check=false;
			}else if(!$.isNumeric($("#phone3").val()))
			{
				alert("전화번호는 숫자만 입력해주세요.");
				$("#phone3").focus();
				check=false;
			}else{
				check=true;
			}
				return check;
		});//end each
		//other checking
		
		if(check){
			alert("가입을 환영합니다");
		return;
		}else{
			event.preventDefault();
		} 
	}); //end submit event 
});//end ready
  
  
</script>
<!-- DAUM 주소 라이브러리 시작 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<!-- DAUM 주소 라이브러리 끝 --> 
        <!-- Page Heading/Breadcrumbs -->
        <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">회원가입 
                    <small>4Travel</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active"><font color="gray">4Travel를 선택 해주셔서 감사합니다. 4Travel에 </font><font color="black">회원 가입</font><font color="gray">하시면 다양한 정보를 제공 받을 수 있습니다..</font><br></li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12"  style="overflow:hidden;">
			<!-- 회원 가입 -->
<h3  style="position: relative; left:50%;">회원가입</h3>
<span id = "font">

</span>
<br>
	
	<form name="sinupForm" action="MemberJoinController">
	<div id = "name">
	이름 (한글, 예 홍길동) <br>
	<input class="inputSize" type="text" name="username" id="username"></div>
	<div id="birthday">
	 생년월일 <br><input class="inputSize" type="date" name="birth" id="birth" max="2017-04-11" min="1900-01-01"></div>
	 <div id = "userid1"> 
	아이디<span id="reg_id"></span><br> 
	<input class="inputSize" type ="text" name="userid" id="userid" name="userid"></div>
	<span id="result"></span><br>
	<div id="passwd1">
	비밀번호<span id="reg_pw"></span><br>
	<input class="inputSize" type="password" id="passwd" name="passwd"></div>
	<div id = "passwd2">
	비밀번호 확인<br>
	<input class="inputSize" type="password" id="passwdconfirm" name="passwdconfirm"></div> 
	<span id="confirm"></span><br>
	<div id = "emaildiv">
	이메일<br>
	<input class="inputSize" type="text" name ="email1" id="email1">@
	<input class="inputSize" type="text" id="email2" name="email2" readonly="readonly" value="naver.com">
	<select id="emailSelect">
	<option selected="selected">naver.com</option>
	<option>gmail.com</option>
	<option>daum.net</option> 
	<option>hotmail.com</option>
	<option>직접입력</option>
	</select> 
	</div>
	<!-- 다음 호면만 본인 화면으로 설정................. -->
	<div id = "addres">
	주소<br>
	<input name="post1" id="post1" size="5" readonly=""> -
	<input name="post2" id="post2" size="5" readonly="">
	<input onclick="openDaumPostcode()" type="button" value="우편번호찾기">
	<br>
	<span id="callbacknestsgroomtistorycom739114"
		style="width: 1px; height: 1px; float: right;"><embed width="1"
			height="1" id="bootstrappersgroomtistorycom739114"
			src="http://sgroom.tistory.com/plugin/CallBack_bootstrapperSrc?nil_profile=tistory&nil_type=copied_post"
			type="application/x-shockwave-flash" swliveconnect="true"
			flashvars="&callbackId=sgroomtistorycom739114&host=http://sgroom.tistory.com&embedCodeSrc=http%3A%2F%2Fsgroom.tistory.com%2Fplugin%2FCallBack_bootstrapper%3F%26src%3D%2F%2Fs1.daumcdn.net%2Fcfs.tistory%2Fresource%2F3771%2Fblog%2Fplugins%2FCallBack%2Fcallback%26id%3D73%26callbackId%3Dsgroomtistorycom739114%26destDocId%3Dcallbacknestsgroomtistorycom739114%26host%3Dhttp%3A%2F%2Fsgroom.tistory.com%26float%3Dleft"
			enablecontextmenu="false" wmode="transparent"
			allowscriptaccess="always"></span>
	<span style="line-height: 10%;"><br></span>
	<input name="addr1" id="addr1" size="40" readonly="" placeholder="도로명주소">
	<br>
	<span style="line-height: 10%;"><br></span>
	<input name="addr2" id="addr2" size="40" placeholder="지번주소">
   </div>
   <div id = "phonenum">
	전화번호<br>
	<select  name="phone1" id="phone1" style="width:4%;">
	<option>010</option>
	<option>011</option>
	<option>02(서울)</option>
	<option>031(경기)</option>
	<option>032(인천)</option>
	<option>033(강원)</option>
	<option>041(충남)</option>
	<option>042(대전)</option>
	<option>043(충북)</option>
	<option>044(세종)</option>
	<option>051(부산)</option>
	<option>052(울산)</option>
	<option>053(대구)</option>
	<option>054(경북/울릉도/독도)</option>
	<option>055(경남)</option>
	<option>061(전남)</option>
	<option>062(광주)</option>
	<option>063(전북)</option>
	<option>064(제주)</option>
	</select>
	- 
	<input class="phoneinputSize" type="text" name="phone2" id="phone2"> - 
	<input class="phoneinputSize" type="text" name="phone3" id="phone3"></div>
	<div id = "submitbutton">
	<input class="inputSize" type ="submit" value="회원가입" name="sub">
	<input class="inputSize" type ="reset" value="취소" name="res"></div> 
	</form> 
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
          <footer>
            <div class="row">
                <div class="col-lg-12">
                    <font color="gray"><p>ForTravel 대표이사: team M&M 서울 강남구 역삼동  에이콘아카데미(주)에이콘이즈</p>
						<p>대표전화: 02-000-0000 팩스:02-000-0000</p>
                   		 <p>Copyright &copy; team M&amp;M(Jung MinWoo,Lee Min Sub) All Rights Reserved.</p></font>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
