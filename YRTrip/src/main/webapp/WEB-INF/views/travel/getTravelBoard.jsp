<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>여행게시판 글 상세보기</title>
</head>
<body>
	<section>
	제목사진ㅇㅇㅇㅇ
		<table border="1">
			<tr>
				<th>사진</th>
				<th>제목</th>
				<th>장소</th>
				<th>테마</th>
				<th>인원</th>
				<th>일정</th>
				<th>출발일</th>
				<th>아이디</th>
				<th>글번호</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
			<tr>
				<td>${board.travelPic}</td>
				<td>${board.travelTitle}</td>
				<td>${board.tinfoId}</td>
				<td>${board.travelWith}</td>
				<td>${board.travelPerson}</td>
				<td>${board.travelSche}</td>
				<td>${board.travelStart}</td>
				<td>${board.userId}</td>
				<td>${board.travelNo}</td>
				<td>${board.travelDate}</td>
				<td>${board.travelHit}</td>
				<td>${board.travellike}</td>

			</tr>
		</table>
	</section>
</body>
</html>
