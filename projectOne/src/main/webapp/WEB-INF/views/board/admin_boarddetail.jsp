<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style>
  #replyForm {
    display: none;
}
</style>
<title>고객센터 게시판</title>
</head>
<body>
<table border="1">
  <tr>
    <th>번호</th>
    <td>${boarddetail.qna_seq}</td>
  </tr>
  <tr>
    <th>아이디</th>
    <td>${boarddetail.mem_id}</td>
  </tr>
  <tr>
    <th>제목</th>
    <td>${boarddetail.qna_title}</td>
  </tr>
  <tr>
    <th>내용</th>
    <td><textarea cols="60" rows="10">${boarddetail.qna_content}</textarea></td>
  </tr>
  <tr>
    <th>첨부이미지 미리보기</th>
    <td>
      <img src="${pageContext.request.contextPath}/image/${boarddetail.qna_fileName}" width=200 height=200/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
    	<button type="button" onclick="replyForm()">답글달기</button>
      <button type="button" onclick="updateForm('${boarddetail.qna_seq}')">수정</button>
      <button type="button" onclick="delBoard('${boarddetail.qna_seq}')">삭제</button>
      <input type="button" value="목록" onclick="location.href='admin_board.do'">
    </td>
  </tr>
</table>
<div id="replyForm">
	<h1>답글</h1>
		<form action="admin_replyBoard.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="seq" value="${boarddetail.qna_seq}">
      <table border="1">
        <tr>
          <th>아이디</th>
          <td colspan="2"><input type="text" name="mem_id" value="ADMIN" readonly></td>
        </tr>
        <tr>
          <th>제목</th>
          <td colspan="2"><input type="text" name="qna_title"></td>
        </tr>
        <tr>
          <th>내용</th>
          <td colspan="2"><textarea name="qna_content" cols="60" rows="10" style="border: none;"></textarea></td>
        </tr>
        <tr>
          <th>이미지파일 첨부:</th>
          <td><input type="file" name="uploadFile" onchange="readURL(this);"></td>
          <td><img id="preview" src="#" width=200 height=200/></td>
        </tr>
        <tr>
          <td colspan="3">
            <input type="submit" value="등록">
            <input type="button" value="목록" onclick="history.back()'">
          </td>
        </tr>
      </table>  
		</form>
</div>
<!-- 댓글  -->
<div class="container">
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
    
    <div class="container">
        <div class="commentList"></div>
    </div>
 
<!--                     추가                         -->
<%@ include file="comment.jsp" %>
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
    $('#replyForm').show();
	}
  
  // 수정폼으로 이동
  function updateForm(seq) {
    location.href="admin_updateForm.do?seq=" + seq;
  }
  // 삭제하기
  function delBoard(seq) {
    location.href="admin_del.do?seq=" + seq;
  }
</script>
</body>
</html>