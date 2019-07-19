<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<!-- HEAD(link파일들 모음) -->
<%@ include file="../include/head.jsp"%>
<style>
  #replyForm {
    display: none;
  }
</style>

<body class="layout-boxed skin-blue sidebar-mini">
  <div class="wrapper">
    <!-- Main Header(네비게이션 바) -->
    <%@ include file="../include/main_header.jsp"%>

    <!-- Left Column(사이드바) -->
    <%@ include file="../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          고객센터 게시판 <small>관리자용</small>
          <hr>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">
        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-body table-responsive no-padding">
                <table class="table table-bordered table-hover">
                  <tr>
                    <th width="10%">번호</th>
                    <td>${boarddetail.qna_seq}</td>
                    <th>아이디</th>
                    <td>${boarddetail.mem_id}</td>
                  </tr>
                  <tr>
                    <th>제목</th>
                    <td colspan="3">${boarddetail.qna_title}</td>
                  </tr>
                  <tr>
                    <th>첨부이미지 미리보기</th>
                    <td colspan="3">
                      <img src="${pageContext.request.contextPath}/image/${boarddetail.qna_fileName}" width=200
                        height=200 />
                    </td>
                  </tr>
                  <tr>
                    <th>내용</th>
                    <td colspan="3">${boarddetail.qna_content}</td>
                  </tr>
                </table>
                <div class="btn-group">
                  <button class="btn btn-default" type="button" onclick="replyForm()">답글달기</button>
                  <button class="btn btn-default" type="button"
                    onclick="updateForm('${boarddetail.qna_seq}')">수정</button>
                  <button class="btn btn-default" type="button" onclick="delBoard('${boarddetail.qna_seq}')">삭제</button>
                  <input class="btn btn-default" type="button" value="목록" onclick="location.href='admin_board.do'">
                </div>
                <div class="form-group" id="replyForm">
                  <h1>답글</h1>
                  <form action="admin_replyBoard.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="seq" value="${boarddetail.qna_seq}">
                    <table class="table table-bordered table-hover">
                      <tr>
                        <th width="10%">아이디</th>
                        <td colspan="2"><input class="form-control" type="text" name="mem_id" value="ADMIN" readonly>
                        </td>
                      </tr>
                      <tr>
                        <th>제목</th>
                        <td colspan="2"><input class="form-control type=" text" name="qna_title"></td>
                      </tr>
                      <tr>
                        <th><input type="file" name="uploadFile" onchange="readURL(this);"></th>
                        <td><img id="preview" src="#" width=200 height=200 /></td>
                      </tr>
                      <tr>
                        <th>내용</th>
                        <td colspan="2"><textarea name="qna_content" class="form-control rounded-0" rows="5"></textarea>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3">
                          <input class="btn btn-default" type="submit" value="등록">
                          <input class="btn btn-default" type="button" value="목록" onclick="history.back()">
                        </td>
                      </tr>
                    </table>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr>
        <!-- 저장된 댓글 -->
        <div class="container-fluid">
          <div class="commentList"></div>
        </div>
        <!-- 댓글  -->
        <div class="container-fluid">
          <label for="content">댓글</label>
          <form name="commentInsertForm">
            <div class="input-group">
              <input type="hidden" name="qna_seq" value="${boarddetail.qna_seq}">
              <input type="text" class="form-control" id="content" name="com_content" placeholder="내용을 입력하세요.">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
              </span>
            </div>
          </form>
        </div>


        <%@ include file="comment.jsp" %>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

  <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
  <script>
    // 이미지 미리보기
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    };
    // 답글작성폼으로 이동
    function replyForm() {
      $('#replyForm').toggle();
    }

    // 수정폼으로 이동
    function updateForm(seq) {
      location.href = "admin_updateForm.do?seq=" + seq;
    }
    // 삭제하기
    function delBoard(seq) {
      location.href = "admin_del.do?seq=" + seq;
    }
  </script>
</body>

</html>