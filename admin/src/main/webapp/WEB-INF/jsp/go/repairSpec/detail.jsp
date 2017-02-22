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

</style>
<form action="" method="post" class="form-horizontal" id="defForm">
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC">
            <div class="timeline-body-content">
                <div class="form-group col-md-3">
                    <label for="shipName" class="col-sm-5 control-label label-top">船名：</label>
                    <div class="col-sm-7">
                        <input id="shipName" name="shipName" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="catagory" class="col-sm-6 control-label label-top">项目分类：</label>
                    <div class="col-sm-6">
                        <input id="catagory" name="catagory" type="text" maxlength="32"
                               class="form-control ">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="code" class="col-sm-6 control-label label-top">项目号：</label>
                    <div class="col-sm-6">
                        <input id="code" name="code" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="proOrderNo" class="col-sm-6 control-label label-top">项目单号：</label>
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
                    <div><span style="background-color: #C0C9CC;font-size: 20px">工程项目描述</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">工程名称：<input id="proName" type="text"
                                                                                         name="proName"/></div>
                    <div class="col-md-12 div-left">工程描述：</div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" name="proDesc"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div><span class="head">设备信息</span></div>
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
                    <div><span class="head">维修部位</span></div>
                    <div class="form-group col-md-12" style="margin-left: 3px;margin-top: 20px">
                        <c:forEach items="${repDicts}" var="r">
                            <div class="col-md-3">
                                <label class="mt-checkbox">
                                    <input type="checkbox" value="${r.value}" name="repairPosition"> ${r.des}
                                    <span></span>
                                </label>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" placeholder="请输入详细位置"
                                  name="repairPositionDesc"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div><span class="head">损坏程度</span></div>
                    <div class="col-md-12 div-left" style="margin-top: 20px">
                        <textarea class="form-control" rows="4" name="damage"></textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="margin-top: 5px;border: 1px dashed #337ab7;margin-left: 10px">
                <p>插入图片或图纸</p>
                <img id="imges"
                     src=""
                     style="display: block;width: 50%;height: 50%"
                     onerror="nofind(1)"/>
                <input type="hidden" id="img" name="img" value="">
                <br>
                <button id="upload_img" class="btn blue" type="button"><i class="fa fa-tv"></i> 本地上传</button>
            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div><span class="head">请求材料规格</span></div>
            <div class="col-md-12 div-left" style="margin-top: 20px">
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table" style="width: 98%">
                    <thead>
                    <tr style="background-color: #8CD2E5">
                        <td style="width:2%"><input type="checkbox" id="selectAll"/></td>
                        <th style="width: 64%">要求和描述/材料规格</th>
                        <th style="width: 6%">单位</th>
                        <th style="width: 6%">数量</th>
                        <th style="width: 24%">
                            <button type="button" onclick="" class="btn btn-sm red" id="deletes">删除</button>
                            &nbsp;
                            <button type="button" onclick="addTr(this)" class="btn btn-sm green">添加</button>
                            <input type="text" value="1" id="assPages" style="width: 20%">
                        </th>
                    </tr>
                    </thead>
                    <tbody id="table-tbody">
                    <tr id="td-oneline">
                        <td><input type="checkbox" class="td-checkbox"/></td>
                        <td><input type="text" class="td-text" name="des"></td>
                        <td><input type="text" class="td-text" name="unit"></td>
                        <td><input type="text" class="td-text" name="count"></td>
                        <td>
                            <button type="button" onclick="delTr(this)" class="btn btn-sm red">删除</button>
                            &nbsp;
                            <button type="button" onclick="insTr(this)" class="btn btn-sm green">插入一行</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div><span class="head">修理工艺</span></div>
            <div class="form-group col-md-12 div-left" style="margin-top: 20px">
                <c:forEach items="${reqDicts}" var="req">
                    <div class="col-md-3">
                        <label class="mt-checkbox">
                            <input type="checkbox" value="${req.value}" name="repairTech"> ${req.des}
                            <span></span>
                        </label>
                    </div>
                </c:forEach>
            </div>

            <div class="col-md-10 div-left">
                <textarea class="form-control" rows="4" placeholder="请填写修理工艺" name="repairTechDesc"></textarea>
            </div>
        </div>
    </div>

    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <br>
                <button type="button" class="btn green" onclick="saveInfo(1)">确定</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn default">重置</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn green" onclick="saveInfo(2)">保存为范本</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <br><br>
            </div>
        </div>
    </div>
</form>


<script type="text/javascript">

    var rowTr = '<tr>' +
            '<td><input type="checkbox" class="td-checkbox"/></td>' +
            '<td><input type="text" class="td-text" name="des"></td>' +
            '<td><input type="text" class="td-text" name="unit"></td>' +
            '<td><input type="text" class="td-text" name="count"></td>' +
            '<td><button type="button" onclick="delTr(this)" class="btn red">删除</button>&nbsp;&nbsp;' +
            '<button  type="button" onclick="insTr(this)" class="btn green" >插入一行</button></td>' +
            '</tr>'
    function delTr(obj) { //删除行  
        if (confirm('确定要删除？')) {
            $(obj).parent().parent().remove();
        }
    }

    function addTr() {  //增加行
        var rows = $("#assPages").val();
        for (i = 0; i < rows; i++) {
            if ($("table tbody tr:visible").length == 0) {
                $("#default_table tbody").append(rowTr);
            } else {
                $("#default_table tbody tr:last").after(rowTr);
            }
        }
        $("#assPages").val(1);
    }
    function insTr(obj) {
        $(obj).parent().parent().after(rowTr);
    }


    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    initUploaders_img("upload_img", "windyeel", "${staticPath}/", "imges", "img");

    //服务器校验
    function saveInfo(a) {
        var dataJson = "";
        var des = "";
        var unit = "";
        var count = 0;
        $("#default_table tr").each(function (index, domEle) {// mainTable 下的tr  
            userId = "";
            if (index != 0) {//遍历除去第一行的之外的所有input作为json数据传入后台  
                $(domEle).find("input").each(function (index, data) {
                    if (index == 1) {
                        des = $(data).val();
                    }
                    if (index == 2) {
                        unit = $(data).val();
                    }
                    if (index == 3) {
                        if ($(data).val() != "" && $(data).val() != null) {//如果没有输入的情况下传的值是0  
                            count = $(data).val();
                        }
                    }
                });
                /*
                 dataJson += "{"+"\"des\":\""+des+"\","+"\"unit\":\""+unit+"\","+"\"count\":\""+count+"\"},";
                 */
                dataJson += des + "," + unit + "," + count + ",";

            }
        });
        if (dataJson.lastIndexOf(",")) {
            dataJson = dataJson.substring(0, dataJson.length - 1);
        }
        alert(dataJson);
        if (a == 1) {
            $("#defForm").attr("action", "enquiry/add?dataJson=" + dataJson);
        } else if (a == 2) {
            $("#defForm").attr("action", "enquiry/addModel?dataJson=" + dataJson);
        }
        if (check()) {
            $("#defForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        alert("success");
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

    $(function () {
        $("#selectAll").change(function () {

            $("#selectAll").prop("checked", this.checked);
            if ($("#selectAll").prop("checked")) {
                $(".td-checkbox").each(function () {
                    $(this).prop("checked", "checked");
                });
            } else {
                $(".td-checkbox").each(function () {
                    $(this).attr("checked", false);
                });
            }
        });

        $("#deletes").click(function (e) {
            //e.preventDefault();
            var t = confirm("确定要删除吗？");
            if (t) {
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
