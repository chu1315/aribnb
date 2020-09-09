<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/hostSaveTwo.css">
<link rel="shortcut icon" href="/resources/img/pinklogo.ico">
<link rel="stylesheet" href="/resources/css/dropzone.css" />
<script src="/resources/js/dropzone.js"></script>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<title>에어비앤비 호스트가 되세요</title>
</head>
<body>
<container id="container">
	<header>
		<div>
			<a href="/aircnc"><img id="logo" src="/resources/img/pinklogo.png"></a>
		</div>
        <div id="menubutton" onclick="myMenu()">
            <div><img id="ham" src="/resources/img/bars-solid.svg"></div>
            <div id="profile">
                <img src="/resources/img/pimg.jpg">
            </div>
        </div>
        <div id="menuctnt">
		 <c:if test="${loginUser.i_user != null}">
		 	<a href="/logout"><li class="b">로그아웃</li></a>
		 </c:if>
         <li class="b" onclick="goMsg()">메시지</li>
         <li class="b" onclick="goWish()">저장 목록</li>
         <div class="line">――――――――――――――――</div>
         <c:if test="${loginUser.i_user != null}">
         <li class="b" onclick="goHost()">숙소 호스트 등록</li>
         </c:if>
         <li>계정</li>
         <div class="line">――――――――――――――――</div>
         <li>도움말</li>
      </div>
	</header>
</container>

<div id="container2">
	<div id="containerOne">
		<h2>멋진 사진으로 숙소가 돋보이게 해주세요.</h2>
			<br>
			<div>
				<h5>휴대전화나 카메라를 사용하여 사진을 찍으세요.<br>
					숙소를 등록하려면 1장 이상의 사진이 필요합니다.<br> 
					사진을 첨부하시는 순간 바로 등록됩니다.<br>
					그 점에 주의하시고 올려주세요</h5>
			</div>
			<br>
		<!-- 리스트에 뿌려질 썸네일 이미지 -->
		<div class="dropzone dz-clickable" id="myDropTwo" action="./thumUpload">
		    <div class="dz-default dz-message" data-dz-message="">
		    	<input type="hidden" name="i_host" value="${i_host}">
				<input type="hidden" name="i_user" value="${loginUser.i_user}">
		        <span><h4>리스트에 보여질 썸네일 이미지를 선택해주세요.</h4></span>
		    </div>
		</div>
		
		<script>
			$(document).on(function(){
				var Dropzone = $('div#myDropTwo').Dropzone({
				});
				Dropzone.autoDiscover = false;
				Dropzone.options.myAwesomeDropzone = false;
			});
		</script>
			
			
		
		<!-- 상세보기에 뿌려질 리스트 사진들 -->
		<div class="dropzone dz-clickable" id="myDrop" action="./upload">
		    <div class="dz-default dz-message" data-dz-message="">
		    	<input type="hidden" name="i_host" value="${i_host}">
				<input type="hidden" name="i_user" value="${loginUser.i_user}">
		        <span><h4>사진을 드래그해주시거나 선택해주세요</h4></span>
		    </div>
		</div>
		
		<script>

		
