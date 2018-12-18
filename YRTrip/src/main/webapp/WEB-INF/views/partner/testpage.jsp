<table class="table table-bordered table-striped" style="text-align: center;">
	<thead>
		<tr>
			<th colspan="10" style="background-color: #eeeeee; text-align: center;">동행신청 리스트</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${joinerList}" var="joiner">
			<tr>
				<td>${joiner.userid}</td>
				<td>${joiner.joinerdate}</td>
				<td>${joiner.joinercondition}</td>
			</tr>
			<!-- 페이징처리 -->
			<!-- 숨긴 페이징 부분 hide jobs -->
		</c:forEach>
	</tbody>
</table>