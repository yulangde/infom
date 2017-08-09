<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="top">
    	<div class="topbg">
            <div class="logo_sign">
            	<div class="logo"></div>
                <div class="sign">
                	<span>欢迎您!您是第：${HitCount}个访问本网站</span>
                    <span class="sp_home">
                    		<a href="toIndex.action">首页</a>
                    </span>
                    <span class="sp_backstage">
                    		<a href="admin.html">后台管理</a>
                    </span>
                    <!-- <span class="sp_signout">退出</span> -->
                </div>
            </div> 
            <div class="nav">
            	<ul class="navUI">
            		<li><a href="index.html">首页</a></li>
            		<c:forEach items="${categorylist}" var="cate">  
						<li><a href="list.html?id=${cate.code}&&name=${cate.name}">${cate.name}</a></li>
					</c:forEach>
                </ul>
            </div>
            <div class="banner">
            	<div class="banimg"><img width="1072" height="241" src="theme/1/images/front/banner.png"></div>
            </div>
        </div>
    </div>