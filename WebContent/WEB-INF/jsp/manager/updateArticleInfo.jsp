<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(function(){
	$("form").off("submit");
	$("form").on("submit",function(){
		//异步提交
		$("form").ajaxSubmit(function(){
			$("form input").val("");//清空表单内容
			$("form textarea").val("");//清空表单内容
			$("form select").val("");//清空表单内容
			alert("修改成功");
			$("span:contains('信息管理')").trigger("click");
		});
		//阻止表单的默认提交行为
		return false;
	});
	/* $("#selected").on(function(){}); */
});
</script>	

<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
			<div class="website_base">
				<form action="updateArticle.action" method="post">
					<%-- <input type="hidden" name="id" value="${article.id}"> --%>
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改信息</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
						<tr>
							<td class="tr" width="80">id：</td>
							<td class="pl5"><input type="text" name="id" value="${ariticle.id}"></td>
						</tr>
							<tr>
								<td class="tr" width="80">标题：</td>
								<td class="pl5"><input type="text" name="title" value="${ariticle.title }"></td>
							</tr>
							<tr>
								<td class="tr" width="80">作者：</td>
								<td class="pl5"><input type="text" name="author" value="${ariticle.author}"></td>
							</tr>
							<tr>
								<td class="tr" width="80">所属栏目：</td>
								<td class="pl5">
									<select id="selected" name="categorycode">
										<option value="" >--请选择--</option>
										<c:forEach items="${categorylist}" var="cate">
										<c:choose>
											<c:when test="${cate.code eq ariticle.category.code}" >
												<option value="${cate.code}" selected="selected">--${cate.name}--</option>
											</c:when>
											<c:otherwise>
												<option value="${cate.code}">--${cate.name}--</option>
											</c:otherwise>
										</c:choose>
										
									</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<textarea name="content" class="website_edit" cols="100">${ariticle.content}</textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">修改</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>