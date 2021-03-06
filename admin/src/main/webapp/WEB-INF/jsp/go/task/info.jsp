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
    .modal-dialog {
        position: relative;
        width: 65%;
        margin: auto;
    }

    table td, th {
        text-align: center;
    }

</style>
<go:navigater path="task"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <fmt:message key="report_progress_report"/> <%--工程汇报--%>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4">
                            <fmt:message key="repair_vessel_name"/> <%--船名--%>: ${task.shipName}
                        </div>
                        <div class="col-md-4">
                            <fmt:message key="repair_repc_num"/> <%--维修单号--%>:
                        </div>
                        <div class="col-md-4">
                            <a href="report/add?taskId=${task.id}"
                               data-model="dialog"><fmt:message key="report_submit_report"/> <%--当日汇报提交--%></a>
                        </div>
                    </div>
                </div>
                <c:forEach items="${cataList}" var="cata" varStatus="outerVs">
                    <c:set var="type" value="type${outerVs.count}"></c:set>
                    <div class="portlet-body item">
                        <div class="portlet box blue-dark">
                            <div class="portlet-title" style="background-color: #00aaaa">
                                <div class="caption">
                                    <i class="fa fa-cog"></i>
                                        ${cata.des}
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="row">
                                    <div class="col-md-12 clearfix">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                               id="table${outerVs.count}">
                                            <thead>
                                            <tr>
                                                <th style="width: 5%"><fmt:message key="project_bill_number"/> </th><%--单号--%>
                                                <th style="width: 10%"><fmt:message key="project_name"/></th><%--工程名称--%>
                                                <th style="width: 60%"><fmt:message key="project_describe"/></th><%--工程描述--%>
                                                <th style="width: 5%"><fmt:message key="report_project_status"/></th><%--工程状态--%>
                                                <th style="width: 5%"><fmt:message key="report_record_report"/></th><%--记录汇报--%>
                                                <th style="width: 5%"><fmt:message key="report_prophase_report"/></th><%--前期汇报--%>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="addNew" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #32c5d2;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><fmt:message key="report_add_item"/> <%--新增项目--%></h4>
            </div>
            <form id="addNewForm" class="form-horizontal" action="repairProgDetail/addNew" method="post">
                <input type="hidden" id="repairProgId" name="repairProgId" value="${task.repairProgId}">
                <input type="hidden" id="proOrderNo" name="proOrderNo" value="">
                <input type="hidden" name="catagory" value="新增">
                <input type="hidden" name="taskStatus" value="2">
                <input type="hidden" name="delFlag" value="0">
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="form-group">
                            <label for="proName" class="col-sm-3 control-label"><fmt:message key="project_enter_name"/> <%--请输入工程名称--%></label>
                            <div class="col-sm-7">
                                <input id="proName" name="proName" type="text" class="form-control required"
                                       placeholder="<fmt:message key='project_enter_name'/> "><%--请输入工程名称--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="proDesc" class="col-sm-3 control-label"><fmt:message key="project_enter_des"/> <%--请输入工程描述--%></label>
                            <div class="col-sm-7">
                                <input id="proDesc" name="proDesc" type="text" class="form-control required"
                                       placeholder="<fmt:message key='project_enter_des'/>"><%--请输入工程描述--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message
                            key="cancel"></fmt:message></button>
                    <button type="button" onclick="addNew()" class="btn btn-primary"><fmt:message
                            key="save"></fmt:message></button>
                </div>
            </form>
        </div>
    </div>
</div>
<input type="hidden" id="nextADNo" value="1">
<table style="display: none">
    <tr id="newRowTemp">
        <td class="proOrderNo-td"></td>
        <td class="proName-td"></td>
        <td class="proDesc-td"></td>
        <td class="proStatus-td"><label class='btn default'><fmt:message key="progress_not_started"/> <%--未开始--%></label></td>
        <td class="report-td"><a data-target="navTab" class="btn default" href=""><fmt:message key="report_enter"/> <%--进入--%></a></td>
        <td class="recent-td"><a data-target="navTab" class="btn default" href=""><fmt:message key="go_check"/> <%--查看--%></a></td>
    </tr>
