<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<span class="spanmenu">

<c:if test="${adminlogin != null }">
<a href="AdminUIController" class="dropdown-toggle">관리자페이지</a>
</c:if>

<c:if test="${adminlogin == null }">
<a href="#">마이페이지 |</a>
<a href="#">예약확인/결제 |</a>
<a href="#">고객센터</a>
</c:if>
</span>
<div>
<a href="Home">
<img id = "logimg" alt="로고" src="images/log2.png"></a>
</div>
<div>
<form action="" method="get">
<table class ="TotalSerch" border="2px" bordercolor="#ffa70b">
<tr>
<td>통합검색 </td><td><input class="serchinput" type="text" border="0"></td><td><input class="serchinput" type = "submit" value="검색">
</tr>
</table>
</form>
</div>