<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String ctx = request.getContextPath();
%>
<style>
    table th,td {
        text-align: center;
    }
</style>
<go:navigater path="privateShipyard"></go:navigater>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <fmt:message key="shipyard_info"/> <%--船厂信息--%>
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="privateShipyard/add">
                                    <a href="privateShipyard/add" data-target="navTab"
                                       class="btn btn-sm blue"><i class="fa fa-plus"></i> <fmt:message key="shipyard_add_info"/> <%--新增船厂信息--%>
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
                        <th><fmt:message key="shipyard_logo"/> </th><%--Logo--%>
                        <th><fmt:message key="shipyard_name"/></th><%--船厂名称--%>
                        <th><fmt:message key="shipyard_group"/></th><%--集团公司--%>
                        <th><fmt:message key="shipyard_nation"/></th><%--国家--%>
                        <th><fmt:message key="shipyard_city"/></th><%--城市--%>
                        <th><fmt:message key="shipyard_location"/></th><%--位置--%>
                        <th><fmt:message key="shipyard_contact_phone"/></th><%--联系电话--%>
                        <th><fmt:message key="shipyard_pic"/></th><%--联系人--%>
                        <th><fmt:message key="shipyard_email"/></th><%--邮箱--%>
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
                "url": "privateShipyard/list",
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
                    "data": "logo",
                    "render": function (logo) {
                        return "<img src='<%=basePath%>assets/layouts/layout/img/loading.gif'>"
                    }
                },
                {
                    "data": "name",
                },
                {
                    "data": "groupCompany",
                },
                {
                    "data": "country",
                },
                {
                    "data": "city",
                },
                {
                    "data": "location",
                },
                {
                    "data": "tel",
                },
                {
                    "data": "contactName",
                },
                {
                    "data": "email",
                },
            ],

            "columnDefs": [{
                "targets": 9,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="privateShipyard/look">
                            + '<a href="privateShipyard/look?id=' + row.id + '" class="btn btn-sm grey-mint" data-target="navTab"></i><fmt:message key='go_check'/> </a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="privateShipyard/edit">
                            + '<a href="privateShipyard/edit?id=' + row.id + '" class="btn  btn-sm blue" data-target="navTab"></i><fmt:message key='go_editor'/></a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="privateShipyard/delete">
                            + '<a href="privateShipyard/delete?id=' + row.id +
                            '" data-msg="<fmt:message key='shipyard_delete_confirm'/> "  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm red"><fmt:message key='go_delete'/> </a>'
                            </shiro:hasPermission>
                            ;
                }
            }],

            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "<fmt:message key='shipyard_search_name'/> ");/*搜索船厂名称*/
            }
        });

        $('#myInput').on('keyup', function () {
            defTable.search(this.value).draw();
        });
    });


    function refreshTable(toFirst) {
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }


</script>
<script>
    if (${mes}) {
        alert("<fmt:message key='shipyard_info_no'/> ");
    }
</script>