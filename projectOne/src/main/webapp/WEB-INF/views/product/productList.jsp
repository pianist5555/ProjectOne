<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 파일럿 페이지</title>
</head>
<body>
<h1>상품 파일럿 페이지</h1>
<form action="muldel.do" method="post">
<table border="1">
	<col width="50px">
	<col width="50px"><col width="50px"><col width="300px"><col width="100px"><col width="50px">
	<col width="50px"><col width="50px"><col width="50px"><col width="50px">
	<tr>
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)" /></th> <!-- this는 현재 태그(checkbox)를 객체로 만들어줌 =document.getElementById(); -->
		<th>번호</th><th>상품이름</th><th>이미지</th><th>가격</th><th>설명</th><th>카테고리번호</th>
		<th>메인여부</th><th>메뉴판번호</th><th>수정일</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}"> <!-- request에 담은 list트가 비어있으면 이것을 실행 -->
			<tr><td colspan="10">-----작성된 글이 없습니다.-----</tr>
		</c:when>
		<c:otherwise> <!-- else면 이것을 실행 -->
			<c:forEach items="${list}" var="dto">
				<tr>
					<td><input type="checkbox" name="chk" value="${dto.pro_seq}" /></td>
					<td>${dto.pro_seq}</td>
					<td>${dto.pro_name}</td>
					<td>${dto.pro_image}</td>
					<td>${dto.pro_price}</td>
					<td>${dto.pro_desc}</td>
					<td>${dto.cat_seq}</td>
					<td>${dto.pro_option}</td>
					<td>${dto.pro_menu}</td>
					<td><fmt:formatDate value="${dto.regdate}" pattern="yyyy-mm-dd" /> </td> <!--날짜 보기 편한 포맷으로 변경해줌 주의사항) val에 date타입이어야함-->
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr><td>
	<input type="button" value="글추가" onclick="location.href='insertForm.do'" />
	<input type="submit" value="글삭제" />
	</td></tr>
</table>
</form>
</body>
</html>