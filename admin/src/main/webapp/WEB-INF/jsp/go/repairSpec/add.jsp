<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    .table-striped > tbody > tr:nth-of-type(odd) {
        background-color: #d2f7ff;
    }

    .table-striped > tbody > tr:nth-of-type(even) {
        background-color: #bfe3ff;
    }

    .copyRow {
        background-color: lightseagreen;
        border: none;
        color: white;
    }

    .remark-text {
        position: fixed;
        resize: none;
        left: 40%;
        top: 40%;
        z-index: 100;
    }

    #menu {
        width: 30px;
        height: auto;
        position: fixed;
        top: 40%;
        right: 10px;
        margin-top: -135px;
    }

    #menu ul {
        display: block;
        list-style: none;
        padding: 0;
    }

    #menu ul li a {
        width: 30px;
        height: 60px;
        padding: 15px 0;
        line-height: 15px;
        text-align: center;
        background-color: #fbfcfd;
        color: #32c96a;
        display: block;
        font-size: 10px;
    }

    #menu ul li a:hover, #menu ul li a.cur {
        background-color: #32c92a;
        color: #fbfcfd;
    }

    .modal-dialog {
        position: relative;
        width: 75%;
        margin: auto;
    }

    .modal-content {
        padding: 10px;
    }
</style>
<go:navigater path="repairSpec"></go:navigater>

<a href="repairSpecDetail/addModelDetail?shipName=好船&catagory=机械工程&code=2.2.2" id="add-detail"
   data-model="dialog">新增详单</a>
<div>
    <select class="model-detail-select"></select>
    <input class="repairSpecDetailId" name="repairSpecDetailId" value="">
</div>
<div>
    <select class="model-detail-select"></select>
    <input class="repairSpecDetailId" name="repairSpecDetailId" value="">
</div>
<div>
    <select class="model-detail-select"></select>
    <input class="repairSpecDetailId" name="repairSpecDetailId" value="">
</div>
<script>
    $(document).ready(initRepairModelDetailList())
    function initRepairModelDetailList() {
        $.ajax({
            "url": 'repairSpec/getModelDetailList',
            "type": 'get',
            "success": function (data) {
                var html = "";
                html += "<option>--请选择维修详单范本--</option>"
                html += "<option data-id=0>--新增详单--</option>";
                for (var i = 0; i < data.length; i++) {
                    html += "<option value=" + data[i].id + ">" + data[i].proName + "</option>"
                }
                $(".model-detail-select").html(html);
            }
        })
        $('.model-detail-select').on("change", function () {
            alert(1);
            var thisone = $(this);
            $('.marked-spec-detail').removeClass("marked-spec-detail");
            thisone.siblings('.repairSpecDetailId').addClass("marked-spec-detail");
            $('#add-detail').attr("href", "repairSpecDetail/addModelDetail?shipName=好船&catagory=机械工程&code=2.2.2&id=" + thisone.val());
            $('#add-detail').click();
        })
    }


</script>

