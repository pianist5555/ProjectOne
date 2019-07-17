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
  src="https://code.jquery.com/jquery-latest.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록 페이지</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="../resources/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="../resources/AdminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="../resources/AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="../resources/AdminLTE/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script type="text/javascript">
	var mem_id = "mem_id";
	function goDetail(mem_id) {
 		location.href = 'memberDetail.do?mem_id=' + mem_id; 
	}
</script>
<style type="text/css">
	#tableSelect > tbody {
		cursor: pointer;
	}
	#tableSelect > tbody:hover {
		background-color: gray;
	}
</style>
</head>
<body class="skin-blue">
	<div class="wrapper">
		<section class="content-header">
			<form name="searchForm" method="post" action="./searchMember.do">
				<div class="form-group" style='display:inline; width:100px; float:left; margin-right:10px;'>
					<select name="searchOption" size='1' class='form-control'>
						<option value='all' <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
						<option value='mem_name' <c:out value="${map.searchOption == 'mem_name'?'selected':''}"/>>회원 이름</option>
						<option value="mem_id" <c:out value="${map.searchOption == 'mem_id'?'selected':''}"/>>회원ID</option>
						<option value="mem_b_name" <c:out value="${map.searchOption == 'mem_b_name'?'selected':''}"/>>상호명</option>
						<option value="mem_seq" <c:out value="${map.searchOption == 'mem_seq'?'selected':''}"/>>회원 번호</option>	
					</select>
				</div>
				<div class="input-group input-group-sm" style="width: 200px; float:left;">
					<input type="text" name="keyword" class="form-control" value="${map.keyword}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-info btn-flat">조회</button>
					</span>
				</div>
			</form>
		</section>
	</div>	
	<div class="content-wrapper">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<section class="content-subject">
						<h3 class="box-title">회원 목록</h3>
					</section>
				</div>
				<div class="box-body">
					<table border="1" id="tableSelect" class="table table-bordered table-hover">
						<col width="50px"><col width="80px"><col width="150px"><col width="150px"><col width="150px"><col width="80px"><col width="80px">
						<tr>
							<th>회원번호</th><th>이미지</th><th>회원ID</th><th>회원 이름</th><th>상호명</th><th>승인</th><th>상태</th>
						</tr>
						<c:choose>
							<c:when test="${empty list}">
								<tr><td colspan="10">-----가입된 회원이 없습니다.-----</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="member">
									<tbody onclick="goDetail('${member.mem_id}')">
									<tr>
										<td>${member.mem_seq}</td>
										<td>${member.mem_image}</td>
										<td>${member.mem_id}</td>
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
									</tbody>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<tr><td>
						<input type="button" value="회원 추가" onclick="location.href='joinMemberForm.do'" />
						<button onclick="location.href='home.do'">홈으로</button>
						<button onclick="location.href='<c:url value="to_find_PwForm.do"/>'">비밀번호 찾기</button>
						</td></tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>