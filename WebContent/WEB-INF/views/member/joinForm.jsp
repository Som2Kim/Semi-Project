<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">

.fieldBox {
	position: relative;
}

.msg { //fieldBox를 기준으로 위치 지정
	position: absolute;
	color : red;
	top: 0;
	left: 250px;
	font-size: 10px;
}


</style>

<script type="text/javascript">
//form validation
//	폼 데이터 유효성 검증

//	-> 유효성 값을 입력했는지 검증
//	-> 적당한 값이 아니면 form을 submit하지 않는다

//------------------------------------------------------------


//아이디, 비밀번호 조합 제한
var req_id = /^[A-Za-z]{1}[A-Za-z0-9_]{3,19}$/ //반드시 영문으로 시작 숫자+언더바 허용 4~20자리


//------------------------------------------------------------

window.onload = function () {
	
	//focus를 잃었을 때 blur이벤트 발생
	userid.addEventListener("blur", function () {
		console.log("#userid blur")
		
		validateId();
	}) 
	
	//타이핑 할 때마다 확인하게(위아래 둘다 두는 편) keyup이벤트 발생
	userid.addEventListener("keyup", function () {
		console.log("#userid keyup")
		
		validateId();
	})
	
	//focus를 잃었을 때 blur이벤트 발생
	userpw.addEventListener("blur", function () {
		console.log("#userid blur")
		
		validatePw();
	}) 
	
	//타이핑 할 때마다 확인하게(위아래 둘다 두는 편) keyup이벤트 발생
	userpw.addEventListener("keyup", function () {
		console.log("#userid keyup")
		
		validatePw();
	})
	
	
}

//유효성 이중 검사
$(document).ready(function () {
	
	//form태그에 submit이 발생했을 때 이벤트 처리
	//	-> submit수행 전에 동작한다.
	$("form").submit(function () {
		//console.log("submit event")
		
		//유효성 검사 결과에 따른 submit 
		if(!validateId() || !validatePw()) {
			
		//console.log("SUBMIT 중단됨")
		
		//submit을 중단시킨다.(return false를 submit에 쓰면)
		return false;
		
		}
		
		//alert("SUBMIT 수행됨")
	})
	
})

//폼 아이디 검증 함수
function validateId() {
	//CASE 1. 문자열을 입력하지 않았을 때
	//	warnMsg를 보이지 않음
	//	버튼을 누를 때 submit되지 않음
	
	//CASE 2. 길이가 8~20이 아닌 입력
	//	warnMsg를 보여줌(8글자 이상 20글자 이하로 입력하세요)
	//	버튼을 누를 때 submit되지 않음
	
	
	//CASE 3. 길이가 8~20인 입력
	//	warnMsg를 보이지 않음
	//	버튼을 누를 때 submit됨
//----------------------------------------------------------------

	console.log(userid.value)
	
	if(userid.value=="") {
		warnMsgId.innerHTML = "";
		warnMsgId.style.display="none";
		return false;
		
	} else if(!req_id.test(userid.value)) { //아이디 조합 검증
		warnMsgId.innerHTML = "아이디는 4~20자 사이의 영문 + 숫자 조합으로 입력해주세요";
		warnMsgId.style.display = "block";	
		return false;
			
	} else if(userid.value.length<4 || userid.value.length>20) { //아이디 길이 검증
		warnMsgId.innerHTML = "아이디는 4~20자 사이의 영문 + 숫자 조합으로 입력해주세요";
		warnMsgId.style.display = "block";
		return false;
			
	} else { //맞게 입력하면
		warnMsgId.innerHTML = "";
		warnMsgId.style.display = "none";
		return true;
		console.log("submit완료")
	}
	
	
}

//폼 비밀번호검증 함수
function validatePw() {
	//CASE 1. 문자열을 입력하지 않았을 때
	//	warnMsg를 보이지 않음
	//	버튼을 누를 때 submit되지 않음
	
	//CASE 2. 길이가 8~20이 아닌 입력
	//	warnMsg를 보여줌(8글자 이상 20글자 이하로 입력하세요)
	//	버튼을 누를 때 submit되지 않음
	
	//CAER 3. 비밀번호와 비밀번호 입력이 같지 않을 때
	//	warnMsg를 보여줌(비밀번호를 다시 확인하세요)
	//	버튼을 누를 때 submit되지 않음

	//CASE 4. 길이가 8~20인 입력, 비밀번호와 비밀번호 입력이 같으면
	//	warnMsg를 보이지 않음
	//	버튼을 누를 때 submit됨
//----------------------------------------------------------------

	console.log(userid.value)
	
	if(userpw.value=="") {
		warnMsgPw.innerHTML = "";
		warnMsgPw.style.display="none";
		return false;
		
	} else if(!req_id.test(userpw.value)) { //비밀번호 조합 검증
		warnMsgPw.innerHTML = "비밀번호는 4~20자 사이의 영문 + 숫자 조합으로 입력해주세요";
		warnMsgPw.style.display = "block";	
		warnMsgPw2.style.display = "block";	
		return false;
			
	} else if(userpw.value.length<4 || userpw.value.length>20) { //비밀번호 길이 검증
		warnMsgPw.innerHTML = "비밀번호는 4~20자 사이의 영문 + 숫자 조합으로 입력해주세요";
		warnMsgPw.style.display = "block";
		warnMsgPw2.style.display = "block";
		return false;
			
	} else if(userpw.value != userpw2.value) {
		warnMsgPw2.innerHTML = "비밀번호와 비밀번호 확인을 같게 입력해주세요.";;
		warnMsgPw.style.display = "block";
		warnMsgPw2.style.display = "block";
		return false;
		
	} else { //맞게 입력하면
		warnMsgPw.innerHTML = "";
		warnMsgPw2.innerHTML = "";
		warnMsgPw.style.display = "none";
		warnMsgPw2.style.display = "none";
		return true;
		console.log("submit완료")
	} 
	
	
}





</script>

</head>
<body>

<h1>회원가입</h1>
<hr>

<form action="/member/join" method="post" id="f">
<div class="fieldBox">

<label for="userid">아이디</label>
<input type="text" name="userid" id="userid" required placeholder="필수 입력 항목입니다"><br>
<div id="warnMsgId" class="msg" ></div>

<label for="userpw">비밀번호</label>
<input type="text" name="userpw" id="userpw" required placeholder="필수 입력 항목입니다"><br>
<div id="warnMsgPw" class="msg" ></div>

<label for="userpw2">비밀번호 확인</label>
<input type="text" name="userpw2" id="userpw2" required placeholder="필수 입력 항목입니다"><br>
<div id="warnMsgPw2" class="msg" ></div>

<label for="nick">이름</label>
<input type="text" name="username" id="username"><br>

<label for="nick">닉네임</label>
<input type="text" name="nick" id="nick" required placeholder="필수 입력 항목입니다"><br>

<label>성별</label>
	<label style="width:60px;"><input type="radio" name="gender" value="m"> 남</label>
	<label><input type="radio" name="gender" value="f"> 여</label><br>
	
<label for="email">이메일</label>
<input type="text" name="email" id="email"><br>

<label for="phone">전화번호</label>
<input type="text" name="phone" id="phone"><br>

<label for="phone">주소</label>
<input type="text" name="address" id="address"><br>

<label for="textarea">자기소개</label>
	<textarea rows="2" cols="20" id="textarea" placeholder="입력하세요"></textarea>
</div>

<button id="btn">가입</button>

</form>

</body>
</html>