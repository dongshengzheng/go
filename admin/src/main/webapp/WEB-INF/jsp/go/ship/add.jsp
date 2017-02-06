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
</style>
<go:navigater path="ship"></go:navigater>
<form class="form-horizontal" action="ship/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title tabbable-line">
                    <div class="caption caption-md">
                        <i class="icon-microphone font-green"></i>
                        <span class="caption-subject bold font-green uppercase"> 新增船舶信息</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <div class="timeline">
                        <div class="timeline-item">
                            <div class="timeline-badge">
                                <div class="timeline-icon" style="">
                                    概要信息
                                </div>
                            </div>
                            <div class="timeline-body">
                                <div class="timeline-body-arrow"></div>
                                <div class="timeline-body-content">
                                    <div class="form-group col-md-6">
                                        <label for="name" class="col-sm-3 control-label">船舶名称</label>
                                        <div class="col-sm-7">
                                            <input id="name" name="name" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请填写船舶名称">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="name" class="col-sm-3 control-label">建造船厂</label>
                                        <div class="col-sm-7">
                                            <input id="" name="name" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请填写建造船厂">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="name" class="col-sm-3 control-label">IMO</label>
                                        <div class="col-sm-7">
                                            <input id="" name="name" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请填写船舶国际海事组织标识码IMO">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="buildeYear" class="col-sm-3 control-label">建造日期</label>
                                        <div class="col-sm-7">
                                            <input id="buildeYear" name="buildeYear" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请填写建造日期">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="shipClass" class="col-sm-3 control-label">船级社</label>
                                        <div class="col-sm-7">
                                            <input id="shipClass" name="shipClass" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请选择船级社">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="name" class="col-sm-3 control-label">船舶呼号</label>
                                        <div class="col-sm-7">
                                            <input id="" name="name" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请填写船舶呼号">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="name" class="col-sm-3 control-label">船舶类型</label>
                                        <div class="col-sm-7">
                                            <input id="" name="name" type="text" maxlength="32"
                                                   minlength="2" class="form-control required"
                                                   placeholder="请选择船舶类型">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-badge">
                                    <div class="timeline-icon">
                                        船体信息
                                    </div>
                                </div>
                                <div class="timeline-body">
                                    <div class="timeline-body-arrow"></div>
                                    <div class="timeline-body-content">
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">船长</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写船长姓名">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">吃水</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写吃水深度">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">船宽</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写船宽长度">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">载重吨</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写载重吨">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">型深</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写型深">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">总吨</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写总吨">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-badge">
                                    <div class="timeline-icon">
                                        动力设备
                                    </div>
                                </div>
                                <div class="timeline-body">
                                    <div class="timeline-body-arrow"></div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <span class="timeline-body-alerttitle font-green-haze">主机</span>
                                        </div>
                                    </div>
                                    <div class="timeline-body-content">
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">厂家</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写厂家名称">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">型号</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写型号">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">马力/转速</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写马力/转速">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">数量</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写数量">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">缸径</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写缸径">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="timeline-body">
                                    <div class="timeline-body-arrow"></div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <span class="timeline-body-alerttitle font-green-haze">辅机</span>
                                        </div>
                                    </div>
                                    <div class="timeline-body-content">
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">厂家</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写厂家名称">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">型号</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写型号">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">额定功率</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写额定功率">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">数量</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写数量">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">缸径</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写缸径">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="timeline-body">
                                    <div class="timeline-body-arrow"></div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <span class="timeline-body-alerttitle font-green-haze">锅炉</span>
                                        </div>
                                    </div>
                                    <div class="timeline-body-content">
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">厂家</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写厂家名称">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">型号</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写型号">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">工作压力</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写工作压力">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">数量</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写数量">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">热交换面积</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写热交换面积">
                                            </div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="name" class="col-sm-3 control-label">蒸发量</label>
                                            <div class="col-sm-7">
                                                <input id="" name="name" type="text" maxlength="32"
                                                       minlength="2" class="form-control required"
                                                       placeholder="请填写蒸发量">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-item">
                                <div class="timeline-badge">
                                    <div class="timeline-icon">
                                        完成
                                    </div>
                                </div>
                                <div class="timeline-body">
                                    <div class="timeline-body-arrow"></div>
                                    <div class="timeline-body-head">
                                        <div class="timeline-body-head-caption">
                                            <shiro:hasPermission name="ship/add">
                                                <button type="submit" class="btn btn-primary">提交</button>
                                            </shiro:hasPermission>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- END CONTENT BODY -->
    </div>
    <!-- END CONTENT -->
    <!-- BEGIN QUICK SIDEBAR -->
</form>