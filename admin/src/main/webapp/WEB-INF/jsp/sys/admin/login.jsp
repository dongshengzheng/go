<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="global" value="http://windyeel.oss-cn-shanghai.aliyuncs.com/global"/>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8" />
    <title>每石文化管理后台登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <base href="<%=basePath%>">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <link href="${global}/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${global}/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="${global}/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/css/login.min.css" rel="stylesheet" type="text/css" />

    <!-- Bootstrap 3.3.4 -->
    <script src="${global}/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/js/jquery.cookie.js"></script>
    <script src="${ctx}/static/js/jquery.tips.js"></script>
    <link rel="shortcut icon" href="${ctx}/favicon.ico" />
<body class=" login">
<div class="logo">
    <a href="index.html"></a>
</div>
<div class="content">
    <form role="form" method="post" action="" name="loginForm"
          id="loginForm">
        <h3 class="form-title"><fmt:message key="sys.user.plogin"/></h3>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">用户名</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="请输入用户名" name="loginName" id="loginName" /> </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="请输入密码" name="password" id="password" /> </div>
        </div>
        <div class="form-group">
            <input class="form-control" placeholder="验证码" type="text"
                   id="code" name="code" style="width: 30%; float: left;">
            <img id="codeImg" alt="点击更换" title="点击更换"
                 style="width: 40%; height: 34px; margin-left: 12px;" src="">
        </div>
        <div class="form-actions">
            <button onclick="severCheck();" type="button" class="btn green">
                <fmt:message key="sys.user.login"/> </button>
        </div>
    </form>


</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright"> 2016 &copy; <a href="http://www.mschuangyi.com/">每石文化</a> 版权保留. </div>

<script src="${global}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${global}/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
</body>
<script type="text/javascript">
    //服务器校验
    function severCheck() {
        if (check()) {

            var loginName = $("#loginName").val();
            var password = $("#password").val();
            var code = "ksbadmtn1f2izwqy" + loginName + ",00," + password
                    + "ipvb5cxat0zn9eg7" + ",00," + $("#code").val();
            $.ajax({
                type: "POST",
                url: 'login_login',
                data: {
                    keyData: code,
                    tm: new Date().getTime()
                },
                dataType: 'json',
                cache: false,
                success: function (data) {

                    console.log(data);

                    if ("success" == data.result) {
                        saveCookie();
                        window.location.href = "<%=basePath%>";
                    } else if ("usererror" == data.result) {
                        $("#loginName").tips({
                            side: 1,
                            msg: "用户名或密码有误",
                            bg: '#FF5080',
                            time: 15
                        });
                        $("#loginName").focus();
                    } else if ("codeerror" == data.result) {
                        $("#code").tips({
                            side: 1,
                            msg: "验证码输入有误",
                            bg: '#FF5080',
                            time: 15
                        });
                        changeCode();
                        $("#code").focus();
                    } else {
                        $("#loginName").tips({
                            side: 1,
                            msg: "缺少参数",
                            bg: '#FF5080',
                            time: 15
                        });
                        $("#loginName").focus();
                    }
                }
            });
        }
    }

    $(document).ready(function () {
        changeCode();
        $("#codeImg").bind("click", changeCode);

        // init background slide images
        $.backstretch([
                "${ctx}/assets/layouts/layout/img/bg/6.jpg",
                "${ctx}/assets/layouts/layout/img/bg/1.jpg",
                "${ctx}/assets/layouts/layout/img/bg/4.jpg",
                "${ctx}/assets/layouts/layout/img/bg/5.jpg"

            ], {
                fade: 1000,
                duration: 8000
            }
        );

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
                msg: '用户名不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#loginName").focus();
            return false;
        } else {
            $("#loginName").val(jQuery.trim($('#loginName').val()));
        }

        if ($("#password").val() == "") {

            $("#password").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#password").focus();
            return false;
        }
        if ($("#code").val() == "") {

            $("#code").tips({
                side: 1,
                msg: '验证码不得为空',
                bg: '#AE81FF',
                time: 3
            });

            $("#code").focus();
            return false;
        }

        $("#loginbox").tips({
            side: 1,
            msg: '正在登录 , 请稍后 ...',
            bg: '#68B500',
            time: 10
        });

        return true;
    }

    function savePaw() {
        if (!$("#saveid").attr("checked")) {
            $.cookie('loginName', $("#loginName").val(), {
                expires: -1
            });
            $.cookie('password', $("#password").val(), {
                expires: -1
            });
            //$("#loginName").val('');
            //$("#password").val('');
        }
    }

    function saveCookie() {
        if ($("#saveid").attr("checked")) {
            $.cookie('loginName', $("#loginName").val(), {
                expires: 7
            });
            $.cookie('password', $("#password").val(), {
                expires: 7
            });
        }
    }
    function quxiao() {
        $("#loginName").val('');
        $("#password").val('');
    }

    jQuery(function () {
        var loginName = $.cookie('loginName');
        var password = $.cookie('password');
        if (typeof (loginName) != "undefined"
                && typeof (password) != "undefined") {
            $("#loginName").val(loginName);
            $("#password").val(password);
            $("#saveid").attr("checked", true);
            $("#code").focus();
        }
    });
</script>
<script>
    //TOCMAT重启之后 点击左侧列表跳转登录首页
    if (window != top) {
        top.location.href = location.href;
    }
</script>
</html>