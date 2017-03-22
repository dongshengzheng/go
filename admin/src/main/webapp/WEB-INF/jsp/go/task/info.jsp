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
                            工程汇报
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4">
                            船名: ${task.shipName}
                        </div>
                        <div class="col-md-4">
                            维修单号:
                        </div>
                        <div class="col-md-4">
                            <a href="report/add?taskId=${task.id}"
                               data-model="dialog">当日汇报提交</a>
                        </div>
                    </div>
                </div>
                <c:forEach items="${cataList}" var="cata" varStatus="outerVs">
                    <c:set var="type" value="type${outerVs.count}"></c:set>
                    <div class="portlet-body">
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
                                                <th>单号</th>
                                                <th>工程名称</th>
                                                <th>工程描述</th>
                                                <th>工程状态</th>
                                                <th>记录汇报</th>
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
<input type="hidden" id="repairProgId" value="${task.repairProgId}">
<script>
    $(function () {
        var catagory = ["通用服务", "坞修工程", "船体工程", "机械工程", "电气工程", "冷藏工程", "特种设备", "其他"];
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
        var taskId=${taskId};
        if (detailList != null && detailList.length > 0) {
            $(detailList).each(function () {
                var detail = eval(this);
                var detailId=detail.id;
                html += "<tr>";
                html += "<td>" + detail.proOrderNo + "</td>";
                html += "<td>" + detail.proName + "</td>";
                html += "<td>" + detail.proDesc + "</td>";
                var taskStatus = detail.taskStatus;
                if (taskStatus == 0) {
                    html += "<td><label  class='btn green-jungle'>已完成</label></td>"
                } else if (taskStatus == 1) {
                    html += "<td><label  class='btn blue'>进行中</label></td>"
                } else if (taskStatus == 3) {
                    html += "<td><label  class='btn yellow'>已取消</label></td>"
                } else {
                    html += "<td><label  class='btn default'>未开始</label></td>"
                }
                html += "<td>" + "<a data-target='navTab' class='btn default' href='report/addRecord?id="+detailId+"&taskId="+taskId+"'  data-mode='dialog' >进入</a>" + "</td>";
                html += "</tr>";
            })
        } else {
            html += "<tr><td colspan='5'>无详单信息</td><tr>"
        }
        tbody.html(html);
    }
</script>
