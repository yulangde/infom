<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.btn_left {
	position: absolute;
	bottom: 30px;
	margin-left: 10px
}
</style>

<script>
$(function(){
	//为查询绑定事件
	$("form").off("submit");
	$("form").on("submit",function(){
		$(".divtable").load($(this).attr("action"),{
			key:$(this).find("select[name='key']").val(),
			con:$(this).find("input[name='con']").val()
			//page:page
		});
		//阻止表单的默认提交行为
		return false;
	});
	
	 //为删除图标绑定事件
	$(".divtable .pl5 .ico_del").off("click");
	
	$(".divtable").on("click",".pl5 .ico_del",function(){
		alert("删除");
		//获取点击元素的id
		var id = $(this).attr("val");
		//通过ajax删除id为id的栏目
		$.post("deleteArticle.action",{
			"id":id	//参数
		},function(){			//回调函数
			alert("删除成功");
			//模拟点击"栏目管理"
			$("span:contains('信息管理')").trigger("click");
		});
	});
	//为修改图标绑定事件
	$(".divtable .pl5 .ico_edit").off("click");
	$(".divtable").on("click",".pl5 .ico_edit",function(){
		alert("修改");
		//获取要修改元素的id
		var id = $(this).attr("val");
		//将class为"rightContent"的元素替换为action返回页面
		$(".rightContent").load("updateArticle.html",{
			"id":id
		});
	});
	
});
</script>
<script>
  function delNews(){
		cCount = getCheckedCount("checkboxid");
		if (cCount == 0){
			alert("请至少一条信息!");
			return;
		}
		if (confirm("确定删除吗？")==false){
			return false;
		}
		document.forms.Article.action="<c:url value='deleteAllArticle.action'/>";
		document.forms.Article.submit();	
	} 
</script>
<div class="c_condition">
<form id="form" action="articleList.action" method="post">
	<span>
		<select name="key">
			<option value="choose">-请选择-</option>
			<option value="title">标题</option>
			<option value="author">作者</option>
			<option value="category">栏目</option>
		</select>
	</span>
	<span>关键字：<input name="con" type="text"></span> 
	<button class="btn_gray">搜索</button>
</form>	
</div>
<!-- 内容 -->

<div class="divtable">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab1">
		<tbody>
		 <tr>
			<th class="tl pl5">选择</th>
			<th class="tl pl5">文章标题</th>
			<th class="tl pl5">文章栏目</th>
			<th class="tl pl5">文章作者</th>
			<th class="tl pl5">文章内容</th>
			<th class="tl pl5">操作</th>
		</tr>
		</tbody>
	</table>
</div>
	

<div class="btn_left">
	<!-- <span class="btnL"><em class="btnR">添加</em></span> -->
	<!-- <span class="btnL"><em class="btnR">推荐</em></span>  -->
</div>