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
<jsp:include page="include/header.jsp"></jsp:include>
<div id="main">
    <div class="content">
    	<div class="congw">
           <div class="conarticle">
                    <div class="position">
                    	<span class="poshome">您现在的位置：</span>
                        <a href="index.html">首页</a> >> 
                        <a href="list.html?id=1">
                        	${name}
                        </a>
                    </div>
                    <div class="title">${content.title }</div>
                    <div class="abstract">
                    	<span>更新时间：${content.publisurDate }</span>
                        <span>发布人：${content.author }</span>
                        <span>点击${content.clickTimes }次</span>
                    </div>
                    <div class="details">
						<center>
                    		${content.content}
						</center>
                    </div>
           </div>
           <jsp:include page="include/footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>