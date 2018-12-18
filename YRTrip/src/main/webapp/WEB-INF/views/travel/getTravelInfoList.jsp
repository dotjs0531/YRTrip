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
	
	var context = '${pageContext.request.contextPath}';

	//목록조회 요청
	function loadTravelInfoList() {
		$.getJSON(context + "/getTravelInfoListData", function(datas){
			for(i=0; i<datas.length;i++) {
				console.log(datas);
				$("#travelInfoList").append( makeTravelInfoView(datas[i]) );
			}
		});
	
	
	function makeTravelInfoView(travelInfo){
		var div = $("<div>"); 
		div.attr("id", "t"+travelInfo.tinfoId);
		div.addClass('travelInfo');
		div[0].travelInfo=travelInfo;  //{id:1,.... }
		
		var str ="<strong class='travelInfotinfoId'>" + travelInfo.tinfoId + "</strong>" 
		        +"<span class='travelInfotinfoCountry'>" + travelInfo.tinfoCountry +"</span>"
		        +"<span class='travelInfotinfoState'>" + travelInfo.tinfoState +"</span>"
		        +"<span class='travelInfotinfoCity'>" + travelInfo.tinfoCity +"</span>"
		div.html(str);
		return div;
	}
	
	//목록 조회
	loadTravelInfoList(); 
})
</script>
</head>
<body>
<h1>getInfoListData....</h1>
<div id="travelInfo">

<div id="travelInfoList"></div>




</div>

</body>
</html>