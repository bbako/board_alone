<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="include/header.jsp"%>

<body>

	<div class="panel panel-warning">
		<div class="panel-heading">
			<h1>View</h1>
		</div>

		<div class="panel-body">
			<table class="table table-condensed">
				<tr>
					<td>넘버</td>
					<td>타이틀</td>
					<td>내용</td>
					<td>글쓴이</td>
					<td>작성날짜</td>
					<td>최근수정날짜</td>
				</tr>
				<tr>
					<td>${vo.bno}</td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.writer}</td>
					<td>${vo.regdate}</td>
					<td>${vo.updatedate}</td>
				</tr>
			</table>



			<form id="f1">
				<input type="hidden" value="${vo.bno}" name="bno"> <input
					type="hidden" value="${cri.page}" name="page"> <input
					type="hidden" value="${cri.type}" name="type"> <input
					type="hidden" value="${cri.keyword}" name="keyword">

			</form>
			
			
			<ul class="list-unstyled" >
		
			<c:forEach items="${flist}" var="files">
			<li>
					
			<img src="display?fileName=${files}" width="100%">
			
			</li>
			</c:forEach>
			</ul>
			
			
			
			<div class="btn-group" role="group" aria-label="...">

				<button type="button" class="btn btn-default" id='turn'>전체
					리스트 보기</button>
				<button type="button" class="btn btn-default" id="modifyBtn">수정</button>
				<button type="button" class="btn btn-default" id="deleteBtn">삭제</button>
			</div>

		</div>
	</div>

	<!-- reply part -->

	<div class="panel panel-success">
		<div class="panel-heading">
			<h5>Reply		
			<button type="button" class="btn btn-default" data-toggle="modal" data-target="#exampleModal">댓글 등록</button>
			</h5>
			
		</div>
<div class="panel-body">
<table class="table table-striped">
		<thead>
				<tr>	
					<td>넘버</td>
					<td>글쓴이</td>
					<td>작성자</td>
					<td>작성날짜</td>
					<td>최근수정날짜</td>
					<td></td>
				</tr></thead>
				<tbody id="retr">
				
				
				</tbody>
				
</table>



</div>
		<!-- modal 시작 !!!-->


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새 댓글 달기
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button></h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">Replyer:</label>
            <input type="text" class="form-control" id="replyer" name="replyer">
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">Replytext:</label>
            <textarea class="form-control" id="replytext" name="replytext"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button  type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button id="sBtn" type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
      </div>
    </div>
  </div>
</div>

		<!-- modal 끝 !!!-->
		
		<!--modal 2 시작  -->
		
		<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">댓글 수정
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         <span aria-hidden="true">&times;</span>
        </button></h5>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">Replyer:</label>
            <input type="text" class="form-control" id="replyer2" name="replyer" value="">
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">Replytext:</label>
            <textarea class="form-control" id="replytext2" name="replytext" value=""></textarea>
          </div>
          
           <input type="hidden" id="rno" name="rno" value="">
          
        </form>
      </div>
      <div class="modal-footer">
        <button  type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="remodibtn" type="button" class="btn btn-primary" data-dismiss="modal">수정</button>
        <button id="redelbtn" type="button" class="btn btn-primary" data-dismiss="modal">삭제</button>
      </div>
    </div>
  </div>
