<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	page import="java.util.ArrayList" %>
<%! int partnerhit,partnerno; String partnertitle,partnerclass,partnerpay,partnerdate, userid, partnercondition; %>
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
                    <h2>동행 게시판</h2>
                </div>
               <div class="col-md-offset-1 col-sm-6">
                    	<table class="table table-hover">
								<!-- 동행구하기 테이블 헤더부분 -->
                            	<thead>
                            		<tr>                      					
                            			<th>글제목</th>
                            			<th>글쓴이</th>
                            			<th>문화</th>
                            			<th>게시일</th>
                            			<th>여행경비</th>
                            			<th>진행상태</th>
                            		</tr>
                            	</thead>
								<tbody>
								<c:forEach items="${partnerList}" var="partner">
                                <tr>
                                    <td><a href="./getPartner?partnerno=${partner.partnerno}">${partner.partnertitle}</a></td>
                                    <td>${partner.userid}</td>
                                    <td>${partner.partnerclass}</td>
                                    <!-- 여행 경비 넣는 부분 -->
                                    <td>${partner.partnerpay}</td>
                                    <td class="tbl-apply"><a href="#">${partner.condition}</a></td>
                                </tr>
                                <!-- 페이징처리 -->
                                <!-- 숨긴 페이징 부분 hide jobs -->
                                </c:forEach>
                                </tbody>
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