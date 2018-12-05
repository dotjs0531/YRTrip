<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:900i"
	rel="stylesheet">
<link rel="stylesheet" href="resources/vender/css/index.css">
	<title>YOUR REAL TRIP:-)</title>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document).ready(
			function($) {

				var bArray = [];
				var sArray = [ 4, 6, 8, 10, 12, 14, 16, 18 ];

				for (var i = 0; i < $('.bubbles').width(); i++) {
					bArray.push(i);
				}

				function randomValue(arr) {
					return arr[Math.floor(Math.random() * arr.length)];
				}

				setInterval(function() {

					var size = randomValue(sArray);

					$('.bubbles').append(
							'<div class="individual-bubble" style="left: '
									+ randomValue(bArray) + 'px; width: '
									+ size + 'px; height:' + size
									+ 'px;"></div>');

					$('.individual-bubble').animate({
						'bottom' : '100%',
						'opacity' : '-=0.7'
					}, 1500, function() {
						$(this).remove()
					});

				}, 350);

			});
</script>
</head>
<body style="overflow-x: hidden; overflow-y: hidden">
	<div>
		<video id="videobcg" preload="auto" autoplay="autoplay" loop="loop"
			muted="muted" poster="resources/media/main-image.jpg">
			<source src="resources/media/main-video.mp4" type="video/mp4">
			<source src="resources/media/main-video.webm" type="video/webm">
			Your browser does not support the video tag.
		</video>
		<div class="bubbles">
			<h1>
				<a href="main.html">For Your REAL Trip!</a>
			</h1>
		</div>
	</div>
</body>
</html>
