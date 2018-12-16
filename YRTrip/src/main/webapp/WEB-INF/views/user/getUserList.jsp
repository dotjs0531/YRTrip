<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <section class="about_us_area" id="about">
        <div class="container">
            <div class="row">
                <div class="col-sm-6" style="min-width:700px">
                	<div class="table-responsive" style="min-height:420px;">
                    	<table class="table table-hover">
                    		<thead>
                    			<tr>
                    				<th>아이디</th>
                    				<th>비밀번호</th>
                    			</tr>
                    		</thead>
                    		<tbody>
                    		<c:forEach items="${userList}" var="user">
								<tr>
									<td>${user.userId}</td>
									<td>${user.userPw}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>