<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 글쓰기</title>
<script>
   // 댓글 목록 조회
   function loadJoinerList(){
      var params = { partnerId : '${partner.partnerId}' };
      $.getJSON("getJoinerList", params, function(datas){
            for(i=0; i<datas.length; i++){
               var div = JoinerView(datas[i]);
               $(div).appendTo("#joinerList")
            }
         });
   }
   
   $(function(){
      loadJoinerList();
      //동행신청 취소  이벤트
      $("#joinerList").on("click", ".btnDel", function(){
         var seq = $(this).parent().attr("id").substr(1);
         if(confirm("삭제할까요?")) {
            var params = "seq="+ seq;  // { seq : seq };
            var url = "deleteJoiner";
            $.getJSON(url, params, function(datas){
               $('#c'+datas.seq).remove();
            });
         }
      });
      
      //동행 신청 처리
      $("#btnAdd").click(function(){
         var params = $("#addForm").serialize();
         console.log(params);
         $.getJSON("insertJoiner", params, function(datas){
               var div = JoinerView(datas);
               $(div).prependTo("#joinerList");
         });      
      });      //end btnAdd clcic event
   });      //$() end ready event
   
   
   function JoinerView(joiner){
      var div = $("<div>"); 
      div.attr("id", "c"+joiner.joinerId);
      div.addClass('joiner');
      div[0].joiner=joiner;  //{id:1,.... }
      
      var str ="<strong class='joinerName'>신청자 : " + joiner.joinerId + "</strong>   " 
              +"<span class='joinerCondition'>신청여부 : " + joiner.joinerCondition +"</span>   "
            +"<button type=\"button\" class=\"btnUpdFrm\">수정</button>"
            +"<button type=\"button\" class=\"btnDel\">삭제</button>"
      div.html(str);
      return div;
   }
   
</script>
<script>
   $(document).ready(function() {
      $.ajax({
         url : '/app/ajax/getJoinerList',
         data : {
            'partnerId' : '${partner.partnerId}'
         },
         //type : 'post',
         dataType : 'json',
         success : function(data) {
            alert(data);
            $('#aads').html(data);

         }
      });
   });
   function del(partnerid) {
      if (confirm("삭제하시겠습니까?")) {
         location.href = "./deletePartner?partnerId=" + partnerId;
      } else {
         return;
      }
   };

   //동행 신청 목록 조회
   function loadJoinerList() {
      var params = {
         partnerid : '${partner.partnerId}'
      };
      $.getJSON("getJoinerList", params, function(datas) {
         for (i = 0; i < datas.length; i++) {
            var div = JoinerView(datas[i]);
            $(div).appendTo("#JoinerList")
         }
      });
   }
   function JoinerView(joiner) {
      var div = $("<div>");
      div.attr("id", "c" + joiner.joinerid);
      div.addClass('joiner');
      div[0].comment = comment; //{id:1,.... }

      var str = "<strong class='partnerName'>동행 신청자 : " + joiner.userid
            + "</strong>   " + "<span class='commentContent'>신청일 : "
            + joiner.joinerdate + "</span>   "
            + "<button type=\"button\" class=\"btnDel\">신청취소</button>"
      div.html(str);
      return div;
   }

   $(function() {
      loadJoinerList();
      //동행 신청 취소 이벤트
      $("#joinerList").on("click", ".btnDel", function() {
         var seq = $(this).parent().attr("id").substr(1);
         if (confirm("삭제할까요?")) {
            var params = "seq=" + seq; // { seq : seq };
            var url = "deleteJoiner";
            $.getJSON(url, params, function(datas) {
               $('#c' + datas.seq).remove();
            });
         }
      });
      //동행 신청 등록처리
      $("#btnAdd").click(function() {
         var params = $("#addForm").serialize();
         console.log(params);
         $.getJSON("insertJoiner", params, function(datas) {
            var div = makeCommentView(datas);
            $(div).prependTo("#joinerList");
         });
      }); //end btnAdd clcic event
   }); //$() end ready event
