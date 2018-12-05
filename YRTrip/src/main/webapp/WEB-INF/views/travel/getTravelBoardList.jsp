<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행게시판 목록보기</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo&amp;subset=korean"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="assist/css/getTravelBoardList.css">
<script>
	$(document).ready(function() {
		$('#pinBoot').pinterest_grid({
			no_columns : 4,
			padding_x : 10,
			padding_y : 10,
			margin_bottom : 50,
			single_column_breakpoint : 700
		});
	});

	;
	(function($, window, document, undefined) {
		var pluginName = 'pinterest_grid', defaults = {
			padding_x : 10,
			padding_y : 10,
			no_columns : 3,
			margin_bottom : 50,
			single_column_breakpoint : 700
		}, columns, $article, article_width;

		function Plugin(element, options) {
			this.element = element;
			this.options = $.extend({}, defaults, options);
			this._defaults = defaults;
			this._name = pluginName;
			this.init();
		}

		Plugin.prototype.init = function() {
			var self = this, resize_finish;

			$(window).resize(function() {
				clearTimeout(resize_finish);
				resize_finish = setTimeout(function() {
					self.make_layout_change(self);
				}, 11);
			});

			self.make_layout_change(self);

			setTimeout(function() {
				$(window).resize();
			}, 500);
		};

		Plugin.prototype.calculate = function(single_column_mode) {
			var self = this, tallest = 0, row = 0, $container = $(this.element), container_width = $container
					.width();
			$article = $(this.element).children();

			if (single_column_mode === true) {
				article_width = $container.width() - self.options.padding_x;
			} else {
				article_width = ($container.width() - self.options.padding_x
						* self.options.no_columns)
						/ self.options.no_columns;
			}

			$article.each(function() {
				$(this).css('width', article_width);
			});

			columns = self.options.no_columns;

			$article
					.each(function(index) {
						var current_column, left_out = 0, top = 0, $this = $(this), prevAll = $this
								.prevAll(), tallest = 0;

						if (single_column_mode === false) {
							current_column = (index % columns);
						} else {
							current_column = 0;
						}

						for (var t = 0; t < columns; t++) {
							$this.removeClass('c' + t);
						}

						if (index % columns === 0) {
							row++;
						}

						$this.addClass('c' + current_column);
						$this.addClass('r' + row);

						prevAll.each(function(index) {
							if ($(this).hasClass('c' + current_column)) {
								top += $(this).outerHeight()
										+ self.options.padding_y;
							}
						});

						if (single_column_mode === true) {
							left_out = 0;
						} else {
							left_out = (index % columns)
									* (article_width + self.options.padding_x);
						}

						$this.css({
							'left' : left_out,
							'top' : top
						});
					});

			this.tallest($container);
			$(window).resize();
		};

		Plugin.prototype.tallest = function(_container) {
			var column_heights = [], largest = 0;

			for (var z = 0; z < columns; z++) {
				var temp_height = 0;
				_container.find('.c' + z).each(function() {
					temp_height += $(this).outerHeight();
				});
				column_heights[z] = temp_height;
			}

			largest = Math.max.apply(Math, column_heights);
			_container.css('height', largest
					+ (this.options.padding_y + this.options.margin_bottom));
		};

		Plugin.prototype.make_layout_change = function(_self) {
			if ($(window).width() < _self.options.single_column_breakpoint) {
				_self.calculate(true);
			} else {
				_self.calculate(false);
			}
		};

		$.fn[pluginName] = function(options) {
			return this.each(function() {
				if (!$.data(this, 'plugin_' + pluginName)) {
					$.data(this, 'plugin_' + pluginName, new Plugin(this,
							options));
				}
			});
		}

	})(jQuery, window, document);
</script>
</head>
<body>
	<form action="#" method="post">
		<div class="container">
			<div class="row">
				<h2>전체 여행기</h2>
				<hr>
				<div class="right">
					<select>
						<option>정렬</option>
						<option>최근순</option>
						<option>조회수순</option>
						<option>좋아요순</option>
						<option>댓글순</option>
					</select><br>
					<br>
				</div>
				<section id="pinBoot">
					<article class="white-panel">
						<img src="http://i.imgur.com/sDLIAZD.png" alt="">
						<h4>
							<a href="#">여행글제목이야</a>
						</h4>
						<p class="right">
							By <a href="#">글쓴이야</a>
						</p>
						<hr>
						<div class="content">
							<span class="bottom"><a href="#"><i
									class="glyphicon glyphicon-share">공유하기</i></a></span> <span class="bottom"><a
								href="#"><i class="glyphicon glyphicon-heart-empty">좋아요</i></a></span>
							<span class="bottom"><a href="#"><i
									class="glyphicon glyphicon-comment">댓글</i></a></span>
						</div>
					</article>

				</section>

				<hr>
			</div>
		</div>
	</form>
</body>
</html>