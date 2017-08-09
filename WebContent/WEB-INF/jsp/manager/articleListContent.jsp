<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<script src="theme/common.js" type="text/javascript"></script>

<form name="Article">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab1">
		<tbody>
			<tr>
				<th class="tl pl5">选择</th>
				<th class="tl pl5">标题</th>
				<th class="tl pl5">所属栏目</th>
				<th class="tl pl5">作者</th>
				<th class="tl pl5">发布日期</th>
				<th class="tl pl5">点击次数</th>
				<th class="tl pl5">操作</th>
			</tr>
			
	<c:forEach items="${articless}" var="a">  
			<tr>
			<td class="pl5"><input type="checkbox" name=checkboxid value="${a.id}" /></td>
				<td class="pl5">${a.title}</td>
				<td class="pl5">${a.category.name}</td>
				<td class="pl5">${a.author}</td>
				<td class="pl5">${a.publisurDate}</td>
				<td class="pl5">${a.clickTimes}</td>
				<!-- 拓展 js -->
				<td class="pl5">
					<span class="ico_edit" val="${a.id }"></span>
					<span class="ico_del ml5" val="${a.id }" id="one"></span>
				</td>
			</tr>
	</c:forEach>
		
		</tbody>
		<tr>
			<td align="left" width="30%" colspan="6">
			选择：<a href="#" onclick="javascript:selAllCheckbox('checkboxid');">全部</a>-
	  			  <a href="#" onclick="javascript:unselAllCheckbox('checkboxid');">不选</a>-
	 			  <a href="#" onclick="javascript:reAllCheckbox('checkboxid');">反选</a>
	 			  <br><span id="batch" onclick="javascript:delNews();">&nbsp;批量删除</span>
              </td>
		</tr>
	</table>
	</form>
	<div class="p_btn">
			<c:set var="pager_url"	value="articleList.action" />
			<c:set var="param_target" value=".divtable" />
			<jsp:include page="../include/paging.jsp">
				<jsp:param name="url" value="${pager_url }" />
				<jsp:param name="target" value="${param_target }" />
			</jsp:include>
	</div>
    