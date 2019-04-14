<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<LINK rel="Bookmark" href="/favicon.ico" >
		<LINK rel="Shortcut Icon" href="/favicon.ico" />
		<link href="${contextPath}/bg/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
		<link href="${contextPath}/bg/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		<link href="${contextPath}/bg/css/style.css" rel="stylesheet" type="text/css" />
		<title>SYE后台管理系统</title>
		<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
		<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
		
		<style>
			.one-title{
				font-weight:bold;
			}
			.two-title{
				margin-left:10px;
			}
			.dePass{
				font-size:14px;
				color:#fff;
				line-height: 44px;
				margin-left: 5%;
			}
			.dePass:visited{
				color:#fff;
			}
			.dePass:hover{
				color:#8FBC8F;
			}
		</style>
	</head>
	
	<body>
	<header class="Hui-header cl"> 
		<a class="Hui-logo l" title="SYE" href="#">SYE后台管理系统</a> 
		<a class="Hui-logo-m l" href="#" title="SYE">SYE</a> 
		<span class="Hui-subtitle l">V1.1</span>
		<a class="dePass" href="adminManage/changeAdminPsw?id=${BGUserSession.admin.id}" title="修改密码">修改密码</a>
		<ul class="Hui-userbar">
			<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
				<ul class="dropDown-menu radius box-shadow">
					<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
					<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
					<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
					<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
					<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
					<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
				</ul>
			</li>
		</ul>
		<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a> 
	</header>
	
	<aside class="Hui-aside">
		<input runat="server" id="divScrollValue" type="hidden" value="" />
		<div class="menu_dropdown bk_2">
			
			<c:set value="0" var="roleLevel" scope="request" />
				<c:forEach items="${BGUserSession.roleList}" var="role">
					<c:if test="${role.parent == 0 }">
						<dl id="menu-article">
							<dt>
								<i class="Hui-iconfont">&#xe6bf;</i>
								<span class="one-title">${role.roleName}</span>
								<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
							</dt>
							<c:set value="${role.roleLevel}" var="roleLevel" scope="request" />
							<dd>
								<ul>
									<c:forEach items="${BGUserSession.roleList}" var="r">
										<c:if test="${r.parent == roleLevel}">
											<li>
												<a _href="${r.roleLink}" href="javascript:void(0);">
													<span class="two-title">${r.roleName}</span>
												</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</dd>
						</dl>
					</c:if>
				</c:forEach>
		
			<%-- <dl id="menu-picture">
				<dt><i class="Hui-iconfont">&#xe613;</i> 孵化园管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a _href="incubationpark/incubationpark-list?pageIndex=1" href="javascript:void(0)">孵化园列表</a></li>
						<li><a _href="incubationpark/incubationpark-setUI?pageIndex=1" href="javascript:void(0)">孵化园配置</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-article">
				<dt>
					<i class="Hui-iconfont">&#xe6bf;</i> 审核管理
					<c:if test="${noauditedPro!=0 || noauditedUser!=0 || noauditedLms!=0 || noauditedIna!=0}">
						<img src="${contextPath}/image/litteredcircle.png" style="margin-top:-10px;border-radius:50%;">
					</c:if>
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a _href="checkuser/userDetailForCheckList?start=0&size=5" href="javascript:void(0)">
								身份认证审核
								<c:if test="${noauditedUser!=0}">
									<img src="${contextPath}/image/litteredcircle.png" style="margin-top:-10px;border-radius:50%;">
								</c:if>
							</a>
						</li>
						<li>
							<a _href="project/bgpro?start=0&auditstatus=1" href="javascript:void(0)">
							项目管理
								<c:if test="${noauditedPro!=0}">
									<img src="${contextPath}/image/litteredcircle.png" style="margin-top:-10px;border-radius:50%;">
								</c:if>
							</a>
						</li>
						<li>
							<a _href="manage/queryMsgBlockPage?start=0&flag=0" href="javascript:void(0)">
								留言审核
								<c:if test="${noauditedLms!=0}">
									<img src="${contextPath}/image/litteredcircle.png" style="margin-top:-10px;border-radius:50%;">
								</c:if>
							</a>
						</li>
						<li>
							<a _href="interaction/questionlist?start=0&pageSize=0&state=2">
								互动审核
								<c:if test="${noauditedIna!=0}">
									<img src="${contextPath}/image/litteredcircle.png" style="margin-top:-10px;border-radius:50%;">
								</c:if>
							</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-system">
				<dt><i class="Hui-iconfont">&#xe62e;</i> 配置管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a _href="configure/notice?start=0" href="javascript:void(0)">公告配置</a></li>
						<li><a _href="configure/banner?start=0" href="javascript:void(0)">banner页面配置</a></li>
						<li><a _href="configure/point?start=0" href="javascript:void(0)">积分规则配置</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-article">
				<dt><i class="Hui-iconfont">&#xe6bf;</i>用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a _href="userManage/userList?start=0&size=10" href="javascript:void(0)">用户列表</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-article">
				<dt><i class="Hui-iconfont">&#xe6bf;</i>数据统计管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
				<dd>
					<ul>
						<li><a _href="syeStatisticsManage/syeStatisticsList?start=0&size=10" href="javascript:void(0)">数据统计列表</a></li>
					</ul>
				</dd>
			</dl> --%>
			
		</div>
	</aside>
	<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
	<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active"><span title="我的桌面" data-href="welcome">我的桌面</span><em></em></li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display:none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0" src="welcome"></iframe>
			</div>
		</div>
	</section>
	<script type="text/javascript" src="${contextPath}/bg/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/lib/layer/1.9.3/layer.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.js"></script> 
	<script type="text/javascript" src="${contextPath}/bg/js/H-ui.admin.js"></script> 
	<script type="text/javascript">
		$(function(){
			
		})
	</script> 
	</body>
</html>