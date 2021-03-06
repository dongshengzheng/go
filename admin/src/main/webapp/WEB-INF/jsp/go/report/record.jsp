<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="task"></go:navigater>
<style>
    table, tr, td {
        border: solid 2px #9C9C9C
    }

    .borders {
        border: solid 1px #9C9C9C;
        margin-bottom: 40px;
    }

    textarea {
        resize: none;
    }

    ul.dropdown-menu {
        z-index: 100;
    }

    .modal-dialog {
        position: relative;
        width: 75%;
        margin: auto;
    }

    .modal-content {
        padding: 10px;
    }
    .divImg{
        float:left;position:relative;margin: 10px
    }
</style>

<form action="report/addRecord" method="post" class="form-horizontal" id="defForm">
    <input name="repairProgDetailId" type="hidden" value="${progDetail.id}" id="progDetailId"/>
    <input type="hidden" value="${reportDetailId}" id="reportDetailId">

    <%--更新时候用到--%>
    <input name="id" type="hidden" value="${reportDetail.id}"/>
    <input name="taskId" type="hidden" value="${taskId}"/>
    <input name="taskStatus" value="" type="hidden" id="taskStatus">


    <div class="profile-content">
        <div class="row col-md-11">
            <div class="col-md-12"><h4><fmt:message key="report_record_report"/> <%--记录报告--%></h4></div>
            <div class="col-md-12" style="padding-left:0px;padding-right: 0px">
                <div class="timeline-body-content">
                    <table class="table table-bordered">
                        <tr>
                            <td>${progDetail.proOrderNo}</td>
                            <td>${progDetail.proName}</td>
                            <td style="width: 50%">${progDetail.proDesc}</td>
                            <td>
                                <c:if test="${progDetail.taskStatus == 0}">
                                    <label class='btn green-jungle'><fmt:message key="progress_completed"/> </label><%--已完成--%>
                                </c:if>
                                <c:if test="${progDetail.taskStatus == 1}">
                                    <label class='btn blue'><fmt:message key="progress_underway"/></label><%--进行中--%>
                                </c:if>
                                <c:if test="${progDetail.taskStatus == null||progDetail.taskStatus==2}">
                                    <label class='btn default'><fmt:message key="progress_not_started"/></label><%--未开始--%>
                                </c:if>
                                <c:if test="${progDetail.taskStatus ==3}">
                                    <label class='btn yellow'><fmt:message key="progress_canceled"/></label><%--已取消--%>
                                </c:if>
                            </td>
                            <td><a data-model="dialog" href="repairProg/progDetail?id=${progDetail.id}"><fmt:message key="report_review_spec_detail"/> </a></td><%--工程详单查看--%>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-12"><h4><fmt:message key="report_details_recorded"/> <%--详情记录--%></h4></div>
            <div class="col-md-12 borders">
                <div style="padding-top: 15px;padding-bottom: 15px">
                    <div class="col-md-9" style="padding: 0px">
                        <div id="example" style=" height: 250px; overflow: hidden;"></div>
                    </div>
                    <div class="col-md-3" style=" height: 250px;padding: 0px">
                        <textarea name="memo" style="width: 100%;height:100%;"
                                  placeholder="<fmt:message key='report_memo'/> :">${reportDetail.memo}</textarea><%--备注--%>
                    </div>
                </div>
            </div>
            <div class="col-md-12 "><h4><fmt:message key="report_upload_photo"/> <%--上传照片--%></h4></div>
            <div class="col-md-12 borders">
                <c:if test="${!empty reportDetailFiles}">
                    <c:forEach items="${reportDetailFiles}" var="t">
                        <c:if test="${t.type==0}">
                            <div class="divImg">
                                <input name="fileDiskName" type="hidden" value="">
                                <input name="fileName" type="hidden" value="${t.filename}"/>
                                <input name="fileType" type="hidden" value="0">
                                <input name="oss" type="hidden" value="${t.oss}"/>
                                <span onclick="javascript:this.parentNode.remove();" class="glyphicon glyphicon-remove" style="background: rgba(0,0,0,.5);color:white;position:absolute;top:0px;right:2px;z-index: 999;"></span>
                                <a href="${t.oss}" target="_blank"><img src="${t.oss}"
                                                                        style="width: 100px;height: 100px;"
                                                                        class="min-img"></a>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>
                <div id="divId" style="margin: 10px;overflow: hidden">
                    <button id="upload_img">
                        <img id="img" src="" style="width: 100px;height: 100px"
                             onerror="nofind(4)"/>
                    </button>
                </div>
            </div>
            <div class="col-md-12"><h4><fmt:message key="report_upload_relevant_file"/> <%--上传相关文件--%></h4></div>
            <div class="col-md-12 borders">
                <div style="padding: 10px;">
                    <table class="table" id="table_attachment">
                        <tbody>
                        <tr>
                            <td id="one" rowspan="100" width="100px"><input id="attachment" type="button" value="<fmt:message key='report_browse_local_file'/> "/><%--浏览本地--%>
                            </td>
                        </tr>
                        <c:if test="${!empty reportDetailFiles}">
                            <c:forEach items="${reportDetailFiles}" var="r">
                                <c:if test="${r.type==2}">
                                    <tr>
                                        <td style="width: 80%">${r.filename}<a target="_blank"
                                                                               href="${r.oss}">${r.filename}</a></td>
                                        <td>
                                            <button onclick="delTr(this)"><fmt:message key="go_delete"/> </button><%--删除--%>
                                            <input name="fileDiskName" type="hidden" value="">
                                            <input name="fileName" type="hidden" value="${r.filename}"/>
                                            <input name="fileType" type="hidden" value="2"/>
                                            <input name="oss" type="hidden" value="${r.oss}"/>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button type="button" onclick="status()" class="btn btn-primary"><fmt:message key="go_submit"/> <%--提交--%></button>
                <button type="button" onclick="goBack()" class="btn btn-default"><fmt:message key="go_cancel"/> <%--取消--%></button>
            </div>
        </div>
    </div>
