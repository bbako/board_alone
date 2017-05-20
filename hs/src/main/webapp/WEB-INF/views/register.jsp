<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp"%>

<body>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3>새글 등록하기</h3>
		</div>
		<div class="panel-body">

			<form id="f1">
				<div class="form-group">
					<label>title</label> <input id="ititle" type="text"
						class="form-control" name="title" placeholder="title">

				</div>
				<div class="form-group">
					<label>content</label>
					<textarea id="icontext" type="text" class="form-control"
						name="content" rows="4" placeholder="content"></textarea>

				</div>
				<div class="form-group">
					<label>writer</label> <input id="iwriter" type="text"
						class="form-control" name="writer" placeholder="writer">

				</div>

				<div class="form-group">
					<label>file upload</label>
					<div class="fileDrop"></div>

				</div>

				<div class="box-footer">
					<div>
						<hr>
					</div>

					<ul class="uploadedList">


					</ul>

				</div>

			</form>

			<style>
.fileDrop {
	width: 100%;
	height: 100px;
	border: 1px dotted gray;
	background-color: #ccf5ff;
	amrgin: auto;
}
</style>

			<button id="regiBtn" class="btn btn-default">
				<a>등록</a>
			</button>

			<button class="btn btn-default">
				<a href="/board/main">취소</a>
			</button>

		</div>
	</div>





	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>






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
			
			
			
			$(".fileDrop").on("dragenter dragover", function(event){
	            event.preventDefault(); 
	        });
	        $(".fileDrop").on("drop", function(event){
	            event.preventDefault();
				
				console.log("drag drop!!!!!!")
				
				var files = event.originalEvent.dataTransfer.files;
				
				var file = files[0];
				
				console.log(files);
				
				console.log(file)
				
				var formData = new FormData();
				
				formData.append("file",file);
				
				console.log("formData: "+formData.tostring);
			
				$.ajax({
					
					url:'/upload',
					data:formData,
					processData: false,
					contentType: false,
					type :'post',
					success: function(data){
						alert(data)
						console.log("------------------")
						console.log(data)
						console.log(data.name)
						var str = "<li><img src='display?fileName="+data+"'width:'42px' height='42px'><button id='delBtn'>DELETE</button></li><input name='files' type='hidden' value='"+data+"'>"
						
						$(".uploadedList").append(str);
				
						$(".uploadedList").on("click","li #delBtn",function(e){
							e.preventDefault();
							console.log($(e));
							$(e.target).parent().remove();
							console.log(data);
							var fileName = data;
							console.log(fileName)
							$.ajax({
								
								url:'/upload/fdelete',
								dataType:'text',
								data:{fileName:fileName},
								contentType: "application/x-www-form-urlencoded; charset=UTF-8",
								type :'get',
								success: function(data){}
								
								
							})
							
							
							
						})
						
					}})									
					
				})
		})			
	
	</script>

</body>
</html>