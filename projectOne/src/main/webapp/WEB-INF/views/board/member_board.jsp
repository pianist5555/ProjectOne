<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%@ include file="../include/head.jsp"%>

<body class="layout-boxed skin-blue sidebar-mini">

	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="../include/main_header.jsp"%>

		<!-- Left Column(사이드바) -->
		<%@ include file="../include/left_column.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					고객센터 게시판 <small>점주용</small>
					<hr>
				</h1>
				<form class="form-inline" action="searchBoard.do" method="POST" name="searchForm">
					<div class="form-group">
						<select class="form-control" name="searchType" size="1" class="select">
							<option value="all" <c:out value="${search.searchType == 'all'?'selected':''}" />>전체</option>
							<option value="qna_title" <c:out value="${search.searchType == 'qna_title'?'selected':''}" />>제목
							</option>
							<option value="qna_content" <c:out value="${search.searchType == 'qna_content'?'selected':''}" />>내용
							</option>
							<option value="mem_id" <c:out value="${search.searchType == 'mem_id'?'selected':''}" />>아이디</option>
						</select>
					</div>
					<div class="form-group">
						<input class="form-control" name="keyword" value="${search.keyword}">
					</div>
					<div class="form-group">
						<button class="btn btn-info btn-flat" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						<input type="button" class="btn btn-default" onclick="location.href='member_writeForm.do'" value="글쓰기">
					</div>
				</form>
			</section>
			<section class="content container-fluid">
				<div class="row">
					<div class="col-xs-10">
						<div class="box">
							<div class="box-body table-responsive no-padding">
								<table class="table table- table-bordered table-hover">
									<thead>
										<tr>
											<th width="7%">번호</th>
											<th width="10%">작성자</th>
											<th>제목</th>
											<th width="15%">작성일</th>
											<th width="10%">조회수</th>
										</tr>
									</thead>
									<c:choose>
										<c:when test="${empty board}">
											<tr>
												<td colspan="5">----작성된 글이 없습니다.----</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="board" items="${board}">
												<tr>
													<td>${board.qna_seq}</td>
													<td>${board.mem_id}</td>
													<td align='left'>
														<c:choose>
															<c:when test='${board.qna_isDel == 1}'>
																----삭제된 글입니다.----
															</c:when>
															<c:when test='${board.level > 1}'>
																<c:forEach begin="1" end="${board.level}" step="1">
																	<span style="padding-left: 20px;"></span>
																</c:forEach>
																<span style="font-size: 12px;">[답변]</span>
																<a href="member_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
															</c:when>
															<c:otherwise>
																<a href="member_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<fmt:formatDate value="${board.qna_regDate}" />
													</td>
													<td>${board.qna_readCount}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div>
					<ul class="pagination">
						<c:if test="${totalArticles != null}">
							<c:choose>
								<c:when test="${totalArticles > 100}">
									<c:forEach var="page" begin="1" end="10" step="1">
										<c:if test="${section > 1 && page == 1}">
											<a href="member_board.do?section=${section-1}&curPage=${(section-1)*10}">&nbsp;[이전]</a>
										</c:if>
										<li><a href="member_board.do?section=${section}&curPage=${page}">${(section-1)*10+page}</a></li>
										<c:if test="${page == 10}">
											<a href="member_board.do?section=${section+1}&curPage=1">&nbsp;[다음]</a>
										</c:if>
									</c:forEach>
								</c:when>
								<c:when test="${totalArticles == 100}">
									<c:forEach var="page" begin="1" end="10" step="1">
										<li><a href="#">${page}</a></li>
									</c:forEach>
								</c:when>
								<c:when test="${totalArticles < 100}">
									<c:forEach var="page" begin="1" end="${totalArticles/10+1}" step="1">
										<c:choose>
											<c:when test="${page==curPage}">
												<li><a href="member_board.do?section=${section}&curPage=${page}">${page}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="member_board.do?section=${section}&curPage=${page}">${page}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
							</c:choose>
						</c:if>
					</ul>
				</div>
			</section>
		</div>
		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>

	</div>
	<!-- /wrapper -->
	<%@ include file="../include/plugin_js.jsp"%>
</body>

</html>