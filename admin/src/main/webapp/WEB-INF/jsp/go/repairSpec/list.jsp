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
                                       class="btn btn-sm blue mt-ladda-btn ladda-button" data-style="slide-down">
                                        <span class="ladda-label"> <i class="fa fa-plus"></i> 新增维修工程单</span>
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
            ],

            "columnDefs": [{
                "targets": 9,
                "render": function (data, type, row) {
                    return ""
                            <shiro:hasPermission name="repairSpec/info">
                            + '<a href="repairSpec/info?id=' + row.id + '" class="btn btn-sm margin-bottom-5 default" data-target="navTab"></i>查看</a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/makeProgress">
                            + '<a href="repairProg/makeProgress?id=' + row.id +
                            '" data-msg="确定生成吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm margin-bottom-5 green">生成维修进度</a>'
                            </shiro:hasPermission>
                            + '<div class="btn-group margin-top-5">'
                            + '<button class="btn btn-sm margin-bottom-5 dropdown-toggle blue" type="button" data-toggle="dropdown"> 更多 <i class="fa fa-angle-down"></i> </button> '
                            + '<ul class="dropdown-menu pull-right" role="menu"> '
                            <shiro:hasPermission name="repairSpec/edit">
                            + '<li> <a href="repairSpec/edit?id=' + row.id + '" class="btn btn-sm margin-bottom-5 grey-mint" data-target="navTab"></i>编辑</a> </li> '
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/delete">
                            + '<li><a href="repairSpec/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm margin-bottom-5 red">删除</a></li>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/enquiry">
                            + '<li><a href="repairSpec/enquiry?id=' + row.id + '" class="btn btn-sm margin-bottom-5 blue" data-target="navTab"></i>询价</a></li>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/delete">
                            + '<a href="repairSpec/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="dialog" data-callback="refreshTable" class="btn btn-sm red">确定</a>'
                            </shiro:hasPermission>
                            ;
                            <shiro:hasPermission name="repairSpec/exportExcel">
                            + '<li><a href="repairSpec/exportExcel?id=' + row.id +
                            '" data-msg="确定发送吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm margin-bottom-5 yellow">发送excel</a></li>'
                            </shiro:hasPermission>
                            + '</ul></div>';
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

    function refreshTable(toFirst) {
        //defaultTable.ajax.reload();
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }


    var UIButtons = function () {
        var handleButtons = function () {
            Ladda.bind('.mt-ladda-btn', {timeout: 60000});
        }
        return {
            init: function () {
                handleButtons();
            }
        };
    }();

    jQuery(document).ready(function () {
        UIButtons.init();
    });

</script>