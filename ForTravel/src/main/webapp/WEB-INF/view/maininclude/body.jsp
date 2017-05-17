<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <div class="container">
 <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".newpackage").css("width","100%");
		$(".newpackage").css("height","200px");
		
		$(".testEle").css("color","red");
		$(".fontcolor").css("color","black");
		
		$("#002").css("left","29%");
		$("#002").css("position","relative"); 
		$("#002box").css("background-color","orange");
		$("#002box").css("color","white"); 
		
		$("#api").css("position","fixed");
		$("#api").css("left","85%");
		$("#api").css("top","75%");
		
		$(window).scroll(function(){
			
			var sc = $(document).scrollTop();
			var dHeight = $("body").height();
			var wHeight = $(window).height();
			if(sc > 490){
				$("#api").css("position","fixed");
				$("#api").css("top","20%");    
				$("#api").css("left","85%");
			}else if (sc < 490){      
			$("#api").css("position","fixed");
			$("#api").css("top","75%"); 
			$("#api").css("left","85%");
			
			}
		});
	});
	
			</script>
        <!-- Marketing Icons Section -->
        <br>
           <div>
        <iframe id ="api" src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0002&rc=0&divType=1&lang=KOR" frameBorder=0
width=600 scrolling=no height=184 topmargin="0" name=irate marginWidth=0 marginHeight=0 title="무료환율표A형"></iframe>			
			
           </div>
    
         <h3 class="page-header">
                 <font color="orange">BEST 여행 후기</font>  	 
         </h3> 
         
     <c:forEach var="BestReview" items="${Plist2}"> 
        <div >
               
        	<div class="col-md-4" id="bestReview">
                <div class="panel panel-default">
                  <!--   <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i>베스트 여행후기</h4>
                    </div> -->
        	 <div class="panel-body">
        	 <p><a href="ReviewBoardDetailController?num=${BestReview.num}">
        	 <c:if test="${BestReview.image1 !=null}">
			<c:set var="image_array" value="${fn:split(BestReview.image1,'/')}" />
				<img class="newpackage" src="/4Travel/images/${image_array[0]}"/>
			</c:if>
			<c:if test="${BestReview.image1 ==null}">
        	 <img  class="newpackage" src="images/noimage.png"/>
        	 </c:if>
        	 </a><br><br>
                        	<span>타이틀 : </span><span class="testEle">${BestReview.title}</span></p>
                        	작성자 : ${BestReview.userid}<br>
                        	여행지 : ${BestReview.travelNation}/${BestReview.travelLoc}<br>
                        	<span>조회수 : </span><span class="testEle">${BestReview.readcnt}</span></p>
        	</div>
        	</div>
        	</div>
        </div>
        </c:forEach>
        
         <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    	<font color="orange">추천 패키지</font><font size = "1"><a href="#" >더보기...</font></a>
                </h3> 
            </div>
             
            <c:forEach var="i" items="${Plist}"> 
            <div class="col-md-4"> 
                 <div class="panel panel-default"> 
                    <!--  <div class="panel-heading"> 
                        <h4><i class="fa fa-fw fa-check"></i>추천 패키지</h4>
                    </div> -->
                    <div class="panel-body">
    				<%Date today = new Date();
    				SimpleDateFormat dayform=new SimpleDateFormat("yyyy/MM"); 
    				%>
				<a href="PackageThirdListController?packageno=${i.packageno}&startdate=<%=dayform.format(today)%>&term=${i.term}">
                        <p><img  class="newpackage" src="images/${i.image}.jpg"></img></a><br><br>
                        	패키지 명 : ${i.packagename}<br>
                        	<%-- 출발날짜 : ${i.startdate}<br> --%>
                        	<%-- 도착날짜 : ${i.lastdate}<br> --%>
                        	<span>가격 : </span><span class="testEle">${i.price}</span></p>
                    </div>
               </div>
             </div>
              </c:forEach>
           
             </div>
        <hr>

        <!-- Call to Action Section -->
        <div class="well">
            <div class="row">
                <div class="col-md-8">
                    <p><font color="orange">고객지원 센터</font></p>
                </div>
                <div class="col-md-4" id="002">
                    <a class="btn btn-lg btn-default btn-block " id="002box" href="FAQBoard.jsp">02-000-0000</a>
                </div>
            </div>
        </div>

        <hr>

        <!-- Footer -->
        

    </div>
    <footer style="margin: 0 auto;">
            <div class="row" style="background: black;
    width: 100%;
    height: 100%;
    margin: 0 auto;
    position: relative;
    top: 100px;">
                <div class="col-lg-12">
                   <jsp:include page="forcopy.jsp" flush="true" />
                </div>
            </div>
        </footer>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script> 
