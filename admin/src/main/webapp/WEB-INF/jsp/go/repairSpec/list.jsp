<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    long time = new Date().getTime();
%>
<go:navigater path="repairSpec"></go:navigater>
<style>
    .htContextMenu {
        z-index: 1060000;
    }

    table th, td {
        text-align: center;
    }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                    <div class="row">
                        <div class="col-md-6">
                            <fmt:message key="repair_spec"/> <%--维修工程单--%>
                        </div>
                        <div class="col-md-2">
                            <div class="btn-group">
                                <shiro:hasPermission name="repairSpec/add">
                                    <a href="repairSpec/add?t=<%=time%>" data-target="navTab"
                                       class="btn btn-sm blue mt-ladda-btn ladda-button" data-style="slide-down">
                                        <span class="ladda-label"> <i class="fa fa-plus"></i> <fmt:message key="repair_spec_add"/> <%--新增维修工程单--%></span>
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
                        <th><fmt:message key="repair_vessel_name"/> </th><%--船舶名称--%>
                        <th><fmt:message key="repair_repc_num"/></th><%--维修单号--%>
                        <th><fmt:message key="repair_spec_type"/></th><%--维修类别--%>
                        <th><fmt:message key="repair_spec_company_type"/></th><%--公司名称--%>
                        <th><fmt:message key="repair_spec_plan_date"/></th><%--计划进场日期--%>
                        <th><fmt:message key="repair_spec_plan_day"/></th><%--计划天数--%>
                        <th><fmt:message key="repair_spec_plan_cost"/></th><%--计划金额--%>
                        <th><fmt:message key="repair_spec_create_date"/></th><%--创建日期--%>
                        <th><fmt:message key="repair_spec_creator"/></th><%--创建人--%>
                        <th><fmt:message key="go_operation"/></th><%--操作--%>
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
                <h4 class="modal-title"><fmt:message key="repair_spec_enter_email"/> </h4><%--请输入邮箱--%>
            </div>
            <div class="modal-body">
                <input id="email" class="form-control" placeholder="<fmt:message key='repair_spec_enter_correct_email'/> " name="toAddress"><%--请输入正确的邮箱--%>
                <input id="id" type="hidden" name="id">
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline"><fmt:message key="repair_spec_close"/> <%--关闭--%></button>
                <button type="button" onclick="severCheck(this)" class="btn dark btn-outline"><fmt:message key="repair_spec_send"/> <%--发送--%></button>
            </div>
        </div>
    </div>
</div>

<div id="make" class="modal fade" tabindex="-1" data-backdrop="make" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #4bccd8">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><fmt:message key="repair_spec_enter_info"/> <%--请输入信息--%></h4>
            </div>
            <div class="modal-body">
                <label><fmt:message key="repair_spec_enter_shipyard"/> <%--请输入船厂--%></label>
                <input id="shipyardName" class="form-control" placeholder="<fmt:message key='repair_spec_enter_correct_shipyard'/> "<%--请输入正确的船厂--%>
                                           name="shipyardName">
            </div>
            <div class="modal-body">
                <label><fmt:message key="repair_spec_enter_email"/> <%--请输入邮箱--%></label>
                <div id="example1" style=" height: 200px; overflow: hidden;"></div>
                <input type="hidden" id="repairSpecId"/>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline"><fmt:message key="repair_spec_close"/> <%--关闭--%></button>
                <button type="button" onclick="sure(this)" class="btn dark btn-outline"><fmt:message key="repair_spec_confirm"/> <%--确定--%></button>
            </div>
        </div>
    </div>
