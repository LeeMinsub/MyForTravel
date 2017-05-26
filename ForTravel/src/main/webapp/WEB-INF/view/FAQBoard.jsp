<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <link href="resources/css/mainSerch.css" rel="stylesheet">
 <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    <!-- /.container -->
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="maininclude/Serch.jsp" flush="true"/>
<jsp:include page="maininclude/navi.jsp" flush="true"/>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">FAQ
                    <small>자주 묻는 질문</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="Home">Home</a>
                    </li>
                    <li class="active">FAQ</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">회원가입은 어떻게 하나요?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                               	회원 가입은 	main 화면 > 상단 회원가입 클릭 > 정보 입력 후 전송 누르시면 회원 가입이 되십니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">주말(휴일)에 신청한 예약/상담건은 바로 확정이 되나요?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                	주말에 신청하신 예약/상담 요청건은 즉시 확인/확정이 불가능 하며 업무일에 담당자의 확인/상담 후 진행됩니다. <br>이는 제휴여행사 의 업무진행이 어렵기 떄문이며, 돌아오는 평일에 신청들아온 우선순위대로 처리 하고 있습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">원하는 상품(좌석)이 나오면 연락 주실수 있나요?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                	죄송합니다만 업무 여건상 따로 연락을 드리는 부분은 불가합니다. 도움을 드리지 못해 죄송합니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">짐이 도착하지 않은 경우 어떻게 해야 되나요?</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                	출국 시 항공티켓에 붙여주는 수하물표(Baggage Claim Tag)를 확인하시기 바랍니다. 이러한 불상사가 발생했으 시에 짐을 찾을 수 있는 유일한 증거입니다. <br>해당 공항 및 항공사 직원에게 수하물표와 항공권을 보여주시고 분실 접수 하시면 됩니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">기상이 좋지 않을 때 운항 여부는 언제 결정 되나요?</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                기상으로 인한 운항 여부는 항공 출발시간 2시간 전에 1차적으로 결정이 되며 확실한 운항 여부는 1시간 전에 화인이 가능 합니다. <br>운항 여부를 안내 받기 어려운 경우에는 해당 항공으로 문의하시기 바랍니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">임산부인데 비행기를 탈 수 있나요?</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                임산부의 경우에도 국제선/국내선 모두 탑승이 가능합니다. 단, 탑승일 기준으로 32주 이상된 임산부의 경우 의사 소견서가 필요하며 항공편 예약 시 임신 일수 및 출산 예정일 등을 알아야 합니다. 32주 미만의 경우 일반인과 동일하게 간주됩니다. <br>
                                <br>서약서 2부 : <br>출발하기 전에 공항에서 작성하시면 됩니다. 위의 사항은 국적기 기준이며 외항사들의 경우는 임산부 탑승 기준이 되는 주기가 국적기와 다를 수 있으모 자세한 사항은 해당 항공사나 예약 시 해당 상품의 담당자와 상의해보시기 바랍니다. 또한 외항사들의 경우 진단서(의사 소견서)가 영문으로 필요한 경우도 있으니 참고하시기 바랍니다. 
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">옵션(선택관광)강요가 있나요?</a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                옵션의 강요란 없습니다. 현지에서는 강요가 아닌 강력추천의 의미로 보시면 됩니다. <br>
                                만약 고객님께서 여행을 가겼을 경우 강요라고 느껴지셨다면 해당 상품의 담당자에게 전화 주시기 바랍니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">최소 출발인원이 안되는 경우는 어떻게 되나요?</a>
                            </h4>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <div class="panel-body">
                                패키지 여행은 단체 여행이기 떄문에 출발일 까지 최소 출발 인원이 채워지지 않는 경우 다른 날로 상품을 변경하시거나 혹은 여행상품이 취소될 수 있습니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">여행 경비는 얼마나 가져가야 할까요?</a>
                            </h4>
                        </div>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <div class="panel-body">
                               패키지 여행일 경우 상품가격에 식사나 공항세 등 포함되어 있지 않은 사항을 확인하시고 개인 경비를 준비하시면 됩니다. <br>또 현지에서 상품가격에 포함되어 있지 않은 선택관광이남 쇼핑을 하고자 할 경우 그 비용을 추가로 준비하시면 되겠습니다. <br>쇼핑의 경우에는 대부분 카드로 결제 가능하오니 카드로 지불하는 것이 안전하고 편리한 방법입니다.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.panel-group -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <hr>

    </div>
        <!-- Footer -->
      <jsp:include page="maininclude/forcopy.jsp" flush="true" />

    <!-- /.container -->
<script src="resources/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>