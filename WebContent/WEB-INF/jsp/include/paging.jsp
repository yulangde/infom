<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
	分页效果
	<div class="p_btn">
		<c:set var="pager_url"	value="abctest.action" />
		<c:set var="param_target" value=".divtable" />
		<jsp:include page="include/two.jsp">
			<jsp:param name="url" value="${pager_url }" />
			<jsp:param name="target" value="${param_target }" />
		</jsp:include>
	</div> 
--%>

<style type="text/css">
.page-nav{ text-align: center;  margin-top: 50px; }
.page-nav a{text-decoration: none;border:1px solid #D1E0EF;padding: 5px 7px;color: #767675;cursor: pointer;}
.page-nav .page-nava{background-color: #E4E9F7;}
</style>
<script type="text/javascript">

$(function(){
	$(".page-nav a").on({
		mouseover:function(){
			$(this).toggleClass("page-nava");
		},
		mouseout:function(){
			$(this).toggleClass("page-nava");
		}
	});
	
});

</script>


<!-- 分页   -->
<c:set var="target" value="${param.target }" />
<c:set var="pager_url" value="${param.url }" />


<c:set var="offset" value="4" /><!-- 当前页显示4页数据  -->

<!-- 页面数据 -->
<!-- 总共有多少页 -->
<%-- <c:set var="pageCount" value="7"  />  --%>

<!-- 当前少页  -->
<%-- <c:set var="pageNo" value="0"  /> --%>

<%-- 总共有多少页:${pageCount }   当前少页:${pageNo }   --%>

<c:if test="${simplePage.pageCount -1 >= 0  }">
	<%--页数过少 --%>
	<c:if test="${simplePage.pageCount - offset < 0}">
		<c:set var="pager_begin" value="1" />
		<c:set var="pager_end" value="${simplePage.pageCount}" />
	</c:if>
	<c:if test="${simplePage.pageCount - offset >= 0}">
		<c:set var="pager_begin" value="${simplePage.pageNo - (offset / 2)}" />
		<!-- 页码偏前 -->
		<c:if test="${simplePage.pageNo -(offset / 2) < 0 }">
			<c:set var="pager_begin" value="0" />
		</c:if>
		<!-- 页码偏后 -->
		<c:if test="${(simplePage.pageCount - simplePage.pageNo) - (offset / 2) < 0}">
			<c:set var="pager_begin" value="${simplePage.pageCount - offset}" />
		</c:if>
		<c:set var="pager_end" value="${pager_begin + offset}" />
	</c:if>
	
	<div class="page-nav">
		
		<c:if test="${simplePage.pageNo - 1 >  0}">
			<a href='javascript:toLoad("${simplePage.pageNo - 1}")' style="margin-right: 10px;">&lt;上一页 </a>
		</c:if>
		
		<c:forEach var="n" begin="${pager_begin }" end="${pager_end  }" step="1">
			<c:if test="${n != simplePage.pageNo }">
				<a href='javascript:toLoad("${n }");'>${n }</a>
			</c:if>
			<c:if test="${n == simplePage.pageNo }">
				<span style=" color: red;">${n}</span>
			</c:if>
		</c:forEach> 
		<c:if test="${simplePage.pageNo  -  simplePage.pageCount < 0}">
			<a href='javascript:toLoad("${simplePage.pageNo + 1}")'>下一页 &gt;</a>
		</c:if>
		<span class="separator J_pageList">共${simplePage.pageCount }页,${simplePage.pageDataNum }条数据</span>
		
		<input type="text" name="pageNo"  style="width: 40px;">
 		<span onclick="gotoPage()">转到</span>
	</div>
</c:if>
<script type="text/javascript">
/**
 * url 请求的地址
 * content 局部刷新的内容
 */
function toLoad(num){
	$("${target}").load("${pager_url }",{pageNo:num});
} 
/**
	 
 */
function gotoPage(){
	var pageNo = Number($("input[name='pageNo']").val());
	var pageCount  = Number('${pageCount}');
	if(pageNo - pageCount <= 0){
		$("${target}").load("${pager_url }",{pageNo:pageNo});
	}else{
		alert("您输入的不合法,请输入有效数据。")
	}
}

</script>