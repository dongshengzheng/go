<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="reportDetail"></go:navigater>
<go:navigater path="task"></go:navigater>
<style>
    table ,tr,td{
        border: solid 2px #9C9C9C
    }
    .borders{
        border: solid 1px #9C9C9C;
        margin-bottom: 40px;
    }
    textarea{ resize:none;}
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
</style>

<form action="report/addRecord" method="post" class="form-horizontal" id="defForm">
    <input name="repairProgDetailId" type="hidden" value="${progDetail.id}" id="progDetailId"/>
    <input type="hidden" value="${reportDetailId}" id="reportDetailId">

    <div class="profile-content">
        <div class="row col-md-11" >
            <div class="col-md-12"><h4>记录报告</h4></div>
            <div class="col-md-12" style="padding-left:0px;padding-right: 0px">
                <div class="timeline-body-content">
                    <table class="table table-bordered">
                        <tr>
                            <td>${progDetail.proOrderNo}</td>
                            <td>${progDetail.proName}</td>
                            <td style="width: 50%">${progDetail.proDesc}</td>
                            <td>
                                <c:if test="${progDetail.taskStatus == 0}">
                                    已完成
                                </c:if>
                                <c:if test="${progDetail.taskStatus == 1}">
                                    进行中
                                </c:if>
                                <c:if test="${progDetail.taskStatus == null||progDetail.taskStatus==2}">
                                    未开始
                                </c:if>
                                <c:if test="${progDetail.taskStatus ==3}">
                                    已取消
                                </c:if>
                            </td>
                            <td><a  data-model="dialog" href="repairProg/progDetail?id=${progDetail.id}">工程详单查看</a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <c:forEach var="i" begin="0" end="${size-1}" step="1" varStatus="d">
                <fmt:formatDate value="${reportDetails[i].createDate}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                <div class="col-md-12">${date}</div>
                <div class="col-md-12"><h4>详情记录</h4></div>
                <div class="col-md-12 borders">
                    <div style="padding-top: 15px;padding-bottom: 15px">
                        <div class="col-md-9" style="padding: 0px">
                            <div  id="example${d.count}"  style=" height: 250px; overflow: hidden;"></div>
                        </div>
                        <div class="col-md-3"style=" height: 250px;padding: 0px">
                            <textarea name="memo" style="width: 100%;height:100%;" placeholder="备注:">${reportDetails[i].memo}</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 " ><h4>上传照片</h4></div>
                <div class="col-md-12 borders" >
                    <c:if test="${!empty reportDetailFiles}">
                        <c:forEach items="${reportDetailFiles}" var="t">
                            <c:if test="${t.type==0}">
                                <div style="float:left;position:relative;margin: 10px">
                                    <input name="fileDiskName" type="hidden" value="" >
                                    <input name="fileName" type="hidden" value="${t.filename}"/>
                                    <input name="fileType" type="hidden" value="0">
                                    <input name="oss" type="hidden" value="${t.oss}"/>
                                    <img src="${t.oss}"style="width: 100px;height: 100px;"class="min-img" >
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
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
                                    <c:if test="${r.type==2}">
                                        <tr>
                                            <td style="width: 80%">${r.filename}<a target="_blank" href="${r.oss}">${r.filename}</a></td>
                                            <td>
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
            </c:forEach>



            <div class="modal-footer" style="text-align: center">
                <button type="button" onclick="goBack()" class="btn blue">取消</button>
            </div>
        </div>
    </div>
</form>

<a id="info" href="task/info?id=${taskId}" class="btn btn-sm grey-mint" data-target="navTab" style="display: none"></a>
<a href="#make"  style="display:none" data-toggle="modal" id="box" class="btn btn-sm margin-bottom-5 green"></a>

<script>
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
