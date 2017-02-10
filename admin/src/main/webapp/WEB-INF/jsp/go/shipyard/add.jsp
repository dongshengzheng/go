<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="shipyard"></go:navigater>
<form action="#" id="form_sample_1" class="form-horizontal">
    <div class="form-body">
        <div class="form-group">
            <label class="control-label col-md-3">Name
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input type="text" name="name" data-required="1" class="form-control" /> </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Email
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input name="email" type="text" class="form-control" /> </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">URL
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input name="url" type="text" class="form-control" />
                <span class="help-block"> e.g: http://www.demo.com or http://demo.com </span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Number
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input name="number" type="text" class="form-control" /> </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Digits
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input name="digits" type="text" class="form-control" /> </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Credit Card
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <input name="creditcard" type="text" class="form-control" />
                <span class="help-block"> e.g: 5500 0000 0000 0004 </span>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-3">Occupation&nbsp;&nbsp;</label>
            <div class="col-md-4">
                <input name="occupation" type="text" class="form-control" />
                <span class="help-block"> optional field </span>
            </div>
        </div>


        <div class="form-group">
            <label class="control-label col-md-3">Input Group
                <span class="required"> * </span>
            </label>
            <div class="col-md-4">
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="fa fa-envelope"></i>
                    </span>
                    <input type="text" class="form-control" name="input_group" placeholder="Email Address"> </div>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="submit" class="btn green">Submit</button>
                <button type="button" class="btn grey-salsa btn-outline">Cancel</button>
            </div>
        </div>
    </div>
</form>