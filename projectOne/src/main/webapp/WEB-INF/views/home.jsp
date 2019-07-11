<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page session="false" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String name = "";
	if(principal != null) {
		name = auth.getName();
	}
%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	통합 주문관리서비스 기능구현중
</h1>


<p><a href="<c:url value='productList.do?countProductPage=1'/>">상품리스트</a></p>
<p><a href="<c:url value='memberList.do'/>">회원목록</a>
<p><a href="<c:url value='member/board/member_board.do'/>">점주 게시판</a>
<p><a href="<c:url value='admin/board/admin_board.do'/>">관리자 게시판</a>
 
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/secu/loginPage.do"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<h3><%=name %>님, 반갑습니다.</h3>
	<form action="/logout" method="POST">
		<button type="submit">LOGOUT</button>
	</form>
</sec:authorize>
</body>
</html>
