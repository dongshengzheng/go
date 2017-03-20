<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="progress"></go:navigater>
<go:navigater path="task"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            维修工程单汇报
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="ship/add">
                                    <a href="ship/add" data-target="navTab"
                                       class="btn btn-sm blue"><i class="fa fa-plus"></i> 新增汇报信息
                                    </a>
                                </shiro:hasPermission>
                            </div>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table">
                    <thead>
                    <tr>
                        <th>船舶名称</th>
                        <th>维修单号</th>
                        <th>维修状态</th>
                        <th>维修船厂</th>
                        <th>最后报告日期</th>
                        <th>汇报邮箱</th>
                        <th>查看每日汇报</th>
                        <th>工程汇报</th>
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
                "url": "task/list",
                "type": "post",
                "data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },

            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {
                    "data": "shipName",
                },
                {
                    "data": "shipName",
                },
                {
                    "data": "status",
                    "render": function (data) {
                        if (data == 0) {
                            return "已完成";
                        } else if (data == 1) {
                            return "进行中";
                        } else {
                            return "未开始";
                        }
                    }
                },
                {
                    "data": "shipyard",
                },
                {
                    "data": "shipyard",
                },
                {
                    "data": "shipyard",
                },
                {
                    "data": "id",
                    "render": function (data) {
                        return "<button type='button' class='btn btn-sm blue'>查看</button>";
                    }
                },
                {
                    "data": "id",
                    "render": function (data) {
                        return "<a href='task/info?id=" + data + "' data-target='navTab'>进入汇报</a>";
                    }
                },
//                {
//                    "data": "createDate", "type": "date",
//                    "render": function (data) {
//                        var date = new Date(data);
//                        return date.Format("yyyy-MM-dd");
//                    }
//                },
            ],

            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "请输入船舶名称");
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
