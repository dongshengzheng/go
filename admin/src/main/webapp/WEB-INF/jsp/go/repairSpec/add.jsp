<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .red {
        color: red;
    }

    .portlet.box > .portlet-title > .tools > a.collapse {
        background-image: url(<%=basePath%>assets/global/img/portlet-collapse-icon.png);
    }

    .details-control {
        cursor: pointer;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(odd) {
        background-color: white;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(even) {
        background-color: #fbfcfd;
    }

    .table-checkable tr.details-control-child > td:first-child {
        text-align: right;
        padding-right: 15px;
    }

    .table-striped > tbody > tr.details-control-child.detail-row:nth-of-type(odd) {
        background-color: white;
    }

    .table-striped > tbody > tr.details-control-child.detail-row:nth-of-type(even) {
        background-color: white;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(odd) {
        background-color: #d2f7ff;
    }

    .table-striped > tbody > tr.details-control-child:nth-of-type(even) {
        background-color: #d2f7ff;
    }

    .table-striped > tbody > tr:nth-of-type(odd) {
        background-color: #bfe3ff;
    }

    .table-striped > tbody > tr:nth-of-type(even) {
        background-color: #bfe3ff;
    }

    .remark-text {
        position: fixed;
        resize: none;
        left: 40%;
        top: 40%;
        z-index: 100;
    }

</style>
<go:navigater path="repairSpec"></go:navigater>
<form class="form-horizontal" action="repairSpec/add" method="post"
      id="defForm" callfn="refreshTable">
    <input type="hidden" name="modelId" value="${modelId}">
    <div class="profile-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div id="bootstrap_alerts_demo"></div>
                        <div class="caption caption-md">
                            <i class="fa fa-user"></i>
                            <span class="caption-subject font-blue-madison bold uppercase"> 新增维修工程单</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-info"></i>工程单概要
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="shipId" class="col-sm-3 control-label">
                                            船舶名称</label>
                                        <div class="col-sm-7">
                                            <select id="shipId" name="shipId" class="form-control">
                                                <option value="0">请选择船舶</option>
                                                <c:forEach items="${shipList}" var="ship">
                                                    <option value="${ship.id}">${ship.name}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" name="shipName" id="shipName" value="">
                                        </div>
                                        <label class="col-sm-1 control-label"><span class="red">* </span></label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="planStartDate" class="col-sm-3 control-label">计划进场日期</label>
                                        <div class="col-sm-7">
                                            <div class="input-group">
                                                <input id="planStartDate" name="planStartDate" type="text"
                                                       class="form-control date-picker" readonly
                                                       placeholder="请选择进厂日期">
                                                <span class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="planDays" class="col-sm-3 control-label">
                                            预估天数</label>
                                        <div class="col-sm-7">
                                            <input id="planDays" name="planDays" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修天数">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="planCost" class="col-sm-3 control-label">
                                            预估金额</label>
                                        <div class="col-sm-7">
                                            <input id="planCost" name="planCost" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修金额">
                                        </div>
                                        <label class="col-sm-2 control-label"
                                               style="padding-left: 5px;padding-right: 5px">
                                            (单位:万元)</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="col-sm-3 control-label">
                                            维修类型</label>
                                        <div class="col-sm-9 icheck-inline">
                                            <c:forEach items="${typeList}" var="type" varStatus="vs">
                                                <label>
                                                    <input type="radio" name="type"
                                                           value="${type.value}"
                                                           <c:if test="${vs.count==1}">checked</c:if>> ${type.des}
                                                    <span></span>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-cog"></i>维修工程详细
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body" id="content">
                                <c:forEach begin="1" end="8" varStatus="outerVs">
                                    <div class="portlet box blue-dark item" id="item${outerVs.count}">
                                        <div class="portlet-title" style="background-color: #00aaaa">
                                            <div class="caption">
                                                <i class="fa fa-cog"></i>
                                                <c:if test="${outerVs.count==1}">通用服务</c:if>
                                                <c:if test="${outerVs.count==2}">坞修工程</c:if>
                                                <c:if test="${outerVs.count==3}">船体工程</c:if>
                                                <c:if test="${outerVs.count==4}">机械工程</c:if>
                                                <c:if test="${outerVs.count==5}">电气工程</c:if>
                                                <c:if test="${outerVs.count==6}">冷藏工程</c:if>
                                                <c:if test="${outerVs.count==7}">特种设备</c:if>
                                                <c:if test="${outerVs.count==8}">其他</c:if>
                                            </div>
                                            <div class="tools">
                                                <a href="javascript:;" class="collapse"> </a>
                                            </div>
                                        </div>
                                        <div class="portlet-body">
                                            <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                                   id="table${outerVs.count}">
                                                    <%--通用服务开始--%>
                                                <c:if test="${outerVs.count==1}">
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">&nbsp;</th>
                                                        <th style="width:10%">项目号</th>
                                                        <th style="width:45%">维修内容</th>
                                                        <th style="width:10%">单位</th>
                                                        <th style="width:10%">数量</th>
                                                        <th style="width:10%">备注</th>
                                                        <th style="width:10%">操作</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="type" value="type${outerVs.count}"></c:set>
                                                    <c:forEach items="${requestScope[type]}" var="item"
                                                               varStatus="itemVs">
                                                        <c:if test="${item.parentCode!='0'}">
                                                            <tr class="details-control-child" data-parent="${item.parentCode}" data-code="${item.code}" style="display: none">
                                                        </c:if>
                                                        <c:if test="${item.parentCode=='0'}">
                                                            <tr class="top-row" data-parent="${item.parentCode}" data-code="${item.code}">
                                                        </c:if>
                                                        <input type="hidden" value="${item.catagory}"
                                                               name="type${outerVs.count}List[${itemVs.index}].catagory">
                                                        <input type="hidden" value="${item.code}" class=""
                                                               name="type${outerVs.count}List[${itemVs.index}].code">
                                                        <input type="hidden" value="${item.content}"
                                                               name="type${outerVs.count}List[${itemVs.index}].content">
                                                        <input type="hidden" value="${item.unit}"
                                                               name="type${outerVs.count}List[${itemVs.index}].unit">
                                                        <input type="hidden" value="${item.parentCode}"
                                                               name="type${outerVs.count}List[${itemVs.index}].parentCode">
                                                        <input type="hidden" value="${item.children}"
                                                               name="type${outerVs.count}List[${itemVs.index}].children">
                                                        <input type="hidden" value="${item.sort}"
                                                               name="type${outerVs.count}List[${itemVs.index}].sort">
                                                        <td>
                                                            <input type="checkbox" disabled
                                                                   class="status-checkBox status-control">
                                                            <input type="hidden" value="1" class="true-status"
                                                                   name="type${outerVs.count}List[${itemVs.index}].status">
                                                        </td>
                                                        <td>
                                                                ${item.code}
                                                        </td>
                                                        <td>${item.content}
                                                            <c:forEach items="${item.paramList}" var="p" varStatus="vs">
                                                                <c:if test="${(!(vs.count==1))||((vs.count==1)&&(!empty item.content))}">
                                                                    <br>
                                                                </c:if>
                                                                ${p.name}
                                                                <c:if test="${p.type=='text'}">
                                                                    <input name="type${outerVs.count}List[${itemVs.index}].param${vs.count}Val"
                                                                           class="input-control">
                                                                </c:if>
                                                                <c:if test="${p.type=='select'}">
                                                                    <select name="type${outerVs.count}List[${itemVs.index}].param${vs.count}Val">
                                                                        <c:forEach items="${p.paramValueVariableList}"
                                                                                   var="val">
                                                                            <option value="${val.paramValVariable}">${val.paramValVariable}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                                ${p.unit}
                                                            </c:forEach>
                                                        </td>
                                                        <td>${item.unit}</td>
                                                        <td><c:if test="${!empty item.unit}"><input
                                                                class="col-md-12 input-control"
                                                                name="type${outerVs.count}List[${itemVs.index}].count"></c:if>
                                                        </td>
                                                        <td><c:if test="${item.parentCode=='0'}">
                                                            <a class="add-remark" data-toggle="modal"
                                                               onclick="addRemark(this)" onmouseover="showRemark(this)"
                                                               onmouseout="showRemark(this)"
                                                               href="#responsive">添加备注 </a>
                                                            <textarea class="remark-text"
                                                                      name="type${outerVs.count}List[${itemVs.index}].remark"
                                                                      cols="60"
                                                                      rows="10"
                                                                      wrap="hard" placeholder="暂未添加备注"
                                                                      style="display: none"></textarea></c:if>
                                                        </td>
                                                        <c:if test="${item.children==1}">
                                                            <td class="details-control" data-code="${item.code}">
                                                                <a href="javascript:;"
                                                                   onclick="controlHidden(false,'${item.code}',this)"
                                                                   class="btn btn-circle blue m-icon m-icon-only open-png">
                                                                    <i class="m-icon-swapdown m-icon-white"></i>
                                                                </a>
                                                                <a href="javascript:;"
                                                                   onclick="controlHidden(true,'${item.code}',this)"
                                                                   class="btn btn-circle blue m-icon m-icon-only close-png"
                                                                   style="display: none">
                                                                    <i class="m-icon-swapup m-icon-white"></i>
                                                                </a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${item.children==0}">
                                                            <td>
                                                            </td>
                                                        </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <c:set var="lastCode"
                                                                   value="${requestScope[type][fn:length(requestScope[type])-1].code}"></c:set>
                                                            <input class="last-code"
                                                            <c:if test="${empty lastCode}">
                                                                   value="${outerVs.count}.0"
                                                            </c:if>
                                                            <c:if test="${!empty lastCode}">
                                                                   value="${outerVs.count}"
                                                            </c:if>
                                                            >
                                                            <button type="button" class="btn btn-sm blue addRow1">新增
                                                            </button>
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    </tbody>
                                                </c:if>
                                                    <%--通用服务结束--%>
                                                    <%--除通用服务外开始--%>
                                                <c:if test="${outerVs.count!=1}">
                                                    <tbody>
                                                    <thead>
                                                    <tr>
                                                        <th style="width:5%">&nbsp;</th>
                                                        <th style="width:10%">项目号</th>
                                                        <th style="width:40%">维修内容</th>
                                                        <th style="width:25%">维修详单</th>
                                                        <th style="width:10%">备注</th>
                                                        <th style="width:10%">操作</th>
                                                    </tr>
                                                    </thead>
                                                    <c:set var="type" value="type${outerVs.count}"></c:set>
                                                    <c:forEach items="${requestScope[type]}" var="item"
                                                               varStatus="itemVs">
                                                        <c:if test="${item.parentCode!='0'}">
                                                            <tr class="details-control-child" data-parent="${item.parentCode}" data-code="${item.code}" style="display: none">
                                                        </c:if>
                                                        <c:if test="${item.parentCode=='0'}">
                                                            <tr class="top-row" data-parent="${item.parentCode}" data-code="${item.code}">
                                                        </c:if>
                                                        <input type="hidden" value="${item.catagory}"
                                                               name="type${outerVs.count}List[${itemVs.index}].catagory">
                                                        <input type="hidden" value="${item.code}" class=""
                                                               name="type${outerVs.count}List[${itemVs.index}].code">
                                                        <input type="hidden" value="${item.content}"
                                                               name="type${outerVs.count}List[${itemVs.index}].content">
                                                        <input type="hidden" value="${item.unit}"
                                                               name="type${outerVs.count}List[${itemVs.index}].unit">
                                                        <input type="hidden" value="${item.parentCode}"
                                                               name="type${outerVs.count}List[${itemVs.index}].parentCode">
                                                        <input type="hidden" value="${item.children}"
                                                               name="type${outerVs.count}List[${itemVs.index}].children">
                                                        <input type="hidden" value="${item.sort}"
                                                               name="type${outerVs.count}List[${itemVs.index}].sort">
                                                        <td>
                                                            <input type="checkbox" disabled
                                                                   class="status-checkBox status-control">
                                                            <input type="hidden" value="1" class="true-status"
                                                                   name="type${outerVs.count}List[${itemVs.index}].status">
                                                        </td>
                                                        <td>
                                                                ${item.code}
                                                        </td>
                                                        <td>${item.content}
                                                            <c:forEach items="${item.paramList}" var="p" varStatus="vs">
                                                                <c:if test="${(!(vs.count==1))||((vs.count==1)&&(!empty item.content))}">
                                                                    <br>
                                                                </c:if>
                                                                ${p.name}
                                                                <c:if test="${p.type=='text'}">
                                                                    <input name="type${outerVs.count}List[${itemVs.index}].param${vs.count}Val"
                                                                           value="" class="input-control">
                                                                </c:if>
                                                                <c:if test="${p.type=='select'}">
                                                                    <select name="type${outerVs.count}List[${itemVs.index}].param${vs.count}Val">
                                                                        <c:forEach items="${p.paramValueVariableList}"
                                                                                   var="val">
                                                                            <option value="${val.paramValVariable}">${val.paramValVariable}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </c:if>
                                                                ${p.unit}
                                                            </c:forEach>
                                                        </td>
                                                        <td>
                                                            <c:if test="${item.parentCode!='0'}">
                                                                <select class="model-detail-select"
                                                                        data-code="${item.parentCode}"
                                                                        data-catagory="${item.catagory}"></select>
                                                            </c:if>
                                                        </td>
                                                        <td><c:if test="${item.parentCode=='0'}">
                                                            <a class="add-remark" data-toggle="modal"
                                                               onclick="addRemark(this)" onmouseover="showRemark(this)"
                                                               onmouseout="showRemark(this)"
                                                               href="#responsive">添加备注</a>
                                                            <textarea class="remark-text"
                                                                      name="type${outerVs.count}List[${itemVs.index}].remark"
                                                                      cols="60"
                                                                      rows="10"
                                                                      wrap="hard" placeholder="暂未添加备注"
                                                                      style="display: none"></textarea></c:if>
                                                        </td>
                                                        <c:if test="${item.children==1}">
                                                            <td class="details-control" data-code="${item.code}">
                                                                <a href="javascript:;"
                                                                   onclick="controlHidden(false,'${item.code}',this)"
                                                                   class="btn btn-circle blue m-icon m-icon-only open-png">
                                                                    <i class="m-icon-swapdown m-icon-white"></i>
                                                                </a>
                                                                <a href="javascript:;"
                                                                   onclick="controlHidden(true,'${item.code}',this)"
                                                                   class="btn btn-circle blue m-icon m-icon-only close-png"
                                                                   style="display: none">
                                                                    <i class="m-icon-swapup m-icon-white"></i>
                                                                </a>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${item.children==0}">
                                                            <td>
                                                            </td>
                                                        </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <c:set var="lastCode"
                                                                   value="${requestScope[type][fn:length(requestScope[type])-1].code}"></c:set>
                                                            <input class="last-code"
                                                            <c:if test="${empty lastCode}">
                                                                   value="${outerVs.count}.0"
                                                            </c:if>
                                                            <c:if test="${!empty lastCode}">
                                                                   value="${outerVs.count}"
                                                            </c:if>
                                                            >
                                                            <button type="button" class="btn btn-sm blue addRow2">新增
                                                            </button>
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    </tbody>
                                                </c:if>
                                                    <%--除通用服务外结束--%>
                                            </table>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center" id="item9">
                            <shiro:hasPermission name="repairSpec/add">
                                <button type="button" onclick="severCheck()" class="btn btn-primary">提交</button>
                            </shiro:hasPermission>
                            <button id="reset-btn" type="reset" class="btn blue">清空</button>
                            <a href="repairSpec" class="btn default" data-target="navTab">取消</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<jsp:include page="common.jsp"></jsp:include>
<script>
    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    function severCheck() {
        var shipId = $("#shipId").val();
        if (shipId == "0") {
            $("#shipId").tips({
                side: 1,
                msg: "船舶不能为空",
                bg: '#FF5080',
                time: 15
            });
            $("#shipId").focus();
            return;
        }

        $("#defForm").ajaxSubmit({
            success: function (data) {
                if (data.success) {
                    $('#reset-btn').click();
                    App.alert({
                        container: "#bootstrap_alerts_demo",
                        close: true,
                        icon: 'fa fa-check',
                        place: "append",
                        message: "success",
                        type: 'success',
                        reset: true,
                        focus: true,
                        closeInSeconds: 10,
                    })
                } else {
                    App.alert({
                        container: "#bootstrap_alerts_demo",
                        close: true,
                        icon: 'fa fa-warning',
                        place: "append",
                        message: "failure",
                        type: 'danger',
                        reset: true,
                        focus: true,
                        closeInSeconds: 10,
                    })
                }
            },
            error: function () {
                App.alert({
                    container: "#bootstrap_alerts_demo",
                    close: true,
                    icon: 'fa fa-warning',
                    place: "append",
                    message: "error",
                    type: 'warning',
                    reset: true,
                    focus: true,
                    closeInSeconds: 10,
                })
                return;
            }
        });
    }

    <%--选择船舶后  修改隐藏的 shipName的值--%>
    $("#shipId").on("change", function () {
        $("#shipName").val($(this).find("option:selected").text());
    })

    <%--行的展开与折叠--%>
    function controlHidden(hidden, code, obj) {
        $(obj).toggle().siblings().toggle();
        if (hidden) {
            hiddenRow(code);
        } else {
            showRow(code);
        }
    }
    function showRow(parentCode) {
        if (parentCode != null) {
            var ele = $("tr.details-control-child[data-parent='" + parentCode + "']");
            ele.each(function () {
                $(this).css("display", "table-row");
                showRow($(this).attr("data-code"));
            })
        }
    }
    function hiddenRow(parentCode) {
        if (parentCode != null) {
            var ele = $("tr.details-control-child[data-parent='" + parentCode + "']");
            ele.each(function () {
                $(this).css("display", "none");
                hiddenRow($(this).attr("data-code"));
            })
        }
    }


    <%--新增一行--%>
    $('.addRow1').on('click', function () {
        $(this).parent().parent().before($("#item-row-temp1").clone().removeAttr("id").toggle());
    })
    $('.addRow2').on('click', function () {
        $(this).parent().parent().before($("#item-row-temp2").clone().removeAttr("id").toggle());
    })

</script>
<script>
    $(".input-control").on("change", function () {
        var tr = $(this).parents("tr");
        var code = tr.attr("data-code");
        changeStatus(code);
    })

    function addDetail(repairSpecDetailId, proName) {
        var tr = $(".marked-select").removeClass("marked-select").parents("tr");
        var code = tr.attr("data-code");
        var newRow = $("#detail-row-temp").clone().attr("data-parent", code).removeAttr("id").toggle();
        newRow.find(".repairDetailId").val(repairSpecDetailId);
        var a = newRow.find(".editDetail");
        a.html(proName).attr("href", "repairSpecDetail/editSpecDetail?id=" + repairSpecDetailId);
        tr.after(newRow);
        changeStatus(code);
    }

    function deleteDetail(obj) {
        var tr = $(obj).parents("tr");
        var code = tr.attr("data-parent");
        tr.remove();
        changeStatus(code);
    }

    function changeStatus(code) {
        if (code != null) {
            var tr = $("tr[data-code='" + code + "']")
            var flag = false;
            var children = $("tr[data-parent='" + code + "']");
            children.each(function () {
                var status = $(this).find(".status-control").prop("checked");
                if (status) {
                    flag = true;
                    return false;
                }
            })
            if (!flag) {
                var inputs = tr.find(".input-control");
                inputs.each(function () {
                    var status = !($(this).val() == null || $(this).val().trim() == "");
                    if (status) {
                        flag = true;
                        return false;
                    }
                })
            }
            if (flag) {
                tr.find(".status-control").prop("checked", true);
                tr.find(".true-status").val(0);
            } else {
                tr.find(".status-control").prop("checked", false);
                tr.find(".true-status").val(1);
            }
            changeStatus(tr.attr("data-parent"));
        }
    }
</script>