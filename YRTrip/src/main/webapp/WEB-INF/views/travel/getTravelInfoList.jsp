<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
	//댓글목록조회처리
	loadTravelInfoList();
	
	//댓글목록조회 요청	
function loadTravelInfoList(){
	$.getJSON("getTravelInfoList", function(datas){
		for(i=0; i<datas.length; i++){
			var tr = makeTravelInfoListView(datas[i]);
			$(tr).appendTo("#travelInfoList");
		}
	});
} 	// end of loadCommentList

	function makeTravelInfoListView(travelInfo){
	var tr = $("<tr>"); 
	tr.addClass('travelInfo');
	tr[0].travelInfo=travelInfo;  //{id:1,.... }
	
	var str ="<strong class='tinfoId'>" + travelInfo.tinfoId + "</strong>" 
	        +"<span class='commentContent'>" + travelInfo.tInfoCountry +"</span>"
	tr.html(str);
	return tr;
} 
});
</script>
</head>
<body>

<div>목록
		<table border="1">
			<thead>
			<tr>
				<th>장소번호</th>
				<th>나라</th>
				<th>주/도</th>
				<th>도시명</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
</div>

</body>
</html>