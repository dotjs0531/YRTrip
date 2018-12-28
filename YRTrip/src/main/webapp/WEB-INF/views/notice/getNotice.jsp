<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>KakaoLink v2 Demo(Default / List) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script language="javascript">
   function del(nid){
      if(confirm("삭제하시겠습니까?")){
         location.href = "./deleteNotice?noticeId=" + nid;
      } else { return; }
   };
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
                            <h2 style="color:black">고객센터</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="getNoticeList" style="color:black"><strong>공지사항</strong></a></li>
                            <li><a href="getQnaList" style="color:black">1:1 문의</a></li>
                        </ul>
                        <div class="order-buton">
                            <a href="#">탈퇴</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="min-width:700px">
                    <div class="about_car">
                    	<br/>
						<h3 style="color:black">${notice.noticeTitle}</h3>
						<br/>
						<strong>작성자</strong>&nbsp;&nbsp;${notice.userName} ｜ <strong>작성일</strong>&nbsp;&nbsp;${notice.noticeDate} ｜ <strong>조회수</strong>&nbsp;&nbsp;${notice.noticeHit}
						
						<!-- 카톡 공유하기 버튼 -->
						<a id="kakao-link-btn" href="javascript:;" style="float:right">
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png"/>
						</a>
						<p style="clear:both">
						
						<hr />
						<div style="min-height:300px;">
						<c:if test="${not empty notice.noticeImg}">
							<img id="noticeImg" src="./images/notice/${notice.noticeImg}" />
						</c:if>
							<pre style="background-color:white; border-style: none; font-family: 'montserratbold'; font-size: 16px">${notice.noticeContent}</pre>
						</div>
						
                    	<c:if test="${sessionScope.login.userGrant eq 'admin'}">
						<div class="order-buton" style="float:right">
                            <a href="./updateNoticeForm?noticeId=${notice.noticeId}">수정</a>&nbsp;&nbsp;
                            <a onclick="del('${notice.noticeId}')">삭제</a>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--   end of about us area-->
    
<script type='text/javascript'>
  //<![CDATA[
	  
	// // 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('4115609fb50877ceef895d9a2db54237');
	// // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
	Kakao.Link.createDefaultButton({
		container : '#kakao-link-btn',
		objectType : 'feed',
		content : {
			title : '${notice.noticeTitle}',
			description : '${notice.noticeContent}',
			imageUrl: 'https://postfiles.pstatic.net/MjAxODEyMjlfNiAg/MDAxNTQ2MDE0ODM1ODk5.VlG0P4NPq3mfRH0WkShxFV1TQFTrxJzDCSrkglA9g-kg.ClRMBKh_OXXzAFp7xDzEwlTzFCH1sb0ZCrFiOLMCDcMg.PNG.dotjs0531/%EB%8F%84%EC%8B%9C+%EB%B0%94%ED%83%95%ED%99%94%EB%A9%B4+(1).png?type=w773',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		},
		social : {
			likeCount : 286,
			commentCount : 45,
			sharedCount : 845
		},
		buttons : [ {
			title : '웹으로 보기',
			link : {
				mobileWebUrl : document.location.href,
				webUrl : document.location.href
			}
		} ]
	});
	//]]>
</script>
</body>
</html>