<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>여행게시판 글 등록</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/vender/css/Travel.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<style>
.modal-backdrop {
	z-index: -1;
}

.nav>li>a:focus, .nav>li>a:hover {
	background-color: white;
}

#map {
	height: 400px;
}

.controls {
	background-color: #fff;
	border-radius: 2px;
	border: 1px solid transparent;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
	box-sizing: border-box;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	height: 29px;
	margin-left: 17px;
	margin-top: 10px;
	outline: none;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 400px;
}

.controls:focus {
	border-color: #4d90fe;
}

.title {
	font-weight: bold;
}

#infowindow-content {
	display: none;
}

#map #infowindow-content {
	display: inline;
}
</style>
<script>
$(function(){
    var travelMenu = document.getElementById("travelMenu");
    travelMenu.className='current-menu-item';
});
$(document).ready(function(){
	/* 파일업로드 */
	$("#fileInput").on('change', function(){ 
		if(window.FileReader){ 
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#userfile").val(filename);
	});
});
</script>
</head>
<body>

<section class="about_us_area" id="about">
	<div class="container">
		<div class="row">

			<!-- 왼쪽 사이드바 -->
			<div class="col-md-4 col-lg-4 col-sm-4 col-xs-12 text-center">
				<div class="single-pricing-table">
                        <div class="pricing-title">
                            <h2 style="color:black">여행정보</h2>
                        </div>
                        <ul class=price-list>
                            <li><a href="./getTravelBoardList" style="color:black">전체 여행기</a></li>
                            <li><a href="./getBestTravelList" style="color:black">베스트 여행기</a></li>
                            <li><a href="./getTravelPlaceList" style="color:black"><strong>세계의 여행지</strong></a></li>
                        </ul>
	                    <div class="order-buton" style="padding-bottom:30px;">
	                        <a href="./insertTravelPlaceform" style="text-decoration:none; color:#fff;"><strong>세계의 여행지 등록</strong></a>
	                    </div>                   
				</div>
			</div>

			<!-- 검색 창 -->
			<div>
				<div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:450px;">		
<!-- 등록폼 -->
 <form class="form" action="./updateTravelPlace" method="post" enctype="multipart/form-data">
								<input id="pac-input" class="controls" type="text"
									placeholder="다녀온 장소를 검색하세요.">
								<div id="map"></div>
								<div id="infowindow-content">
									<span id="place-name" class="title"></span>
									<span id="place-address"></span>
								</div>
									<div class="form-group">
										<label for="placeTitle" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeTitle" class="form-control" value="${travelPlace.placeTitle}" required>
									</div>
									<div class="form-group">
										<label for="placeName" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" id="placeName" name="placeName" class="form-control" value="${travelPlace.placeName}" required>
									</div>
									<div class="form-group">
										<label for="placeAddress" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" id="placeAddress" name="placeAddress" class="form-control" value="${travelPlace.placeAddress}" required>
									</div>
									<div class="form-group">
										<label for="placeContent" class="text-info" style="color:#5f768b;"></label><br>
										<textarea class="form-control" rows="3" name="placeContent" required>${travelPlace.placeContent}</textarea>
									</div>
									<input type="file" name="placePicFile"
						 							id="fileInput" data-class-button="btn btn-default"
													data-class-input="form-control" data-icon-name="fa fa-upload"
													class="form-control" tabindex="-1" style="position: absolute;
													clip: rect(0px, 0px, 0px, 0px);">
												<div class="bootstrap-filestyle input-group">
													<input type="text" id="userfile" class="form-control"
														name="userfile" disabled="">
													<span class="group-span-filestyle input-group-btn" tabindex="0">
														<label for="fileInput" class="btn btn-default ">
															<span class="glyphicon fa fa-upload"></span>
														</label>
													</span>
												</div>
									<div class="form-group">
										<label for="placeVisitDate" class="text-info" style="color:#5f768b;"></label><br>
										<input type="text" name="placeVisitDate" class="form-control datePicker" value="${fn:substring(travelPlace.placeVisitDate, 0, 10)}" required>
									</div>
									<div class="form-group">
										<label for="remember-me" class="text-info"></label>
										<input type="submit" name="submit" class="btn btn-info btn-md"  style="background-color:#f9bf3b; border:#f9bf3b; float:right;" value="등록">
									</div>
									<input type="hidden" name="placeNo" value="${travelPlace.placeNo}">
									<input type="hidden" name="travelNo" value="0">
									<input type="hidden" name="userId" value="${sessionScope.login.userId}">
									
									
 			</form>

			</div>	<!-- end of table-responsive -->
				</div></div></div></div></section>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
/* datepicker */
$(function() {
    $( ".datePicker" ).datepicker({   
    	changeMonth: true, 
        changeYear: true,
        nextText: '다음 달',
        prevText: '이전 달',
        showButtonPanel: true, 
        currentText: '오늘 날짜', 
        closeText: '닫기', 
        dateFormat: "yymmdd",
        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
        monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
        maxDate: "+0D",
        showMonthAfterYear : true,
        yearRange: "-100:+0"
    });
    }); 
    
/* 지도 */
function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 37.565598, lng: 126.978031},
          zoom: 13
        });

        var input = document.getElementById('pac-input');

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });

        autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }

          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }

          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);

          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = place.formatted_address;
          infowindow.open(map, marker);

          document.getElementById("placeName").value= place.name;
          document.getElementById("placeAddress").value= place.formatted_address;
        });
      }
</script>

</body>
</html>