</form>
<div id="make" class="modal fade" tabindex="-1" data-backdrop="make" data-keyboard="false">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #4bccd8">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><fmt:message key="report_select_status"/> <%--请选择状态--%></h4>
            </div>
            <div class="modal-body">
                <div class="form-group form-md-radios">
                    <div class="md-radio-inline" style="margin-left: 50px">
                        <div class="md-radio">
                            <input type="radio" id="radio6" name="radio2" class="md-radiobtn" value="2"
                            <c:if test="${progDetail.taskStatus==2||progDetail.taskStatus==null}">
                                   checked
                            </c:if>
                            <c:if test="${progDetail.taskStatus==0}">
                                   disabled
                            </c:if>
                            >
                            <label for="radio6">
                                <span></span>
                                <span class="check"></span>
                                <span class="box"></span> <fmt:message key="progress_not_started"/> <%--未开始--%> </label>
                        </div>
                        <div class="md-radio">
                            <input type="radio" id="radio7" name="radio2" class="md-radiobtn" value="1"
                            <c:if test="${progDetail.taskStatus==1}">
                                   checked
                            </c:if>
                            <c:if test="${progDetail.taskStatus==0}">
                                   disabled
                            </c:if>
                            >
                            <label for="radio7">
                                <span></span>
                                <span class="check"></span>
                                <span class="box"></span> <fmt:message key="progress_underway"/><%--进行中--%> </label>
                        </div>
                        <div class="md-radio">
                            <input type="radio" id="radio8" name="radio2" class="md-radiobtn" value="0"
                            <c:if test="${progDetail.taskStatus==0}">
                                   checked
                            </c:if>
                            >
                            <label for="radio8">
                                <span></span>
                                <span class="check"></span>
                                <span class="box"></span> <fmt:message key="progress_completed"/><%--已完成--%> </label>
                        </div>
                        <div class="md-radio">
                            <input type="radio" id="radio9" name="radio2" class="md-radiobtn" value="3"
                            <c:if test="${progDetail.taskStatus==3}">
                                   checked
                            </c:if>
                            <c:if test="${progDetail.taskStatus==0}">
                                   disabled
                            </c:if>
                            >
                            <label for="radio9">
                                <span></span>
                                <span class="check"></span>
                                <span class="box"></span> <fmt:message key="progress_canceled"/><%--已取消--%> </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="close" type="button" data-dismiss="modal" class="btn dark btn-outline"><fmt:message key="go_close"/> <%--关闭--%></button>
                <button type="button" onclick="severCheck()" class="btn dark btn-outline"><fmt:message key="go_confirm"/> <%--确定--%></button>
            </div>
        </div>
    </div>
</div>
<div id="result" class="modal fade" tabindex="-1" data-backdrop="make" data-keyboard="false">
    <div class="modal-dialog" style="width: 40%">
        <div class="modal-content">
            <input type="hidden" id="resultNum" value=""/>
            <div class="modal-header" style="background-color: #4bccd8">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title"><fmt:message key="report_submit_results"/> </h4><%--提交结果--%>
            </div>
            <div class="modal-body">
                <h4><p id="reminder"></p></h4>
            </div>
            <div class="modal-footer">
                <button onclick="resultClose()" type="button"  class="btn dark btn-outline"><fmt:message key="go_confirm"/> <%--确定--%></button>
            </div>
        </div>
    </div>