</script>
<script>
   $(document).ready(function() {
      $.ajax({
         url : '/app/ajax/getJoinerList',
         data : {
            'partnerId' : '${partner.partnerId}'
         },
         //type : 'post',
         dataType : 'json',
         success : function(data) {
            alert(data);
            $('#aads').html(data);

         }
      });
   });
   function del(partnerid) {
      if (confirm("삭제하시겠습니까?")) {
         location.href = "./deletePartner?partnerId=" + partnerId;
      } else {
         return;
      }
   };

   //동행 신청 목록 조회
   function loadJoinerList() {
      var params = {
         partnerid : '${partner.partnerId}'
      };
      $.getJSON("getJoinerList", params, function(datas) {
         for (i = 0; i < datas.length; i++) {
            var div = JoinerView(datas[i]);
            $(div).appendTo("#JoinerList")
         }
      });
   }
   function JoinerView(joiner) {
      var div = $("<div>");
      div.attr("id", "c" + joiner.joinerid);
      div.addClass('joiner');
      div[0].comment = comment; //{id:1,.... }

      var str = "<strong class='partnerName'>동행 신청자 : " + joiner.userid
            + "</strong>   " + "<span class='commentContent'>신청일 : "
            + joiner.joinerdate + "</span>   "
            + "<button type=\"button\" class=\"btnDel\">신청취소</button>"
      div.html(str);
      return div;
   }

   $(function() {
      loadJoinerList();
      //동행 신청 취소 이벤트
      $("#joinerList").on("click", ".btnDel", function() {
         var seq = $(this).parent().attr("id").substr(1);
         if (confirm("삭제할까요?")) {
            var params = "seq=" + seq; // { seq : seq };
            var url = "deleteJoiner";
            $.getJSON(url, params, function(datas) {
               $('#c' + datas.seq).remove();
            });
         }
      });
      //동행 신청 등록처리
      $("#btnAdd").click(function() {
         var params = $("#addForm").serialize();
         console.log(params);
         $.getJSON("insertJoiner", params, function(datas) {
            var div = makeCommentView(datas);
            $(div).prependTo("#joinerList");
         });
      }); //end btnAdd clcic event
   }); //$() end ready event
</script>
<script>
   $(document).ready(function() {
      $.ajax({
         url : '/app/ajax/getJoinerList',
         data : {
            'partnerId' : '${partner.partnerId}'
         },
         //type : 'post',
         dataType : 'json',
         success : function(data) {
            alert(data);
            $('#aads').html(data);

         }
      });
   });
   function del(partnerid) {
      if (confirm("삭제하시겠습니까?")) {
         location.href = "./deletePartner?partnerId=" + partnerId;
      } else {
         return;
      }
   };

   //동행 신청 목록 조회
   function loadJoinerList() {
      var params = {
         partnerid : '${partner.partnerId}'
      };
      $.getJSON("getJoinerList", params, function(datas) {
         for (i = 0; i < datas.length; i++) {
            var div = JoinerView(datas[i]);
            $(div).appendTo("#JoinerList")
         }
      });
   }
   function JoinerView(joiner) {
      var div = $("<div>");
      div.attr("id", "c" + joiner.joinerid);
      div.addClass('joiner');
      div[0].comment = comment; //{id:1,.... }

      var str = "<strong class='partnerName'>동행 신청자 : " + joiner.userid
            + "</strong>   " + "<span class='commentContent'>신청일 : "
            + joiner.joinerdate + "</span>   "
            + "<button type=\"button\" class=\"btnDel\">신청취소</button>"
      div.html(str);
      return div;
   }

   $(function() {
      loadJoinerList();
      //동행 신청 취소 이벤트
      $("#joinerList").on("click", ".btnDel", function() {
         var seq = $(this).parent().attr("id").substr(1);
         if (confirm("삭제할까요?")) {
            var params = "seq=" + seq; // { seq : seq };
            var url = "deleteJoiner";
            $.getJSON(url, params, function(datas) {
               $('#c' + datas.seq).remove();
            });
         }
      });
      //동행 신청 등록처리
      $("#btnAdd").click(function() {
         var params = $("#addForm").serialize();
         console.log(params);
         $.getJSON("insertJoiner", params, function(datas) {
            var div = makeCommentView(datas);
            $(div).prependTo("#joinerList");
         });
      }); //end btnAdd clcic event
   }); //$() end ready event
