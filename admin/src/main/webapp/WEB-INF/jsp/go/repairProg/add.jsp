<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .red {
        color: red;
    }

    .portlet.box > .portlet-title > .tools > a.collapse {
        background-image: url(<%=basePath%>assets/global/img/portlet-collapse-icon.png);
    }

    .details-control {
        cursor: pointer;
    }


</style>
<go:navigater path="account"></go:navigater>
<form class="form-horizontal" action="ship/add" method="post"
      id="defForm" callfn="refreshTable">
    <div class="profile-content">
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered">
                    <div class="portlet-title tabbable-line">
                        <div class="caption caption-md">
                            <i class="fa fa-user"></i>
                            <span class="caption-subject font-blue-madison bold uppercase"> 新增维修工程单</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-info"></i>工程单概要
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="shipName" class="col-sm-3 control-label">
                                            船舶名称</label>
                                        <div class="col-sm-7">
                                            <input id="shipName" name="shipName" type="text" maxlength="32"
                                                   value=""
                                                   minlength="2" class="form-control required" placeholder="请选择船舶">
                                        </div>
                                        <label class="col-sm-1 control-label"><span class="red">* </span></label>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="sStartDate" class="col-sm-3 control-label">计划进场日期</label>
                                        <div class="col-sm-7">
                                            <div class="input-group">
                                                <input id="sStartDate" name="sStartDate" type="text"
                                                       class="form-control date-picker"
                                                       placeholder="请选择进厂日期">
                                                <span class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="sDays" class="col-sm-3 control-label">
                                            预估天数</label>
                                        <div class="col-sm-7">
                                            <input id="sDays" name="sDays" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修天数">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="sCost" class="col-sm-3 control-label">
                                            预估金额</label>
                                        <div class="col-sm-7">
                                            <input id="sCost" name="sCost" type="text" maxlength="32"
                                                   minlength="2" class="form-control required" placeholder="请输入预估维修金额">
                                        </div>
                                        <label class="col-sm-2 control-label"
                                               style="padding-left: 5px;padding-right: 5px">
                                            (单位:万元)</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="col-sm-3 control-label">
                                            维修类型</label>
                                        <div class="col-sm-9 icheck-inline">
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option1" checked> 临时维修
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option2"> 坞检
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option1"> 特检
                                                <span></span>
                                            </label>
                                            <label>
                                                <input type="radio" name="type"
                                                       value="option2"> 改造
                                                <span></span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="portlet box blue-dark">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="fa fa-cog"></i>维修工程详细
                                </div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"> </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <div class="portlet box blue-dark">
                                    <div class="portlet-title" style="background-color: #00aaaa">
                                        <div class="caption">
                                            <i class="fa fa-cog"></i>通用服务
                                        </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                               id="default_table2">
                                            <thead>
                                            <tr>
                                                <th>&nbsp;</th>
                                                <th>项目号</th>
                                                <th>维修内容</th>
                                                <th>单位</th>
                                                <th>数量</th>
                                                <th>备注</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.1</td>
                                                <td>码头费</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2</td>
                                                <td>供电费</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>
                                                    <img src="<%=basePath%>static/img/details_open.png" class="details-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2.1</td>
                                                <td>接拆电缆</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2.2</td>
                                                <td>租用频率转换器</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="portlet box blue-dark">
                                    <div class="portlet-title" style="background-color: #00aaaa">
                                        <div class="caption">
                                            <i class="fa fa-cog"></i>通用服务
                                        </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse"> </a>
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                                               id="default_table">
                                            <thead>
                                            <tr>
                                                <th>&nbsp;</th>
                                                <th>项目号</th>
                                                <th>维修内容</th>
                                                <th>单位</th>
                                                <th>数量</th>
                                                <th>备注</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.1</td>
                                                <td>码头费</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2</td>
                                                <td>供电费</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>
                                                    <img src="<%=basePath%>static/img/details_open.png" class="details-control">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2.1</td>
                                                <td>接拆电缆</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>1.2.2</td>
                                                <td>租用频率转换器</td>
                                                <td>天</td>
                                                <td>20</td>
                                                <td>备注</td>
                                                <td>操作</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
<script>

</script>