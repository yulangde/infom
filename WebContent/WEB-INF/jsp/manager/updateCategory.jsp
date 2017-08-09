<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	$("form").off("submit");
	$("form").on("submit",function(){
		//异步提交
		$("form").ajaxSubmit(function(){
			$("form input").val("");//清空表单内容
			alert("修改成功");
			//模拟点击"栏目管理"
			$("span:contains('栏目管理')").trigger("click");
		});
		//阻止表单的默认提交行为 	
		return false;
	});
});
</script>	
<div class="editingarea">
	<div class="c_flex">
		<span class="c_flexible"></span>
	</div>
	<div class="c_editview">
		<div class="c_r_right_border">
		<form action="manager/updateCategory.action" method="post">
			<input type="hidden" name="category.id" value="${category.id }">
			<div class="website_base">
				<div class="c_condition website_condition dot_line">
					<span class="yx_txt_center">修改栏目</span>
				</div>
				<div class="divtable mt5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tab3">
						<tbody>
							<tr>
								<td class="tr" width="80">栏目名称：</td>
								<td class="pl5"><input type="text" value="军事" name="category.name"></td>
							</tr>
							<tr>
								<td class="tr" width="80">栏目编号：</td>
								<td class="pl5"><input type="text" value="5" name="category.code"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_left btn_left_bcol">
					<button class="btn_gray mr5 ml5">修改</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>