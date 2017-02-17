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
                            船舶信息
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
                        <th>船舶名称</th>
                        <th>IMO</th>
                        <th>船舶类型</th>
                        <th>载重吨</th>
                        <th>船级社</th>
                        <th>坞检</th>
                        <th>特检</th>
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
                "url": "ship/list",
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
                    "data": "name",
                    "render": function (data, type, row) {
                        return row.name;
                    }
                },
                {
                    "data": "imo",
                },
                {
                    "data": "type",
                },
                {
                    "data": "dwt",
                },
                {
                    "data": "shipClass",
                },
                {
                    "data": "dd",
                },
                {
                    "data": "ss",
                },
//                {
//                    "data": "createDate", "type": "date",
//                    "render": function (data) {
//                        var date = new Date(data);
//                        return date.Format("yyyy-MM-dd");
//                    }
//                },
            ],

            "columnDefs": [{
                "targets": 7,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="ship/info">
                            + '<a href="ship/info?id=' + row.id + '" class="btn btn-sm grey-mint" data-target="navTab"></i>查看</a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="ship/edit">
                            + '<a href="ship/edit?id=' + row.id + '" class="btn  btn-sm blue" data-target="navTab"></i>编辑</a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="ship/delete">
                            + '<a href="ship/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm red">删除</a>'
                            </shiro:hasPermission>
                            ;
                }
            }],

            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "请输入船厂名称");
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