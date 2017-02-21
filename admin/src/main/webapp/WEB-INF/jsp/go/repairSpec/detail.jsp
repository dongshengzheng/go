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
    .form-horizontal .form-group{}

</style>
<go:navigater path="repairSpec"></go:navigater>
<form action="enquiry/add" method="post" class="form-horizontal" id="defForm">
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC" >
            <div class="timeline-body-content">
                <div class="form-group col-md-3">
                    <label for="shipName" class="col-sm-4 control-label">船名：</label>
                    <div class="col-sm-7">
                        <input id="shipName" name="shipName" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="catagory" class="col-sm-6 control-label">项目分类：</label>
                    <div class="col-sm-6">
                        <input id="catagory" name="catagory" type="text" maxlength="32"
                               class="form-control ">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="code" class="col-sm-6 control-label">项目号：</label>
                    <div class="col-sm-6">
                        <input id="code" name="code" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="proOrderNo" class="col-sm-6 control-label">项目单号：</label>
                    <div class="col-sm-6">
                        <input id="proOrderNo" name="proOrderNo" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="margin-top: 5px;border-right: dashed 1px #337ab7;" class="col-md-8">
                <div style="width: 100%;">
                    <div ><span style="background-color: #C0C9CC;font-size: 20px">工程项目描述</span></div>
                    <div class="col-md-12 div-left">工程名称：<input type="text" name="proName"/></div>
                    <div class="col-md-12 div-left">工程描述： </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" name="proDesc"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div ><span class="head">设备信息</span></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12">
                            <label for="faciName" class="col-sm-6 control-label">设备名称:</label>
                            <div class="col-sm-6">
                                <input id="faciName" name="faciName" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciType" class="col-sm-6 control-label">设备型号:</label>
                            <div class="col-sm-6">
                                <input id="faciType" name="faciType" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciSrc" class="col-sm-6 control-label">厂家/国家:</label>
                            <div class="col-sm-6">
                                <input id="faciSrc" name="faciSrc" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="faciNo" class="col-sm-6 control-label">序列号:</label>
                            <div class="col-sm-6">
                                <input id="faciNo" name="faciNo" type="text"
                                       class="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" style="margin-left: 20px">
                            <textarea class="form-control" rows="7" placeholder="请输入相关参数" name="faciParam"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div  class="form-group col-md-12"><span class="head">维修部位</span></div>
                    <div class="form-group col-md-12" style="margin-left: 3px">
                        <c:forEach items="${repDicts}" var="r">
                            <div class="col-md-3">
                                <label class="mt-checkbox">
                                    <input type="checkbox" value="${r.id}" name="repairPosition"> ${r.value}
                                    <span></span>
                                </label>
                            </div>
                        </c:forEach>

                    </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" placeholder="请输入详细位置" name="repairPositionDesc"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="form-group col-md-12"><span class="head">损坏程度</span></div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" name="damage"></textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="margin-top: 5px;border: 1px dashed #337ab7;margin-left: 10px">
                <p>插入图片或图纸</p>
                <img id="logo-img"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${company.logo}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     style="display: block;width: 50%;height: 50%"
                     onerror="nofind(1)"/>
                <input type="hidden" id="logo" name="logo" value="${company.logo}">
                <br>
                <button id="upload_logo" class="btn blue" type="button"><i class="fa fa-tv"></i> 本地上传</button>
            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">请求材料规格</span></div>
            <div class="col-md-12 div-left">
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                   id="default_table" style="width: 98%" >
                <thead>
                <tr style="background-color: #8CD2E5">
                    <td style="width:2%"> <input type="checkbox"/></td>
                    <th style="width: 68%">要求和描述/材料规格</th>
                    <th style="width: 6%">单位</th>
                    <th style="width: 6%">数量</th>
                    <th style="width: 20%">
                        <button type="button" onclick="" class="btn red">删除</button>&nbsp;
                        <button  type="button" onclick="addTr(this)" class="btn green">添加</button>
                        <input type="text" value="1" id="assPages" style="width: 20%">
                    </th>
                </tr>
                </thead>
                <tbody id="table-tbody">
                    <tr id="td-oneline">
                        <td> <input type="checkbox" /></td>
                        <td><input type="text" class="td-text"></td>
                        <td><input type="text" class="td-text"></td>
                        <td><input type="text" class="td-text"></td>
                        <td>
                            <button type="button" onclick="delTr(this)" class="btn red">删除</button>&nbsp;
                            <button  type="button"  class="btn green insert" >插入</button>
                            <input type="text" value="1" class="asd"  style="width: 20%">
                        </td>
                    </tr>


                </tbody>
            </table>
            </div>
        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">修理工艺</span></div>
            <div class="col-md-12 div-left">
                <c:forEach items="${reqDicts}" var="req">
                    <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="${req.id}"> ${req.value}
                        <span></span>
                    </label>
                </div>
                </c:forEach>
            </div>
            <div class="col-md-12 div-left">
                <textarea class="form-control" rows="4" placeholder="请填写修理工艺" name="repairTechDesc"></textarea>
            </div>
        </div>
    </div>

    <div class="form-actions" >
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green" onclick="saveInfo()">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn default">重置</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn green">保存为工程单范本</button>
            </div>
        </div>
    </div>
</form>

<script>
    function delTr(obj) { //删除行  
        if(confirm('确定要删除？')) {
            s = $("#default_table tbody tr").clone();
            $(obj).parent().parent().remove();
        }
    }

    function addTr() {  //增加行
        var rows=$("#assPages").val();
        for(i=0;i<rows;i++){
            if($("table tbody tr:visible").length==0){
                $("#default_table tbody").append(s);
            }else {
                s=$("#default_table tbody tr:last").clone()
                $("#default_table tbody tr:last").after(s);
            }
        }

        $(".insert").unbind('click');

        $(".insert").on("click",function () {
            var rows=$(this).parent().find('input').val();
            for(i=0;i<rows;i++){
                var s=$("#default_table tbody tr:last").clone()
                $(this).parent().parent().after(s);
            }
            $(this).parent().find('input').val(1);
        })
    }

    $(".insert").on("click",function () {
        var rows=$(this).parent().find('input').val();
        for(i=0;i<rows;i++){
            var s=$("#default_table tbody tr:last").clone()
            $(this).parent().parent().after(s);
        }
        $(this).parent().find('input').val(1);
    })

    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    initUploaders_logo("upload_logo", "windyeel", "${staticPath}/", "logo-img", "logo");

    //服务器校验
    function saveInfo() {
        $("#defForm").ajaxSubmit({
            success: function (data) {
                if (data.success) {
                    alert("success");
                    $("#shipyard").click();
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
</script>