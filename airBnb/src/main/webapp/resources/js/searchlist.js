var slideIndex = 1;

function goFilter(){
	var form = document.querySelector('#ffom');
	for (var pair of formData.entries()) {
  	 console.log(pair[0] + ': ' + pair[1]);
	}
}

// 초기 검색 인원 증감함수
function countUp(d) {
	d.value = parseInt(d.value) + 1;
}

function countDw(d) {
    d.value = parseInt(d.value) - 1;
    if(d.value < 0) {
        d.value = 0;
    }
}

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

});
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
	
// 이미지 화살표 버튼 클릭시 
function plusSlides(n,sIndex) {
  showSlides(slideIndex += n,sIndex);
}
// class dot 클릭시 
function currentSlide(n,sIndex) {
  showSlides(slideIndex = n,sIndex);
}

// 이미지 활성화
function showSlides(n,sIndex) {
  var i;
  // calss -> dot mySlides 의 부모 태그 정보 가지고 오기 
  var sContainer = document.querySelector('#s_'+sIndex);
  var dotCont = document.querySelector('#d_'+sIndex);
  // id ="s_${item.i_host}" , id="d_${item.i_host}" 밑에 있는  class 요소 다 가지고 오기 
  var slides =  sContainer.getElementsByClassName("mySlides");
  var dots = dotCont.getElementsByClassName("dot");
  // 사진 표기 
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  //
}

function filter(){
	var modal = document.getElementById('myModal');
	var fiter_type = document.getElementById("fiter_type");
	var filter_fee = document.getElementById("fiter_fee");
	modal.style.display = "block";
	fiter_type.style.display = "none";
	filter_fee.style.display = "none";
}

function filter_close(){
	var modal = document.getElementById('myModal');
	 modal.style.display = "none";
}
// 침대수 침실수 욕실수 갯수 증감 함수 
function searchUp(d) {
	d.value = parseInt(d.value) + 1;
}

function searchDw(d) {
    d.value = parseInt(d.value) - 1;
    if(d.value < 0) {
        d.value = 0;
    }
}
// 필터 검색 데이터 초기화 함수 
function fiter_del(){
	bed_qty.value	=0;
	b_room.value	=0;
	bth_room.value	=0;
	var pmCon = document.querySelector('#myModal');
	var mContainer = pmCon.getElementsByClassName('f_ch');
	for (i = 0; i < mContainer.length; i++) {
		mContainer[i].checked = "";
	}
}



// 요금 버튼 
function filter_fee(){
	var modal = document.getElementById('myModal');
	var fiter_type = document.getElementById("fiter_type");
	var filter_fee = document.getElementById("fiter_fee");
	modal.style.display = "none";
	fiter_type.style.display = "none";
	filter_fee.style.display = "block";
	
}
//요금 닫기 
function fee_close(){
	var filter_fee = document.getElementById("fiter_fee");
	filter_fee.style.display = "none";
}

function fevalue(v){
	var viewVal = document.getElementById('fee_value');
	viewVal.innerHTML = '$'+v.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
// 요금 검색 데이터 초기화 
function fee_del(){
	var feeCon = document.querySelector('#fiter_fee');
	var feeContainer = document.getElementsByClassName('f_fe');
	feeContainer[0].value = feeContainer[0].max;
}

// 숙소 유형 버튼 
function filter_type(){
	var modal = document.getElementById('myModal');
	var fiter_type = document.getElementById("fiter_type");
	var filter_fee = document.getElementById("fiter_fee");
	modal.style.display = "none";
	filter_fee.style.display = "none";
	fiter_type.style.display = "block";
}
// 숙소 유형 닫기 
function type_close(){
	var fiter_type = document.getElementById("fiter_type");
	fiter_type.style.display = "none";
}
// 숙소 유형 검색 데이터 초기화 
function type_del(){
	var ftpCon = document.querySelector('#fiter_type');
	var ftpContainer = ftpCon.getElementsByClassName('f_tp');
	for (i = 0; i < ftpContainer.length; i++) {
		ftpContainer[i].checked = "";
	}
}

function like(i_host, i_user){
	
}




	