<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <base href="http://localhost:9999/infom/"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>杰普信息管理系统</title>
<link rel="stylesheet" type="text/css" href="theme/1/css/common.css">
<link rel="stylesheet" type="text/css" href="theme/1/css/front/style.css">
</head>
<body>
<div id="main">
	<!-- 导入共用header.jsp -->
	<div class="top">
    	<div class="topbg">
            <div class="logo_sign">
            	<div class="logo"></div>
                <div class="sign">
                	<span>欢迎您</span>
                    <span class="sp_home">
                    		<a href="index.html">首页</a>
                    </span>
                    <span class="sp_backstage">
                    		<a href="WEB-INF\jsp\manager\home.html">后台管理</a>
                    </span>
                    <!-- <span class="sp_signout">退出</span> -->
                </div>
            </div> 
            <div class="nav">
            	<ul class="navUI">
                	<li><a href="index.html">首页</a></li>
                    <li><a href="WEB-INF\jsp\list.html?id=1">财经</a></li>
					<li><a href="WEB-INF\jsp\list.html?id=1">社会</a></li>
					<li><a href="WEB-INF\jsp\list.html?id=1">汽车</a></li>
					<li><a href="WEB-INF\jsp\list.html?id=1">军事</a></li>
					<li><a href="WEB-INF\jsp\list.html?id=1">游戏</a></li>
					<li><a href="WEB-INF\jsp\list.html?id=1">热搜</a></li>
                </ul>
            </div>
            <div class="banner">
            	<div class="banimg"><img width="1072" height="241" src="theme/1/images/front/banner.png"></div>
            </div>
        </div>
    </div>   

    <div class="content">
    	<div class="congw">
             <div class="clear"></div>
            <div class="box">
            	<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">财经</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="WEB-INF\jsp\list.html?id=1"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            	<a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
							<li>
                            	<a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>

                        </ul>
                    </div>
                </div>

				<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">社会</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="WEB-INF\jsp\list.html?id=2"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            	<a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
                        </ul>
                    </div>
                </div>
				<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">汽车</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="WEB-INF\jsp\list.html?id=3"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            <a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 每当输入三个box_b在其后输入一个clear(空开与上面的距离)-->
                <div class="clear"></div>
				
				<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">军事</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="toList.html?id=3"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            	<a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
                        </ul>
                    </div>
                </div>
				<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">游戏</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="WEB-INF\jsp\list.html?id=5"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            <a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
                        </ul>
                    </div>
                </div>
				<div class="box_b">
                	<div class="title">
                    	<span class="txt_title">热搜</span>
                        <span class="txt_discipline">作者</span>
                        <span class="txt_time">
                        	<a class="txt_time" href="WEB-INF\jsp\list.html?id=6"> 更多>> </a>
                        </span>
                    </div>
                    <div class="cont">
                    	<ul class="discipUI">
                    	
                        	<li>
                            	<a href="WEB-INF\jsp\content.html?id=1" class="txt_title">
                            		杰普公开课
                            	</a>
                            	<span class="txt_discipline">小明</span>
                            	<span class="txt_time">2017-1-1</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 每当输入三个box_b在其后输入一个clear(空开与上面的距离)-->
                <div class="clear"></div>


            </div>
            
            <div class="link">
            	<div class="linelink">
            		<span>友情链接：</span><a href="javascript:void(0)">上海教育网</a><a href="javascript:void(0)">上海杰普软件科技有限公司</a><a href="javascript:void(0)">郑州轻工学院</a><a href="javascript:void(0)">郑州大学</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 导入底部文件 -->
	<div class="footer">
			<div class="foot">
				<p>杰普信息发布系统 技术支持：<a href="javascript:void(0)">上海杰普软件科技有限公司</a>      电话：021-xxxxxxx</p>
			</div>
		</div>
</div>
</body>
</html>
