<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
	String nickName= request.getParameter("nickName");		 
	session.setAttribute("logname",nickName);
	response.sendRedirect("/myapp/");
%>