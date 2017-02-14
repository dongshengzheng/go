<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="repairSpec"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            维修工程单
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="repairSpec/add">
                                    <a href="repairSpec/add" data-target="navTab"
                                       class="btn btn-sm blue"><i class="fa fa-plus"></i> 新增维修工程单
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
                        <th>维修类别</th>
                        <th>公司名称</th>
                        <th>计划进场日期</th>
                        <th>计划天数</th>
                        <th>计划金额</th>
                        <th>创建日期</th>
                        <th>创建人</th>
                        <th>操作</th>
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
                "url": "repairSpec/list",
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
                    "data": "orderNo",
                },
                {
                    "data": "type",
                },
                {
                    "data": "companyName",
                },
                {
                    "data": "sStartDate", "type": "date",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                },
                {
                    "data": "sDays",
                },
                {
                    "data": "sCost",
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
            ],

            "columnDefs": [{
                "targets": 9,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="repairSpec/edit">
                            + '<a href="repairSpec/edit?id=' + row.id + '" class="btn btn-sm grey-mint" data-target="navTab"></i>编辑</a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/enquiry">
                            + '<a href="repairSpec/enquiry?id=' + row.id + '" class="btn  btn-sm blue" data-target="navTab"></i>询价</a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/delete">
                            + '<a href="repairSpec/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm red">删除</a>'
                            </shiro:hasPermission>
                            ;
                }
            }],

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