</div>
<a href="repairProg" class="btn btn-sm grey-mint" data-target="navTab" id="repairProg" style="display: none"></a>
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
                    "render": function (data) {
                        if(data==1){
                            return "<fmt:message key="repair_temporary_repairs"/>";
                        }else if(data=2){
                            return "<fmt:message key="repair_dd"/>";
                        }else {
                            return "<fmt:message key="repair_remould"/>";
                        }
                    }
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
                            + '<a href="repairSpec/info?id=' + row.id + '" class="btn btn-sm margin-bottom-5 default mt-ladda-btn ladda-button" data-style="slide-down" data-target="navTab"><span class="ladda-label"><fmt:message key='go_check'/> </span></a>'/*查看*/
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/makeProgress">
                            + '<a href="#make" onclick="makeId(' + row.id + ')" data-toggle="modal"  class="btn btn-sm margin-bottom-5 green"><fmt:message key='repair_spec_prog'/> </a>'/*生成维修进度*/
                            </shiro:hasPermission>
                            + '<div class="btn-group margin-top-5">'
                            + '<button class="btn btn-sm margin-bottom-5 dropdown-toggle blue" type="button" data-toggle="dropdown">  <fmt:message key='repair_spec_more'/> <i class="fa fa-angle-down"></i> </button> '/*更多*/
                            + '<ul class="dropdown-menu pull-right" role="menu"> '
                            <shiro:hasPermission name="repairSpec/edit">
                            + '<li> <a href="repairSpec/edit?id=' + row.id + '" class="btn btn-sm margin-bottom-5 grey-mint mt-ladda-btn ladda-button" data-style="slide-down" data-target="navTab"><span class="ladda-label"><fmt:message key='go_editor'/> </span></a> </li> '/*编辑*/
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/delete">
                            + '<li><a href="repairSpec/delete?id=' + row.id +
                            '" data-msg="确定删除吗？"  data-model="ajaxToDo" data-callback="refreshTable" class="btn btn-sm margin-bottom-5 red"><fmt:message key='go_delete'/> </a></li>'/*删除*/
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/enquiry">
                            + '<li><a href="enquiry/compare?id=' + row.id + '" class="btn btn-sm margin-bottom-5 blue" data-target="navTab">比价 </a></li>'/*询价*/
                            </shiro:hasPermission>
                            <shiro:hasPermission name="repairSpec/exportExcel">
                            + '<li><a onclick="addId(' + row.id + ')" href="#static" data-toggle="modal" class="btn btn-sm margin-bottom-5 yellow"><fmt:message key='repair_spec_send_excel'/> </a></li>'/*发送excel*/
                            </shiro:hasPermission>
                            + '</ul></div>';

                }
            }],
            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
                Ladda.bind('.mt-ladda-btn', {timeout: 60000});
            },
            "initComplete": function () {
                initSearchForm(null, "<fmt:message key='ship_name_input'/> ");/*请输入船舶名称*/
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
            $.ajax({
                type: "POST",
                url: 'repairSpec/exportExcel',
                data: {
                    id: id,
                    toAddress: email
                },
                success: function (data) {
                    if ("success" == data.result) {
                        excelAlert("teal", "<fmt:message key='repair_spec_send_success'/> ");/*发送成功*/
                    } else if ("email error" == data.result) {
                        excelAlert("ruby", "<fmt:message key='repair_spec_send_failure'/>");/*发送失败*/
                    }
                },
                error: function () {
                    excelAlert("tangerine", "<fmt:message key='repair_spec_system_error'/>");/*系统错误,发送失败*/
                }
            })
            $(".close").click();
        }
    }

    function check() {
        var email = $("#email").val();
        if (email == "") {
            $("#email").tips({
                side: 1,
                msg: "<fmt:message key="register_email_empty"/>",
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

    //发送工程单响应alert
    function excelAlert(theme, msg) {
        var settings = {
            theme: theme,
            sticky: false,
            horizontalEdge: "top",
            verticalEdge: "left"
        }
        if (!settings.sticky) {
            settings.life = 3000;
        }
        $.notific8('zindex', 11500);
        $.notific8(msg, settings);
    }


    /*s生成维修进度所调用的方法*/
    function sure(obj) {
        var arr1 = new Array();
        var datas = handsontableData();
        var j = 0;
        for (var i = 0; i < datas.length; i++) {
            if (datas[i] == null || datas[i] == "") {
                continue;
            }
            var obj = new Object();
            obj.email = datas[i];
            arr1[j++] = obj;
        }
        var dataJson = JSON.stringify(arr1);

        if (check1(arr1)) {
            var repairSpecId = $("#repairSpecId").val();
            var shipyardName = $("#shipyardName").val();
            $.ajax({
                type: "post",
                data: {
                    id: repairSpecId,
                    dataJson: dataJson,
                    shipyardName: shipyardName
                },
                url: "repairProg/makeProgress",
                success: function (data) {
                    if (data.mes) {
                        alert("<fmt:message key='repair_spec_submit_success'/>");/*提交成功*/
                        $(".close").click();
                    } else {
                        alert("<fmt:message key='repair_spec_submit_failure'/> ");/*提交失败*/
                        $(".close").click();
                    }
                },
                error: function () {
                    alert("<fmt:message key='repair_spec_go_wrong'/>");/*发生错误,请稍后再试*/
                    $(obj).prop("disabled", false);
                }
            });
        }
    }
    function check1(attr) {
        if (attr.length <= 0) {
            $("#example1").tips({
                side: 1,
                msg: "<fmt:message key="register_email_empty"/>",/*邮箱不能为空*/
                bg: '#AE81FF',
                time: 3
            });
            return false;
        }
        var datas = handsontableData();
        for (var i = 0; i < datas.length; i++) {
            if (datas[i] == null || datas[i] == "") {
                continue;
            }
            if (!checkMail(datas[i])) {
                var j = i + 1
                $("#example1").tips({
                    side: 1,
                    msg: '第' + j + '行<fmt:message key="register_incorrect_email2"/>',
                    bg: '#AE81FF',
                    time: 3
                });
                return false;
            }
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

    function makeId(id) {
        console.log(id);
        $("#repairSpecId").val(id);
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
<script>
    var container = document.getElementById('example1'),
            storedData = {},
            savedKeys,
            resetState,
            stateLoaded,
            hot;

    hot = new Handsontable(container, {
        rowHeaders: true,
        colHeaders: true,
        colWidths: [500],
        minRows: 2,
        colHeaders: ["<fmt:message key='repair_spec_email_address'/> "],/*邮箱地址*/
        columnSorting: true,
        columns: [
            {data: "des"},
        ],
        manualColumnMove: false,
        manualColumnResize: true,
        manualRowMove: true,
        manualRowResize: true,
        minSpareRows: 1,
        contextMenu: true,
        persistentState: true
    });

    function handsontableData() {
        return hot.getDataAtCol(0);
    }
</script>