<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>杰普信息管理系统</title>

<link rel="stylesheet" type="text/css" href="theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/front/style.css">
</head>
<body>
<div id="main">
	<!-- 导入头部页面（logo, 导航） -->
   <jsp:include page="include/header.jsp"></jsp:include>
    <div class="content">
    	<div class="congw">
           <div class="conlist">
           		<div class="position">
                   	<span class="poshome">您现在的位置：</span>
                       <a href="index.html">首页</a> >> 
                       <a href="list.html?id=${category.id}">
							${name}
                       </a>
                </div>
                <div class="search_result">
               	<c:forEach items="${news}"  var="news">
                    	 <div class="art_box">
                        	<div class="art_img">
                        		<a href="content.html?id=${news.id}&&name=${name}">
                        			<img src="theme/1/images/front/doc.png">
                        		</a>
                        	</div>
                            <div class="art_txt">
                            	<div class="title">${news.title}<span class="icon_pen"></span></div>
                                <div class="tag_txt"><span>栏目名称：${name}</span>
                                <span class="pl30">点击数：${news.clickTimes}</span>
                             	</div>
                                <div class="tag_txt">
                                	<span>作者：${news.author}</span>
                                	<span class="pl30">发表日期：${news.publisurDate}</span>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    	
                    <div class="page">分页</div>
                </div>
           </div>
        </div>
    </div>
    <jsp:include page="include/footer.jsp"></jsp:include>
    
</div>
</body>
