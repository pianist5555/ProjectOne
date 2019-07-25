<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

// 카테고리 선택후 상품리스트 출력
function menuList(seq) {
  $.ajax({
    url : 'menuList.do?seq=' + seq,
    type : 'get',
    success : function(data) {
      var a = '';
      let count = 0; 
      a += '<tr>';
      $.each(data, function(key, value){
          a += '<td><p><img src="${pageContext.request.contextPath}/resources/img/product/' + value.pro_image +
           '" width="150" height="200" data-toggle="modal" data-target="#productUpdate" onclick="productUpdate(' + value.pro_seq +
           ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
           count++;
           if (count == 4) {
             a += '</tr><tr>';
             count = 0;
           }
      });
      /* a += '<tr>';
      $.each(data, function(key, value){
          a += '<td><p><img src="${pageContext.request.contextPath}/resources/img/product/' + value.pro_image +
           '" width="150" height="200" data-toggle="modal" data-target="#productUpdate" onclick="productUpdate(' + value.pro_seq +
           ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
           count++;
           if (count == 4) {
             a += '</tr><tr>';
             count = 0;
           }
      }); */
      $('.menuList').html(a);
    }
  });
}

function productUpdate(seq) {
  $.ajax({
    url : 'menuProductUpdate.do?seq=' + seq,
    type : 'get',
    success : function(data) {
      $('#productUpdate').modal('show');
      $('input[name="pro_seq"]').val(data.pro_seq);
      $('input[name="pro_name"]').val(data.pro_name);
      $('input[name="pro_price"]').val(data.pro_price);
      $('input[name="pro_desc"]').val(data.pro_desc);
      $('input[name="pro_image"]').val(data.pro_image);
      $('input[name="pro_option"]').val(data.pro_option);
      if ($('select[name="cat_seq"]').val(data.cat_seq)) {
        $('select[name="cat_seq"]').val(data.cat_seq).prop("selected", true);
      };
    }
  })
}

function delProduct() {
  location.href="delProduct.do?seq=" + $('input[name="pro_seq"]').val();
}
</script>

<!-- 상품수정 MODAL -->
<div class="modal fade" id="productUpdate" tabindex="-1" role="dialog" aria-labelledby="productUpdateLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="productUpdateLabel"><strong>상품 수정</strong></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="productUpdateSubmit.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="pro_seq">
            <label for="pro_name">상품명</label>
            <input type="text" class="form-control" name="pro_name"><br>
            <label for="pro_price">가격</label>
            <input type="text" class="form-control" name="pro_price"><br>
            <label for="pro_desc">상품설명</label>
            <input type="text" class="form-control" name="pro_desc"><br>
            <label for="pro_desc">상품 이미지</label>
            <img src="<c:url value="/resources/img${data.pro_image}"/>" class="img-circle"
							id="preview" alt="Product Image" style="width:150px; height:200px;">
            <input type="file" id="uploadFile" name="uploadFile" onchange="readURL(this);" style="display:none;">
            <button type="button" id="btn_upload" class="btn btn-block btn-default" style="width:150px;">이미지 변경</button>
            <label for="pro_option">상품 옵션</label>
            <input type="text" class="form-control" name="pro_option"><br>
            <label for="pro_category">카테고리</label>
            <select class="form-control" name="cat_seq">
              <c:forEach var="cate" items="${category}">
                <option value="${cate.cat_seq}">${cate.cat_name}</option>
              </c:forEach>
            </select>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-danger" onclick="delProduct();">삭제</button>
            <input type="submit" class="btn btn-primary" value="수정">
        </div>
          </form>
      </div>
    </div>
  </div>
  
  
<script type="text/javascript">
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
    console.log("이미지 밸류: " + mem_image);
  };
</script>
<script type="text/javascript">
$(function (){
	$('#btn_upload').click(function (e) {
		e.preventDefault();
		$('#uploadFile').click();
	});

});
</script>