<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 게시판 리스트</title>
</head>
<body>
<!-- 동행 게시판 테이블 부분 -->
            <div class="container">
                <div class="row page-title text-center wow bounce"  data-wow-delay="1s">
                    <h5>소제목 부분</h5>
                    <h2><span></span> 동행 게시판</h2>
                </div>
                <div class="row jobs">
                    <div class="col-md-9">
                        <div class="job-posts table-responsive">
                            <table class="table">
                            	<!-- 동행구하기 유저 1부분 -->
                                <tr class="odd wow fadeInUp" data-wow-delay="1s">
                                    <td class="tbl-logo"><img src="img/job-logo1.png" alt=""></td>
                                    <td class="tbl-title"><h4>동행유저 1 제목부분<br><span class="job-type">추가 사항</span></h4></td>
                                    <td><p>글쓴이</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 1 부분</p></td>
                                    <!-- 여행 경비 넣는 부분 -->
                                    <td><p>ex) 200,000원</p></td>
                                    <td class="tbl-apply"><a href="#">완료</a></td>
                                </tr>
                                <!-- 동행구하기 유저 2부분 -->
                                <tr class="even wow fadeInUp" data-wow-delay="1.1s">
                                    <td class="tbl-logo"><img src="img/job-logo2.png" alt=""></td>
                                    <td class="tbl-title"><h4>동행유저 2 제목부분<br><span class="job-type">full time</span></h4></td>
                                    <td><p>Jolil corporation</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 2 부분</p></td>
                                    <td><p>&wond; 14000</p></td>
                                    <td class="tbl-apply"><a>미완료</a></td>
                                </tr>
                                <!-- 동행구하기 유저 3부분 -->
                                <tr class="odd wow fadeInUp" data-wow-delay="1.2s">
                                    <td class="tbl-logo"><img src="img/job-logo3.png" alt=""></td>
                                    <td class="tbl-title"><h4>동행유저 3 제목부분<br><span class="job-type">full time</span></h4></td>
                                    <td><p>Fanta bevarage</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 3 부분</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">완료</a></td>
                                </tr>
                                <tr class="even wow fadeInUp" data-wow-delay="1.3s">
                                    <td class="tbl-logo"><img src="img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>동행유저 4 제목부분<br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 4 부분</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">미완료</a></td>
                                </tr>
                                <tr class="odd wow fadeInUp" data-wow-delay="1.4s">
                                    <td class="tbl-logo"><img src="img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>동행유저 5 제목부분<br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 5 부분</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">완료</a></td>
                                </tr>
                                <!-- 숨긴 페이징 부분 hide jobs -->
                                <tr class="even hide-jobs">
                                    <td class="tbl-logo"><img src="img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>여행 지역 6 부분</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd hide-jobs">
                                    <td class="tbl-logo"><img src="img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="even hide-jobs">
                                    <td class="tbl-logo"><img src="img/job-logo4.png" alt=""></td>
                                    <td class="tbl-title"><h4>Internship Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Google</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                                <tr class="odd hide-jobs">
                                    <td class="tbl-logo"><img src="img/job-logo5.png" alt=""></td>
                                    <td class="tbl-title"><h4>Software Designer <br><span class="job-type">full time</span></h4></td>
                                    <td><p>Microsoft</p></td>
                                    <td><p><i class="icon-location"></i>San Franciso, USA</p></td>
                                    <td><p>&dollar; 14000</p></td>
                                    <td class="tbl-apply"><a href="#">Apply now</a></td>
                                </tr>
                            </table>
                        </div>
                        
                        
                        
                        
                        
                        
                        <div class="more-jobs">
                            <a href=""> <i class="fa fa-refresh"></i>더 보기</a>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>