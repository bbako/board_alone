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
		
		<div class="form-group">
		<label>file upload</label>
		<div class="fileDrop"></div>
		
		</div>
		
		<div class="box-footer">
		<div>
		<hr>
		</div>
		
		<ul id="uploadedList" class="mailbox-attachments clearfix uploadedList" >
		
	
		
	
		
		
		</ul>
		
		</div>

	</form>
	
	<style>
	.fileDrop {
	width :100%;
	height:100px;
	border:1px dotted gray;
	background-color : #ccf5ff;
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
<script type="text/javascript" src = "/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 <script id="template" type="text/x-handlebars-template">

	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
		<div class="mailvox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name" >{{fileName}}</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw" fa-remove></i></a>
		
		</div>
		

		</li>


</script>





	
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
			
			
			var template = Handlebars.compile($("#template").html());
			
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
			
				$.ajax({
					
					url:'/uploadAjax',
					data:formData,
					dataType:'text',
					processData: false,
					contentType: false,
					type :'post',
					success: function(data){
						
						var fileInfo = getFileInfo(data);
						
						var html = template(fileInfo);
						$("#uploadedList").append(html);
					}
					
					
					
				})
				
				
			})

			
			

		})
	</script>

</body>
</html>