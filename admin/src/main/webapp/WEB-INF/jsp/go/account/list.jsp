<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="account"></go:navigater>
<shiro:hasPermission name="account/editName">
    <button data-url="account/editName" data-model="dialog" class="btn btn-outline btn-circle btn-sm green"> 修改个人姓名
    </button>
</shiro:hasPermission>

<button type="button" id="changeStyle">点击修改样式</button>
<script>
    $('#changeStyle').on('click', function () {
        console.log($('#style_color').attr('href'));
        $('#style_color').attr('href', "${ctx}/assets/layouts/layout/css/themes/default.min.css");
        console.log($('#style_color').attr('href'));
    })
</script>