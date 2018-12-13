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
	var idCheck = 0;
	var emailCheck = 0;
	var pwdCheck = 0;
	var pwdckCheck = 0;
	var nameCheck = 0;
	var phoneCheck = 0;
	//var birthCheck = 0;
	//var genderCheck = 0;
	
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

	    if(!isEmail.test(email.value)){
            //$(".signupbtn").prop("disabled", true);
	    	MsgEmail.style.display="block";
	    	MsgEmail.className='error';
	    	MsgEmail.innerHTML="이메일 형식을 확인하세요";
	    	emailCheck = 0;
	        return false;
	    } else{
            //$(".signupbtn").prop("disabled", false);
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
            //$(".signupbtn").prop("disabled", true);
	        MsgPw.style.display="block";
	        MsgPw.className='error';
	        MsgPw.innerHTML="숫자포함 최소 6자리 이상";
	        pwdCheck = 0;
	        return false;
	    } else{
            //$(".signupbtn").prop("disabled", false);
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
            //$(".signupbtn").prop("disabled", true);
	    	MsgPwck.style.display="block";
	    	MsgPwck.className='error';
	    	MsgPwck.innerHTML="숫자포함 최소 6자리 이상";
	    	pwdckCheck = 0;
	    } else if(pwd_ck.value!=pwd){
            //$(".signupbtn").prop("disabled", true);
	        MsgPwck.style.display="block";
	        MsgPwck.className='error';
	        MsgPwck.innerHTML="비밀번호가 일치하지 않습니다.";
	        pwdckCheck = 0;
	        return false;
	    } else{
            //$(".signupbtn").prop("disabled", false);
	        MsgPwck.className='vaild';
	        MsgPwck.innerHTML="ok";
	        pwdckCheck = 1;
	    }   
	}

	function ck_name(){
	    var name = document.getElementById("userName");
	    var MsgName = document.getElementById("MsgName");
	    var isName = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*].{1,19}$/
	    
	    if(!isName.test(name.value)){
            //$(".signupbtn").prop("disabled", true);
	        MsgName.style.display="block";
	        MsgName.className='error';
	        MsgName.innerHTML="2~20자의 문자 또는 숫자";
	        nameCheck = 0;
	        return false;
	    } else{
            //$(".signupbtn").prop("disabled", false);
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
            //$(".signupbtn").prop("disabled", true);
	        MsgPhone.style.display="block";
	        MsgPhone.className='error';
	        MsgPhone.innerHTML="올바른 전화번호 형식이 아닙니다.";
	        phoneCheck = 0;
	        return false;
	    } else{
            //$(".signupbtn").prop("disabled", false);
	        MsgPhone.className='vaild';
	        MsgPhone.innerHTML="ok";
	        phoneCheck = 1;
	    } 
	}

	function ck_gender(){
		var wrap_gender = document.getElementById("wrap_gender");
		var man = document.getElementById("man");
		var woman = document.getElementById("woman");
		var MsgGender = document.getElementById("userGen");

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
				<input type="text" id="userId" name="userId" placeholder="아이디" oninput="ck_id()" required>
				<span id="MsgId" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호" oninput="ck_pwd()" required>
				<span id="MsgPw" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="password" id="userPw_ck" name="userPw_ck" placeholder="비밀번호 확인" oninput="ck_pwd2()">
				<span id="MsgPwck" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="text" id="userName" name="userName" placeholder="이름" oninput="ck_name()" required>
				<span id="MsgName" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="email" id="userEmail" name="userEmail" placeholder="이메일 (yedam@yrtrip.com)" oninput="ck_email()" required>
				<span id="MsgEmail" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="text" id="userPhone" name="userPhone" placeholder="연락처 (010-0000-0000)" oninput="ck_phone()" required>
				<span id="MsgPhone" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div>
				<input type="date" id="userBirth" name="userBirth" placeholder="생년월일" required>
				<span id="MsgBirth" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
				</div>
				
				<div id="wrap_gender">
					<span id="wrap_man" class="gender">
					<input type="radio" id="man" name="userGen" onclick="ck_gender()" value="남" required>
					<label for="man"> 남자 </label>
					</span>
					
					<span id="wrap_woman" class="gender no_line">
					<input type="radio" id="woman" name="userGen" onclick="ck_gender()" value="여" required>
					<label for="woman" onclick="ck_gender()"> 여자 </label>
					</span>
				</div>
				<!-- <select id="country" name="country">
					<option value="australia">20대</option>
					<option value="canada">30대</option>
					<option value="usa">40대</option>
				</select> -->
				
				<br><strong><input type="submit" class="btn btn-warning" value="회원가입"
							style="width: 100%; padding: 14px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"></strong>
			</fieldset>
            </form>
            </div>
        </div>
    </section>
</body>
</html>