<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>


<body>

	<div class="panel panel-danger">
		<div class="panel-heading">
			<h1>List <button type="button" class="btn btn-default"><a href="/register" >새글 등록</a></button></h1>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<tr>
					<td>넘버</td>
					<td>타이틀</td>
					<td>내용</td>
					<td>글쓴이</td>
					<td>작성날짜</td>
					<td>최근수정날짜</td>
					<td>첨부파일 갯수</td>
				</tr>

				<c:choose>
					<c:when test="${listSize != 0}">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.bno}</td>
								<td><a class="goSub" href="${list.bno}">${list.title}(${list.replycnt})</a></td>
								<td>${list.content}</td>
								<td>${list.writer}</td>
								<td>${list.regdate}</td>
								<td>${list.updatedate}</td>
								<td>${list.filescnt}</td>
							</tr>
						</c:forEach>

					</c:when>
					<c:when test="${listSize == 0}">
						<tr>
							<td><h2>검색 결과가 없습니다......<button>
								<a href="/board/main">첫 페이지로 가기</a>
							</button></h2></td>

						</tr>
					</c:when>


				</c:choose>

			</table>

			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a class="prev" href="${pageMaker.start-1}"
							aria-label="Previous"> <span aria-hidden=false>&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
						var="idx">
						<li class="${pageMaker.current ==idx?'active':''}">
						<a class="curr" href="${idx}">${idx}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li><a class="next" href="${pageMaker.end+1}" aria-label="Next">
								<span aria-hidden="${pageMaker.next}">&raquo;</span>
						</a></li>
					</c:if>

				</ul>
			</nav>



			<div class='box-body'>
				<form action="/board/main" method="get">
					<input type="hidden" name="page" value="1"> <select 
						name='type'>
						<option value='n'
							<c:out value="${cri.type ==null?'selected':''}"/>>------</option>
						<option value='t' <c:out value="${cri.type eq't'?'selected':''}"/>>타이틀</option>
						<option value='c' <c:out value="${cri.type eq'c'?'selected':''}"/>>내용</option>
						<option value='w' <c:out value="${cri.type eq'w'?'selected':''}"/>>글쓴이</option>
					</select> <input name='keyword' type="text" value="${cri.keyword}">
					<button id="searchBtn" type="submit">Search</button>
				</form>


			</div>
			
		</div>
	</div>

	<form id="f1">
	<input id="hbno" type="hidden" name="bno">
	<input id="hpage" type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="type" value="${cri.type}">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>


	<script>
		var result = '${param.msg}';

		if (result == 'SUCCESS') {

			alert("처리가완료되었습니다.");
			history.pushState(null, null, "/board/main");
		}

		window.onpopstate = function(e) {
			history.go(1);
		};
	
	</script>
	
	<script>
	
	
	$(document).ready(function() {
		
		$(".goSub").on("click", function(e) {
			e.preventDefault();
			$("#hbno").val($(this).attr("href"));
			$("#f1").attr("action", "/sub").submit();

		});
		
		$(".prev").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/board/main").submit();

		});
		
		$(".curr").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/board/main").submit();

		});
		
		$(".next").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/board/main").submit();

		});
		
	});
	</script>

</body>


</html>

