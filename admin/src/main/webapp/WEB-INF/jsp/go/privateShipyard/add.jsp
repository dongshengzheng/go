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
    .col-sm-6{
        width: 60%;
    }
    .col-sm-2 {
        width: 39%;
    }
    .col-md-4 {
        width: 70%;
    }
    .red{
        color: red;
    }

</style>
<go:navigater path="privateShipyard"></go:navigater>
<form action="privateShipyard/add" id="defForm" class="form-horizontal" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title tabbable-line">
                    <div id="bootstrap_alerts_demo"></div>
                    <div class="caption caption-md">
                        <div style="display: inline-block">
                            <i class="icon-microphone font-green"></i>
                            <span class="caption-subject bold font-green uppercase"> <fmt:message key="shipyard_add_info"/></span><%--新增船厂信息--%>
                        </div>
                    </div>
                </div>
                <div class="form-body">
                    <div class="col-sm-6">
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_name"/> <%--船厂名称--%>
                                <span class="red"> * </span>
                            </label>
                            <div class="col-md-4">
                                <input id="name" type="text" name="name" data-required="1" class="form-control" /> </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_group"/> <%--集团公司--%>
                                <span class="red">  </span>
                            </label>
                            <div class="col-md-4">
                                <input name="groupCompany" type="text" class="form-control" /> </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_nation"/> <%--国家--%>
                                <span class="red">  </span>
                            </label>
                            <div class="col-md-4">
                                <input name="country" type="text" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_city"/> <%--城市--%>
                                <span class="red">  </span>
                            </label>
                            <div class="col-md-4">
                                <input name="city" type="text" class="form-control" /> </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_location"/> <%--位置--%>
                                <span class="red">  </span>
                            </label>
                            <div class="col-md-4">
                                <input name="location" type="text" class="form-control" /> </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_contact_phone"/> <%--联系电话--%>
                                <span class="red">  </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-phone"></i>
                                    </span>
                                    <input id="tel" name="tel" type="text" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_pic"/> <%--联系人--%>
                                <span class="red">   </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-user"></i>
                                    </span>
                                    <input id="contactName" name="contactName" type="text" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3"><fmt:message key="shipyard_email"/> <%--邮箱--%>
                                <span class="red">   </span>
                            </label>
                            <div class="col-md-4">
                                <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="fa fa-envelope"></i>
                                    </span>
                                    <input id="email" type="text" class="form-control" name="email" placeholder="Email Address"/> </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2" >
                    <p><fmt:message key="shipyard_logo"/> <%--公司logo--%></p>
                    <img id="logo-img"
                         src="http://shipinfo.img-cn-shanghai.aliyuncs.com/${shipyard.logo}?x-oss-process=image/resize,m_fill,h_100,w_100"
                         style="display: block;width: 50%;height: 50%"
                         onerror="nofind(1)"/>
                    <input type="hidden" id="logo" name="logo" >
                    <br>
                    <button id="upload_logo" class="btn blue" type="button"><i class="fa fa-tv"></i> <fmt:message key="shipyard_local_upload"/> <%--本地上传--%></button>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="button" class="btn green" onclick="severCheck()"><fmt:message key="go_submit"/> <%--提交--%></button>
                            <input  type="reset" class="btn btn-default" value="<fmt:message key='go_reset'/> "/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<a id="shipyard" href="privateShipyard" class="btn btn-sm grey-mint" data-target="navTab" style="display: none"></a>
<script>
    $('.date-picker').datepicker({autoclose: true, todayHighlight: true, format: 'yyyy-mm-dd'});

    initUploaders_logo("upload_logo", "shipinfo", "${staticPath}/", "logo-img", "logo");

    //服务器校验
    function severCheck() {
        if (check()) {
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
    }

    //客户端校验
    function check() {
        if ($("#name").val() == "") {
            $("#name").tips({
                side: 2,
                msg: '<fmt:message key='shipyard_name_empty'/> ',/*船厂名称不能为空*/
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        } else {
            $("#name").val(jQuery.trim($('#name').val()));
        }
        /*if ($("#tel").val() == "") {
            $("#tel").tips({
                side: 2,
                msg: '联系电话不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#tel").focus();
            return false;
        } else {
            $("#tel").val(jQuery.trim($('#tel').val()));
        }
        if ($("#contactName").val() == "") {
            $("#contactName").tips({
                side: 2,
                msg: '联系人不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#contactName").focus();
            return false;
        } else {
            $("#contactName").val(jQuery.trim($('#contactName').val()));
        }
        if ($("#email").val() == "") {
            $("#email").tips({
                side: 2,
                msg: 'contactName不能为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#email").focus();
            return false;
        } else {
            $("#email").val(jQuery.trim($('#email').val()));
        }*/
        return true;
    }

    $(document).keyup(function (event) {
        if (event.keyCode == 13) {
            $("#to-recover").trigger("click");
        }
    });


</script>
