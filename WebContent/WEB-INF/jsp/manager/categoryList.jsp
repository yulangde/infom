<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.btn_left {
	position: absolute;
	bottom: 30px;
	margin-left: 10px
}
</style>

<!-- 
<div class="c_condition">
	<span><select><option>--资源栏目--</option></select></span> <span><select><option>--资源类型--</option></select></span>
	<span><select><option>--审核状态--</option></select></span> <span><select><option>--转码状态--</option></select></span>
	<span>关键字：<input type="text"></span> <span class="btn_gray">搜索</span>
</div> 
-->
<script>
$(function(){
	//为删除图标绑定事件
	$(".pl5 .ico_del").off("click");
	$(".pl5 .ico_del").on("click",function(){
		//获取点击元素的id
		var id = $(this).attr("val");
		//通过ajax删除id为id的栏目
		$.post("deleteCategory.action",{
			"id":id	//参数
		},function(){			//回调函数
			alert("删除成功");
			//模拟点击"栏目管理"
			$("span:contains('栏目管理')").trigger("click");
		});
	});
	//为修改图标绑定事件
	$(".pl5 .ico_edit").off("click");
	$(".pl5 .ico_edit").on("click",function(){
		//获取要修改元素的id
		var id = $(this).attr("val");
		//将class为"rightContent"的元素替换为action返回页面
		$(".rightContent").load("updateCategory.html",{
			"category.id":id
		});
	});
	
	
});
</script>
<div class="divtable">
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		class="tab1">
		<tbody>
			<tr>
				<th class="tl pl5">栏目名称</th>
				<th class="tl pl5">栏目编号</th>
				<th class="tl pl5">操作</th>
			</tr>
		
		<c:forEach items="${categorylist}" var="cate">  
			<tr>
				<td class="pl5">${cate.name}</td>
				<td class="pl5"><span class="fontLv">${cate.code}</span>
				</td>
				<td class="pl5">
					<span class="ico_edit" val="${cate.id }"></span>
					<span class="ico_del ml5" val="${cate.id }"></span>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="btn_left">
	<!-- <span class="btnL"><em class="btnR">添加</em></span> -->
	<!-- <span class="btnL"><em class="btnR">推荐</em></span>  -->
</div>