</table>
<script>
    var taskId =${task.id};

    $(function () {
        var catagory = ["通用服务", "坞修工程", "船体工程", "机械工程", "电气工程", "冷藏工程", "特种设备", "其他", "新增"];
        for (var n = 0; n < catagory.length; n++) {
            getItem(catagory[n], n)
        }
    })

    function getItem(catagory, num) {
        var repairProgId = $("#repairProgId").val();
        $.ajax({
            type: "GET",
            url: 'task/detailList',
            data: {
                repairProgId: repairProgId,
                catagory: catagory,
            },
            success: function (data) {
                appendDetail(data, num);
            },
        })
    }

    function appendDetail(data, num) {
        var tbody = $("#table" + (num * 1 + 1)).find("tbody");
        var detailList = eval(data.detailList);
        var html = "";
        var taskId =${taskId};
        if (detailList != null && detailList.length > 0) {
            $(detailList).each(function () {
                var detail = eval(this);
                var detailId = detail.id;
                html += "<tr>";
                html += "<td>" + detail.proOrderNo + "</td>";
                html += "<td>" + detail.proName + "</td>"
                html += "<td>" + detail.proDesc + "</td>";
                var taskStatus = detail.taskStatus;
                if (taskStatus == 0) {
                    html += "<td><label  class='btn green-jungle'><fmt:message key="progress_completed"/> </label></td>"/*已完成*/
                } else if (taskStatus == 1) {
                    html += "<td><label  class='btn blue'><fmt:message key="progress_underway"/></label></td>"/*进行中*/
                } else if (taskStatus == 3) {
                    html += "<td><label  class='btn yellow'><fmt:message key="progress_canceled"/></label></td>"/*已取消*/
                } else {
                    html += "<td><label  class='btn default'><fmt:message key="progress_not_started"/></label></td>"/*未开始*/
                }
                html += "<td><a data-target='navTab' class='btn default' href='report/addRecord?id=" + detailId + "&taskId=" + taskId + "'><fmt:message key="report_enter"/> </a></td>";/*进入*/
                html += "<td><a data-target='navTab' class='btn default' href='reportDetail/recentDetail?progDetailId=" + detailId + "&taskId=" + taskId + "'><fmt:message key="go_check"/> </a></td>";/*查看*/
                html += "</tr>";
            })
            if (num != 8) {
                tbody.html(html);
            }
        } else {
            if (num != 8) {
                tbody.parents(".item").remove();
            }
        }

        if (num == 8) {
            if (detailList != null && detailList.length > 0) {
                var orderNo = detailList[detailList.length - 1].proOrderNo;
                var nextNo = orderNo.substring(orderNo.length - 3, orderNo.length);
                console.log("nextNo:" + nextNo);
                $("#nextADNo").val(nextNo * 1 + 1);
            }
            html += "<tr><td colspan='6'><a id='addNewButton' class='btn btn-sm blue' href='#addNew' data-toggle='modal'><fmt:message key="repair_spec_append"/> </a></td></tr>";/*新增*/
            tbody.html(html);
        }
    }

    function addNew() {
        if (check()) {
            var no = $("#nextADNo").val();
            $("#proOrderNo").val("AD-" + foo(no))
            $("#nextADNo").val(no * 1 + 1);
            $("#addNewForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        appendNewRow(data.id, $("#proName").val(), $("#proDesc").val(), $("#proOrderNo").val());
                        $("#proName").val("");
                        $("#proDesc").val("");
                        $("#addNew .btn-default").click();
                    } else {
                        saveAlert("ruby", "<fmt:message key="report_add_failure"/> ")/*新增失败,请稍后再试*/
                    }
                },
                error: function () {
                    saveAlert("tangerine", "<fmt:message key='report_system_error'/> ")/*系统错误,请稍后再试*/
                }
            })
        }
    }

    function saveAlert(theme, msg) {
        var settings = {
            theme: theme,
            sticky: false,
            horizontalEdge: "top",
            verticalEdge: "left"
        }
        if (!settings.sticky) {
            settings.life = 3000;
        }
        $.notific8('zindex', 11500);
        $.notific8(msg, settings);
    }

    function foo(str) {
        str = '00' + str;
        return str.substring(str.length - 3, str.length);
    }

    function check() {
        var proName = $("#proName").val();
        if (proName == null || proName.trim() == "") {
            $("#proName").tips({
                side: 2,
                msg: '<fmt:message key="project_name_empty"/> ',/*工程名称不能为空*/
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        return true;
    }

    function appendNewRow(id, proName, proDesc, proOrderNo) {
        var newRow = $("#newRowTemp").clone().removeAttr("id");
        newRow.find(".proOrderNo-td").html(proOrderNo);
        newRow.find(".proName-td").html(proName);
        newRow.find(".proDesc-td").html(proDesc);
        newRow.find(".report-td a").prop("href", "report/addRecord?id=" + id + "&taskId=" + taskId);
        newRow.find(".recent-td a").prop("href", "reportDetail/recentDetail?progDetailId=" + id + "&taskId=" + taskId);
        var tr = $("#addNewButton").parents("tr");
        tr.before(newRow);
    }
</script>