
// 달력 
$(function() {
 //체크인 눌렀을때  달력 출력 
  $('input[id="searchin"]').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
  });
// apply 누른 순간 input value에 날짜 값 삽입 
  $('input[id="searchin"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY-MM-DD'));
	  $('input[id="searchout"]').val(picker.endDate.format('YYYY-MM-DD'));
  });
//  Clear 눌렀을때 삽입된 값 비우기 
  $('input[id="searchin"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
	  $('input[id="searchout"]').val('');
  });
 //체크아웃 눌렀을때  달력 출력 
  $('input[id="searchout"]').daterangepicker({
      autoUpdateInput: false,
      locale: {
          cancelLabel: 'Clear'
      }
  });
// apply 누른 순간 input value에 날짜 값 삽입 
  $('input[id="searchout"]').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.endDate.format('YYYY-MM-DD')); 
	  $('input[id="searchin"]').val(picker.startDate.format('YYYY-MM-DD'));
  });
//  Clear 눌렀을때 삽입된 값 비우기 
  $('input[id="searchout"]').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
	  $('input[id="searchin"]').val('');
  });

}); // function(){} 끝


function countUp(d) {
    d.value = parseInt(d.value) + 1;
}

function countDw(d) {
    d.value = parseInt(d.value) - 1;
    if(d.value < 0) {
        d.value = 0;
    }
}

function goIndex(){
	location.href='/aircnc';
}


function goSearch(){
	var addr = document.getElementById("s_addr").value;
	
	if(addr.length == 0) {
		alert('여행지를 설정해주시기 바랍니다.');
	}else{
		document.location = "/search/searchMain?addr="+addr;
	}
	
}

// dropDown 메뉴 함수 
function myMenu() {
	display = document.getElementById("menuctnt").style.display;
	if(display == 'block'){
		document.getElementById("menuctnt").style.display='none';
	}else{
		document.getElementById("menuctnt").style.display='block';
	}
}



// 주소 검색 
function goAddr(){
	axios.get('/index/search', {
    params: {
      s_addr: s_addr.value
    }
  })
  .then(function (res) {
	//console.log(res);
	res.data.result.forEach(function(element, index, array){
    //console.log(`${element.addr}`);
		
	});

  })

}


// 메뉴-저장 목록으로 이동
function goWish() {
	location.href = '/wish';
}

// 메시지 화면 이동
function goMsg() {
	location.href = '/aircnc/message';
}


function popupJoin() {
	display = document.getElementById("join").style.display;
	if (display == 'block') {
		document.getElementById("join").style.display = 'none';
	} else {
		document.getElementById("join").style.display = 'block';
		document.getElementById("showJoin").style.display= 'block';
	}
}
function mailJoin() {
	display = document.getElementById("joinSubmit").style.display;
	if (display == 'block') {
		document.getElementById("joinSubmit").style.display = 'none';
	} else {
		document.getElementById("showJoin").style.display = 'none';
		document.getElementById("joinSubmit").style.display = 'block';
	}
}
function joinClose() {
	display = document.getElementById("join").style.display;
	if (display == 'block') {
		document.getElementById("joinSubmit").style.display = 'none';
		document.getElementById("showJoin").style.display = 'block';
		document.getElementById("join").style.display = 'none';
	} else {
		document.getElementById("join").style.display = 'block';
	}
}

// 로그인창 팝업, 닫기
function popupLogin() {
	display = document.getElementById("login").style.display;
	if (display == 'block') {
		document.getElementById("login").style.display = 'none';
	} else {
		document.getElementById("login").style.display = 'block';
	}
}
function loginClose() {
	display = document.getElementById("login").style.display;
	if (display == 'block') {
		document.getElementById("login").style.display = 'none';
	} else {
		document.getElementById("login").style.display = 'block';
	}
}


//회원가입 창 팝업, 닫기
function popupJoin() {
	display = document.getElementById("join").style.display;
	if (display == 'block') {
		document.getElementById("join").style.display = 'none';
	} else {
		document.getElementById("join").style.display = 'block';
		document.getElementById("showJoin").style.display= 'block';
	}
}
function mailJoin() {
	display = document.getElementById("joinSubmit").style.display;
	if (display == 'block') {
		document.getElementById("joinSubmit").style.display = 'none';
	} else {
		document.getElementById("showJoin").style.display = 'none';
		document.getElementById("joinSubmit").style.display = 'block';
	}
}
function joinClose() {
	display = document.getElementById("join").style.display;
	if (display == 'block') {
		document.getElementById("joinSubmit").style.display = 'none';
		document.getElementById("showJoin").style.display = 'block';
		document.getElementById("join").style.display = 'none';
	} else {
		document.getElementById("join").style.display = 'block';
	}
}

// 로그인창 팝업, 닫기
function popupLogin() {
	display = document.getElementById("login").style.display;
	if (display == 'block') {
		document.getElementById("login").style.display = 'none';
	} else {
		document.getElementById("login").style.display = 'block';
	}
}
function loginClose() {
	display = document.getElementById("login").style.display;
	if (display == 'block') {
		document.getElementById("login").style.display = 'none';
	} else {
		document.getElementById("login").style.display = 'block';
	}
}

function goHost(i_user){
	location.href='/host/hostSave';
}

function defaultCheckE_mailValue(){
		checkE_mail.value = 2;
		duplicationIdMsg.innerHTML = '';
	}
		


function chk(){
	if($('#checkE_mail').val() != 0){
		alert('이메일 체크를 해주세요!!');
		return false;
	}
	var chk = ['nm', 'c_pw', 'bir_day'];
	for(var i=0; i<chk.length; i++){
		if($('#'+chk[i]).val() == ''){
			alert($('#'+chk[i]).attr('placeholder') + '을 입력해주세요 !');
			return false;
		}
	}
	$.ajax({
		type:"POST",
		url:"/join",
		data:{e_mail:$('#bubu').val(), nm:$('#nm').val(), 
			  c_pw:$('#c_pw').val(), bir_day:$('#bir_day').val()},
		success:function(data){
			alert('회원가입이 완료되셨습니다.');
			// attr = 속성 attribue 
			// $('#id').attr("src") => id의 src의 값을 가져옴
			// $('#id').attr("src","/css/boot.css") => id의 src를 저걸로 바꿈
			$('#menuctnt').css("display", "none"); // css를 사용해서 display : none 만들기
			$('#join').attr("style", "display:none"); // attr를 사용해서 display : none 만들기
			window.location.reload(); // 새로고침해서 지워주기
		},
		error: function(xhr, status, error) {
            alert(error);
		}
	});
}


//			Map = key : value 
//			ModelAndView = "key" : value <- 이게 정석인데
//			json -> "key" : value
//			json으로 파싱 data -> 파싱해서 -> js에서 가공해서 사용

function chkE_mail() {
	var msg ='';
	var e_mail = $('#bubu').val();
    $.ajax({
        type:"GET",
        url:"./checkE_mail",
        data : {e_mail : e_mail},
        success: function(json){
			
            var res = json.result;
			switch(res){
				case 1:
					$('#checkE_mail').val(1);
		    		msg = '이미 사용 중 입니다.'
		    		break;
		   		 case 0:
					$('#checkE_mail').val(0);
		    		msg ='이메일을 사용할 수 있습니다.'
		    		break;
		    	}
//			duplicationE_mailMsg.innerHTML=msg
			$('#duplicationE_mailMsg').html(msg);
        },
        error: function(xhr, status, error) {
            alert(error);
	        } 
	    });
	}





