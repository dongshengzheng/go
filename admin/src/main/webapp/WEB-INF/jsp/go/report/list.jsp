<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="report"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            每日报告
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-4">
                            船名: ${task.shipName}
                        </div>
                        <div class="col-md-4">
                            维修单号:
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>日期</th>
                        <th>天气</th>
                        <th>温度(℃)</th>
                        <th>湿度(%)</th>
                        <th>所涉及单号</th>
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
                "url": "report/list",
                "type": "post",
                "data": function (data) {
                    data.taskId =${task.id};
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },

            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {
                    "data": "id"
                },
                {
                    "data": "publishTime",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "weather"
                },
                {
                    "data": "temperature"
                },
                {
                    "data": "humidity"
                }
            ],

            "drawCallback": function (settings) {
                defTable.column(0).nodes().each(function (cell, i) {
                    i = i + 1;
                    var page = defTable.page.info();
                    var pageNo = page.page;
                    var length = page.length;
                    var columnIndex = (i + pageNo * length);
                    cell.innerHTML = columnIndex;

                });
            },
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