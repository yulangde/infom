<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="footer">
		<div class="link">
         	<div class="linelink">
         		<span>友情链接：</span>
         		<c:forEach items="${friendLinks}" var="link">
         			<a href="${link.url}">${link.name}</a>
         		</c:forEach>
             </div>
         </div>
    	<div class="foot">
        	<p>${Basicinfo.content}&nbsp&nbsp<a href="index.html">${Basicinfo.name}</a></p>
        	<p> ${Basicinfo.copr}</p>
        </div>
</div>