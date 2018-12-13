<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<!-- 
상품글번호 1 ITEM_ID
상품명 유심  ITEM_NAME
가격 3000 ITEM_PRICE
수량 1 ITEM_EA
상품상세정보 사세여........ ITEM_CONTENT
결제방법 카드결제/현금결제/ ITEM_METHOD
카테고리 유심(db에는 카테고리1이렇게 들어가있음) ITEM_CATEGORY
판매자 회원아이디(fk) user1 SELLER_ID
구매가능여부 구매가능/구매불가 ITEM_ORDERDETAIL
상품별점 0.0-5.0 ITEM_STAR
상품사진 주소값넣기 ITEM_PIC
작성날짜 sysdate ITEM_DATE
상품상태 : 중고/ 새상품/ 하자있음... ITEM_CONDITION
상품 좋아요 별점 0+ ITEM_LIKE - 위시리스트 -> 좋아요로 바꾸고 좋아요한 목록에서 볼수있도록 
-->

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <!-- 제품명들어갈듯 -->
  <title>제품 상세 페이지</title>

  <!-- Bootstrap core CSS -->
  <!--  product.bootstrap.min.css 이거 어쩌냐ㅠㅠ -->
  <link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"> -->
  <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
  <!-- Custom styles for this template -->
  <!-- <link href="./css/shop-homepage.css" rel="stylesheet"> -->
  <!-- <link href="resources/css/product.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz">
  <script>
    var slideIndex = 0;
    $('#myCarousel').on('slide.bs.carousel', function () {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
      }
      slideIndex++;
      if (slideIndex > slides.length) { slideIndex = 1 }
      slides[slideIndex - 1].style.display = "block";
      setTimeout(showSlides, 2000); // Change image every 2 seconds
    })
    </script>
</head>

