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
    .col-md-3{
        margin-bottom: 5px;
    }
    .col-md-6{
        padding-left: 0px;
    }
    .form-control{
        height: 28px;
        margin-top: 5px;
        width:100%;
    }
    .control-label{
        margin-top:0px;
    }
    .form-horizontal .control-label{
        padding-top: 0px;
    }
    .line1{  border-bottom:solid 2px #337ab7; height:1px;margin-top: 10px  }
    .head{background-color: #C0C9CC;font-size: 20px  }
    textarea{ resize:none;
    }
    .td-text{
        height: 100%;width: 100%;
    }
    .div-left{
        margin-left: 20px
    }
    .mt-checkbox, .mt-radio{
        margin-left: 3px;
    }
    .form-horizontal .form-group{
        margin-left: 5px;
    }
    .label-top{
        margin-top: 10px
    }
    .col-md-offset-3 {
        margin-left: 40%;
        margin-top: 20px;
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
        margin-left: 30px;
        float: left;
    }

</style>
<go:navigater path="repairSpec"></go:navigater>
<form action="" method="post" class="form-horizontal" id="defForm">
    <input id="id" name="id" type="hidden" value="${modelDetails.id}"/>
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC" >
            <div class="timeline-body-content">
                <div class="form-group col-md-4">
                    <label for="shipName" class="col-sm-6 control-label label-top" ><fmt:message key="project_vessel_name"/> <%--船名--%>：</label>
                    <div class="col-sm-6">
                        <input disabled id="shipName" name="shipName" type="text" maxlength="32" value="${modelDetails.shipName}"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label for="catagory" class="col-sm-6 control-label label-top"><fmt:message key="project_category"/><%--项目分类--%>：</label>
                    <div class="col-sm-6">
                        <input disabled id="catagory" name="catagory" type="text" maxlength="32" value="${modelDetails.catagory}"
                               class="form-control ">
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label for="proOrderNo" class="col-sm-8 control-label label-top"><fmt:message key="project_bill_number"/><%--项目单号--%>：</label>
                    <div class="col-sm-4">
                        <input disabled id="proOrderNo" name="proOrderNo" type="text" maxlength="32" value="${modelDetails.proOrderNo}"
                               class="form-control required">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="margin-top: 5px;border-right: dashed 1px #337ab7;" class="col-md-8">
                <div style="width: 100%;">
                    <div class="col-md-6"><span  class="head"><fmt:message key="project_describe" /><%--工程项目描述--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px"><fmt:message key="project_name"/> <%--工程名称--%>：
                        <input disabled id="proName" type="text" name="proName" style="width:50%;" value="${modelDetails.proName}"/>
                    </div>
                    <div class="col-md-12 div-left"><fmt:message key="project_describe"/><%--工程描述--%>： </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea disabled class="form-control" rows="2" name="proDesc">${modelDetails.proDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head "><fmt:message
                            key='project_repair_location'/><%--维修部位--%></span></div>
                    <div class="form-group col-md-7" style="margin-left: 3px;margin-top: 20px">
                        <c:forEach items="${repDicts}" var="r">
                            <div class="col-md-3">
                                <input  type="checkbox" value="${r.value}"
                                <c:forEach var="p" items="${positions}">
                                <c:if test="${r.value==p}" >
                                        checked
                                </c:if>
                                </c:forEach>
                                        name="repairPosition"> ${r.des}
                            </div>
                        </c:forEach>

                    </div>
                    <div class="col-md-5" style="margin-top: 20px;">
                        <textarea disabled class="form-control" rows="4"
                                  placeholder="<fmt:message key='project_detail_location'/>"<%--请输入详细位置--%>
                                  name="repairPositionDesc">${modelDetails.repairPositionDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head"><fmt:message
                            key="project_repair_technology"/><%--修理工艺--%></span></div>
                    <div class="form-group col-md-8 div-left" style="margin-top: 20px">
                        <c:forEach items="${reqDicts}" var="req">
                            <div class="col-md-4">
                                <input  type="checkbox"  value="${req.value}"
                                <c:forEach var="t" items="${techs}">
                                <c:if test="${req.value==t}" >
                                        checked
                                </c:if>
                                </c:forEach>
                                        name="repairTech" >${req.des}
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-4">
                        <div class="col-md-12 ">
                            <textarea disabled class="form-control" rows="4"
                                      placeholder="请填写脚手架数量"
                                      name="scaffoldNum">${modelDetails.scaffoldNum}</textarea>
                        </div>
                        <div class="col-md-12 ">
                            <textarea disabled class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_repair_technology_input'/> " <%--请填写修理工艺--%>
                                      name="repairTechDesc">${modelDetails.repairTechDesc}</textarea>
                        </div>
                    </div>

                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head"><fmt:message
                            key='project_extent_damage'/><%--损坏程度--%></span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <textarea disabled class="form-control" rows="4" name="damage">${modelDetails.damage}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head">签名</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <div class="div-signature">
                            <label>填表人</label>
                            <select name="preparerRole">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${preparerRoles}" var="p">
                                    <option value="${p.value}"
                                            <c:if test="${modelDetails.preparerRole==p.value}">
                                                selected
                                            </c:if>
                                    >${p.des}</option>
                                </c:forEach>
                            </select>
                            <input disabled type="text" name="preparer" value="${modelDetails.preparer}"/>
                        </div>
                        <div class="div-signature">
                            <label>船员主管</label>
                            <select name="directorRole">
                                <option value="0">--请选择--</option>
                                <c:forEach items="${directorRoles}" var="d">
                                    <option value="${d.value}"
                                            <c:if test="${modelDetails.preparerRole==d.value}">
                                                selected
                                            </c:if>
                                    >${d.des}</option>
                                </c:forEach>
                            </select>
                            <input disabled type="text" name="director" value="${modelDetails.director}"/>
                        </div>
                        <div class="div-signature">
                            <label>机务</label>
                            <input  disabled type="text" name="engineer" value="${modelDetails.engineer}"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4" id="imgNum">
                <div style="width: 100%;">
                    <div class="col-md-6"><span class="head"><fmt:message
                            key="project_equipment_info"/><%--设备信息--%></span></div>
                    <div class="col-md-12" style="margin-top: 20px">
                        <div class="col-md-6">
                            <div class="form-group col-md-12">
                                <label for="faciName" class="col-sm-8 control-label"><fmt:message
                                        key="project_equipment_name"/><%--设备名称--%>:</label>
                                <div class="col-sm-4">
                                    <input disabled id="faciName" name="faciName" type="text" value="${modelDetails.faciName}"
                                           class="">
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="faciType" class="col-sm-8 control-label"><fmt:message
                                        key="project_equipment_model"/><%--设备型号--%>:</label>
                                <div class="col-sm-4">
                                    <input disabled id="faciType" name="faciType" type="text"  value="${modelDetails.faciType}"
                                           class="">
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="faciSrc" class="col-sm-8 control-label"><fmt:message
                                        key="project_manufacturer_nation"/><%--厂家/国家--%>:</label>
                                <div class="col-sm-4">
                                    <input disabled id="faciSrc" name="faciSrc" type="text" value="${modelDetails.faciSrc}"
                                           class="">
                                </div>
                            </div>
                        </div>
                        <div class=col-md-6">
                            <textarea disabled class="form-control" rows="4"
                                      placeholder="<fmt:message key='project_related_parameters'/> " <%--请填写其他参数--%>
                                      name="faciParam">${modelDetails.faciParam}</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%">
                    <div class="col-md-6" style="margin-top: 5px"><span class="head"><fmt:message
                            key="project_upload_img"/><%--上传图片--%></span></div>
                    <div class="col-md-12 divId" >
                        <div class="col-md-12"  id="divId" >
                            <button disabled id="upload_img" style="width: 100%">
                                <img src="" onerror="nofind(4)" style="width:100%;height: 100px"/>
                            </button>
                        </div>


                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div><span class="head"><fmt:message key="project_repair_des_material_spec"/><%--维修描述/材料规格--%></span></div>
            <div class="col-md-12 div-left" style="margin-top: 20px">
                <div id="example1"></div>
            </div>
        </div>

    </div>

    <div class="form-actions"  >
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <a href="modelDetail" type="button" class="btn btn-default" data-target="navTab"><fmt:message key="go_back"/> <%--返回--%>
                </a>
            </div>
        </div>
    </div>
</form>
<a id="modelDetail" href="modelDetail" class="btn btn-sm grey-mint" data-target="navTab" style="display: none"></a>'
<script type="text/javascript">

    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    initUploaders_img("upload_img", "shipinfo", "${staticPath}/", "imges", "img");

    //服务器校验
    function saveInfo() {
        var arr1=new Array();
        var datas=handsontableData();
        var j=0;
        for(var i=0;i<datas.length;i++){
            if(datas[i][0]==null){
                continue;
            }
            var obj=new Object();
            obj.des=datas[i][0];
            obj.unit=datas[i][1];
            obj.count =datas[i][2];
            arr1[j++]=obj;
        }
        var dataJson=JSON.stringify(arr1);
        console.log(dataJson);
        $("#defForm").attr("action","modelDetail/edit");
        if(check()) {
            $("#defForm").ajaxSubmit({
                data:{
                    dataJson:dataJson
                },
                success: function (data) {
                    if (data.success) {
                        alert("success");
                        $("#modelDetail").click();
                    } else {
                        alert("false");
                        alert(data.msg);
                    }
                },
                error: function () {
                    alert("error");
                    return;
                }
            });
        }
    }
    //客户端校验
    function check() {
        if ($("#proName").val() == "") {
            $("#proName").tips({
                side: 2,
                msg: '<fmt:message key="project_name_empty"/>',/*工程名称不能为空*/
                bg: '#AE81FF',
                time: 3
            });
            $("#proName").focus();
            return false;
        } else {
            $("#proName").val(jQuery.trim($('#proName').val()));
        }
        return true
    }

</script>
<script>
    var id=$("#id").val();
    var width=$(window).width();
    var widthOne=width*0.46;
    var widthTwo=width*0.07;
    $("#example1").width(width*0.75);
    var dataJson;
    var h;
    $.ajax({
        url:'modelDetail/reqs',
        type:'POST', //GET
        async:true,    //或false,是否异步
        data:{
            id:id
        },
        success:function(data){
            dataJson=data.reqs;
            console.log(dataJson);
            var datas = eval(dataJson);
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
                colWidths: [widthOne,widthTwo,widthTwo],
                minRows:15,
                colHeaders: ["<fmt:message key='project_request'/> ", "<fmt:message key='project_unit'/>", "<fmt:message key='projec_quantity'/>"],
                columnSorting: true,
                columns: [
                    {data: "des"},
                    {data: "unit"},
                    {data: "count"}
                ],
                manualColumnMove: false,
                manualColumnResize: true,
                manualRowMove: true,
                manualRowResize: true,
                minSpareRows: 1,
                contextMenu: true,
                persistentState: true,
                readOnly:true
            });
            h=hot;

            resetState = document.querySelector('.reset-state');
            stateLoaded = document.querySelector('.state-loaded');

        },
        error:function(xhr,textStatus){
            console.log('错误');
        }
    });
    function handsontableData() {
        return h.getData();
    }


</script>
