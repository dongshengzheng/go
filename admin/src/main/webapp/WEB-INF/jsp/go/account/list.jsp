<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="account"></go:navigater>

<div class="profile-content">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light bordered">
                <div class="portlet-title tabbable-line">
                    <div class="caption caption-md">
                        <i class="fa fa-user"></i>
                        <span class="caption-subject font-blue-madison bold uppercase">账号管理</span>
                    </div>
                </div>
                <div class="portlet-body">

                    <div class="portlet box blue-dark">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-info"></i>账号信息
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"> </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="modal-body" style="padding: 5px;">
                                <label style="margin-right: 2%">个人姓名</label>
                                <button class="btn blue-dark" style="margin-right: 2%"> 已设置
                                </button>
                                <label class="">您当前姓名为:${sessionScope.sessionUser.name}</label>
                                <shiro:hasPermission name="account/editName">
                                    <button style="float:right" data-url="account/editName" data-model="dialog"
                                            class="btn green-haze"> 修改
                                    </button>
                                </shiro:hasPermission>
                            </div>
                            <hr style="border-top: 1px dotted lightgrey;margin-top: 5px;margin-bottom: 5px">
                            <div class="modal-body" style="padding: 5px;">
                                <label style="margin-right: 2%">手机号码</label>
                                <button class="btn blue-dark" style="margin-right: 2%"> 已设置
                                </button>
                                <label class="">您当前的手机号码为:${sessionScope.sessionUser.phone}</label>
                                <shiro:hasPermission name="account/editPhone">
                                    <button style="float:right" data-url="account/editPhone" data-model="dialog"
                                            class="btn green-haze"> 修改
                                    </button>
                                </shiro:hasPermission>
                            </div>
                            <hr style="border-top: 1px dotted lightgrey;margin-top: 5px;margin-bottom: 5px">
                            <div class="modal-body" style="padding: 5px;">
                                <label style="margin-right: 2%">电子邮箱</label>
                                <button class="btn blue-dark" style="margin-right: 2%"> 已设置
                                </button>
                                <label class="">您绑定的邮箱是:${sessionScope.sessionUser.email}</label>
                                <shiro:hasPermission name="account/editEmail">
                                    <button style="float:right" data-url="account/editEmail" data-model="dialog"
                                            class="btn green-haze"> 修改
                                    </button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>

                    <div class="portlet box blue-dark">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-lock"></i>修改密码
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"> </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="modal-body" style="padding: 5px;">
                                <label style="margin-right: 2%">账号密码</label>
                                <button class="btn blue-dark" style="margin-right: 2%"> 已设置
                                </button>
                                <label class="">安全性高的密码可以使账号更安全</label>
                                <shiro:hasPermission name="account/editPassword">
                                    <button style="float:right" data-url="account/editPassword" data-model="dialog"
                                            class="btn green-haze"> 修改
                                    </button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                    <div class="portlet box blue-dark">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-cog"></i>其他设置
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"> </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="modal-body" style="padding: 5px;">
                                <label style="margin-right: 2%">系统样式</label>
                                <button class="btn blue-dark" style="margin-right: 2%"> 已设置
                                </button>
                                <label class="">可以选择您喜爱的样式</label>
                                <shiro:hasPermission name="account/editStyle">
                                    <button style="float:right" data-url="account/editStyle" data-model="dialog"
                                            class="btn green-haze"> 修改
                                    </button>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>