<form class="form-horizontal" action="repairSpec/add" method="post"
      id="defForm" callfn="refreshTable">
    <input type="hidden" name="modelId" value="${modelId}">
    <input type="hidden" name="shipId" value="">
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
                                        <label for="shipName" class="col-sm-3 control-label">
                                            船舶名称</label>
                                        <div class="col-sm-7">
                                            <input id="shipName" name="shipName" type="text" maxlength="32"
                                                   value=""
                                                   minlength="2" class="form-control required" placeholder="请选择船舶">
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
                                                <c:forEach items="${requestScope[type]}" var="item" varStatus="itemVs">
                                                    <c:if test="${item.parentCode!='0'}">
                                                        <tr class="details-control-child" data-parent="${item.parentCode}" style="display: none">
                                                    </c:if>
                                                    <c:if test="${item.parentCode=='0'}">
                                                        <tr>
                                                    </c:if>
                                                    <input type="hidden" value="${item.catagory}"
                                                           name="type${outerVs.count}List[${itemVs.index}].catagory">
                                                    <input type="hidden" value="${item.code}"
                                                           name="type${outerVs.count}List[${itemVs.index}].code">
                                                    <input type="hidden" value="${item.content}"
                                                           name="type${outerVs.count}List[${itemVs.index}].content">
                                                    <input type="hidden" value="${item.unit}"
                                                           name="type${outerVs.count}List[${itemVs.index}].unit">
                                                    <input type="hidden" value="${item.parentCode}"
                                                           name="type${outerVs.count}List[${itemVs.index}].parentCode">
                                                    <input type="hidden" value="${item.children}"
                                                           name="type${outerVs.count}List[${itemVs.index}].children">
                                                    <td>
                                                        <input type="checkbox" class="status-checkBox">
                                                        <input type="hidden" value="1"
                                                               name="type${outerVs.count}List[${itemVs.index}].status">
                                                    </td>
                                                    <td>${item.code}</td>
                                                    <td>${item.content}
                                                        <c:if test="${item.content=='维修详单'}">
                                                            <select>
                                                                <option>
                                                                    选择详单
                                                                </option>
                                                            </select>
                                                        </c:if>
                                                        <c:forEach items="${item.paramList}" var="p" varStatus="vs">
                                                            <c:if test="${(!(vs.count==1))||((vs.count==1)&&(!empty item.content))}">
                                                                <br>
                                                            </c:if>
                                                            ${p.name}
                                                            <c:if test="${p.type=='text'}">
                                                                <input name="type${outerVs.count}List[${itemVs.index}].param${vs.count}Val"
                                                                       value="">
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
                                                    <td><c:if test="${!empty item.unit}"><input class="col-md-12"
                                                                                                name="type${outerVs.count}List[${itemVs.index}].count"></c:if>
                                                    </td>
                                                    <td><c:if test="${item.parentCode=='0'}"><a data-id="${item.id}"
                                                                                                class="add-remark"
                                                                                                data-toggle="modal"
                                                                                                href="#responsive">
                                                        添加备注 </a></c:if>
                                                        <textarea class="remark-text"
                                                                  name="type${outerVs.count}List[${itemVs.index}].remark"
                                                                  cols="60"
                                                                  rows="10"
                                                                  wrap="hard" placeholder="暂未添加备注"
                                                                  style="display: none"></textarea>
                                                    </td>
                                                    <c:if test="${item.children==1}">
                                                        <td class="details-control" data-code="${item.code}">
                                                            <img src="<%=basePath%>static/img/details_open.png"
                                                                 class="open-png">
                                                            <img src="<%=basePath%>static/img/details_close.png"
                                                                 class="close-png"
                                                                 style="display: none">
                                                                <%--<a href="javascript:;"--%>
                                                                <%--class="btn dark m-icon m-icon-only open-png">--%>
                                                                <%--<i class="m-icon-swapdown m-icon-white"></i>--%>
                                                                <%--</a>--%>
                                                                <%--<a href="javascript:;"--%>
                                                                <%--class="btn dark m-icon m-icon-only close-png"--%>
                                                                <%--style="display: none">--%>
                                                                <%--<i class="m-icon-swapup m-icon-white"></i>--%>
                                                                <%--</a>--%>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${item.children==0}">
                                                        <td>
                                                            <c:if test="${item.copy==1}">
                                                                <button type="button" class="copyRow"
                                                                        data-row="${itemVs.index}">+
                                                                </button>
                                                            </c:if>
                                                        </td>
                                                    </c:if>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <button type="button" class="btn btn-sm blue addRow">新增
                                                        </button>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center">
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

<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true" data-id="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">添加备注</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                            <textarea id="dialog-text" class="form-control" rows="10"
                                      style="resize: none;" placeholder="请添加备注信息"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                <button type="button" data-dismiss="modal" class="btn green save-remark">确认</button>
            </div>
        </div>
    </div>
</div>

<table style="display: none">
    <tr id="row-temp1">
        <td></td>
        <td></td>
        <td><input class="form-control col-md-12"></td>
        <td><input class="form-control col-md-12"></td>
        <td><input class="form-control col-md-12"></td>
        <td></td>
        <td></td>
    </tr>
    <tr id="row-temp2">
        <td></td>
        <td></td>
        <td>维修详单<input value="请选择需要的范本"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