<body>

 <section class="about_us_area" id="about">

  <!-- Page Content 전체 바디 -->
  <div class="container">

    <div class="row">
      <!-- 시작 : 사이드 :  3-->
      <div class="container col-lg-3">
					<div class="single-pricing-table">
						<div class="pricing-title">
							<h2 style="color: black">카테고리</h2>
						</div>
						<ul class="price-list">
							<li><a href="getProductList" style="color: black">전체보기</a></li>
							<li><a href="#" style="color: black">의류</a></li>
							<li><a href="#" style="color: black">티켓/쿠폰</a></li>
							<li><a href="#" style="color: black">전자기기</a></li>
							<li><a href="#" style="color: black">여행도서</a></li>
							<li><a href="#" style="color: black">USIM</a></li>
							<li><a href="#" style="color: black">기타</a></li>
						</ul>
						<div class="order-buton">
							<a href="#">상품요 청</a>
						</div>
						<div class="order-buton">
							<a href="#">상품등록</a>
						</div>
					</div>
				</div>
      <!-- 끝 : 사이드 : 3-->
      <!-- 시작 : 내용 : 9-->
      <div class="container col-lg-8">

        <div class="card mb-10">
          <div class="card-header">
            <nav class="header-navigation">
              <a href="#" class="btn btn-link"> ← 이전으로 돌아가기 </a>

              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">유심</a></li>
                <li class="breadcrumb-item"><a href="#">유심</a></li>
                <li class="breadcrumb-item"><a href="#">유시이임</a></li>
                <li class="breadcrumb-item active" aria-current="page">현재 유심페이지!</li>
              </ol>

              <div class="btn-group">
                <a href="#" class="btn btn-link btn-share">공유하기</a>
                <a href="#" class="btn btn-link">이건 뭔 링크버튼?</a>
              </div>
            </nav>
          </div>
          <div class="card-body store-body">
            <!-- 왼쪽 -->
            <div class="product-info">
              <!-- 왼쪽 갤러리(사진들만) -->
              <div class="product-gallery">
                <div class="product-gallery-featured">
                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                      <div class="carousel-item active img-fluid">
                        <img class="d-block w-100" src="https://via.placeholder.com/350x350/ffcf5b" alt="First slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100 img-fluid" src="https://via.placeholder.com/350x350/ffcf5b">
                      </div>
                      <div class="carousel-item img-fluid">
                        <img class="d-block w-100" src="https://via.placeholder.com/350x350/ffcf5b" alt="Third slide">
                      </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
                </div>
              </div>
              
              <!-- 오른쪽 아래 -->
               <div class="product-payment-details">
              <p class="last-sold text-muted"><small>몇개팔렸을까여?</small><small class="pull-right">작성일</small></p>
              <h4 class="product-title mb-2">상품명 입니다 상품명을 길게 막 적어도 보고 짧게 적어봐도 되는데 걍 막 적어봤습니다</h4>
              <h2 class="product-price display-2">￦12,000</h2>
              <p class="mb-0"><i class="fa fa-truck"></i>중고 <small class="pull-right text-success">구매가능</small> </p>
              <div class="text-muted mb-2"><small>약간의 사용감이 있습니다!</small></div>
              <!-- 구매가능하면 text-success 
              구매불가하면 text-danger -->

              <label for="quant">수량</label>
              <input type="number" name="quantity" min="1" id="quant" class="form-control mb-5 input-lg" placeholder="1개 이상 선택하세요">

              <button class="btn btn-lg btn-block btn-primary">구매하기</button><button class="btn  btn-lg btn-block btn-light">위시리스트</button>

            </div>
              <div class="product-seller-recommended">
                <h3 class="mb-5">판매자의 다른 상품 </h3>
                <!-- 상품이 없으면 어떻하지? 아무것도 안 뜨게 해야하나???-->
                <div class="row">
                  <!-- <div class="recommended-items card-deck"> -->
                  <div class="col-md-4">
                    <div class="card">
                      <img src="https://via.placeholder.com/157x157" class="card-img-top">
                      <div class="card-body">
                        <h5 class="card-title">판매자 다른 상품 이름</h5>
                        <span class="text-muted">￦ 12,000</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card">
                      <img src="https://via.placeholder.com/157x157" class="card-img-top">
                      <div class="card-body">
                        <h5 class="card-title">판매자 다른 상품 이름1 </h5>
                        <span class="text-muted">￦ 12,000</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="card">
                      <img src="https://via.placeholder.com/157x157" class="card-img-top">
                      <div class="card-body">
                        <h5 class="card-title">판매자 다른 상품 이름1 </h5>
                        <span class="text-muted">￦ 12,000</span>
                      </div>
                    </div>
                  </div>
            
                  <!-- </div> -->
                </div>
                <!-- /.recommended-items-->
                <p class="mb-5 mt-5"><a href="#">판매자의 모든 상품 보러가기!</a></p>
                <div class="product-description mb-5">
                  <h2 class="mb-5">제품 기본정보</h2>
                  <dl class="row mb-5">
                    <dt class="col-sm-4">상품명</dt>
                    <dd class="col-sm-8">${product.itemName}</dd>
                    <dt class="col-sm-4">가격</dt>
                    <dd class="col-sm-8">${product.itemPrice}</dd>
                    <dt class="col-sm-4">수량</dt>
                    <dd class="col-sm-8">${product.itemEa}</dd>
                    <dt class="col-sm-4">선호결제방법</dt>
                    <dd class="col-sm-8">${product.itemMethod}</dd>
                    <dt class="col-sm-4">구매가능여부</dt>
                    <dd class="col-sm-8">${product.itemOrderdetail}</dd>
                    <dt class="col-sm-4">상품상태</dt>
                    <dd class="col-sm-8">${product.itemCondition}</dd>
                    <dt class="col-sm-4">작성일</dt>
                    <dd class="col-sm-8">${product.itemDate}</dd>
                    <dt class="col-sm-4">판매자명</dt>
                    <dd class="col-sm-8">${product.sellerId}</dd>
                  </dl>
                  <h2 class="mb-5">제품 상세 설명</h2>
                  <p>${product.itemContent}</p>
                </div>
                <div class="product-faq mb-5">
                  <h2 class="mb-3">Q/A라고 쓰고 큐엔에이라고 읽</h2>
                  <p class="text-muted">판매자에게 상품에 대한 질문을 해보세여!</p>
                  <div class="main-questions d-inline" data-container="body" data-toggle="popover" data-placement="right"
                    data-content="Are you in doubt? these shortcuts can help you!">
                    <a href="#" class="btn btn-outline-primary">판매자에게메세지</a>
                    <a href="#" class="btn btn-outline-primary">???????????????</a>
                    <a href="#" class="btn btn-outline-primary">이건질문들옵션창같은데</a>
                  </div>
                </div>
                <div class="product-comments">
                  <h5 class="mb-2">????님의 후기가 필요해요!</h5>
                  <form action="" class="form-inline mb-5">
                    <textarea name="" id="" cols="50" rows="2" class="form-control mb-4" placeholder="마구마구 써보세여"></textarea>
                    <button class="btn btn-lg-12 btn-primary">질문을해보자</button>
                  </form>
                  <h5 class="mb-5">최근 댓글</h5>
                  <ol class="list-unstyled last-questions-list">
                    <li><i class="fa fa-comment"></i> <span>Hello david, can i pay with credit card?</span></li>
                    <li><i class="fa fa-comment"></i> <span>can i send it to another address?</span></li>
                  </ol>
                </div>
              </div>
            </div>
           
          </div>
        </div>

      </div>
      <!-- 끝 : 내용 : 9-->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container 전체 바디끝-->
</section>

  <!-- Bootstrap core JavaScript -->
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>