// 			$(document).ready(function(){
			$(document).on(function(){

				
				var Dropzone = $('div#myDrop').Dropzone({
// 					url : 'http://localhost:8090/upload'
// 					,
// 					method : "post",
// 					params : {
// 						i_user : $("#i_user").val() ,name : name
// 					},
// 					success: function (file, response) {
// 		                console.log(response);
// 		            }
				});
				

				Dropzone.autoDiscover = false;
				Dropzone.options.myAwesomeDropzone = false;
// 				$(".file-dropzone").on('dragover', handleDragEnter); 
// 				$(".file-dropzone").on('dragleave', handleDragLeave); 
// 				$(".file-dropzone").on('drop', handleDragLeave); 
// 				function handleDragEnter(e) { this.classList.add('drag-over'); } 
// 				function handleDragLeave(e) { this.classList.remove('drag-over'); }

// 				Dropzone.autoDiscover = false;
				
// // 				var Dropzone = new Dropzone("div#myDrop", { url: "/upload"});
// 				var Dropzone = $('div#myDrop').Dropzone({
// 				    url: 'http://localhost:8090/upload',
// 				    method: "post",
// 				    autoProcessQueue: false, //자동으로 보내기 방지
// 				    paramName: 'files',
// 				    parallelUploads: 99,
// 				    maxFilesize: 10, // MB
// 				    uploadMultiple: true,
// 				    headers: {
// 				        "Authorization": 'Bearer ' + token //localstorage에 저장된 token
// 				    },
// 				    init: function() {
// 				        var myDropzone = this;
// 				        this.on("sending", function(file, xhr, formData) {
// 				            let cardName = $("input[name='cardname']").val();
// 				            formData.append("name", cardName);
// 				        });

// 				        this.on("queuecomplete", function(file) {
// 				            document.location.href = "./index" //업로드가 완료되었다면 이전 화면으로 이동
// 				        });
// 				        this.on("addedfile", function(file) { //중복된 파일의 제거 
// 				            if (this.files.length) {
// 				                // -1 to exclude current file
// 				                var hasFile = false;
// 				                for (var i = 0; i < this.files.length - 1; i++) {
// 				                    if (this.files[i].name === file.name && this.files[i].size === file.size &&
// 				                        this.files[i].lastModifiedDate.toString() === file.lastModifiedDate.toString()) {
// 				                        hasFile = true;
// 				                        this.removeFile(file);
// 				                    }
// 				                }
// 				                if (!hasFile) {
// 				                    addedFiles.push(file);
// 				                }
// 				            } else {
// 				                addedFiles.push(file);
// 				            }
// 				        });

				      
// 				        $('#myDrop').click(function(e) {
// 				            let cardName = $("input[name='cardname']").val();
// 				            if (cardName.length == 0) {
// 				                alert('카드제목 입력 필요')
// 				                return;
// 				            }
// 				            if (myDropzone.getRejectedFiles().length > 0) {
// 				                let files = myDropzone.getRejectedFiles();
// 				                alert('거부된 파일이 있습니다.', files)
// 				                return;
// 				            }

// 				            e.preventDefault();
// 				            e.stopPropagation();

// 				            myDropzone.processQueue();
// 				        })
// 				    }
// 				});
				
// 				Dropzone.options.myAwesomeDropzone = {
// 						paramName: "file", 
// 						maxFilesize: 20, 
// 						maxFiles: 3,
// 						createImageThumbnails : true,
// 			            addRemoveLinks : true,
// 						method:'post',
// 						autoQueue: false,
// 						accept: function(file, done) {
// 							if (file.name == ""){
// 								done();				
// 							}else { done(); }
// 						},
// 			            init : function() {
// 			                // 최대를 넘겼을 때 event
// 			                this.on("maxfilesexceeded", function(file) {
// 			                    alert("최대 3개의 파일만 업로드 가능합니다.");
// 			                });
// 			                // 파일을 삭제할 때 event
// 			                this.on("removedfile", function(file) {
// 			                    if(file.status !== "error") {
// 			                        var fileElParent = $(this.element);
// 			                        var srvFile = $("#srvFile").val();
// 			                        $.ajax({
// 			                            url : "./delete.do",
// 			                            type : "POST",
// 			                            data : {
// 			                                fileName : srvFile
// 			                            },
// 			                            success : function(res) {
// 			                                $("#usrFile").remove();
// 			                                $("#srvFile").remove();
// 			                            }
// 			                        });
// 			                    }
// 			                });
// 			            }
// 					};
				
			});
		</script>
		
	</div>
	
	
	<div id="containerTwo">
		<img src="/resources/img/mustBeHost.png">
	</div>
</div>
<script>
function goHost(i_user){
	location.href='/host/hostSave';
}

//메시지 화면 이동
function goMsg() {
	location.href = '/aircnc/message';
}
//메뉴-저장 목록으로 이동
function goWish() {
	location.href = '/wishlists';
}

function goHST(){
	location.href='/host/hostSaveTwo';
}


//dropDown 메뉴 함수 
function myMenu() {
	display = document.getElementById("menuctnt").style.display;
	if(display == 'block'){
		document.getElementById("menuctnt").style.display='none';
	}else{
		document.getElementById("menuctnt").style.display='block';
	}
}
</script>
</body>
</html>