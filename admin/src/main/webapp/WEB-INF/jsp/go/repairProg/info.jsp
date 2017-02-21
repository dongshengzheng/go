<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .portlet.box > .portlet-title > .tools > a.collapse {
        background-image: url(<%=basePath%>assets/global/img/portlet-collapse-icon.png);
    }

    .table-checkable tr.details-control-child > td:first-child {
        text-align: right;
        padding-right: 15px;
    }

    .table-striped > tbody > tr:nth-of-type(odd) {
        background-color: #d2f7ff;
    }

    .table-striped > tbody > tr:nth-of-type(even) {
        background-color: #bfe3ff;
    }

    ul.dropdown-menu {
        z-index: 100;
    }
</style>
<go:navigater path="repairProg"></go:navigater>
<form class="form-horizontal" action="repairSpec/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="profile-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption caption-md">
                            <i class="fa fa-user"></i>
                            <span class="caption-subject font-blue-madison bold uppercase"> 维修工程进度看板</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <%--维修进度汇总开始--%>
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-info"></i>维修进度汇总
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                       id="table1">
                                    <thead>
                                    <tr>
                                        <th style="width:14%">分类</th>
                                        <th style="width:14%">项目总数</th>
                                        <th style="width:14%">已完成</th>
                                        <th style="width:14%">未完成</th>
                                        <th style="width:14%">已取消</th>
                                        <th style="width:14%">待完成</th>
                                        <th style="width:16%">完成百分比</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>通用服务</td>
                                        <td>416</td>
                                        <td>258</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>158</td>
                                        <td><input class="prog" value="35"></td>
                                    </tr>
                                    <tr>
                                        <td>船体工程</td>
                                        <td>183</td>
                                        <td>137</td>
                                        <td>0</td>
                                        <td>0</td>
                                        <td>46</td>
                                        <td><input class="prog" value="30"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%--维修进度汇总结束--%>
                        <%--维修工程进度看板开始--%>
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-cog"></i>维修工程进度看板
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body item">
                                <div class="portlet box blue-dark">
                                    <div class="portlet-title" style="background-color: #00aaaa">
                                        <div class="caption">
                                            <i class="fa fa-cog"></i>通用服务
                                        </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="row">
                                            <div class="col-md-12 clearfix">
                                                <c:forEach begin="1" end="20">
                                                    <div class="btn-group margin-bottom-5">
                                                        <button class="btn dropdown-toggle green-jungle " type="button"
                                                                data-toggle="dropdown"> D001
                                                            <i class="fa fa-angle-down"></i>
                                                        </button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li>
                                                                <a href="javascript:;"> 查看详单 </a>
                                                            </li>
                                                            <li class="divider"></li>
                                                            <li>
                                                                <a href="javascript:;" data-color="green-jungle"
                                                                   data-status=0
                                                                   class="btn change-status green-jungle">
                                                                    已完成 </a>
                                                            </li>
                                                            <li>
                                                                <a href="javascript:;" data-color="default"
                                                                   data-status=1
                                                                   class="btn change-status default"> 未完成 </a>
                                                            </li>
                                                            <li>
                                                                <a href="javascript:;" data-color="yellow"
                                                                   data-status=2
                                                                   class="btn change-status yellow ">
                                                                    已取消 </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--维修工程进度看板结束--%>
                    </div>
                    <div class="modal-footer" style="text-align: center">
                        <a href="repairSpec" class="btn default" data-target="navTab">返回</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>

<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true" data-id="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">备注</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                            <textarea id="dialog-text" class="form-control" rows="10"
                                      style="resize: none;" placeholder="暂无备注信息"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn green \">确认</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(".prog").each(function () {
        var percent = $(this).val();
        $(this).ionRangeSlider({
            type: "double",
            min: 0,
            max: 100,
            from: 0,
            to: percent,
            from_fixed: true,
            to_fixed: true,
        });
    })

    $('.change-status').on("click", function () {
        var id = $(this).attr("data-id");
        var status = $(this).attr("data-status");
        $.ajax({
            url: "repairProg/item/changeStatus",
            data: {id: id, status: status},
            success: function (data) {
                if (data.success) {
                    App.alert({
                        container: "#bootstrap_alerts_demo",
                        close: true,
                        icon: 'fa fa-check',
                        place: "append",
                        message: "success",
                        type: 'success',
                        reset: true,
                        focus: true,
                        closeInSeconds: 10,
                    })
                    $(this).parent().parent().siblings('button').removeClass().addClass("btn dropdown-toggle " + $(this).attr("data-color"));
                } else {
                    App.alert({
                        container: "#bootstrap_alerts_demo",
                        close: true,
                        icon: 'fa fa-warning',
                        place: "append",
                        message: "failure",
                        type: 'danger',
                        reset: true,
                        focus: true,
                        closeInSeconds: 10,
                    })
                }
            },
            error: function () {
                App.alert({
                    container: "#bootstrap_alerts_demo",
                    close: true,
                    icon: 'fa fa-warning',
                    place: "append",
                    message: "error",
                    type: 'warning',
                    reset: true,
                    focus: true,
                    closeInSeconds: 10,
                })
                return;
            }
        });
    })
</script>