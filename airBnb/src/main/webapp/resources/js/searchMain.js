// dropDown 메뉴 함수 
function myMenu() {
	display = document.getElementById("menuctnt").style.display;
	if(display == 'block'){
		document.getElementById("menuctnt").style.display='none';
	}else{
		document.getElementById("menuctnt").style.display='block';
	}
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
