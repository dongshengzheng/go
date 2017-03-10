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

<div id="static" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">请输入邮箱</h4>
            </div>
            <div class="modal-body">
                <input id="email" class="form-control" placeholder="请输入正确的邮箱" name="toAddress">
                <input id="id" type="hidden" name="id">
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline">关闭</button>
                <button type="button" onclick="severCheck(this)" class="btn dark btn-outline">发送</button>
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
                    "data": "name",
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
                            + '<a href="repairSpec/info?id=' + row.id + '" class="btn btn-sm margin-bottom-5 default mt-ladda-btn ladda-button" data-style="slide-down" data-target="navTab"><span class="ladda-label">查看</span></a>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/makeProgress">
                            + '<a href="repairProg/makeProgress?id=' + row.id +
                            '" data-msg="确定生成吗？"  data-model="ajaxToDo"  class="btn btn-sm margin-bottom-5 green">生成维修进度</a>'
                            </shiro:hasPermission>
                            + '<div class="btn-group margin-top-5">'
                            + '<button class="btn btn-sm margin-bottom-5 dropdown-toggle blue" type="button" data-toggle="dropdown"> 更多 <i class="fa fa-angle-down"></i> </button> '
                            + '<ul class="dropdown-menu pull-right" role="menu"> '
                            <shiro:hasPermission name="repairSpec/edit">
                            + '<li> <a href="repairSpec/edit?id=' + row.id + '" class="btn btn-sm margin-bottom-5 grey-mint mt-ladda-btn ladda-button" data-style="slide-down" data-target="navTab"><span class="ladda-label">编辑</span></a> </li> '
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/delete">
                            + '<li><a href="repairSpec/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm margin-bottom-5 red">删除</a></li>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/enquiry">
                            + '<li><a href="repairSpec/enquiry?id=' + row.id + '" class="btn btn-sm margin-bottom-5 blue" data-target="navTab">询价</a></li>'
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/exportExcel">
                            + '<li><a onclick="addId(' + row.id + ')" href="#static" data-toggle="modal" class="btn btn-sm margin-bottom-5 yellow">发送excel</a></li>'
                            </shiro:hasPermission>
                            + '</ul></div>';

                }
            }],
            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
                Ladda.bind('.mt-ladda-btn', {timeout: 60000});
            },
            "initComplete": function () {
                initSearchForm(null, "请输入船舶名称");
            }
        });
        $('#myInput').on('keyup', function () {
            defTable.search(this.value).draw();
        });
    });

    function severCheck(obj) {
        if (check()) {
            var email = $("#email").val();
            var id = $("#id").val();
            $(obj).prop("disabled", true);
            $.ajax({
                type: "POST",
                url: 'repairSpec/exportExcel',
                data: {
                    id: id,
                    toAddress: email
                },
                success: function (data) {
                    if ("success" == data.result) {
                        alert("成功");
                        $(".close").click();
                    } else if ("email error" == data.result) {
                        $("#email").tips({
                            side: 1,
                            msg: "<fmt:message key="register_incorrect_email2"/>",
                            bg: '#FF5080',
                            time: 15
                        });
                        $("#email").focus();
                        $(obj).prop("disabled", false);
                    }
                },
                error: function () {
                    alert("发生错误,请稍后再试");
                    $(obj).prop("disabled", false);
                }
            })
        }
    }

    function check() {
        var email = $("#email").val();
        if (email == "") {
            $("#email").tips({
                side: 1,
                msg: '<fmt:message key="register_email_empty"/>',
                bg: '#AE81FF',
                time: 3
            });
            $("#email").focus();
            return false;
        } else if (!checkMail(email)) {
            $("#email").tips({
                side: 1,
                msg: '<fmt:message key="register_incorrect_email2"/>',
                bg: '#AE81FF',
                time: 3
            });
            $("#email").focus();
            return false;
        }
        return true;
    }

    function checkMail(mail) {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (filter.test(mail)) {
            return true;
        } else {
            return false;
        }
    }

    function addId(id) {
        console.log(id);
        $("#id").val(id);
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