<%-- <%@page import="com.dao.MySqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 System.out.println("idCheck");
  String userid = request.getParameter("userid");
  SqlSession sess = MySqlSessionFactory.openSession();
   int result = 0;
  try{
	 result = 
     sess.selectOne("com.fortravel.MemberMapper.idCheck",userid); 
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  sess.close();
  }
  System.out.println("result:" + result);
  String availability;
   if(result == 0 ){
	availability="아이디 사용 가능";
   }else{
	availability="아이디 중복 사용불가";
   }
%>
<%=availability %>
 --%>