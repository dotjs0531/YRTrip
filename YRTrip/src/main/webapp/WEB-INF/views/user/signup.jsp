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
    margin-bottom: 10px;
}
.none{
    display: none;
}
.error{ 
    font-size: 0.8em;
    position: absolute;
    width: auto;
    top: 18px; right: 10px;
    text-align: right;
    color: red;
}
.vaild{
    font-size: 0.8em;
    position: absolute;
    width: 150px;
    top: 18px; right: 10px;
    text-align: right;
    color: #f9bf3b;
}
input[type=text], select, input[type=password], input[type=email], input[type=date] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit],input[type=boutton] {
    width: 100%;
    background-color: #f9bf3b;
    color: white;
    padding: 14px 20px;
    margin: 8px auto;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover,input[type=boutton]:hover {
    background-color: #f9bf3b;
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
$(function(){

	function ck_email(){
	    var email = document.getElementById("userEmail")
	    var MsgId = document.getElementById("MsgEmail")
	    var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/

	    if(!isEmail.test(email.value)){
	        MsgId.style.display="block";
	        MsgId.className='error'
	        MsgId.innerHTML="이메일 형식을 확인하세요"
	        email.focus()
	        return false;
	    } else{
	        MsgId.className='vaild'
	        MsgId.innerHTML="ok"
	    }   
	}

	function ck_pwd(){
	    var pwd = document.getElementById("userPw")
	    var MsgPw = document.getElementById("MsgPw")
	    var isPwd = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
	    
	    if(!isPwd.test(pwd.value)){
	        MsgPw.style.display="block";
	        MsgPw.className='error'
	        MsgPw.innerHTML="숫자포함 최소 6자리 이상"
	        pwd.focus()
	        return false;
	    } else{
	        MsgPw.className='vaild'
	        MsgPw.innerHTML="ok"
	    }   
	}


	function ck_pwd2(){
	    var pwd_ck = document.getElementById("pwd_ck")
	    var pwd = document.getElementById("userPw").value
	    var MsgPwck = document.getElementById("MsgPwck")
	    
	    if(pwd_ck.value!=pwd){
	        MsgPwck.style.display="block";
	        MsgPwck.className='error'
	        MsgPwck.innerHTML="비밀번호가 일치하지 않습니다."
	        pwd_ck.focus()
	        return false;
	    } else{
	        MsgPwck.className='vaild'
	        MsgPwck.innerHTML="ok"
	    }   
	}


	function ck_name(){
	    var name = document.getElementById("userName")
	    var MsgName = document.getElementById("MsgName")
	    
	    if(name.value==''){
	        MsgName.style.display="block";
	        MsgName.className='error'
	        MsgName.innerHTML="2자 이상 입력하세요."
	        name.focus()
	        return false;
	    } else{
	        MsgName.className='vaild'
	        MsgName.innerHTML="ok"
	    }   
	}


	function ck_gender(){
	var wrap_gender = document.getElementById("wrap_gender")
	var man = document.getElementById("man")
	var woman = document.getElementById("woman")
	var MsgGender = document.getElementById("MsgGender")


	if(man.checked){
	    document.getElementById("wrap_man").className='gender_act';
	    document.getElementById("wrap_woman").className='gender';
	}

	if(woman.checked){
	    document.getElementById("wrap_woman").className='gender_act';
	    document.getElementById("wrap_man").className='gender';
	}


	}


	/*    
	if(man.checked == false && woman.checked == false){
	    MsgGender.style.display="block";
	    MsgGender.className='error'
	    MsgGender.innerHTML="필수 정보입니다."        wrap_gender.style.borderColor="red";
	    return false;
	}
	*/
});
</script>
</head>
<body>
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row" style="width:600px; margin:0 auto;">
            <h3 style="color:black;">회원가입</h3><br>
            <form action="./signup" method="post">
            <fieldset>
				<input type="text" id="userId" name="userId" placeholder="아이디" onblur="" required>
				<span id="MsgId" class="none">유효성체크</span>
				
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호" onblur="ck_pwd()" required>
				<span id="MsgPw" class="none">유효성체크</span>
				
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호 확인" onblur="ck_pwd2()">
				<span id="MsgPwck" class="none">유효성체크</span>
				
				<input type="text" id="userName" name="userName" placeholder="이름" onblur="ck_name()" required>
				<span id="MsgName" class="none">유효성체크</span>
				
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일 (yedam@yrtrip.com)" onblur="ck_email()" required>
				<span id="MsgId" class="none">유효성체크</span>
				
				<input type="text" id="userPhone" name="userPhone" placeholder="연락처 (010-0000-0000)" onblur="" required>
				<span id="MsgPhone" class="none">유효성체크</span>
				
				<input type="date" id="userBirth" name="userBirth" placeholder="생년월일" required>
				<span id="MsgBirth" class="none">유효성체크</span>
				
				<input type="text" id="userAddress" name="userAddress" placeholder="주소">
				<span id="MsgAddress" class="none">유효성체크</span>
				
				<div id="wrap_gender">
					<span id="wrap_man" class="gender">
					<input type="radio" id="man" name="userGen" onclick="ck_gender()">
					<label for="man"> 남자 </label>
					</span>
					
					<span id="wrap_woman" class="gender no_line">
					<input type="radio" id="woman" name="userGen" onclick="ck_gender()">
					<label for="woman" onclick="ck_gender()"> 여자 </label>
					</span>
				</div>
				<span id="MsgGender" class="none">유효성체크</span>
				
				<!-- <select id="country" name="country">
					<option value="australia">20대</option>
					<option value="canada">30대</option>
					<option value="usa">40대</option>
				</select> -->
				
				<br><input type="submit" value="회원가입">
			</fieldset>
            </form>
            </div>
        </div>
    </section>
</body>
</html>