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
    .red {
        color: red;
    }

    .portlet.box > .portlet-title > .tools > a.collapse {
        background-image: url(<%=basePath%>assets/global/img/portlet-collapse-icon.png);
    }

    .details-control {
        cursor: pointer;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(odd) {
        background-color: white;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(even) {
        background-color: #fbfcfd;
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

    .addRow {
        background-color: lightseagreen;
        border: none;
        color: white;
    }

</style>
<go:navigater path="account"></go:navigater>
<form class="form-horizontal" action="ship/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="profile-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption caption-md">
                            <i class="fa fa-user"></i>
                            <span class="caption-subject font-blue-madison bold uppercase"> 新增维修工程单</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-info"></i>工程单概要
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="shipName" class="col-sm-3 control-label">
                                            船舶名称</label>
                                        <div class="col-sm-7">
                                            <input id="shipName" name="shipName" type="text" maxlength="32"
                                                   value=""
                                                   minlength="2" class="form-control required" placeholder="请选择船舶">
                                        </div>
                                        <label class="col-sm-1 control-label"><span class="red">* </span></label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="sStartDate" class="col-sm-3 control-label">计划进场日期</label>
                                        <div class="col-sm-7">
                                            <div class="input-group">
                                                <input id="sStartDate" name="sStartDate" type="text"
                                                       class="form-control date-picker"
                                                       placeholder="请选择进厂日期">
                                                <span class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="sDays" class="col-sm-3 control-label">
                                            预估天数</label>
                                        <div class="col-sm-7">
                                            <input id="sDays" name="sDays" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修天数">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="sCost" class="col-sm-3 control-label">
                                            预估金额</label>
                                        <div class="col-sm-7">
                                            <input id="sCost" name="sCost" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修金额">
                                        </div>
                                        <label class="col-sm-2 control-label"
                                               style="padding-left: 5px;padding-right: 5px">
                                            (单位:万元)</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="col-sm-3 control-label">
                                            维修类型</label>
                                        <div class="col-sm-9 icheck-inline">
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option1" checked> 临时维修
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option2"> 坞检
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option1"> 特检
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option2"> 改造
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-cog"></i>维修工程详细
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <%--通用服务开始--%>
                                <div class="portlet box blue-dark">
                                    <div class="portlet-title" style="background-color: #00aaaa">
                                        <div class="caption">
                                            <i class="fa fa-cog"></i>坞修服务
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
                                                <th style="width:10%">&nbsp;</th>
                                                <th style="width:15%">项目号</th>
                                                <th style="width:35%">维修内容</th>
                                                <th style="width:10%">单位</th>
                                                <th style="width:10%">数量</th>
                                                <th style="width:10%">备注</th>
                                                <th style="width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${type1}" var="item">
                                                <c:if test="${item.parentid!=0}">
                                                    <tr class="details-control-child" parent-id="${item.parentid}" style="display: none">
                                                </c:if>
                                                <td><c:if test="${item.status==0}"><input type="checkbox"> </c:if></td>
                                                <td>${item.code}</td>
                                                <td>${item.content}</td>
                                                <td>${item.unit}</td>
                                                <td><c:if test="${item.status==0}"><input> </c:if></td>
                                                <td>添加备注</td>
                                                <c:if test="${item.status==1}">
                                                    <td class="details-control" data-id="${item.id}">
                                                        <img src="<%=basePath%>static/img/details_open.png"
                                                             class="open-png">
                                                        <img src="<%=basePath%>static/img/details_close.png"
                                                             class="close-png"
                                                             style="display: none">
                                                    </td>
                                                </c:if>
                                                <c:if test="${item.status==0}">
                                                    <td>
                                                        操作
                                                    </td>
                                                </c:if>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%--通用服务结束--%>

                                <%--坞修服务开始--%>
                                <div class="portlet box blue-dark">
                                    <div class="portlet-title" style="background-color: #00aaaa">
                                        <div class="caption">
                                            <i class="fa fa-cog"></i>坞修服务
                                        </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                               id="table2">
                                            <thead>
                                            <tr>
                                                <th style="width:10%">&nbsp;</th>
                                                <th style="width:15%">项目号</th>
                                                <th style="width:35%">维修内容</th>
                                                <th style="width:10%">单位</th>
                                                <th style="width:10%">数量</th>
                                                <th style="width:10%">备注</th>
                                                <th style="width:10%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${type2}" var="item">
                                                <c:if test="${item.parentid!=0}">
                                                    <tr class="details-control-child" parent-id="${item.parentid}" style="display: none">
                                                </c:if>
                                                <td><c:if test="${item.status==0}"><input type="checkbox"> </c:if></td>
                                                <td>${item.code}</td>
                                                <td>${item.content}</td>
                                                <td>${item.unit}</td>
                                                <td><c:if test="${item.status==0}"><input> </c:if></td>
                                                <td><c:if test="${item.parentid==0}"><a
                                                        class="btn red btn-outline sbold" data-toggle="modal"
                                                        href="#responsive"> 添加备注 </a></c:if></td>
                                                <c:if test="${item.status==1}">
                                                    <td class="details-control" data-id="${item.id}">
                                                        <img src="<%=basePath%>static/img/details_open.png"
                                                             class="open-png">
                                                        <img src="<%=basePath%>static/img/details_close.png"
                                                             class="close-png"
                                                             style="display: none">
                                                    </td>
                                                </c:if>
                                                <c:if test="${item.status==0}">
                                                    <td>
                                                        <button type="button" class="addRow">+</button>
                                                    </td>
                                                </c:if>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <%--坞修服务结束--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">添加备注</h4>
            </div>
            <div class="modal-body">
                <div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
                    <div class="row">
                        <div class="col-md-12">
                            <textarea class="form-control col-md-12" rows="10" ></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline">Close</button>
                <button type="button" class="btn green">Save changes</button>
            </div>
        </div>
    </div>
</div>
<!--DOC: Aplly "modal-cached" class after "modal" class to enable ajax content caching-->
<div class="modal fade" id="ajax" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <img src="../assets/global/img/loading-spinner-grey.gif" alt="" class="loading">
                <span> &nbsp;&nbsp;Loading... </span>
            </div>
        </div>
    </div>
</div>


<script>

    <%--行的展开与折叠--%>
    $('td.details-control').on('click', function () {
        var parentId = $(this).attr('data-id');
        var ele = $("tr.details-control-child[parent-id=" + parentId + "]");
        ele.toggle();
        $(this).find('img').toggle();
        if ($(this).find('.close-png').css('display') == 'none') {
            ele.each(function () {
                $(this).find('.close-png').each(function () {
                    if ($(this).css('display') == 'inline') {
                        $(this).parent().click();
                    }
                })
            })
        }
    })

    <%--复制一行--%>
    $('.addRow').on('click', function () {
        var row = $(this).parent().parent();
        row.after(row.clone());
    })

</script>