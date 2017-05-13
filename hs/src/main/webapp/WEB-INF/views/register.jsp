<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<body>

	<form action="/register" method="post">
		<div class="form-group">
			<label>title</label> <input id="iTitle" type="text"
				class="form-control" name="title" placeholder="title">

		</div>
		<div class="form-group">
			<label>content</label> <input type="text" class="form-control"
				name="content" placeholder="content">

		</div>
		<div class="form-group">
			<label>writer</label> <input type="text" class="form-control"
				name="writer" placeholder="writer">

		</div>

		<button id="regiBtn" type="submit" class="btn btn-default">
			<a>등록</a>
		</button>
	</form>

	<button class="btn btn-default">
		<a href="/board/main">취소</a>
	</button>

	<script>
		$(document).ready(function() {

			$('#regiBtn').on("click", function(e) {

				e.preventDefault;

				console.log("title 문제 !!!!")
				console.log($('#iTitle').val().length)
				
				if ($('#iTitle').val().length == 0) {
					alert("Title 입력해주세요....");
				}
			})

		})
	</script>

</body>
</html>