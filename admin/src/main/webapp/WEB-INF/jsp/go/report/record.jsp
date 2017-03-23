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
<go:navigater path="progress"></go:navigater>
<style>
    table ,tr,td{
        border: solid 2px #9C9C9C
    }
    .borders{
        border: solid 1px #9C9C9C;
        margin-bottom: 40px;
    }
    textarea{ resize:none;}
</style>

<form action="report/addRecord" method="post" class="form-horizontal" id="defForm">
    <input name="repairProgDetailId" type="hidden" value="${progDetail.id}" id="progDetailId"/>
    <input type="hidden" value="${reportDetailId}" id="reportDetailId">

    <%--更新时候用到--%>
    <input name="id" type="hidden" value="${reportDetail.id}"/>




    <div class="profile-content">
        <div class="row col-md-11" >
            <div class="col-md-12"><h4>记录报告</h4></div>
            <div class="col-md-12" style="padding-left:0px;padding-right: 0px
">
                <div class="timeline-body-content">
                    <table class="table table-bordered">
                        <tr>
                            <td>${progDetail.proOrderNo}</td>
                            <td>${progDetail.proName}</td>
                            <td style="width: 50%">${progDetail.proDesc}</td>
                            <td><a href="#">工程状态修改</a></td>
                            <td><a href="#">工程详单查看</a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-12"><h4>详情记录</h4></div>
            <div class="col-md-12 borders">
               <div style="padding-top: 15px;padding-bottom: 15px">
                   <div class="col-md-9" style="padding: 0px">
                       <div  id="example1"  style=" height: 250px; overflow: hidden;"></div>
                   </div>
                   <div class="col-md-3"style=" height: 250px;padding: 0px">
                       <textarea name="memo" style="width: 100%;height:100%;" placeholder="备注:">${reportDetail.memo}</textarea>
                   </div>
               </div>
            </div>
            <div class="col-md-12 " ><h4>上传照片</h4></div>
            <div class="col-md-12 borders" >
                <c:if test="${!empty reportDetailFiles}">
                    <c:forEach items="${reportDetailFiles}" var="t">
                        <c:if test="${t.type=='img'}">
                            <div style="float:left;position:relative;margin: 10px">
                                <input name="fileDiskName" type="hidden" value="" >
                                <input name="fileName" type="hidden" value="${t.filename}"/>
                                <input name="fileType" type="hidden" value="0">
                                <input name="oss" type="hidden" value="${t.oss}"/>
                                <span onclick="javascript:this.parentNode.remove();" class="glyphicon glyphicon-remove" style="background: rgba(0,0,0,.5);color:white;position:absolute;top:0px;right:4px;z-index: 999;"></span>
                                <img src="${t.oss}"style="width: 100px;height: 100px;"class="min-img" >
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>

                <div id="divId" style="margin: 10px">
                    <button id="upload_img" >
                        <img id="img" src="" style="width: 100px;height: 100px"
                         onerror="nofind(4)"/>
                    </button>
                </div>
            </div>
            <div class="col-md-12"><h4>上传相关文件</h4></div>
            <div class="col-md-12 borders">
                <div style="padding: 10px;">
                    <table class="table" id="table_attachment">
                       <tbody>
                           <tr>
                               <td id="one" rowspan="100" width="100px"><input id="attachment" type="button" value="浏览本地"/></td>
                           </tr>
                            <c:if test="${!empty reportDetailFiles}">
                                <c:forEach items="${reportDetailFiles}" var="r">
                                    <c:if test="${r.type=='attachment'}">
                                       <tr>
                                           <td style="width: 80%">${r.filename}<a target="_blank" href="${r.oss}">${r.filename}</a></td>
                                           <td>
                                               <button onclick="delTr(this)">删除</button>
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
                <button type="button" onclick="severCheck()" class="btn btn-primary">提交</button>
                <button  onclick="goBack()" class="btn blue">取消</button>
            </div>
        </div>
    </div>
</form>
<a id="info" href="task/info?id=${taskId}" class="btn btn-sm grey-mint" data-target="navTab" style="display: none"></a>'
<script>
    function delTr(obj) { //删除行  
        $(obj).parent().parent().remove();
    }
    function goBack() {
        $("#info").click();
    }
    function severCheck() {
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
                    App.alert({
                        container: "#detail_alert",
                        close: true,
                        icon: 'fa fa-warning',
                        place: "append",
                        message: "提交成功",
                        type: 'success',
                        reset: true,
                        focus: false,
                        closeInSeconds: 5,
                    })
                } else {
                    App.alert({
                        container: "#detail_alert",
                        close: true,
                        icon: 'fa fa-warning',
                        place: "append",
                        message: "提交失败,请稍后再试",
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
                    message: "系统繁忙,请稍后再试",
                    type: 'warning',
                    reset: true,
                    focus: false,
                    closeInSeconds: 5,
                })
                return;
            }
        });
    }
</script>
<script>
    initUploaders_report_img("upload_img", "shipinfo", "${staticPath}/", "img", "divId");
    initUploaders_attachment("attachment", "shipinfo", "${staticPath}/", "table_attachment","one");

    var id=$("#progDetailId").val();
    var reportDetailId=$("#reportDetailId").val();
    var width=$(window).width();
    var dataJson;
    var h;
    $.ajax({
        url:'report/reqs',
        data:{
            id:id,
            reportDetailId:reportDetailId
        },
        type:'POST', //GET
        async:true,    //或false,是否异步

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
                colWidths: [width*0.3,width*0.05,width*0.05,width*0.05,width*0.05,width*0.05],
                minRows:10,
                colHeaders: ["要求和描述/材料规格","单位","数量","单价","系数","总价"],
                columnSorting: true,
                columns: [
                    {data: "des",readOnly:true},
                    {data: "unit",readOnly:true},
                    {data: "count"},
                    {data:  "tariff",readOnly:true},
                    {data:  "discount",readOnly:true},
                    {data:  "total",readOnly:true}
                ],
                manualColumnMove: false,
                manualColumnResize: true,
                manualRowMove: false,
                manualRowResize: false,
                minSpareRows: 1,
                contextMenu: false,
                persistentState: false,
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