</div>
		

		<!--modal 2 끝  -->

		<ul id="replies" class="list-group">

		</ul>
		
		<!-- page  처리 시작 -->
		
		<nav aria-label="Page navigation">
				<ul class="pagination">
					

				</ul>
			</nav>
		
		
		<!-- page  처리 끝 -->

	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script>
		var bno = ${vo.bno};
		var replyPage=1;
		
	
		$(document).ready(function() {
				
			function getreply() {
				
				$.getJSON("/reply?bno="+bno+"&page="+replyPage,function(data){
					console.log("getreply function!!!")
					var i=1;
					var str="";
					
					 $(data.list).each(function(){
						 
						 
						 var regDate2 = new Date(this.regdate);
						 var updateDate2 = new Date(this.updatedate);
						
						 dateString = regDate2.toLocaleString();
						 dateString2 = updateDate2.toLocaleString();
						 
						 var n = parseInt((replyPage-1)*10) + parseInt(i++);
						
							str+="<tr ><td>"+n+"</td>"
							str+="<td>"+this.replyer+"</td>"
							str+="<td>"+this.replytext+"</td>"
							str+="<td>"+dateString+"</td>"
							str+="<td>"+dateString2+"</td>"
							str+="<td data-replytext='"+this.replytext+"' data-replyer='"+this.replyer+"' data-rno='"+this.rno+"'><a href='#' id='remodibtn' data-toggle='modal' data-target='#exampleModal2'><i class='glyphicon glyphicon-wrench' ></i></a></td>"
							str+="<td data-replytext='"+this.replytext+"' data-replyer='"+this.replyer+"' data-rno='"+this.rno+"'><a id='redelbtn2' href='#'><i class='glyphicon glyphicon-remove' ></i></a></td></tr>"
					}); 
					
					$("#retr").html(str);
									
				});
			}
			
			getreply();
			
			
			function printPaging(page) {
				
				$.getJSON("/reply?bno="+bno+"&page="+replyPage,function(data){
				
				var str="";
				var pageMaker=data.pageMaker;
				console.log("data.pageMaker");
				console.log(data.pageMaker);
				console.log(pageMaker.start-1);
				
				if(pageMaker.prev){
					str+="<li><a class='prev' href='"+(pageMaker.start-1)+"'aria-label='Previous'><span aria-hidden=false>&laquo;</span></a></li>"; 
				}
				for(var i=pageMaker.start,len=pageMaker.end; i<=len;i++){
					var strClass=pageMaker.current ==i?'class=active':'';
					str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
					
				}
				if(pageMaker.next){
					str+="<li><a class='prev' href='"+(pageMaker.end+1)+"'aria-label='Next'><span aria-hidden=false>&raquo;</span></a></li>"; 
				}
					$(".pagination").html(str);
					});	
				
			};
			
			printPaging(1);
			

			$(".pagination").on("click","li a",function(e){
				
				e.preventDefault();
				
				replyPage=$(this).attr("href");
				
				getreply();
				printPaging(replyPage);
				
			});
			
			
			$('#deleteBtn').on("click", function(e) {

				e.preventDefault();
				
				var result = confirm('게시글을  삭제하시겠습니까??'); 
				if(result) { 
					var formObj = $('#f1');

					formObj.attr('action', '/delete');
					formObj.attr('method', 'get');
					formObj.submit(); 
					
					alert("삭제 완료");
					} else {
						
				}


			});

			$('#modifyBtn').on("click", function(e) {

				e.preventDefault();

				var formObj = $('#f1');

				formObj.attr('action', '/modify');
				formObj.attr('method', 'get');
				formObj.submit();

			});

			
			$('#turn').on("click", function(e) {

				e.preventDefault();

				var formObj = $('#f1');

				formObj.attr('action', '/board/main');
				formObj.attr('method', 'get');
				formObj.submit();

			});
			
			
			$("#sBtn").on("click", function(e) {
				console.log("send in ?????")
				console.log($("#replyer").val())
				console.log($("#replytext").val())
				
				var replyer = $("#replyer").val();
				var replytext = $("#replytext").val();
				
				 $.ajax({
			           type: 'post',
			           url: '/reply',
			           headers:{"content-type": "application/json",
			        	   "X-HTTP-Method-Override":"POST"},			           
			           dataType:'text',
			           data: JSON.stringify({
			        	   bno:bno,
			        	   replyer :replyer,
			        	   replytext :replytext
			           }), 
			           success: function(data)
			           {
			               alert(data); 
			               
			               $("#replyer").val("");
			               $("#replytext").val("");
			               
			               $('#exampleModal').hide("slow");
			              
			               printPaging(replyPage);
			               getreply();
			              		               
			              
			           }
			         });
				});
			
			/*------------- 흠 실험 1 -------------*/
			
			$("#remodibtn").on("click", function(e) {
					
					console.log("modi in ?????")
					
					var replyer2 = $("#replyer2").val();
					var replytext2 = $("#replytext2").val();
					var rno = $("#rno").val();
					
					console.info(replyer2);
					console.info(replytext2);
					console.info(rno);
					
					 $.ajax({
				           type: 'post',
				           url: '/remodify',
				           headers:{"content-type": "application/json",
				        	   "X-HTTP-Method-Override":"POST"},			           
				           dataType:'text',
				           data: JSON.stringify({
				        	   rno:rno,
				        	   replyer :replyer2,
				        	   replytext :replytext2
				           }), 
				           success: function(data)
				           {
				               alert(data); 
				               
				               $("#replyer2").val("");
				               $("#replytext2").val("");
				               
				               $('#exampleModal').hide("slow");
				              
				               getreply();
				              
				           }
				         });
					});
				
			/* ------------- 흠 실험 1 ------------- */			
			
			/* --------------아직 안만들어진 reply li의 버튼---------------- */

					$("#retr").on("click","td #remodibtn",function(){
						
						console.log("수정......");
						console.dir(this);
						
						var reply =$(this).parent();						
						var rno2 = reply.attr("data-rno");
						var replytext = reply.attr("data-replytext");
						var replyer = reply.attr("data-replyer");
						
						console.log(rno2);
						console.log(replytext);
						console.log(replyer);
						
						$("#replyer2").val(replyer);
						$("#replytext2").val(replytext);
						$("#rno").val(rno2);
						
					})
					
					$("#retr").on("click","td #redelbtn2",function(){
						
						console.log("reply delete2 in ?????")
						
						var result = confirm('댓글을  지우시겠습니까??'); 
						
						if(result) {
						var reply =$(this).parent();	
						var rno2 = reply.attr("data-rno");
						
						console.info(rno);
						
						 $.ajax({
					           type: 'post',
					           url: '/redelete',
					           headers:{"content-type": "application/json",
					        	   "X-HTTP-Method-Override":"POST"},			           
					           dataType:'text',
					           data: JSON.stringify({
					        	   rno:rno2,
					           }), 
					           success: function(data)
					           {
					               alert(data); 
					               
					               $("#replyer2").val("");
					               $("#replytext2").val("");
					               
					               $('#exampleModal').hide("slow");
					              
					               printPaging(replyPage);
					               getreply();
					              
					           }
					         });
							}
						
					})
							
			
		/* --------------아직 안만들어진 reply li의 버튼---------------- */
			
			
		
				$("#redelbtn").on("click", function(e) {
					
					console.log("reply delete in ?????")
					
					var result = confirm('댓글을  지우시겠습니까??'); 
					
					if(result) {
				
					var rno = $("#rno").val();
					
					console.info(rno);
					
					 $.ajax({
				           type: 'post',
				           url: '/redelete',
				           headers:{"content-type": "application/json",
				        	   "X-HTTP-Method-Override":"POST"},			           
				           dataType:'text',
				           data: JSON.stringify({
				        	   rno:rno,
				           }), 
				           success: function(data)
				           {
				               alert(data); 
				               
				               $("#replyer2").val("");
				               $("#replytext2").val("");
				               
				               $('#exampleModal').hide("slow");
				              
				               printPaging(replyPage);
				               getreply();
				              
				           }
				         });
						}
					});
						
	});
	</script>


</body>
</html>