</table>

<%--右侧悬浮滚动条--%>
<div id="menu">
    <ul>
        <li><a data-item="#item1" class="cur"
        >通用服务</a></li>
        <li><a data-item="#item2"
        >坞修工程</a></li>
        <li><a data-item="#item3"
        >船体工程</a></li>
        <li><a data-item="#item4"
        >机械工程</a></li>
        <li><a data-item="#item5"
        >电气工程</a></li>
        <li><a data-item="#item6"
        >冷藏工程</a></li>
        <li><a data-item="#item7"
        >特种设备</a></li>
        <li><a data-item="#item8"
        >其他</a></li>
    </ul>
</div>
<script>
    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    function severCheck() {
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

    <%--行的展开与折叠--%>
    $('td.details-control').on('click', function () {
        var parentCode = $(this).attr('data-code');
        var ele = $("tr.details-control-child[data-parent='" + parentCode + "']");
        ele.toggle();
        $(this).find('img').toggle();
        if ($(this).find('.close-png').css('display') == 'none') {
            ele.each(function () {
                $(this).find('.close-png').each(function () {
                    if ($(this).css('display') == 'inline') {
                        $(this).parent().click();
                    }
                })
            })
        }
    })

    <%--勾选code前的checkBox达到改变status的效果--%>
    $('.status-checkBox').on('click', function () {
        if (this.checked) {
            $(this).siblings('input').val(0);
        } else {
            $(this).siblings('input').val(1);
        }
    })

    <%--复制一行--%>
    $('.copyRow').on('click', function () {
        var current = $(this).attr('data-row');
        var row = $(this).parent().parent();
        var index = row.siblings('tr').size();
        var clone = row.clone();
        clone.find('textarea').each(function () {
            var name = $(this).attr('name');
            name = name.replace("[" + current + "]", "[" + index + "]");
            $(this).attr('name', name);
        });
        clone.find('input').each(function () {
            var name = $(this).attr('name');
            if (name != null) {
                name = name.replace("[" + current + "]", "[" + index + "]");
                $(this).attr('name', name);
            }
        });
        clone.find('.copyRow').remove();
        row.after(clone);
    })

    <%--新增一行--%>
    $('.addRow').on('click', function () {
        $(this).parent().parent().before($('#row-temp1').clone()).before($('#row-temp2').clone());
    })

    <%--显示备注--%>
    $('.add-remark').on('mouseover mouseout', function () {
        $(this).siblings('.remark-text').toggle();
    })

    $responsive = $('#responsive');
    <%--添加备注--%>
    $('.add-remark').on('click', function () {
        var text = $(this).siblings('.remark-text').text()
        $('#dialog-text').val(text);
        $responsive.attr('data-id', $(this).attr('data-id'));
    })
    $('.save-remark').on('click', function () {
        var text = $('#dialog-text').val();
        var dataId = $responsive.attr('data-id')
        $('.add-remark[data-id=' + dataId + ']').siblings('.remark-text').text(text);
    })

    //右侧悬浮滚动条
    $(document).ready(function () {
        $(window).scroll(function () {
            var top = $(document).scrollTop();          //定义变量，获取滚动条的高度
            var menu = $("#menu");                      //定义变量，抓取#menu
            var items = $("#content").find(".item");    //定义变量，查找.item
            var curId = "";                             //定义变量，当前所在的楼层item #id
            items.each(function () {
                var m = $(this);                        //定义变量，获取当前类
                var itemsTop = m.offset().top;        //定义变量，获取当前类的top偏移量
                if (top >= itemsTop - 300) {
                    curId = "#" + m.attr("id");
                } else {
                    return false;
                }
            });
            var curLink = menu.find(".cur");
            if (curId && curLink.attr("data-item") != curId) {
                curLink.removeClass("cur");
                menu.find("[data-item='" + curId + "']").addClass("cur");
            }
        });
    });

    $('#menu a').on('click', function () {
        $(document).scrollTop($($(this).attr('data-item')).offset().top - 300);
    })

</script>