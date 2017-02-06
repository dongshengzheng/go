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
<form class="form-horizontal" action="account/editStyle" method="post"
      id="defForm">
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
            <c:forEach items="${styleList}" var="style">
                <a href="javascript:;" data-id="${style.id}" class="btn btn-lg ${style.color}">${style.des}</a>
            </c:forEach>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <input type="hidden" value="" id="oldStyle">
        <shiro:hasPermission name="account/editStyle">
            <input type="hidden" value="0" name="styleId" id="styleId">
            <button type="submit" class="btn btn-primary">保存</button>
        </shiro:hasPermission>
    </div>
</form>

<script>
    $(document).ready(function () {
        $('#oldStyle').val($('#style_color').attr('href'));
    })
    $('.btn-default').on('click', function () {
        $('#style_color').attr('href', $('#oldStyle').val());
    })


    $('.btn-lg').on('click', function () {
        $('#styleId').val($(this).attr('data-id'));
        $('#style_color').attr('href', " ${ctx}/assets/layouts/layout/css/themes/" + $(this).html() + ".min.css");
    })

    $('#defForm').validate({
        rules: {
            remote: {
                type: "post",
                url: "account/editStyle",
                dataType: "json",
            }
        }
    });
</script>