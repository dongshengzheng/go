<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    table th,td {
        text-align: center;
    }
</style>
<go:navigater path="repairProg"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <fmt:message key="progress_work_manag"/> <%--维修工程管理--%>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table">
                    <thead>
                    <tr>
                        <th><fmt:message key="repair_vessel_name"/></th><%--船舶名称--%>
                        <th><fmt:message key="repair_repc_num"/></th><%--维修单号--%>
                        <th><fmt:message key="repair_spec_type"/></th><%--维修类别--%>
                        <th><fmt:message key="progress_shipyard"/></th><%--船厂--%>
                        <th><fmt:message key="repair_spec_plan_date"/></th><%--计划进厂日期--%>
                        <th><fmt:message key="repair_spec_plan_day"/></th><%--计划天数--%>
                        <th><fmt:message key="repair_spec_plan_cost"/></th><%--计划金额--%>
                        <th><fmt:message key="repair_spec_create_date"/></th><%--创建日期--%>
                        <th><fmt:message key="repair_spec_creator"/></th><%--创建人--%>
                        <th><fmt:message key="progress_general"/></th><%--工程总进度--%>
                        <th><fmt:message key="go_operation"/></th><%--操作--%>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var defTable;
    $(document).ready(function () {
        defTable = $('#default_table').DataTable({
            "ordering": false,
            "pagingType": "simple_numbers",
            "processing": true,
            "autoWidth": false,
            "serverSide": true,
            "ajax": {
                "url": "repairProg/list",
                "type": "post",
                "data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "http://windyeel.oss-cn-shanghai.aliyuncs.com/global/plugins/datatables/cn.txt"
            },

            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {
                    "data": "shipName",
                },
                {
                    "data": "orderNo",
                },
                {
                    "data": "type",
                },
                {
                    "data": "shipyardName",
                },
                {
                    "data": "planStartDate", "type": "date",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "planDays",
                },
                {
                    "data": "planCost",
                },
                {
                    "data": "createDate", "type": "date",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "createBy",
                },
                {
                    "data": "per",
                    "render": function (data) {
                        if (data == null) {
                            data = 100;
                        }
                        return '<input type="text" value="' + data + '" class="prog"/>';
                    }
                },
            ],

            "columnDefs": [{
                "targets": 10,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="repairProg/info">
                            + '<a href="repairProg/info?id=' + row.id + '" class="btn btn-sm grey-mint" data-target="navTab"></i><fmt:message key="progress_review_pro"/></a>'/*查看进度*/
                            </shiro:hasPermission>
                            ;
                }
            }],

            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
                $(".prog").each(function () {
                    var percent = $(this).val();
                    $(this).ionRangeSlider({
                        min: 0,
                        max: 100,
                        from: percent,
                        from_fixed: true,
                    });
                })
            },
            "initComplete": function () {
                initSearchForm(null, "<fmt:message key='ship_name_input'/> ","<fmt:message key='go_search' />");/*请输入船舶名称*/
            }
        });

        $('#myInput').on('keyup', function () {
            defTable.search(this.value).draw();
        });
    });


    function refreshTable(toFirst) {
        //defaultTable.ajax.reload();
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }

</script>