<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록 페이지</title>
</head>
<body>
<form name="searchForm" method="post" action="./searchMember.do">
	<select name="searchOption" size='1' class='select'>
		<option value='all' <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
		<option value='mem_name' <c:out value="${map.searchOption == 'mem_name'?'selected':''}"/>>회원 이름</option>
		<option value="mem_id" <c:out value="${map.searchOption == 'mem_id'?'selected':''}"/>>회원ID</option>
		<option value="mem_b_name" <c:out value="${map.searchOption == 'mem_b_name'?'selected':''}"/>>상호명</option>
		<option value="mem_seq" <c:out value="${map.searchOption == 'mem_seq'?'selected':''}"/>>회원 번호</option>	
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회" >
</form>
${map.count}개의 회원 정보가 있습니다.

<h1>회원 목록</h1>
<table border="1">
	<col width="50px"><col width="80px"><col width="150px"><col width="150px"><col width="150px"><col width="80px"><col width="80px">
	<tr>
		<th>회원번호</th><th>회원ID</th><th>이미지</th><th>회원 이름</th><th>상호명</th><th>승인</th><th>상태</th>
	</tr>
	<c:choose>
		<c:when test="${empty map.list}">
			<tr><td colspan="10">-----검색 결과에 맞는 회원이 없습니다.-----</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${map.list}" var="member">
				<tr>
					<td>${member.mem_seq}</td>
					<td><a href="memberDetail.do?mem_id=${member.mem_id}">${member.mem_id}</a></td>
					<td>${member.mem_image}</td>
					<td>${member.mem_name}</td>
					<td>${member.mem_b_name}</td>
					<td>
						<c:set var="isApprove" value="${member.mem_isApprove}" />
						<c:choose>
							<c:when test="${isApprove == 1}">
							승인
							</c:when>
							<c:otherwise>
							미승인
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:set var="isDel" value="${member.mem_isDel}" />
						<c:choose>
							<c:when test="${isDel == 1}">
							탈퇴
							</c:when>
							<c:otherwise>
							가입
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr><td>
	<input type="button" value="회원 추가" onclick="location.href='joinMemberForm.do'" />
	<button onclick="location.href='home.do'">홈으로</button>
	</td></tr>
</table>
</body>
</html>