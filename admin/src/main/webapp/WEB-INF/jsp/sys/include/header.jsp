<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="page-header navbar navbar-fixed-top  ">
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner ">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="">
                <img src="${ctx}/static/img/banner.png" alt="logo" class="logo-default"/>
            </a>
            <div class="menu-toggler sidebar-toggler">
                <span></span>
            </div>
        </div>
        <div class="page-top">
            <div class="top-menu">
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown dropdown-user dropdown-dark">
                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                           data-close-others="true">
                            <span class="username username-hide-on-mobile"> ${user.name} </span>
                            <img alt="" class="img-circle" src="${ctx}/assets/layouts/layout/img/avatar.png"/>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-default">
                            <li>
                                <a href="javascript:;" data-url="user/editPwd" data-model='dialog'>
                                    <i class="icon-user"></i><fmt:message key="account_modify_password"/> <%--修改密码--%> </a>
                            </li>
                            <li>
                                <a href="logout">
                                    <i class="icon-key"></i> <fmt:message key="go_exit"/> <%--退出--%> </a>
                            </li>
                            <li>
                                <a href="javascript:sync()" id="sync">
                                    <i class="fa fa-hourglass-2"></i> 同步 </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="clearfix"> </div>

