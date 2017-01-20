<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-horizontal" action="account/editPassword" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>修改密码</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <label for="oldPwd" class="col-sm-2 control-label">原密码</label>
                <div class="col-sm-7">
                    <input id="oldPwd" name="oldPwd" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输原密码">
                </div>
            </div>
            <div class="form-group">
                <label for="newPwd" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-7">
                    <input id="newPwd" name="newPwd" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请输入新密码">
                </div>
            </div>
            <div class="form-group">
                <label for="newPwdCon" class="col-sm-2 control-label">新密码</label>
                <div class="col-sm-7">
                    <input id="newPwdCon" name="newPwdCon" type="text" maxlength="32"
                           minlength="2" class="form-control required" placeholder="请确认新密码">
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="account/editPassword">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $('#defForm').validate({
        rules: {
            loginName: {
                required: true,
                remote: {
                    type: "post",
                    url: "account/editPassword",
                    dataType: "json",
                    dataFilter: function (data, type) {
                        if (data == 1) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                }
            }
        },
        messages: {
            loginName: {
                required: "请输入用户名",
                remote: "用户名重复"
            }
        }
    });


    $(document).ready(function () {
        changeCode();
        $("#codeImg").bind("click", changeCode);
    });

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function changeCode() {
        $("#codeImg").attr("src", "code?t=" + genTimestamp());
    }

    //客户端校验
    function check() {

        if ($("#loginName").val() == "") {

            $("#loginName").tips({
                side: 2,
                msg: '<fmt:message key="login_username_empty"/>',
                bg: '#AE81FF',
                time: 3
            });

            $("#loginName").focus();
            return false;
        } else {
            $("#loginName").val(jQuery.trim($('#loginName').val()));
        }

        if ($("#code").val() == "") {

            $("#code").tips({
                side: 1,
                msg: '<fmt:message key="login_verifycode_empty"/>',
                bg: '#AE81FF',
                time: 3
            });

            $("#code").focus();
            return false;
        }

        $("#loginbox").tips({
            side: 1,
            msg: '<fmt:message key="login_tuning"/>',
            bg: '#68B500',
            time: 10
        });

        return true;
    }


</script>