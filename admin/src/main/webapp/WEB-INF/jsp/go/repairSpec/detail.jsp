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
        margin-top: 10px;
    }

    .htContextMenu {
        display: none;
        position: absolute;
        z-index: 106000;
    }

    #remind {
        color: red;
    }

    .htContextMenu {
        z-index: 1060000;
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
    <h4 class="modal-title" style="color: white"><fmt:message key="repair_spec_detail"/> </h4><%--维修详单--%>
</div>
<form action="" method="post" class="form-horizontal" id="detail_form">
    <input id="view_catagory" name="viewCatagory" type="hidden"/>
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC">
            <div class="timeline-body-content">
                <div class="form-group col-md-4">
                    <label for="shipName" class="control-label label-top"><fmt:message key="project_vessel_name"/> <%--船名--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="shipNameLabel"
                           class="control-label label-top"></label>
                    <input id="shipName" name="shipName" type="hidden">
                </div>
                <div class="form-group col-md-4">
                    <label for="catagory" class="control-label label-top"><fmt:message key="project_category"/> <%--项目分类--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="catagoryLabel"
                           class="control-label label-top"></label>
                    <input id="catagory" name="catagory" type="hidden">
                </div>
                <div style="display: none">
                    <label for="code" class="control-label label-top"><fmt:message key="project_number"/> <%--项目号--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="codeLabel"
                           class="control-label label-top"></label>
                    <input id="code" name="code" type="hidden">
                </div>
                <div class="form-group col-md-4">
                    <label for="proOrderNo" class="control-label label-top"><fmt:message key="project_bill_number"/> <%--项目单号--%>：</label>
                    <label style="width: auto;padding-left: 0px;" id="proOrderNoLabel"
                           class="control-label label-top"></label>
                    <input id="proOrderNo" name="proOrderNo" type="hidden">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8 left">
                <div style="width: 100%;">
                    <div><span style="background-color: #C0C9CC;font-size: 20px"><fmt:message key="project_describe" /><%--工程项目描述--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px"><fmt:message key="project_name"/> <%--工程名称--%>：
                        <input style="width: 70%" id="proName" type="text" name="proName" value="${detail.proName}"/>&nbsp;&nbsp;<span
                                id="remind"></span>
                    </div>
                    <div class="col-md-12 div-left"><fmt:message key="project_describe"/> <%--工程描述--%>：</div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="2" name="proDesc">${detail.proDesc}</textarea>
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
                        <textarea class="form-control" rows="4" placeholder="<fmt:message key='project_detail_location'/>"<%--请输入详细位置--%>
                                  name="repairPositionDesc">${detail.repairPositionDesc}</textarea>
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
                                      placeholder="脚手架数量"
                                      name="scaffoldNum">${detail.scaffoldNum}</textarea>
                        </div>
                        <div class="col-md-12 ">
                            <textarea class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_repair_technology_input'/> " <%--请填写修理工艺--%>
                                      name="repairTechDesc">${detail.repairTechDesc}</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head"><fmt:message key='project_extent_damage'/><%--损坏程度--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <textarea class="form-control" rows="4" name="damage">${detail.damage}</textarea>
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
                                            <c:if test="${detail.preparerRole==p.value}">
                                                selected
                                            </c:if>
                                    >${p.des}</option>
                                </c:forEach>
                            </select>
                            <input  type="text" name="preparer" value="${detail.preparer}" style="width: 30%"/>
                        </div>
                        <div class="div-signature">
                            <label>船员主管</label>
                            <select name="directorRole">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${directorRoles}" var="d">
                                    <option value="${d.value}"
                                            <c:if test="${detail.preparerRole==d.value}">
                                                selected
                                            </c:if>
                                    >${d.des}</option>
                                </c:forEach>
                            </select>
                            <input  type="text" name="director" value="${detail.director}" style="width:30%"/>
                        </div>
                        <div class="div-signature">
                            <label>机务</label>
                            <input  type="text"name="engineer" value="${detail.engineer}" style="width:50%"/>
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
                                <input id="faciName" name="faciName" type="text" value="${detail.faciName}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciType" class="col-sm-8 control-label"><fmt:message key="project_equipment_model"/> <%--设备型号--%>:</label>
                            <div class="col-sm-4">
                                <input id="faciType" name="faciType" type="text" value="${detail.faciType}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciSrc" class="col-sm-8 control-label"><fmt:message key="project_manufacturer_nation"/><%--厂家/国家--%>:</label>
                            <div class="col-sm-4">
                                <input id="faciSrc" name="faciSrc" type="text" value="${detail.faciSrc}"
                                       class="">
                            </div>
                        </div>
                    </div>
                    <div class=col-md-6">
                            <textarea class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_related_parameters'/> " <%--请填写其他参数--%>
                                      name="faciParam">${detail.faciParam}</textarea>
                    </div>
                </div>
                <input type="hidden" value="" id="num"/>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%">
                    <div class="col-md-6" style="margin-top: 5px"><span class="head"><fmt:message
                            key="project_upload_img"/><%--上传图片--%></span></div>
                    <div class="col-md-12 divId">
                        <c:if test="${specDetailMedias!=null}">
                            <c:forEach var="s" items="${specDetailMedias}">
                                <div class="col-md-12" style="margin-top: 20px;border: 1px dashed #337ab7;padding: 0px">
                                    <input name="fileName" type="hidden" value="${s.filename}"/>
                                    <input name="fileType" type="hidden" value="0">
                                    <input name="oss" type="hidden" value="${s.oss}"/>
                                    <span onclick="removeImg(this)" class="glyphicon glyphicon-remove"
                                          style="background: rgba(0,0,0,.5);color:white;position:absolute;top:0px;right:0px;z-index: 999;"></span>
                                    <a target="_blank" href="${s.oss}">
                                        <img style="width:100%;height: 110px" src="${s.oss}"/></a></div>
                            </c:forEach>
                        </c:if>
                        <div class="col-md-12"  id="divId" >
                            <button id="upload_img" style="width: 100%">
                                <img src="" onerror="nofind(4)" style="width:100%;height: 110px"/>
                            </button>
                        </div>
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
            <div class="col-md-12" style="text-align: center">
                <br>
                <div id="detail_alert"></div>
                <button id="id" type="button" class="btn green" onclick="saveInfo(1)" data-id="${detail.id}"><fmt:message key="go_confirm"/> <%--确定--%></button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn green" onclick="saveInfo(2)"><fmt:message key="project_save_template"/> </button><%--保存为范本--%>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="reset" class="btn default"><fmt:message key="go_reset"/> <%--重置--%></button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button id="close" type="button" class="btn default" data-dismiss="modal"><fmt:message key="go_cancel"/> <%--取消--%></button>
                <br><br>
            </div>
        </div>
    </div>
</form>


<script type="text/javascript">
    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    initUploaders_img("upload_img", "shipinfo", "${staticPath}/", "divId", "imgNum");
    function removeImg(obj) {
        obj.parentNode.remove();

        var i = $("#imgNum").find("img").length;
        var j = $("#num").val();
        console.log(i + ":" + j);
        if (j == 4 && i < 4) {
            $("#divId").show();
        }
    }

    //服务器校验
    function saveInfo(a) {
        var arr1 = new Array();
        var datas = handsontableData();
        var j = 0;
        for (var i = 0; i < datas.length; i++) {
            if (datas[i][0] == null) {
                continue;
            }
            var obj = new Object();
            obj.des = datas[i][0];
            obj.unit = datas[i][1];
            obj.count = datas[i][2];
            arr1[j++] = obj;
        }
        var dataJson = JSON.stringify(arr1);
        if (a == 1) {
            $("#detail_form").attr("action", "repairSpecDetail/addSpecDetail");
        } else if (a == 2) {
            $("#detail_form").attr("action", "repairSpecDetail/addModelDetail");
        }
        if (check()) {
            $("#detail_form").ajaxSubmit({
                data: {
                    dataJson: dataJson
                },
                success: function (data) {
                    if (data.success) {
                        //  保存为工程单详单
                        if (data.specDetail) {
                            addDetail(data.repairSpecDetailId, $("#proName").val(), $("#detail_form #proOrderNo").val());
                            $('#close').click();
                        } else {
                            App.alert({
                                container: "#detail_alert",
                                close: true,
                                icon: 'fa fa-warning',
                                place: "append",
                                message: "<fmt:message key='project_success_template'/> ",/*成功保存为范本*/
                                type: 'success',
                                reset: true,
                                focus: false,
                                closeInSeconds: 5,
                            })
                            initRepairModelDetailList();
                        }
                    } else {
                        App.alert({
                            container: "#detail_alert",
                            close: true,
                            icon: 'fa fa-warning',
                            place: "append",
                            message: "<fmt:message key='project_failure_submit'/> ",/*提交失败,请稍后再试*/
                            type: 'danger',
                            reset: true,
                            focus: false,
                            closeInSeconds: 5,
                        })
                    }
                },
                error: function () {
                    App.alert({
                        container: "#detail_alert",
                        close: true,
                        icon: 'fa fa-warning',
                        place: "append",
                        message: "<fmt:message key='project_system_busy'/> ",/*系统繁忙,请稍后再试*/
                        type: 'warning',
                        reset: true,
                        focus: false,
                        closeInSeconds: 5,
                    })
                    return;
                }
            });
        }
    }
    //客户端校验
    function check() {
        if ($("#proName").val() == "") {
            $("#remind").html("*<fmt:message key='project_name_empty'/> ");/*工程名称不能为空*/
            $("#proName").focus();
            setTimeout("$('#remind').html('')", 3000);//延时3秒
            return false;
        }
        return true
    }
</script>
<script>
    $(function () {
        $(".modal #shipName").val($("#detailShipName").val());
        $(".modal #catagory").val($("#detailCatagory").val());
        $(".modal #code").val($("#detailCode").val());
        $(".modal #proOrderNo").val($("#detailProOrderNo").val());
        $("#shipNameLabel").html($("#detailShipName").val());
        $("#catagoryLabel").html( $("#viewCatagory").val());
        /*用于显示类型的*/
        $("#view_catagory").val( $("#viewCatagory").val());

        $("#codeLabel").html($("#detailCode").val());
        $("#proOrderNoLabel").html($("#detailProOrderNo").val());
    })


    var id = $("#id").attr("data-id");
    var width = $(window).width();
    var widthOne=width*0.46;
    var widthTwo=width*0.07;
    $("#example1").width(width * 0.65);
    var dataJson;
    var h;
    $.ajax({
        url: 'modelDetail/reqs',
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
                colWidths: [widthOne, widthTwo, widthTwo],
                minRows: 10,
                colHeaders: ["<fmt:message key='project_request'/> ", "<fmt:message key='project_unit'/>", "<fmt:message key='projec_quantity'/>"],/*"要求和描述/材料规格", "单位", "数量"*/
                columnSorting: true,
                columns: [
                    {data: "des"},
                    {data: "unit"},
                    {data: "count"}
                ],
                manualColumnMove: false,
                manualColumnResize: true,
                manualRowMove: true,
                manualRowResize: true,
                minSpareRows: 1,
                contextMenu: true,
                persistentState: true
            });
            h = hot;

            resetState = document.querySelector('.reset-state');
            stateLoaded = document.querySelector('.state-loaded');

        },
        error: function (xhr, textStatus) {
            console.log('<fmt:message key="go_error"/> ');/*错误*/
        }
    });
    function handsontableData() {
        return h.getData();
    }


</script>
