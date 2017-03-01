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
    <div class="profile-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption caption-md">
                            <i class="fa fa-user"></i>
                            <span class="caption-subject font-blue-madison bold uppercase"> 查看维修工程单</span>
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
                                            <input disabled id="shipName" name="shipName" type="text" maxlength="32"
                                                   value="${repairSpec.shipName}"
                                                   minlength="2" class="form-control required" placeholder="暂无船舶名称">
                                        </div>
                                        <label class="col-sm-1 control-label"><span class="red">* </span></label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="planStartDate" class="col-sm-3 control-label">计划进场日期</label>
                                        <div class="col-sm-7">
                                            <div class="input-group">
                                                <input disabled id="planStartDate" name="planStartDate" type="text"
                                                       class="form-control date-picker"
                                                       value="<fmt:formatDate value='${repairSpec.planStartDate}' pattern="yyyy-MM-dd"/>"
                                                       placeholder="暂无进厂日期">
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
                                            <input disabled id="planDays" name="planDays" type="text"
                                                   class="form-control required" value="${repairSpec.planDays}"
                                                   placeholder="暂无预估维修天数">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="planCost" class="col-sm-3 control-label">
                                            预估金额</label>
                                        <div class="col-sm-7">
                                            <input disabled id="planCost" name="planCost" type="text"
                                                   class="form-control required" value="${repairSpec.planCost}"
                                                   placeholder="暂无预估维修金额">
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
                                                           <c:if test="${type.value==repairSpec.type}">checked</c:if>> ${type.des}
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
                                                    <c:if test="${item.status==0}">
                                                        <c:if test="${item.parentCode!='0'}">
                                                            <tr class="details-control-child" data-parent="${item.parentCode}" style="display: none">
                                                        </c:if>
                                                        <c:if test="${item.parentCode=='0'}">
                                                            <tr>
                                                        </c:if>
                                                        <input type="hidden" value="${item.id}"
                                                               name="type${outerVs.count}List[${itemVs.index}].id">
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
                                                        <td>
                                                            <input type="checkbox" class="status-checkBox"
                                                                   <c:if test="${item.status==0}">checked</c:if>>
                                                            <input type="hidden" value="${item.status}"
                                                                   name="type${outerVs.count}List[${itemVs.index}].status">
                                                        </td>
                                                        <td>
                                                            <c:if test="${!(item.content=='维修详单')}">
                                                                ${item.code}
                                                            </c:if>
                                                        </td>
                                                        <td>${item.content}
                                                            <c:if test="${item.content=='维修详单'}">
                                                                <select class="model-detail-select"
                                                                        data-code="${item.parentCode}"
                                                                        data-proOrderNo="0"
                                                                        data-catagory="${item.catagory}"></select>
                                                                <input class="repairSpecDetailId"
                                                                       name="type${outerVs.count}List[${itemVs.index}].repairSpecDetailId"
                                                                       type="hidden"
                                                                       value="${item.repairSpecDetailId}">
                                                                <a class="repairSpecDetailName" data-model="dialog"
                                                                   href="javascript:;"><c:if
                                                                        test="${empty item.repairSpecDetailId}">暂未选择详单</c:if>
                                                                        ${item.proName}</a>
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
                                                                                                    value="${item.count}"
                                                                                                    name="type${outerVs.count}List[${itemVs.index}].count"></c:if>
                                                        </td>
                                                        <td><c:if test="${item.parentCode=='0'}">
                                                            <a class="add-remark" data-toggle="modal"
                                                               href="#responsive">添加备注 </a>
                                                            <textarea class="remark-text"
                                                                      name="type${outerVs.count}List[${itemVs.index}].remark"
                                                                      cols="60"
                                                                      rows="10"
                                                                      wrap="hard" placeholder="暂未添加备注"
                                                                      style="display: none">${item.remark}</textarea></c:if>
                                                        </td>
                                                        <c:if test="${item.children==1}">
                                                            <td class="details-control" data-code="${item.code}">
                                                                <img src="<%=basePath%>static/img/details_open.png"
                                                                     class="open-png">
                                                                <img src="<%=basePath%>static/img/details_close.png"
                                                                     class="close-png"
                                                                     style="display: none">
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${item.children==0}">
                                                            <td>
                                                            </td>
                                                        </c:if>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>

                                            </table>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center">
                            <a href="repairSpec" class="btn default" data-target="navTab">返回</a>
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
                <h4 class="modal-title">备注</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                            <textarea id="dialog-text" class="form-control" rows="10"
                                      style="resize: none;" placeholder="暂无备注信息"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn green \">确认</button>
            </div>
        </div>
    </div>
</div>

<script>
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

    <%--显示备注--%>
    $('.add-remark').on('mouseover mouseout', function () {
        $(this).siblings('.remark-text').toggle();
    })

    <%--添加备注--%>
    $('.add-remark').on('click', function () {
        var text = $(this).siblings('.remark-text').text()
        $('#dialog-text').val(text);
        $responsive.attr('data-id', $(this).attr('data-id'));
    })

</script>