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
    .col-md-3 {
        margin-bottom: 5px;
    }

    .col-md-6 {
        padding-left: 0px;
    }

    .form-control {
        height: 28px;
        margin-top: 5px;
        width: 100%;
    }

    .control-label {
        margin-top: 0px;
    }

    .form-horizontal .control-label {
        padding-top: 0px;
    }

    .line1 {
        border-bottom: solid 2px #337ab7;
        height: 1px;
        margin-top: 10px
    }

    .head {
        background-color: #C0C9CC;
        font-size: 20px
    }

    textarea {
        resize: none;
    }

    .td-text {
        height: 100%;
        width: 100%;
    }

    .div-left {
        margin-left: 20px
    }

    .mt-checkbox, .mt-radio {
        margin-left: 3px;
    }

    .form-horizontal .form-group {
        margin-left: 5px;
    }

    .label-top {
        margin-top: 10px
    }

    .col-md-offset-3 {
        margin-left: 40%;
        margin-top: 20px;
    }

    .left {
        margin-top: 5px;
        border-right: dashed 1px #337ab7;
    }

    .right {
        margin-top: 5px;
        border: 1px dashed #337ab7;
        margin-left: 10px
    }
    .divId {
        margin-top: 10px;
        border: 1px solid #337ab7;
        height: 550px;
    }
    #divId{
        border: 1px dashed #337ab7;
        padding: 0px;
        margin-top: 10px;
    }
    .div-signature{
        margin-left: 10px;
        float: left;
        width: 30%;
    }

</style>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
    <h4 class="modal-title" style="color: white"><fmt:message key="repair_spec_detail"/><%--维修详单--%></h4>
