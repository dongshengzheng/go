<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="ship"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            每日报告
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="ship/add">
                                    <a href="ship/add" data-target="navTab"
                                       class="btn btn-sm blue"><i class="fa fa-plus"></i> 新增船舶信息
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
                        <th>序号</th>
                        <th>日期</th>
                        <th>天气</th>
                        <th>温度</th>
                        <th>湿度</th>
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
                    "data": "hnmiaity"
                }

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
//                initSearchForm(null, "请输入船厂名称");
            }
        });

        $('#myInput').on('keyup', function () {
            defTable.search(this.value).draw();
        });


    });

    function check(id, status) {
        if (confirm("确定审核？")) {
            $.post("/shipinfo/check", {id: id, status: status}, function () {
                refreshTable();
            });

        }

    }
    //
    //    function      slide(id, slide) {
    //        if (confirm("确定提交？")) {
    //            $.post("/shipinfo/slide", {id: id, slide: slide}, function () {
    //                refreshTable();
    //            });
    //        }
    //    }


    function refreshTable(toFirst) {
        //defaultTable.ajax.reload();
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }

</script>