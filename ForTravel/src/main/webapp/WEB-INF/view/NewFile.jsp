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
</head>
<body>
<c:set var="curpage" value="${pageDTO.curpage}" /> <!-- 요청된 현재 페이지 -->
	<c:set var="perPage" value="${pageDTO.perPage}" /> <!-- 페이지 당 보여줄 리스트 수(9) -->
	<c:set var="page" value="5" /> <!-- 표시할 페이지 수 -->
	<c:set var="pageblock" value="${Math.ceil(curpage/page)}"/> <!-- 표시할 페이지 블럭수 -->
	<c:set var="totalRecord" value="${pageDTO.totalRecord}" /> <!-- 전체 게시물 수 -->
<!-- 페이징처리 -->
				<c:if test="${pageblock*page <= Math.ceil(totalRecord/perPage)}">
					<c:set var="endPage" value="${pageblock*page}"/>
				</c:if>
				<c:if test="${pageblock*page > Math.ceil(totalRecord/perPage)}">
					<c:set var="endPage" value="${Math.ceil(totalRecord/perPage)}"/>
				</c:if>
						
				<div class="paging">
					<c:if test="${curpage != 1}">
						<p><a href="BedRoomListServlet?curPage=1&category=${category}&sortValue=${sortValue}">[처음]</a>
					</c:if>
					
					<c:if test="${pageblock > 1}">
						<a href="BedRoomListServlet?curPage=${Math.round((pageblock*page)-19)}&category=${category}&sortValue=${sortValue}">
							[이전]
						</a>
					</c:if> &nbsp;
					
					<c:if test="${pageblock < 1}">
						<c:set var="pageblock" value="1"/> <!-- 표시할 페이지 블럭수 -->
					</c:if>
					
					 <c:forEach var="i" begin="${(pageblock*page)-(page-1)}" end="${endPage}" >
						<c:choose>
							<c:when test="${curPage == i}">
								${i}
							</c:when>
							<c:otherwise>
								<a href="BedRoomListServlet?curPage=${i}&category=${category}&sortValue=${sortValue}">
									${i}
								</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> &nbsp;
					
					<c:if test="${pageblock != Math.ceil((totalRecord/perPage+1)/page)}">
						<a href="BedRoomListServlet?curPage=${Math.round((pageblock*page)+1)}">
							[다음]
						</a>
					</c:if>
					
					<c:if test="${curPage != Math.ceil(totalRecord/perPage)}">
						<a href="BedRoomListServlet?curPage=${Math.round((totalRecord/perPage ))}&category=${category}&sortValue=${sortValue}">
							[끝]
						</a></p>
					</c:if>
				</div>

</body>
</html>