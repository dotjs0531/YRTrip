<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.yrtrip.app.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav aria-label="Page navigation example" style="padding:50px 0 0 25%;">
<c:if test="${empty jsFunc}"> 
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>

<ul class="pagination justify-content-center">

<c:if test="${paging.startPage!=1}">
<li class="page-item">
<a class="page-link" href="#" aria-label="Previous" onclick="${jsFunc}(${paging.startPage -1})">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
</a>
</li>
</c:if>

<c:if test="${paging.startPage==1}">
<li class="page-item disable">
<a class="page-link" href="#" aria-label="Previous" onclick="${jsFunc}(${paging.startPage})">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
</a>
</li>
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<li class="page-item"><a href="#" onclick="${jsFunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<li class="page-item active"> 
		<a class="page-link" href="#">${i}<span class="sr-only">(current)</span></a>
		</li>
	</c:if>
	

</c:forEach>

<c:if test="${paging.endPage == paging.lastPage}">
<li class="page-item disable">
<a class="page-link" href="#" aria-label="Next" onclick="${jsFunc}(${paging.endPage})">
<span aria-hidden="true">&raquo;</span>
<span class="sr-only">Next</span>
</a>
</li>
</c:if>

<c:if test="${paging.endPage != paging.lastPage}">
<li class="page-item">
<a class="page-link" href="#" aria-label="Next" onclick="${jsFunc}(${paging.endPage+1})">
<span aria-hidden="true">&raquo;</span>
<span class="sr-only">Next</span>
</a>
</li>
</c:if>

</ul>
</nav>