<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .btn-lg {
        text-align: center;
        width: 200px;
        margin-right: 1%;
        margin-bottom: 3%;
    }
</style>
<form class="form-horizontal" action="account/editEmail" method="post"
      id="defForm" callfn="refreshTable">
    <div class="modal-header">
        <div class='bootstrap-dialog-header'>
            <div class='bootstrap-dialog-close-button'
                 style='display: block;'>
                <button class='close' data-dismiss='modal' aria-label='Close'>×</button>
            </div>
            <div class='bootstrap-dialog-title'>修改系统样式</div>
        </div>
    </div>
    <div class="modal-body">
        <div class="container-fluid">
            <a href="javascript:;" class="btn btn-lg default">default</a>
            <a href="javascript:;" class="btn btn-lg default">default-rtl</a>
            <a href="javascript:;" class="btn btn-lg blue">blue</a>
            <a href="javascript:;" class="btn btn-lg blue">blue-rtl</a>
            <a href="javascript:;" class="btn btn-lg green-steel">darkblue</a>
            <a href="javascript:;" class="btn btn-lg green-soft">darkblue-rtl</a>
            <a href="javascript:;" class="btn btn-lg red-pink">grey</a>
            <a href="javascript:;" class="btn btn-lg yellow">light</a>
            <a href="javascript:;" class="btn btn-lg purple">light2</a>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <shiro:hasPermission name="account/editEmail">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>

<script>
    $('.btn-lg').on('click', function () {
        $('#style_color').attr('href', "${ctx}/assets/layouts/layout/css/themes/" + $(this).html() + ".min.css");
    })
</script>