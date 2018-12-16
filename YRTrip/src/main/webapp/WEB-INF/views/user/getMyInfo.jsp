<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
/* $(function(){
	document.getElementById('userBirth').valueAsDate = new Date(); //현재 날짜 출력
}); */

function ck_email(){
    var email = document.getElementById("userEmail");
    var MsgEmail = document.getElementById("MsgEmail");
    var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

    if(!isEmail.test(email.value)){
    	MsgEmail.style.display="block";
    	MsgEmail.className='error';
    	MsgEmail.innerHTML="이메일 형식을 확인하세요";
    	emailCheck = 0;
		return false;
    } else{
    	MsgEmail.className='vaild';
    	MsgEmail.innerHTML="ok";
    	emailCheck = 1;
	}   
}

function ck_pwd(){
    var pwd = document.getElementById("userPw");
    var MsgPw = document.getElementById("MsgPw");
    var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
    
    if(!isPwd.test(pwd.value)){
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
    var pwd = document.getElementById("userPw").value;
    var MsgPwck = document.getElementById("MsgPwck");
    var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

    if(!isPwd.test(pwd_ck.value)){
    	MsgPwck.style.display="block";
    	MsgPwck.className='error';
    	MsgPwck.innerHTML="숫자포함 최소 6자리 이상";
    	pwdckCheck = 0;
    } else if(pwd_ck.value!=pwd){
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
    var isName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,9}$/

    if(!isName.test(name.value)){
        MsgName.style.display="block";
        MsgName.className='error';
        MsgName.innerHTML="2~10자의 문자 또는 숫자";
        nameCheck = 0;
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

    if(!isPhone.test(phone.value)){
        MsgPhone.style.display="block";
        MsgPhone.className='error';
        MsgPhone.innerHTML="올바른 전화번호 형식이 아닙니다.";
        phoneCheck = 0;
    } else{
        $(".signupbtn").prop("disabled", false);
        $(".signupbtn").css("background-color", "#f9bf3b");
        MsgPhone.className='vaild';
        MsgPhone.innerHTML="ok";
        phoneCheck = 1;
    } 
}


/* //전화번호 하이픈(-) 자동입력
 	function autoHypenPhone(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}

	var userPhone = document.getElementById('userPhone');
	userPhone.onkeyup = function(event) {
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val);
	} */
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
		ck_email(); ck_pwd(); ck_pwd2(); ck_name(); ck_phone(); OnCheckPhone(); ck_birth(); ck_gender();

	    if( emailCheck!=0 && pwdCheck!=0 && pwdckCheck!=0 && nameCheck!=0 && birthCheck!=0 && phoneCheck!=0  && genderCheck !=0 ){
	        $(".signupbtn").prop("disabled", false);
	        $(".signupbtn").css("background-color", "#f9bf3b");
	    } else {
	    	$(".signupbtn").prop("disabled", true);
	    	$(".signupbtn").css("background-color", "#aaaaaa");
	    }
	}
 	
 	$(function(){
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                
                	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    	extraRoadAddr += data.bname;
                	}
                	// 건물명이 있고, 공동주택일 경우 추가한다.
                	if(data.buildingName !== '' && data.apartment === 'Y'){
                   		extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                	}
                	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                	if(extraRoadAddr !== ''){
                    	extraRoadAddr = ' (' + extraRoadAddr + ')';
                    	addr += extraRoadAddr;
                	}
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userPost").value = data.zonecode;
                document.getElementById("userAddress").value = addr;
            }
        }).open();
    }
</script>
</head>
<body>
    <!--    start about us area-->
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
                    <div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">마이페이지</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="#" style="color:black">여행정보</a></li>
                            <li><a href="#" style="color:black">좋아요</a></li>
                            <li><a href="#" style="color:black">상품</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="about_car">
            		<h3 style="color:black; text-align:center">${user.userId}</h3><br>
            			<form action="./updateMyInfo" method="post">
            			<input type="hidden" name="userId" value="${user.userId}">
            			<fieldset>
            				
							이름 *
							<div>
							<input type="text" id="userName" name="userName" value="${user.userName}" oninput="ck_signup()" required>							
            				<span id="MsgName" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
            				비밀번호 *
            				<div>
            				<input type="password" id="userPw" name="userPw" value="${user.userPw}" oninput="ck_signup()" required>
							<span id="MsgPw" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							비밀번호 확인 *
							<div>
							<input type="password" id="userPw_ck" name="userPw_ck" oninput="ck_signup()">
							<span id="MsgPwck" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							이메일 *
							<div>
							<input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" oninput="ck_signup()" required>
							<span id="MsgEmail" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							연락처 *
							<div>
							<input type="text" id="userPhone" name="userPhone" value="${user.userPhone}" oninput="ck_signup()" required maxlength="13"> 
							<span id="MsgPhone" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							생년월일 *
							<div>
							<%-- <fmt:formatDate var="fmtDate" value="${user.userBirth}" pattern="dd/MM/yyyy"/>
							<input type="text" id="userBirth" name="userBirth" value="${fmtDate}" required> --%>
							<%-- <form:input path="user" id="userBirth" value="${fmtDate}" /> --%>
							<input type="date" id="userBirth" name="userBirth" value="${user.userBirth}" oninput="ck_signup()" required>
							<span id="MsgBirth" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							주소 
							<div class="form-group" style="padding:0">
							<input type="text" id="userPost" name="userPost" value="${user.userPost}" placeholder="우편번호" style="width:69%">
							<input type="button" class="btn btn-warning" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" 
								style="width:30%; padding: 13px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"><br>
							<input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" placeholder="도로명주소">
							</div>
							
							성별 * 
							<div>
							<div id="wrap_gender">
								<span id="wrap_man" class="gender">
								<input type="radio" id="man" name="userGen" onclick="ck_gender()" oninput="ck_signup()" value="${user.userGen}" <c:if test="${user.userGen eq '남'}">checked</c:if> required>
								<label for="man"> 남자 </label>
								</span>
					
								<span id="wrap_woman" class="gender no_line">
								<input type="radio" id="woman" name="userGen" onclick="ck_gender()" oninput="ck_signup()" value="${user.userGen}" <c:if test="${user.userGen eq '여'}">checked</c:if> required>
								<label for="woman" onclick="ck_gender()"> 여자 </label>
								</span>
							</div>
							</div>
							
							은행 
							<div>
							<input type="text" id="userBank" name="userBank" value="${user.userBank}">
							<!-- <span id="MsgBank" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span> -->
							</div>
							
							계좌번호
							<div>
							<input type="text" id="userAccount" name="userAccount" value="${user.userAccount}">
							<!-- <span id="MsgAccount" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span> -->
							</div>
							
							<br><strong><input type="submit" class="btn btn-warning signupbtn" disabled="disabled" value="회원정보 수정"
										style="background-color: #aaaaaa; width: 100%; padding: 14px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"></strong>
						</fieldset>
            			</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
</body>
</html>