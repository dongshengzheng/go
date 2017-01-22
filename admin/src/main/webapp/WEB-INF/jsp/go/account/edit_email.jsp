<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form class="form-horizontal" action="account/editEmail" method="post"
      id="defForm">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>修改电子邮箱</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <div class="form-group">
                <label for="email" class="col-sm-3 control-label">新电子邮箱</label>
                <div class="col-sm-6">
                    <input id="email" name="email" type="email" maxlength="32" class="form-control required"
                           placeholder="请输入邮箱地址">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-3 control-label">验证码</label>
                <div class="col-sm-6">
                    <input class="form-control required" placeholder="<fmt:message key="login_verify_code"/>"
                           type="text"
                           id="code" name="code" style="width: 30%; float: left;margin-right: 2%">
                    <button type="button" onclick="sendCode()" class="btn blue-dark"> 发送验证码
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="account/editEmail">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>
<script type="text/javascript">
    $('#defForm').validate({
        rules: {
            required: true,
            remote: {
                type: "post",
                url: "account/editEmail",
                dataType: "json",
                dataFilter: function (data, type) {
                    if (data == 1) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }
        },
        messages: {
            email: {
                required: "请输入邮箱",
                remote: "该邮箱已被使用",
                email: "邮箱格式错误"
            },
            code: {
                required: "请输入验证码",
                remote: "验证码错误"
            }
        }
    });


    function sendCode() {
        $.post("account/editEmail/sendCode", {email: $('#email').val()}, function (data) {
            if (data.suc) {
                alert("验证码已发送,请前往邮箱接受");
            } else {
                if (data.errInfo == "email used") {
                    alert("邮箱已被使用");
                } else if (data.errInfo == "email empty") {
                    alert("邮箱不能为空");
                }
            }
        });
    }

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });

</script>