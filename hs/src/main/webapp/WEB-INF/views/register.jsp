<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<body>
<div class="panel panel-info">
  <div class="panel-heading"><h3>새글 등록하기</h3></div>
  <div class="panel-body">
    
    <form id="f1">
		<div class="form-group">
			<label>title</label> <input id="ititle" type="text"
				class="form-control" name="title" placeholder="title">

		</div>
		<div class="form-group">
			<label>content</label> <textarea id="icontext" type="text" class="form-control"
				name="content" rows="4" placeholder="content"></textarea>

		</div>
		<div class="form-group">
			<label>writer</label> <input id="iwriter" type="text" class="form-control"
				name="writer" placeholder="writer">

		</div>

		
	</form>
	
	<button id="regiBtn" class="btn btn-default">
			<a>등록</a>
		</button>

	<button class="btn btn-default">
		<a href="/board/main">취소</a>
	</button>

  </div>
</div>



	
	<script>
		$(document).ready(function() {

			$('#regiBtn').on("click", function(e) {

				e.preventDefault;

				console.log("title 문제 !!!!")
				console.log($('#ititle').val().length)
				
				if ($('#ititle').val().length == 0) {
					alert("Title 입력해주세요....");
				}
				if ($('#icontext').val().length == 0) {
					alert("icontext 입력해주세요....");
				}
				if ($('#iwriter').val().length == 0) {
					alert("Writer 입력해주세요....");
				}else {
					var fo = $('#f1');
					fo.attr('action','/register');
					fo.attr('method','post');
					fo.submit();
				}
				
			})

		})
	</script>

</body>
</html>