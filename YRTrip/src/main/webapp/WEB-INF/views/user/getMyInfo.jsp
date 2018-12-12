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
function ck_email(){
    var email = document.getElementById("userEmail");
    var MsgEmail = document.getElementById("MsgEmail");
    var isEmail = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

    if(!isEmail.test(email.value)){
    	MsgEmail.style.display="block";
    	MsgEmail.className='error';
    	MsgEmail.innerHTML="이메일 형식을 확인하세요";
        return false;
    } else{
    	MsgEmail.className='vaild';
    	MsgEmail.innerHTML="ok";
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
        return false;
    } else{
        MsgPw.className='vaild';
        MsgPw.innerHTML="ok";
    }   
}


function ck_pwd2(){
    var pwd_ck = document.getElementById("userPw_ck");
    var pwd = document.getElementById("userPw").value;
    var MsgPwck = document.getElementById("MsgPwck");
    
    if(pwd_ck.value!=pwd){
        MsgPwck.style.display="block";
        MsgPwck.className='error';
        MsgPwck.innerHTML="비밀번호가 일치하지 않습니다.";
        return false;
    } else{
        MsgPwck.className='vaild';
        MsgPwck.innerHTML="ok";
    }   
}


function ck_name(){
    var name = document.getElementById("userName");
    var MsgName = document.getElementById("MsgName");
    
    if(name.value==''){
        MsgName.style.display="block";
        MsgName.className='error';
        MsgName.innerHTML="2자 이상 입력하세요.";
        return false;
    } else{
        MsgName.className='vaild';
        MsgName.innerHTML="ok";
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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                document.getElementById('sample4_postcode').value = data.zonecode;
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
            			<input type="hidden" id="userId" value="${user.userId}">
            			<fieldset>
            				
							이름 *
							<div>
							<input type="text" id="userName" name="userName" value="${user.userName}" onblur="ck_name()" required>							
            				<span id="MsgName" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
            				비밀번호 *
            				<div>
            				<input type="password" id="userPw" name="userPw" onblur="ck_pwd()" required>
							<span id="MsgPw" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							비밀번호 확인 *
							<div>
							<input type="password" id="userPw_ck" name="userPw_ck" onblur="ck_pwd2()">
							<span id="MsgPwck" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							이메일 *
							<div>
							<input type="email" id="userEmail" name="userEmail" value="${user.userEmail}" onblur="ck_email()" required>
							<span id="MsgEmail" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							연락처 *
							<div>
							<input type="text" id="userPhone" name="userPhone" value="${user.userPhone}" onblur="" required>
							<span id="MsgPhone" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							생년월일 *
							<div>
							<input type="date" id="userBirth" name="userBirth" value="${user.userBirth}" required>
							<span id="MsgBirth" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
							</div>
							
							주소 
							<div class="form-group" style="padding:0">
							<input type="text" id="sample4_postcode" placeholder="우편번호" style="width:69%">
							<input type="button" class="btn btn-warning" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" 
								style="width:30%; padding: 13px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"><br>
							<input type="text" id="userAddress" name="userAddress" value="${user.userAddress}" placeholder="도로명주소">
							</div>
							
							성별 *
							<div>
							<div id="wrap_gender">
								<span id="wrap_man" class="gender">
								<input type="radio" id="man" name="userGen" onclick="ck_gender()" value="남">
								<label for="man"> 남자 </label>
								</span>
					
								<span id="wrap_woman" class="gender no_line">
								<input type="radio" id="woman" name="userGen" onclick="ck_gender()" value="여">
								<label for="woman" onclick="ck_gender()"> 여자 </label>
								</span>
							</div>
							<span id="MsgGender" class="none" style="margin-left: auto; margin-right: auto;">유효성체크</span>
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
							
							<br><strong><input type="submit" class="btn btn-warning" value="회원정보 수정"
										style="width: 100%; padding: 14px 20px; margin: 8px auto; border: none; border-radius: 4px; cursor: pointer;"></strong>
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