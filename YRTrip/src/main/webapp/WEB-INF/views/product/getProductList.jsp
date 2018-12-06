<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
 
  <title>상품</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/css/product.bootstrap.min.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >

  <!-- Custom styles for this template -->
    <link href="resources/css/product.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="container col-lg-3">

        <h1 class="my-4">상품</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">전체보기</a>
          <a href="#" class="list-group-item">의류</a>
          <a href="#" class="list-group-item">잡화</a>
          <a href="#" class="list-group-item">티켓/쿠폰</a>
          <a href="#" class="list-group-item">캐리어</a>
          <a href="#" class="list-group-item">전자기기</a>
          <a href="#" class="list-group-item">여행도서</a>
          <a href="#" class="list-group-item">USIM</a>
          <a href="#" class="list-group-item">기타</a>
          <a href="#" class="list-group-item">상품요청</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <!-- 여기서 부터 가운데 창! -->
      <div class="container col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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
        <!--상품상세 페이지-->
        <div class="col-lg-container">
          <div class="row">
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="http://tech.firstpost.com/wp-content/uploads/2014/09/Apple_iPhone6_Reuters.jpg" alt="" class="img-fluid">
                <div class="caption">
                  <h4 class="pull-right">${product.itemPrice}</h4>
                  <h4><a href="#">${product.itemName}</a></h4>
                  <p>${product.itemContent}</p>
                  <p>${product.itemOrderdetail}</p>
                  <p>${product.itemCategory}</p>
                  <p>${product.itemCondition}</p>
                </div>
                <div class="ratings text-center">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <a href="#">(15 reviews)</a>
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                  <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i
                      class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="http://tech.firstpost.com/wp-content/uploads/2014/09/Apple_iPhone6_Reuters.jpg" alt="" class="img-fluid">
                <div class="caption">
                  <h4 class="pull-right">$700.99</h4>
                  <h4><a href="#">Mobile Product</a></h4>
                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                    the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                    type and scrambled it to make a type specimen book.</p>
                </div>
                <div class="ratings text-center">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <a href="#">(15 reviews)</a>
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                  <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i
                      class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="http://tech.firstpost.com/wp-content/uploads/2014/09/Apple_iPhone6_Reuters.jpg" alt="" class="img-fluid">
                <div class="caption">
                  <h4 class="pull-right">$700.99</h4>
                  <h4><a href="#">Mobile Product</a></h4>
                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                    the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                    type and scrambled it to make a type specimen book.</p>
                </div>
                <div class="ratings text-center">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <a href="#">(15 reviews)</a>
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                  <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i
                      class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="thumbnail">
                <img src="http://tech.firstpost.com/wp-content/uploads/2014/09/Apple_iPhone6_Reuters.jpg" alt="" class="img-fluid">
                <div class="caption">
                  <h4 class="pull-right">$700.99</h4>
                  <h4><a href="#">Mobile Product</a></h4>
                  <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                    the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                    type and scrambled it to make a type specimen book.</p>
                </div>
                <div class="ratings text-center">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <a href="#">(15 reviews)</a>
                  </p>
                </div>
                <div class="space-ten"></div>                
                <div class="btn-ground text-center">
                  <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i
                      class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
            </div>
          </div>
        </div>

        <!-- 팝업창 -->
        <div class="modal fade product_view" id="product_view">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">                
                <a href="#" data-dismiss="modal" class="class pull-left"><span class="glyphicon glyphicon-remove"></span></a>
                <h3 class="modal-title">상품명</h3>                
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="col-md-6 product_img">
                    <img src="http://img.bbystatic.com/BestBuy_US/images/products/5613/5613060_sd.jpg" class="img-fluid">
                  </div>
                  <div class="col-md-6 product_content">
                    <h4><span class="pull-right">제품번호: 1231434</span></h4>
                    <div class="rating">
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      5.0<!-- rating  -->
                    </div>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been
                      the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of
                      type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the
                      printing and typesetting industry.</p>
                    <h3 class="cost"><span class="glyphicon glyphicon-usd"></span> 75.00 <small class="pre-cost"><span
                          class="glyphicon glyphicon-usd"></span> 60.00</small></h3>
                    <div class="row">
                      <div class="col-md-4 col-sm-6 col-xs-12">
                        <select class="form-control" name="select">
                          <option value="" selected="">Color</option>
                          <option value="black">Black</option>
                          <option value="white">White</option>
                          <option value="gold">Gold</option>
                          <option value="rose gold">Rose Gold</option>
                        </select>
                      </div>
                      <!-- end col -->
                      <div class="col-md-4 col-sm-6 col-xs-12">
                        <select class="form-control" name="select">
                          <option value="">Capacity</option>
                          <option value="">16GB</option>
                          <option value="">32GB</option>
                          <option value="">64GB</option>
                          <option value="">128GB</option>
                        </select>
                      </div>
                      <!-- end col -->
                      <div class="col-md-4 col-sm-12">
                        <select class="form-control" name="select">
                          <option value="" selected="">QTY</option>
                          <option value="">1</option>
                          <option value="">2</option>
                          <option value="">3</option>
                        </select>
                      </div>
                      <!-- end col -->
                    </div>
                    <div class="space-ten"></div>
                    <div class="btn-ground">
                      <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-shopping-cart"></span>
                        Add To Cart</button>
                      <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-heart"></span> Add
                        To Wishlist</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyriddddght &copy; Your Website 2017</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</body>

</html>