</script>
<script>
   $(document).ready(function() {
      $.ajax({
         url : '/app/ajax/getJoinerList',
         data : {
            'partnerId' : '${partner.partnerId}'
         },
         //type : 'post',
         dataType : 'json',
         success : function(data) {
            alert(data);
            $('#aads').html(data);

         }
      });
   });
   function del(partnerid) {
      if (confirm("삭제하시겠습니까?")) {
         location.href = "./deletePartner?partnerId=" + partnerId;
      } else {
         return;
      }
   };

   //동행 신청 목록 조회
   function loadJoinerList() {
      var params = {
         partnerid : '${partner.partnerId}'
      };
      $.getJSON("getJoinerList", params, function(datas) {
         for (i = 0; i < datas.length; i++) {
            var div = JoinerView(datas[i]);
            $(div).appendTo("#JoinerList")
         }
      });
   }
   function JoinerView(joiner) {
      var div = $("<div>");
      div.attr("id", "c" + joiner.joinerid);
      div.addClass('joiner');
      div[0].comment = comment; //{id:1,.... }

      var str = "<strong class='partnerName'>동행 신청자 : " + joiner.userid
            + "</strong>   " + "<span class='commentContent'>신청일 : "
            + joiner.joinerdate + "</span>   "
            + "<button type=\"button\" class=\"btnDel\">신청취소</button>"
      div.html(str);
      return div;
   }

   $(function() {
      loadJoinerList();
      //동행 신청 취소 이벤트
      $("#joinerList").on("click", ".btnDel", function() {
         var seq = $(this).parent().attr("id").substr(1);
         if (confirm("삭제할까요?")) {
            var params = "seq=" + seq; // { seq : seq };
            var url = "deleteJoiner";
            $.getJSON(url, params, function(datas) {
               $('#c' + datas.seq).remove();
            });
         }
      });
      //동행 신청 등록처리
      $("#btnAdd").click(function() {
         var params = $("#addForm").serialize();
         console.log(params);
         $.getJSON("insertJoiner", params, function(datas) {
            var div = makeCommentView(datas);
            $(div).prependTo("#joinerList");
         });
      }); //end btnAdd clcic event
   }); //$() end ready event
</script>
</head>
<body>
   <section class="about_us_area" id="about">
      <div class="container">
         <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
               <div class="single-pricing-table">
                  <div class="pricing-title">
                     <h2 style="color: black">여행목적</h2>
                  </div>
                  <ul class=price-list>
                     <li><a href="getPartnerList" style="color: black">전체보기</a></li>
                     <li><a href="*" style="color: black">여행</a></li>
                     <li><a href="*" style="color: black">문화</a></li>
                     <li><a href="*" style="color: black">맛집</a></li>
                     <li><a href="*" style="color: black">교통</a></li>
                     <li><a href="*" style="color: black">숙소</a></li>
                  </ul>
               </div>
            </div>
            <div class=" col-sm-6" style="min-width: 700px">
               <div class="table-responsive" style="min-height: 450px;">
                  <p style="clear: both">
                  <table class="table table-hover">
                     <thead>
                        <tr>
                           <th colspan="10"
                              style="background-color: #eeeeee; text-align: center;">동행
                              게시판 글쓰기</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td style="text-align: left;" colspan="11">카테고리 >
                              ${partner.partnerClass}</td>
                        </tr>
                        <tr>
                           <td colspan="1">No.${partner.partnerId}</td>
                           <td colspan="3">글제목 : ${partner.partnerTitle}</td>
                           <td colspan="3">${partner.userId}</td>
                           <td colspan="3">${partner.partnerDate}</td>
                        </tr>
                        <tr>
                           <td colspan="2">여행지 : 일단보류</td>
                           <td colspan="4">비용 : ${partner.partnerPay}</td>
                           <td colspan="4">인원 : ${partner.partnerPers}</td>
                        </tr>
                        <tr>
                           <td colspan="2">출발일 : ${partner.partnerStart}</td>
                           <td colspan="8">도착일 : ${partner.partnerEnd}</td>
                        </tr>
                        <tr>
                           <td colspan="10">${partner.partnerContent}</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
            <c:if test="${sessionScope.login.userId eq partner.userId}">
               <div class="order-buton" style="float: right">
                  <a href="./updatePartnerForm?partnerId=${partner.partnerId}">수정</a>&nbsp;&nbsp;
                  <button class="submit-btn" onclick="del('${partner.partnerId}')">삭제</button>
                  <a href="${pageContext.request.contextPath}/getPartnerList">뒤로가기</a>
               </div>
            </c:if>
         </div>
         <h3>동행 신청 리스트</h3>
         <div id="joinerList"></div>
         <!-- 동행 신청  -->
         <div id="joinerAdd" class="order-buton" style="float: right">
            <form name="addForm" id="addForm">
               <input type="hidden" name="partnerId" value="${partner.partnerId}">
               이름: <input type="text" name="name" size="10"><br/>
               내용: <textarea name="content" cols="20" rows="2"></textarea><br/>
               <input type="button" value="등록" id="btnAdd"/>
            </form>
         </div>
      </div>
   </section>
</body>
</html>