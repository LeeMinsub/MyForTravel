<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String num=request.getParameter("num");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4Travel/여행후기 수정하기</title>
<style type="text/css">
body{
margin: auto;
}
</style>
<script type="text/javascript"> 
function frameclose() { 
parent.close() 
window.close() 
self.close() 
} 
function submitUpdate(){
	 var f = document.getElementById("reviewUpdateForm");  // 전송할 폼 ID(현재 자식창내)
	  // f.action = "../ReviewBoardUpdateUI";    // 실행할 액션
	   opener.window.name = "SC-AD4200-05";   // 부모창 이름 설정(임의 설정 가능)
	   f.target = opener.window.name;     // 액션 실행 방향 (부모창)
	   f.submit();
	   window.open('', '_self').close();
}
</script>
</head>
<body>
<form id="reviewUpdateForm" name="reviewUpdateForm" action="ReviewBoardUpdate">
<input type="hidden" name="num" value="<%=num%>">
<center><b><%=num%>번 글을 수정하시겠습니까?</b></center>
<center>
<input type="submit" value="수정하기" onclick="javascript:submitUpdate()">
<input type="reset" value="취소" onclick="javascript:frameclose()">
</center>
</form>
</body>
</html>