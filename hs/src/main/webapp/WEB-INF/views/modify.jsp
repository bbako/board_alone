<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jsp"%>
<body>
	<h1>modify page</h1>

	<form id="f1">
		<input type="hidden" name="page" value="${param.page}"> <input
			type="hidden" name="bno" value="${vo.bno}"> <input
			type="hidden" name="type" value="${param.type}"> <input
			type="hidden" name="keyword" value="${param.keyword}">

		<div class="form-group">
			<label>title</label> <input type="text" class="form-control"
				name="title" value="${vo.title}">

		</div>
		<div class="form-group">
			<label>content</label> <input type="text" class="form-control"
				name="content" value="${vo.content}">

		</div>
		<div class="form-group">
			<label>writer</label> <input type="text" class="form-control"
				name="writer" value="${vo.writer}">

		</div>
		<button id="modiBtn">수정확인</button>
		<button id="canBtn"><a class="modCan" href="">수정취소</a>
		</button>

	</form>

	<form id="f2">

		<input type="hidden" name="page" value="${param.page}"> <input
			type="hidden" name="bno" value="${vo.bno}"> <input
			type="hidden" name="type" value="${param.type}"> <input
			type="hidden" name="keyword" value="${param.keyword}">

	</form>

	<script>
		$(document).ready(function() {

			$('#modiBtn').on("click", function(e) {

				e.preventDefault();

				var formObj = $('#f1');

				var result = confirm('진짜 수정할래??');
				if (result) {

					formObj.attr('action', '/modify');
					formObj.attr('method', 'post');
					formObj.submit();

					alert("수정 완료");
				} else {

				}

			})

			$('#canBtn').on("click", function(e) {

				e.preventDefault();
				var formObj = $('#f2');
				formObj.attr('action', '/sub');
				formObj.attr('method', 'get');
				formObj.submit();

			})

		})
	</script>

</body>
</html>