<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .timeline .timeline-icon {
        padding: 0;
        text-align: center;
        line-height: 80px
    }

    .red {
        color: red;
    }

    .col-sm-3.control-label {
        text-align: left;
    }

</style>
<go:navigater path="ship"></go:navigater>
<form class="form-horizontal" action="ship/edit" method="post"
      id="defForm" callfn="refreshTable">
    <input id="id" name="id" type="hidden" value="${ship.id}"/>
    <input id="createDate" name="createDate" type="hidden" value="<fmt:formatDate value='${ship.createDate}'
                        pattern="yyyy-MM-dd"/>"/>
    <input id="createBy" name="createBy" type="hidden" value="${ship.createBy}"/>
    <input id="delFlag" name="delFlag" type="hidden" value="${ship.delFlag}"/>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title tabbable-line">
                    <div class="caption caption-md">
                        <i class="fa fa-info"></i>
                        <span class="caption-subject bold font-green uppercase"> 公司资料</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-building"></i>
                                公司名称</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司名称">
                            </div>
                            <label class="col-sm-3 control-label"><span class="red">* </span>请填写公司名称</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-user"></i>
                                公司法人</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司法人">
                            </div>
                            <label class="col-sm-3 control-label">请填写公司法人</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-phone"></i>
                                公司电话</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司电话">
                            </div>
                            <label class="col-sm-3 control-label"><span class="red">* </span>请填写公司电话</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-fax"></i>
                                公司传真</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司传真">
                            </div>
                            <label class="col-sm-3 control-label">请填写公司传真</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-internet-explorer"></i>
                                公司网址</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司网址">
                            </div>
                            <label class="col-sm-3 control-label">请填写公司网址</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-location-arrow"></i>
                                公司地址</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写公司地址">
                            </div>
                            <label class="col-sm-3 control-label"><span class="red">* </span>请填写公司地址</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-envelope"></i>
                                邮政编码</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写邮政编码">
                            </div>
                            <label class="col-sm-3 control-label">请填写邮政编码</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-user"></i>
                                联系姓名</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写联系人姓名">
                            </div>
                            <label class="col-sm-3 control-label"><span class="red">* </span>请填写联系人姓名</label>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label"><i class="fa fa-weixin"></i>
                                联系方式</label>
                            <div class="col-sm-7">
                                <input id="name" name="name" type="text" maxlength="32"
                                       minlength="2" class="form-control required" placeholder="请填写联系方式">
                            </div>
                            <label class="col-sm-3 control-label"><span class="red">* </span>请填写联系人联系方式</label>
                        </div>
                    </div>
                    <div class=" col-md-4">
                        <p>公司logo</p>
                        <img src="<%=basePath%>assets/global/img/loading.gif"
                             style="display: block;width: 50%;height: 50%"/>
                        <br>
                        <button class="btn blue" type="button"><i class="fa fa-tv"></i> 本地上传</button>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <shiro:hasPermission name="account/editName">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </shiro:hasPermission>
                </div>
            </div>
        </div>
    </div>
    </div>
</form>
<script>
    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    //服务器校验
    function severCheck() {
        if (check()) {
            $("#defForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        alert("success");
                        $('#ship').click()
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
        if ($("#name").val() == "") {
            $("#name").tips({
                side: 2,
                msg: '<fmt:message key="register_username_empty"/>',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        } else {
            $("#name").val(jQuery.trim($('#name').val()));
        }
        if ($("#imo").val() == "") {
            $("#imo").tips({
                side: 2,
                msg: 'imo号不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#imo").focus();
            return false;
        } else {
            $("#imo").val(jQuery.trim($('#imo').val()));
        }
        if ($("#shipClass").val() == "") {
            $("#shipClass").tips({
                side: 2,
                msg: 'shipClass不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#shipClass").focus();
            return false;
        } else {
            $("#shipClass").val(jQuery.trim($('#shipClass').val()));
        }
        if ($("#type").val() == "") {
            $("#type").tips({
                side: 2,
                msg: 'type不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#type").focus();
            return false;
        } else {
            $("#type").val(jQuery.trim($('#type').val()));
        }
        if ($("#loa").val() == "") {
            $("#loa").tips({
                side: 2,
                msg: 'loa不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#loa").focus();
            return false;
        } else {
            $("#loa").val(jQuery.trim($('#loa').val()));
        }
        if ($("#draft").val() == "") {
            $("#draft").tips({
                side: 2,
                msg: 'draft不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#draft").focus();
            return false;
        } else {
            $("#draft").val(jQuery.trim($('#draft').val()));
        }
        if ($("#beam").val() == "") {
            $("#beam").tips({
                side: 2,
                msg: 'beam不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#beam").focus();
            return false;
        } else {
            $("#beam").val(jQuery.trim($('#beam').val()));
        }
        return true;
    }

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });


</script>
