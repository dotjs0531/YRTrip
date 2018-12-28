<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
fieldset{
    border: none;
}
fieldset > div{ 
    position: relative;
}
.none{
    display: none;
}
.error{ 
    position: absolute;
    width: auto;
    top: 18px; right: 10px;
    text-align: right;
    color: red;
}
.vaild{
    position: absolute;
    width: 150px;
    top: 18px; right: 10px;
    text-align: right;
    color: #f9bf3b;
    font-weight:bold;
}
input[type=text], select, input[type=password], input[type=email], input[type=date] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    color:black;
}
#wrap_gender{
    border-radius: 4px;
    border: 1px solid #ccc;
    display: flex;
}
.gender{
    display: block;
    height: 100%; width: 50%;
    border-right: 1px solid #ccc;
}
.no_line{
    border-right:none;
}
.gender > label {
    display: block;
    /*width: 100%; height: 100%;*/
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #666;
}
input[type=radio]{
   display: none;
}
.gender_act{
    display: inline-block;
    height: 100%; width: 50%;
    background-color: #f9bf3b;
    color:#fff;
}
.gender_act > label {
    display: inline-block;
    width: 100%; height: 100%;
    padding: 10px 0;
    text-align: center;
    font-size: 0.8em;
    color: #fff;
}
/* div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
} */
</style>
<script>
 	function ck_id(){
		var id = document.getElementById("userId");
		var MsgId = document.getElementById("MsgId");
		var isid = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,20}$/;
		
		$.ajax({
			data : {
				userId : id.value
			},
			url: "checkId",
			success : function(data) {
                if( !isid.test(id.value) && data=='0') {
                    //$(".signupbtn").prop("disabled", true);
					MsgId.style.display="block";
				    MsgId.className='error';
					MsgId.innerHTML = "영문자로 시작하는 4~20자의 영문자 또는 숫자";
					idCheck = 0;
				} else if (data == '0'){
                    //$(".signupbtn").prop("disabled", false);
					MsgId.className='vaild';
				    MsgId.innerHTML="ok";
				    idCheck = 1;
				} else if (data == '1') {
                    //$(".signupbtn").prop("disabled", true);
					MsgId.style.display="block";
					MsgId.className='error';
					MsgId.innerHTML = "중복된 ID입니다";
					idCheck = 0;
				}
			}
		});
	}

	function ck_email(){
	    var email = document.getElementById("userEmail");
	    var MsgEmail = document.getElementById("MsgEmail");
	    var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

		$.ajax({
			data : {
				userEmail : email.value
			},
			url: "checkEmail",
			success : function(data) {
                if( !isEmail.test(email.value) && data=='0') {
                    //$(".signupbtn").prop("disabled", true);
        	    	MsgEmail.style.display="block";
        	    	MsgEmail.className='error';
        	    	MsgEmail.innerHTML="이메일 형식을 확인하세요";
        	    	emailCheck = 0;
				} else if (data == '0'){
                    //$(".signupbtn").prop("disabled", false);
			    	MsgEmail.className='vaild';
			    	MsgEmail.innerHTML="ok";
			    	emailCheck = 1;
				} else if (data == '1') {
                    //$(".signupbtn").prop("disabled", true);
        	    	MsgEmail.style.display="block";
        	    	MsgEmail.className='error';
        	    	MsgEmail.innerHTML = "중복된 Email입니다";
        	    	emailCheck = 0;
				}
			}
		});
	    /* if(email.value=="" || !isEmail.test(email.value)){
	    	MsgEmail.style.display="block";
	    	MsgEmail.className='error';
	    	MsgEmail.innerHTML="이메일 형식을 확인하세요";
	    	emailCheck = 0;
	    } else{
	    	MsgEmail.className='vaild';
	    	MsgEmail.innerHTML="ok";
	    	emailCheck = 1;
	    }  */  
	}

	function ck_pwd(){
	    var pwd = document.getElementById("userPw");
	    var MsgPw = document.getElementById("MsgPw");
	    var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

	    if(pwd.value=="" || !isPwd.test(pwd.value)){
	        MsgPw.style.display="block";
	        MsgPw.className='error';
	        MsgPw.innerHTML="숫자포함 최소 6자리 이상";
	        pwdCheck = 0;
	    } else{
	        MsgPw.className='vaild';
	        MsgPw.innerHTML="ok";
	        pwdCheck = 1;
	    }   
	}

	function ck_pwd2(){
	    var pwd_ck = document.getElementById("userPw_ck");
	    var pwd = document.getElementById("userPw");
	    var MsgPwck = document.getElementById("MsgPwck");
	    var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

	    if(pwd_ck.value=="" || !isPwd.test(pwd_ck.value)){
	    	MsgPwck.style.display="block";
	    	MsgPwck.className='error';
	    	MsgPwck.innerHTML="숫자포함 최소 6자리 이상";
	    	pwdckCheck = 0;
	    } else if(pwd_ck.value!=pwd.value){
	        MsgPwck.style.display="block";
	        MsgPwck.className='error';
	        MsgPwck.innerHTML="비밀번호가 일치하지 않습니다.";
	        pwdckCheck = 0;
	    } else{
	        MsgPwck.className='vaild';
	        MsgPwck.innerHTML="ok";
	        pwdckCheck = 1;
	    }   
	}

	function ck_name(){
	    var name = document.getElementById("userName");
	    var MsgName = document.getElementById("MsgName");
	    var isName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,19}$/;

	    if(name.value=="" || !isName.test(name.value)){
	        MsgName.style.display="block";
	        MsgName.className='error';
	        MsgName.innerHTML="2~20자의 문자 또는 숫자";
	        nameCheck = 0;
	        return false;
	    } else{
	        MsgName.className='vaild';
	        MsgName.innerHTML="ok";
	        nameCheck = 1;
	    }   
	}
	
	function ck_phone(){
		var phone = document.getElementById("userPhone");
		var MsgPhone = document.getElementById("MsgPhone");
	    var isPhone =  /^\d{2,3}-\d{3,4}-\d{4}$/;
	    
	    if(phone.value=="" || !isPhone.test(phone.value)){
	        MsgPhone.style.display="block";
	        MsgPhone.className='error';
	        MsgPhone.innerHTML="올바른 전화번호 형식이 아닙니다.";
	        phoneCheck = 0;
	    } else{
	        MsgPhone.className='vaild';
	        MsgPhone.innerHTML="ok";
	        phoneCheck = 1;
	    } 
	}
	
	function OnCheckPhone() { 
		var oTa = document.getElementById("userPhone");
	    var oForm = oTa.form ; 
	    var sMsg = oTa.value ; 
	    var onlynum = "" ; 
	    var imsi=0; 
	    onlynum = RemoveDash2(sMsg);  //하이픈 입력시 자동으로 삭제함 
	    onlynum =  checkDigit(onlynum);  // 숫자만 입력받게 함 
	    var retValue = ""; 

	    if(event.keyCode != 12 ) { 
	        if(onlynum.substring(0,2) == 02) {  // 서울전화번호일 경우  10자리까지만 나타나교 그 이상의 자리수는 자동삭제 
	                if (GetMsgLen(onlynum) <= 1) oTa.value = onlynum ; 
	                if (GetMsgLen(onlynum) == 2) oTa.value = onlynum + "-"; 
	                if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,3) ; 
	                if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,4) ; 
	                if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) ; 
	                if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) ; 
	                if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,7) ; ; 
	                if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,8) ; 
	                if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,5) + "-" + onlynum.substring(5,9) ; 
	                if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
	                if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
	                if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,2) + "-" + onlynum.substring(2,6) + "-" + onlynum.substring(6,10) ; 
	        } 
	        if(onlynum.substring(0,2) == 05 ) {  // 05로 시작되는 번호 체크 
	            if(onlynum.substring(2,3) == 0 ) {  // 050으로 시작되는지 따지기 위한 조건문 
	                    if (GetMsgLen(onlynum) <= 3) oTa.value = onlynum ; 
	                    if (GetMsgLen(onlynum) == 4) oTa.value = onlynum + "-"; 
	                    if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,5) ; 
	                    if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,6) ; 
	                    if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) ; 
	                    if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	                    if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) + "-" + onlynum.substring(7,9) ; ; 
	                    if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,10) ; 
	                    if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) + "-" + onlynum.substring(7,11) ; 
	                    if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,12) ; 
	                    if (GetMsgLen(onlynum) == 13) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) + "-" + onlynum.substring(8,12) ; 
	          } else { 
	                if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
	                if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
	                if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
	                if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
	                if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
	                if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
	                if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,8) ; ; 
	                if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
	                if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
	                if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
	                if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
	          } 
	        } 

	        if(onlynum.substring(0,2) == 03 || onlynum.substring(0,2) == 04  || onlynum.substring(0,2) == 06  || onlynum.substring(0,2) == 07  || onlynum.substring(0,2) == 08 ) {  // 서울전화번호가 아닌 번호일 경우(070,080포함 // 050번호가 문제군요) 
	                if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
	                if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
	                if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
	                if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
	                if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
	                if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
	                if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,8) ; ; 
	                if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
	                if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
	                if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
	                if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 

	        } 
	        if(onlynum.substring(0,2) == 01) {  //휴대폰일 경우 
	            if (GetMsgLen(onlynum) <= 2) oTa.value = onlynum ; 
	            if (GetMsgLen(onlynum) == 3) oTa.value = onlynum + "-"; 
	            if (GetMsgLen(onlynum) == 4) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,4) ; 
	            if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,5) ; 
	            if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) ; 
	            if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) ; 
	            if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,8) ; 
	            if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,9) ; 
	            if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,6) + "-" + onlynum.substring(6,10) ; 
	            if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
	            if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,3) + "-" + onlynum.substring(3,7) + "-" + onlynum.substring(7,11) ; 
	        } 

	        if(onlynum.substring(0,1) == 1) {  // 1588, 1688등의 번호일 경우 
	            if (GetMsgLen(onlynum) <= 3) oTa.value = onlynum ; 
	            if (GetMsgLen(onlynum) == 4) oTa.value = onlynum + "-"; 
	            if (GetMsgLen(onlynum) == 5) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,5) ; 
	            if (GetMsgLen(onlynum) == 6) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,6) ; 
	            if (GetMsgLen(onlynum) == 7) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,7) ; 
	            if (GetMsgLen(onlynum) == 8) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	            if (GetMsgLen(onlynum) == 9) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	            if (GetMsgLen(onlynum) == 10) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	            if (GetMsgLen(onlynum) == 11) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	            if (GetMsgLen(onlynum) == 12) oTa.value = onlynum.substring(0,4) + "-" + onlynum.substring(4,8) ; 
	        } 
	    } 
	    ck_phone();
	} 

	function RemoveDash2(sNo) { 
	var reNo = "" 
	for(var i=0; i<sNo.length; i++) { 
	    if ( sNo.charAt(i) != "-" ) { 
	    reNo += sNo.charAt(i) 
	    } 
	} 
	return reNo 
	} 

	function GetMsgLen(sMsg) { // 0-127 1byte, 128~ 2byte 
	var count = 0 
	    for(var i=0; i<sMsg.length; i++) { 
	        if ( sMsg.charCodeAt(i) > 127 ) { 
	            count += 2 
	        } 
	        else { 
	            count++ 
	        } 
	    } 
	return count 
	} 

	function checkDigit(num) { 
	    var Digit = "1234567890"; 
	    var string = num; 
	    var len = string.length 
	    var retVal = ""; 

	    for (i = 0; i < len; i++) 
	    { 
	        if (Digit.indexOf(string.substring(i, i+1)) >= 0) 
	        { 
	            retVal = retVal + string.substring(i, i+1); 
	        } 
	    } 
	    return retVal; 
	} 
	
	function ck_birth(){
		var birth = document.getElementById("userBirth").valueAsDate;

	    if(birth.valueAsDate==""){
	        birthCheck = 0;
		} else {
	        birthCheck = 1;
		}
	}

	function ck_gender() {
		var wrap_gender = document.getElementById("wrap_gender");
		var man = document.getElementById("man");
		var woman = document.getElementById("woman");
		
		var che = $('input:radio[name=userGen]').is(':checked');

		if(che){
			genderCheck = 1;
			if (man.checked) {
				document.getElementById("wrap_man").className = 'gender_act';
				document.getElementById("wrap_woman").className = 'gender';
			}

			if (woman.checked) {
				document.getElementById("wrap_woman").className = 'gender_act';
				document.getElementById("wrap_man").className = 'gender';
			}
		}
		else{
			genderCheck = 0;
		}
	}
	
 	function ck_signup(){
		ck_id(); ck_email(); ck_pwd(); ck_pwd2(); ck_name(); ck_phone(); OnCheckPhone(); ck_birth(); ck_gender();

	    if( idCheck!=0 && emailCheck!=0 && pwdCheck!=0 && pwdckCheck!=0 && nameCheck!=0 && birthCheck!=0 && phoneCheck!=0  && genderCheck !=0){
	    	$(".signupbtn").prop("disabled", false);
	        $(".signupbtn").css("background-color", "#f9bf3b");
	    } else {
	    	$(".signupbtn").prop("disabled", true);
	    	$(".signupbtn").css("background-color", "#aaaaaa");
	    }
	}
 	
 	$(function(){
 	 	var idCheck = 0;
 		var emailCheck = 0;
 		var pwdCheck = 0;
 		var pwdckCheck = 0;
 		var nameCheck = 0;
 		var phoneCheck = 0;
 		var birthCheck = 0;
 		var genderCheck = 0;
 		
 		ck_signup();
 	});
