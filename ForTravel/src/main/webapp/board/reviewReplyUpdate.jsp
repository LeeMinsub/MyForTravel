<%@page import="com.service.ReviewReplyService"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.MemberDTO"%>
<%@page import="com.entity.ReviewReplyDTO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    <%
    String content=request.getParameter("rprpContent");
    String repRoot=request.getParameter("repRoot");
    String repStep=request.getParameter("repStep");
    String repIndent=request.getParameter("repIndent");
    String reviewNum=request.getParameter("reviewNum");
    ReviewReplyDTO rpDTO=new ReviewReplyDTO();
    MemberDTO mdto = (MemberDTO)session.getAttribute("login");
    
    rpDTO.setContent(content);
	rpDTO.setUserid(mdto.getUserid());
	rpDTO.setRepRoot(Integer.parseInt(repRoot));
	rpDTO.setRepStep(Integer.parseInt(repStep));
	rpDTO.setRepIndent(Integer.parseInt(repIndent));
	rpDTO.setReviewNum(Integer.parseInt(reviewNum));
    
	ReviewReplyService biz=new ReviewReplyService();
	List<ReviewReplyDTO> rpList=null;
	
    int result = 0;
    try{
 	 result = biz.replyInsert(rpDTO);
     
     rpList=biz.replyList(Integer.parseInt(reviewNum));
   }catch(Exception e){
 	  e.printStackTrace();
   }finally{
   }
   System.out.println("result:" + result);
   System.out.println("부모 인덴트" + repIndent);
   
   %>

    
    <!-- Comment -->
	<c:forEach var="list" items="<%=rpList%>">
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
					<input type="hidden" name="reviewNum" value="<%=reviewNum%>">
					<button type="button" class="rprpformButton btn btn-primary">Submit</button>
				</form>
			</div>
			</div>
		</div>
	</c:forEach>
	<!-- Comment -->
