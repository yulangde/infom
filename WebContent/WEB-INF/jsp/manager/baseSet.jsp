<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(function(){
	//添加友情链接
	$("form").off("submit");
	$("form").on("submit",function(){
		//异步提交
		$("form").ajaxSubmit(function(){
			$("form input").val("");//清空表单内容
			$(".editingarea").load("baseSet.html");
			alert("操作成功");
		});
		//阻止表单的默认提交行为
		return false;
	});
	//删除友情链接
	$(".divtable").on("click",".pl5 .ico_del",function(){
		alert("是否删除？");
		//获取点击元素的id
		var id = $(this).attr("val");
		//通过ajax删除id为id的栏目
		$.post("deleteFriend.action",{
			"id":id	//参数
		},function(){			//回调函数
			alert("删除成功");
			//模拟点击"栏目管理"
			//$("span:contains('系统设置')").trigger("click");
			$(".editingarea").load("baseSet.html");
		});
	});
	//修改版权信息
	/* $(".c_editview .pl5 .ico_edit").off("click");
	$(".c_editview").on("click",".pl5 .ico_edit",function(){
		alert("修改");
		//将class为"rightContent"的元素替换为action返回页面
		$(".editingarea").load("baseSet.html");
	}); */
	
	$("#form1").off("submit");
	$("#form1").on("submit",function(){
		//异步提交
		$("#form1").ajaxSubmit(function(){
			$(".editingarea").load("baseSet.html");
			alert("操作成功");
		});
		//阻止表单的默认提交行为
		return false;
	});
	
});
</script>	
<div class="editingarea">
	<div style="float:left;width:48%">
		<div class="c_flex">
			<span class="c_flexible"></span>
		</div>
		<div class="c_editview">
			<div class="c_r_right_border">
			<form action="friendLink.action" method="post">
				<div class="website_base">
					<div class="c_condition website_condition dot_line">
						<span class="yx_txt_center">添加友情链接</span>
					</div>
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">链接名称：</td>
									<td class="pl5"><input type="text" name="name"></td>
								</tr>
								<tr>
									<td class="tr" width="80">链接地址：</td>
									<td class="pl5"><input type="text" name="url"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="c_condition website_condition dot_line">
						<button class="btn_gray mr5 ml5">添加</button>
					</div>
				</div>
				</form>
			</div>
		</div>
		
		<div class="c_editview">
			<div class="c_r_right_border">
			<form action="updateBasicSet.action" method="post" id="form1">
				<div class="website_base">
					<div class="c_condition website_condition dot_line">
						<span class="yx_txt_center">基础设置链接</span>
					</div>
					<div class="divtable mt5">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tab3">
							<tbody>
								<tr>
									<td class="tr" width="80">公司名称：</td>
									<td class="pl5"><input  style="width:80%" type="text" name="name" value="${basicinfo.name}"></td>
								</tr>
								<tr>
									<td class="tr" width="80">公司地址：</td>
									<td class="pl5"><input  style="width:80%" type="text" name="content" value="${basicinfo.content}"></td>
								</tr>
								<tr>
									<td class="tr" width="80">版权信息：</td>
									<td class="pl5"><input style="width:80%" type="text" name="copr" value="${basicinfo.copr}"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="c_condition website_condition dot_line">
						<button class="btn_gray mr5 ml5">设置</button>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<div style="float:right;width:50%">
		<div class="divtable">
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="tab1">
				<tbody>
					<tr>
						<th class="tl pl5">链接名称</th>
						<th class="tl pl5">链接地址</th>
						<th class="tl pl5">操作</th>
					</tr>
					<c:forEach items="${friendLink}" var="friend">
						<tr>
							<td class="pl5">${friend.name}</td>
							<td class="pl5">
								<span class="fontLv">${friend.url}</span>
							</td>
							<td class="pl5">
								<span class="ico_edit" val="${friend.id}"></span>
								<span class="ico_del" val="${friend.id}"></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</div>