</div>

<a id="info" href="task/info?id=${taskId}" class="btn btn-sm grey-mint" data-target="navTab" style="display: none"></a>
<a href="#make" style="display:none" data-toggle="modal" id="box" class="btn btn-sm margin-bottom-5 green"></a>
<a href="#result" style="display:none" data-toggle="modal" id="boxClose" class="btn btn-sm margin-bottom-5 green"></a>
<script>
    function status() {
        $("#box").click();
    }

    function sure() {
        var taskStatus = $("input[type='radio']:checked").val();
        $("#taskStatus").val(taskStatus);
        return true;
    }
    function delTr(obj) { //删除行  
        $(obj).parent().parent().remove();
    }
    function goBack() {
        $("#info").click();
    }
    function resultClose(){
        if($('#resultNum').val()==1) {
            $(".close").click();
            setTimeout("$('#info').click();", 300);
        }else{
            $(".close").click();
        }
    }

    function severCheck() {
        if (sure()) {
            var s=$(".close").click();
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
            $("#defForm").ajaxSubmit({
                data: {
                    dataJson: dataJson
                },
                success: function (data) {
                    if (data.success) {
                        $("#reminder").html("<fmt:message key='report_submit_success'/> ");/*提交成功*/
                        $('#resultNum').val(1);
                        $("#boxClose").click();
                    } else {
                        $("#reminder").html("<fmt:message key='report_submit_failure'/>");/*提交失败*/
                        $('#resultNum').val(0);
                        $("#boxClose").click();
                    }
                },
                error: function () {
                    $("#reminder").html("<fmt:message key='report_system_busy'/>");/*系统繁忙,请稍后再试*/
                    $('#resultNum').val(0);
                    $("#boxClose").click();

                    return;
                }
            });
        }

    }
</script>
<script>
    initUploaders_report_img("upload_img", "shipinfo", "${staticPath}/", "img", "divId");
    initUploaders_attachment("attachment", "shipinfo", "${staticPath}/", "table_attachment", "one","<fmt:message key="go_delete"/>");

    //判断是否已经完成了，完成了，则excel都不可以从操作的
    var flag = false;
    var s =${progDetail.taskStatus};
    if (s == 0) {
        flag = true;
    }

    var id = $("#progDetailId").val();
    var reportDetailId = $("#reportDetailId").val();
    var width = $(window).width();
    var dataJson;
    var h;
    $.ajax({
        url: 'report/reqs',
        data: {
            id: id,
            reportDetailId: reportDetailId
        },
        type: 'POST', //GET
        async: true,    //或false,是否异步

        success: function (data) {
            dataJson = data.reqs;
            console.log(dataJson);
            var datas = eval(dataJson);
            var container = document.getElementById('example'),
                    storedData = {},
                    savedKeys,
                    resetState,
                    stateLoaded,
                    hot;

            hot = new Handsontable(container, {
                data: datas,
                rowHeaders: true,
                colHeaders: true,
                colWidths: [width * 0.3, width * 0.05, width * 0.05, width * 0.05, width * 0.05, width * 0.05],
                minRows: 9,
                colHeaders: ["<fmt:message key='project_repair_des_material_spec'/>","<fmt:message key='project_request'/>","<fmt:message key='project_unit'/>"
                                ,"<fmt:message key='project_unit_price'/>","<fmt:message key='project_ratio'/>","<fmt:message key='project_total_price'/>"],/*"要求和描述/材料规格", "单位", "数量", "单价", "系数", "总价"*/
                columnSorting: true,
                columns: [
                    {data: "des", readOnly: true},
                    {data: "unit", readOnly: true},
                    {data: "count", readOnly: flag},
                    {data: "tariff", readOnly: true},
                    {data: "discount", readOnly: true},
                    {data: "total", readOnly: true}
                ],
                manualColumnMove: false,
                manualColumnResize: true,
                manualRowMove: false,
                manualRowResize: false,
                minSpareRows: 1,
                contextMenu: false,
                persistentState: false,
            });
            h = hot;

            resetState = document.querySelector('.reset-state');
            stateLoaded = document.querySelector('.state-loaded');

        },
        error: function (xhr, textStatus) {
            console.log('错误');
        }
    });
    function handsontableData() {
        return h.getData();
    }


</script>