</script>
</head>
<body>
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row" style="width:600px; margin:0 auto;">
            <h3 style="color:black; text-align:center;">회원가입</h3><br>
            <form action="./signup" method="post">
            <fieldset>
				<div>
				<input type="text" id="userId" name="userId" placeholder="아이디" oninput="ck_signup()" required>
				<span id="MsgId" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호" oninput="ck_signup()" required>
				<span id="MsgPw" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="password" id="userPw_ck" name="userPw_ck" placeholder="비밀번호 확인" oninput="ck_signup()">
				<span id="MsgPwck" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="text" id="userName" name="userName" placeholder="이름" oninput="ck_signup()" required>
				<span id="MsgName" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일 (yedam@yrtrip.com)" oninput="ck_signup()" required>
				<span id="MsgEmail" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="text" id="userPhone" name="userPhone" placeholder="연락처 (010-0000-0000)" oninput="ck_signup()" required maxlength="13">
				<span id="MsgPhone" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="date" id="userBirth" name="userBirth" placeholder="생년월일" oninput="ck_signup()" required>
				<span id="MsgBirth" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div id="wrap_gender">
					<span id="wrap_man" class="gender">
					<input type="radio" id="man" name="userGen" onclick="ck_gender()" oninput="ck_signup()" value="남" required>
					<label for="man"> 남자 </label>
					</span>
					
					<span id="wrap_woman" class="gender no_line">
					<input type="radio" id="woman" name="userGen" onclick="ck_gender()" oninput="ck_signup()" value="여" required>
					<label for="woman" onclick="ck_gender()"> 여자 </label>
					</span>
				</div>
				<!-- <select id="country" name="country">
					<option value="australia">20대</option>
					<option value="canada">30대</option>
					<option value="usa">40대</option>
				</select> -->
				
				<br><strong><input type="submit" class="btn btn-warning signupbtn" disabled="disabled" value="회원가입"
							style="background-color: #aaaaaa; width: 100%; padding: 14px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"></strong>
			</fieldset>
            </form>
            </div>
        </div>
    </section>
</body>
</html>