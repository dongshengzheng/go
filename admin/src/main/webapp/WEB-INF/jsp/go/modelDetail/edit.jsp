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

</style>
<go:navigater path="repairSpec"></go:navigater>
<script type="text/javascript">
    $(function () {
        $("#selectAll").change(function(){

            $("#selectAll").prop("checked",this.checked);
            if($("#selectAll").prop("checked")){
                $(".td-checkbox").each(function () {
                    $(this).prop("checked","checked");
                });
            }else{
                $(".td-checkbox").each(function () {
                    $(this).attr("checked",false);
                });
            }
        });

        $("#deletes").click(function(e){
            //e.preventDefault();
            var t=confirm("确定要删除吗？");
            if(t) {
                var count = 0;
                $(".td-checkbox").each(function () {
                    if ($(this).prop("checked")) {
                        count++
                        $(this).parent().parent().remove();
                    }
                });

                if (count == 0) {
                    alert("至少选择一个!");
                    return;
                }
            }
        });
    });
</script>
<form action="" method="post" class="form-horizontal" id="defForm">
    <c:if test="${!empty modelDetails}">
        <input id="id" name="id" type="hidden" value="${modelDetails.id}"/>
        <input id="createDate" name="createDate" type="hidden" value="<fmt:formatDate value='${modelDetails.createDate}'
                        pattern="yyyy-MM-dd"/>"/>
        <input id="createBy" name="createBy" type="hidden" value="${modelDetails.createBy}"/>
        <input id="delFlag" name="delFlag" type="hidden" value="${modelDetails.delFlag}"/>
        <input id="companyId" name="companyId" type="hidden" value="${modelDetails.companyId}"/>
    </c:if>
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC" >
            <div class="timeline-body-content">
                <div class="form-group col-md-3">
                    <label for="shipName" class="col-sm-4 control-label label-top" >船名：</label>
                    <div class="col-sm-7">
                        <input  id="shipName" name="shipName" type="text" maxlength="32" value="${modelDetails.shipName}"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="catagory" class="col-sm-6 control-label label-top">项目分类：</label>
                    <div class="col-sm-6">
                        <input  id="catagory" name="catagory" type="text" maxlength="32" value="${modelDetails.catagory}"
                               class="form-control ">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="code" class="col-sm-6 control-label label-top">项目号：</label>
                    <div class="col-sm-6">
                        <input  id="code" name="code" type="text" maxlength="32" value="${modelDetails.code}"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="proOrderNo" class="col-sm-6 control-label label-top">项目单号：</label>
                    <div class="col-sm-6">
                        <input  id="proOrderNo" name="proOrderNo" type="text" maxlength="32" value="${modelDetails.proOrderNo}"
                               class="form-control required">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="margin-top: 5px;border-right: dashed 1px #337ab7;" class="col-md-8">
                <div style="width: 100%;">
                    <div ><span style="background-color: #C0C9CC;font-size: 20px">工程项目描述</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">工程名称：<input  id="proName" type="text" name="proName" value="${modelDetails.proName}"/></div>
                    <div class="col-md-12 div-left">工程描述： </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea  class="form-control" rows="4" name="proDesc">${modelDetails.proDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div ><span class="head">设备信息</span></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12">
                            <label for="faciName" class="col-sm-6 control-label">设备名称:</label>
                            <div class="col-sm-6">
                                <input id="faciName"  name="faciName" type="text" value="${modelDetails.faciName}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciType" class="col-sm-6 control-label">设备型号:</label>
                            <div class="col-sm-6">
                                <input  id="faciType" name="faciType" type="text" value="${modelDetails.faciType}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciSrc" class="col-sm-6 control-label">厂家/国家:</label>
                            <div class="col-sm-6">
                                <input  id="faciSrc" name="faciSrc" type="text" value="${modelDetails.faciSrc}"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciNo" class="col-sm-6 control-label">序列号:</label>
                            <div class="col-sm-6">
                                <input   id="faciNo" name="faciNo" type="text" value="${modelDetails.faciNo}"
                                        class="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" style="margin-left: 20px">
                            <textarea  class="form-control" rows="7" placeholder="请输入相关参数" name="faciParam">${modelDetails.faciParam}</textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div><span class="head" >维修部位</span></div>
                    <div class="form-group col-md-12" style="margin-left: 3px;margin-top: 20px">
                        <c:forEach items="${repDicts}" var="r">
                            <div class="col-md-3">
                                <label class="mt-checkbox">
                                    <input  type="checkbox" value="${r.value}"
                                    <c:forEach var="p" items="${positions}">
                                    <c:if test="${r.value==p}" >
                                           checked
                                    </c:if>
                                    </c:forEach>
                                           name="repairPosition"> ${r.des}
                                    <span></span>
                                </label>
                            </div>
                        </c:forEach>

                    </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea  class="form-control" rows="4" placeholder="请输入详细位置" name="repairPositionDesc">${modelDetails.repairPositionDesc}</textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div ><span class="head">损坏程度</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <textarea class="form-control" rows="4" name="damage">${modelDetails.damage}</textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="margin-top: 5px;border: 1px dashed #337ab7;margin-left: 10px">
                <p>插入图片或图纸</p>
                <img id="imges"
                     src="http://shipinfo.img-cn-shanghai.aliyuncs.com/${modelDetails.img}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     style="display: block;width: 80%;height: 50%"
                     onerror="nofind(1)"/>
                <input type="hidden" id="img" name="img" value="">
                <br>
                <button  <%--id="upload_img"--%> class="btn blue" type="button"><i class="fa fa-tv"></i> 本地上传</button>
            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">请求材料规格</span></div>
            <div class="col-md-12 div-left" style="margin-top: 20px">
                <div id="example1"  style=" height: 300px; overflow: hidden;"></div>
            </div>
        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">修理工艺</span></div>
            <div class="form-group col-md-12 div-left" style="margin-top: 20px">
                <c:forEach items="${reqDicts}" var="req">
                    <div class="col-md-3">
                        <label class="mt-checkbox">
                            <input  type="checkbox"  value="${req.value}"
                            <c:forEach var="t" items="${techs}">
                            <c:if test="${req.value==t}" >
                                   checked
                            </c:if>
                            </c:forEach>
                                   name="repairTech" > ${req.des}
                            <span></span>
                        </label>
                    </div>
                </c:forEach>
            </div>

            <div class="col-md-12 div-left">
                <textarea  class="form-control" rows="4" placeholder="请填写修理工艺" name="repairTechDesc">${modelDetails.repairTechDesc}</textarea>
            </div>
        </div>
    </div>

    <div class="form-actions"  >
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button id="dump" type="button" class="btn green" onclick="saveInfo()" data-dump="#example1" data-instance="hot">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" class="btn default" />&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="modelDetail" type="button" class="btn btn-default" data-target="navTab">取消
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
        /*
         dataJson=dataJson.substring(0,dataJson.length-1);
         */
        /*
         dataJson+="]}";
         */

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
                msg: '工程名称不能为空',
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
                    colWidths: [800,100,100],
                    minRows:15,
                    colHeaders: ["要求和描述/材料规格","单位","数量"],
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
                    persistentState: true
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
