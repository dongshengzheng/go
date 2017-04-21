<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    table th, td {
        text-align: center;
    }
</style>
<go:navigater path="modelDetail"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <fmt:message key="repair_specification_example"/> <%--维修范本单--%>
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="modelDetail/add">
                                    <a href="modelDetail/add" data-target="navTab"
                                       class="btn btn-sm blue"><i class="fa fa-plus"></i> <fmt:message key="example_add"/> <%--新增范本信息--%>
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
                        <th><fmt:message key="project_name"/> </th><%--工程名称--%>
                        <th><fmt:message key="project_vessel_name"/></th><%--船名--%>
                        <th><fmt:message key="project_category"/></th><%--项目分类--%>
                        <th><fmt:message key="project_number"/></th><%--项目号--%>
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
                "url": "modelDetail/list",
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
                    "data": "proName",
                },
                {
                    "data": "shipName",
                },
                {
                    "data": "catagory",
                },
                {
                    "data": "code",
                },

            ],

            "columnDefs": [{
                "targets": 4,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="modelDetail/info">
                            + '<a href="modelDetail/info?id=' + row.id + '&operate=look" class="btn btn-sm grey-mint" data-target="navTab"></i><fmt:message key="go_check"/> </a>'
                           </shiro:hasPermission>
                            <shiro:hasPermission name="modelDetail/info">
                            + '<a href="modelDetail/info?id=' + row.id + '&operate=edit" class="btn  btn-sm blue" data-target="navTab"></i><fmt:message key="go_editor"/> </a>'/*编辑*/
                           </shiro:hasPermission>
                            <shiro:hasPermission name="modelDetail/delete">
                            + '<a href="modelDetail/delete?id=' + row.id +
                            '" data-msg="<fmt:message key="go_delete_confirm"/> "  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm red"><fmt:message key="go_delete"/> </a>'
                            </shiro:hasPermission>
                            ;
                }
            }],

            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "<fmt:message key="project_enter_name"/> ","<fmt:message key='go_search' />");/*请输入工程名称*/
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