</div>
<form action="" method="post" class="form-horizontal" id="defForm">
    <input type="hidden" value="${proDetail.id}" id="progDetailId"/>
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC">
            <div class="timeline-body-content">
                <div class="form-group col-md-4">
                    <label for="shipName" class="control-label label-top"><fmt:message key="project_vessel_name"/> <%--船名--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="shipNameLabel"
                           class="control-label label-top">${proDetail.shipName}</label>
                    <input id="shipName" name="shipName" type="hidden" value="${proDetail.shipName}">
                </div>
                <div class="form-group col-md-4">
                    <label for="catagory" class="control-label label-top"><fmt:message key="project_category"/> <%--项目分类--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="catagoryLabel"
                           class="control-label label-top">${proDetail.viewCatagory}</label>
                    <input id="catagory" name="catagory" type="hidden" value="${proDetail.catagory}">
                </div>
                <div class="form-group col-md-4">
                    <label for="proOrderNo" class="control-label label-top"><fmt:message key="project_bill_number"/> <%--项目单号--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="proOrderNoLabel"
                           class="control-label label-top">${proDetail.proOrderNo}</label>
                    <input id="proOrderNo" name="proOrderNo" type="hidden" value="${proDetail.proOrderNo}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 left">
                <div style="width: 100%;">
                    <div><span style="background-color: #C0C9CC;font-size: 20px"><fmt:message key="project_describe" /><%--工程项目描述--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px"><fmt:message key="project_name"/><%--工程名称--%>：
                        <input style="width: 70%" disabled id="proName" type="text" name="proName" value="${proDetail.proName}"/>
                    </div>
                    <div class="col-md-12 div-left"><fmt:message key="project_describe"/><%--工程描述--%>：</div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea disabled class="form-control" rows="2" name="proDesc">${proDetail.proDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div><span class="head"><fmt:message key='project_repair_location'/><%--维修部位--%></span></div>
                    <div class="form-group col-md-7" style="margin-left: 3px;margin-top: 20px">
                        <c:forEach items="${repDicts}" var="r">
                            <div class="col-md-3">
                                <input type="checkbox" value="${r.value}"
                                <c:forEach items="${positionList}" var="pos">
                                <c:if test="${pos==r.value}">
                                       checked
                                </c:if>
                                </c:forEach>
                                       name="repairPosition">${r.des}
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-4" style="margin-left: 20px;margin-top: 20px">
                        <textarea disabled class="form-control" rows="4"
                                  name="repairPositionDesc">${proDetail.repairPositionDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;margin-top: 10px">
                    <div class="col-md-6"><span class="head"><fmt:message key="project_repair_technology"/> <%--修理工艺--%></span></div>
                    <div class="form-group col-md-8 div-left" style="margin-top: 20px">
                        <c:forEach items="${reqDicts}" var="req">
                            <div class="col-md-4">
                                <input type="checkbox" value="${req.value}"
                                <c:forEach items="${techList}" var="tech">
                                <c:if test="${tech==req.value}">
                                       checked
                                </c:if>
                                </c:forEach>
                                       name="repairTech"> ${req.des}
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-12 ">
                            <textarea class="form-control" rows="4"
                                      placeholder="请填写脚手架数量"
                                      name="scaffoldNum">${proDetail.scaffoldNum}</textarea>
                        </div>
                        <div class="col-md-12 ">
                            <textarea class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_repair_technology_input'/> " <%--请填写修理工艺--%>
                                      name="repairTechDesc">${proDetail.repairTechDesc}</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head"><fmt:message key='project_extent_damage'/><%--损坏程度--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <textarea class="form-control" disabled rows="4" name="damage">${proDetail.damage}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head">签名</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 10px">
                        <div class="div-signature">
                            <label>填表人</label>
                            <select name="preparerRole">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${preparerRoles}" var="p">
                                    <option value="${p.value}"
                                            <c:if test="${proDetail.preparerRole==p.value}">
                                                selected
                                            </c:if>
                                    >${p.des}</option>
                                </c:forEach>
                            </select>
                            <input disabled type="text" name="preparer" value="${proDetail.preparer}" style="width: 30%"/>
                        </div>
                        <div class="div-signature">
                            <label>船员主管</label>
                            <select name="directorRole">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${directorRoles}" var="d">
                                    <option value="${d.value}"
                                            <c:if test="${proDetail.preparerRole==d.value}">
                                                selected
                                            </c:if>
                                    >${d.des}</option>
                                </c:forEach>
                            </select>
                            <input disabled type="text" name="director" value="${proDetail.director}" style="width:30%"/>
                        </div>
                        <div class="div-signature">
                            <label>机务</label>
                            <input disabled type="text"name="engineer" value="${proDetail.engineer}" style="width:50%"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4" id="imgNum">
                <div style="width: 100%;">
                    <div><span class="head"><fmt:message key="project_equipment_info"/> <%--设备信息--%></span></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12">
                            <label for="faciName" class="col-sm-8 control-label"><fmt:message key="project_equipment_name"/> <%--设备名称--%>:</label>
                            <div class="col-sm-4">
                                <input id="faciName" name="faciName" type="text" value="${proDetail.faciName}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciType" class="col-sm-8 control-label"><fmt:message key="project_equipment_model"/> <%--设备型号--%>:</label>
                            <div class="col-sm-4">
                                <input id="faciType" name="faciType" type="text" value="${proDetail.faciType}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciSrc" class="col-sm-8 control-label"><fmt:message key="project_manufacturer_nation"/><%--厂家/国家--%>:</label>
                            <div class="col-sm-4">
                                <input id="faciSrc" name="faciSrc" type="text" value="${proDetail.faciSrc}"
                                       class="">
                            </div>
                        </div>
                    </div>
                    <div class=col-md-6">
                            <textarea class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_related_parameters'/> " <%--请填写其他参数--%>
                                      name="faciParam">${proDetail.faciParam}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%">
                    <div class="col-md-6" style="margin-top: 5px"><span class="head"><fmt:message key="project_img"/> <%--图片--%></span></div>
                    <div class="col-md-12 divId">
                        <c:if test="${progDetailMedias!=null}">
                            <c:forEach var="p" items="${progDetailMedias}">
                                <div class="col-md-12" style="margin-top: 20px;border: 1px dashed #337ab7;padding: 0px">
                                    <a target="_blank" href="${p.oss}">
                                        <img style="width:100%;height: 110px" src="${p.oss}"/></a></div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>

            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div><span class="head"><fmt:message key="project_repair_des_material_spec"/> <%--维修描述/材料规格--%></span></div>
            <div class="col-md-12 div-left" style="margin-top: 20px">
                <div id="example1" style=" height: 300px; overflow: hidden;"></div>
            </div>
        </div>
        <div class="col-md-12 line1"></div>
    </div>

    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button id="close" type="button" class="btn default" data-dismiss="modal"><fmt:message key="go_cancel"/> <%--取消--%></button>
            </div>
        </div>
    </div>
</form>
<script>
    $(document).ready(function () {
        var id = $("#progDetailId").val();
        var width = $(window).width();
        var divWidth = $("#example1").width(width * 0.65);

        function json() {
            $.ajax({
                url: 'repairProg/reqs',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    id: id
                },
                success: function (data) {
                    dataJson = data.reqs;
                    console.log(dataJson);
                    var datas = eval(dataJson);
                    var container = document.getElementById('example1'),
                            storedData = {},
                            savedKeys,
                            resetState,
                            stateLoaded,
                            hot;

                    hot = new Handsontable(container, {
                        data: datas,
                        rowHeaders: true,
                        colHeaders: true,
                        colWidths: [width * 0.46, width * 0.07, width * 0.07],
                        minRows: 10,
                        colHeaders: ["<fmt:message key='project_request'/> ", "<fmt:message key='project_unit'/>", "<fmt:message key='projec_quantity'/>"],
                        columnSorting: true,
                        columns: [
                            {data: "des"},
                            {data: "unit"},
                            {data: "count"}
                        ],
                        manualColumnMove: false,
                        manualColumnResize: false,
                        manualRowMove: false,
                        manualRowResize: false,
                        minSpareRows: 1,
                        contextMenu: false,
                        persistentState: false,
                        readOnly: true
                    });

                    resetState = document.querySelector('.reset-state');
                    stateLoaded = document.querySelector('.state-loaded');

                },
                error: function (xhr, textStatus) {
                    console.log('错误');
                }
            });
        }

        json();
    });
</script>
