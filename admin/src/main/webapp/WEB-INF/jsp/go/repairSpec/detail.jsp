<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .col-md-3{
        margin-bottom: 5px;
    }
    .col-md-6{
        padding-left: 0px;
    }
    .form-control{
        height: 28px;
        margin-top: 5px;
        width:100%;
    }
    .control-label{
        margin-top:0px;
    }
    .form-horizontal .control-label{
        padding-top: 0px;
    }
    .line1{  border-bottom:solid 2px #337ab7; height:1px;margin-top: 10px  }
    .head{background-color: #C0C9CC;font-size: 20px  }
    textarea{ resize:none;
    }
    .td-text{
        height: 100%;width: 100%;
    }
    .div-left{
        margin-left: 20px
    }
    .mt-checkbox, .mt-radio{
        margin-left: 3px;
    }
    .form-horizontal .form-group{}

</style>
<go:navigater path="repairSpec"></go:navigater>
<form action="" method="post" class="form-horizontal" id="defForm">
    <div>
        <div class="line1"></div>
        <div style="height:40px;width: 100%;background-color: #C0C9CC" >
            <div class="timeline-body-content">
                <div class="form-group col-md-3">
                    <label for="name" class="col-sm-4 control-label">船名：</label>
                    <div class="col-sm-7">
                        <input id="name" name="name" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="builder" class="col-sm-6 control-label">项目分类：</label>
                    <div class="col-sm-6">
                        <input id="builder" name="builder" type="text" maxlength="32"
                               class="form-control ">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="imo" class="col-sm-6 control-label">项目号：</label>
                    <div class="col-sm-6">
                        <input id="imo" name="imo" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="shipClass" class="col-sm-6 control-label">项目单号：</label>
                    <div class="col-sm-6">
                        <input id="shipClass" name="shipClass" type="text" maxlength="32"
                               class="form-control required">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div style="margin-top: 5px;border-right: dashed 1px #337ab7;" class="col-md-8">
                <div style="width: 100%;">
                    <div ><span style="background-color: #C0C9CC;font-size: 20px">工程项目描述</span></div>
                    <div class="col-md-12 div-left">工程名称：<input type="text" name=""/></div>
                    <div class="col-md-12 div-left">工程描述： </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div ><span class="head">设备信息</span></div>
                    <div class="col-md-6">
                        <div class="form-group col-md-12">
                            <label for="name" class="col-sm-6 control-label">设备名称:</label>
                            <div class="col-sm-6">
                                <input id="ss" name="buildYear" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="builder" class="col-sm-6 control-label">设备型号:</label>
                            <div class="col-sm-6">
                                <input id="s1s" name="buildYear" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="imo" class="col-sm-6 control-label">厂家/国家:</label>
                            <div class="col-sm-6">
                                <input id="ss2" name="buildYear" type="text"
                                       class="">
                            </div>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="ss3" class="col-sm-6 control-label">序列号:</label>
                            <div class="col-sm-6">
                                <input id="ss3" name="buildYear" type="text"
                                       class="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group" style="margin-left: 20px">
                            <textarea class="form-control" rows="7" placeholder="请输入相关参数"></textarea>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div  class="form-group col-md-12"><span class="head">维修部位</span></div>
                    <div class="form-group col-md-12" style="margin-left: 3px">
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox" value="option1"> 甲板
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 机舱
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 货舱
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 泵舱
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 机舱棚
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 压载舱
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 驾驶室
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 舵机舱
                                <span></span>
                            </label>
                        </div>

                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 集控室
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 货控室
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 艏楼区域
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 罗经甲板
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 上建
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 船艉
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="mt-checkbox">
                                <input type="checkbox"  value="option1"> 其他请填
                                <span></span>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4" placeholder="请输入详细位置"></textarea>
                    </div>
                </div>
                <div class="col-md-12 line1"></div>
                <div style="width: 100%;">
                    <div class="form-group col-md-12"><span class="head">损坏程度</span></div>
                    <div class="col-md-12" style="margin-left: 20px">
                        <textarea class="form-control" rows="4"></textarea>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="margin-top: 5px;border: 1px dashed #337ab7;margin-left: 10px">
                <p>插入图片或图纸</p>
                <img id="logo-img"
                     src="http://windyeel.img-cn-shanghai.aliyuncs.com/${company.logo}?x-oss-process=image/resize,m_fill,h_100,w_100"
                     style="display: block;width: 50%;height: 50%"
                     onerror="nofind(1)"/>
                <input type="hidden" id="logo" name="logo" value="${company.logo}">
                <br>
                <button id="upload_logo" class="btn blue" type="button"><i class="fa fa-tv"></i> 本地上传</button>
            </div>

        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">请求材料规格</span></div>
            <div class="col-md-12 div-left">
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                   id="default_table" style="width: 98%" >
                <thead>
                <tr style="background-color: #8CD2E5">
                    <th style="width: 70%">要求和描述/材料规格</th>
                    <th style="width: 6%">单位</th>
                    <th style="width: 6%">数量</th>
                    <th style="width: 5%"><button  type="button" onclick="addTr()" class="btn green">添加一行</button></th>
                </tr>
                </thead>
                <tbody id="table-tbody">
                    <tr id="td-oneline">
                        <td><input type="text" class="td-text"></td>
                        <td><input type="text" class="td-text"></td>
                        <td><input type="text" class="td-text"></td>
                        <td><button type="button" onclick="delTr(this)" class="btn red">删除</button></td>
                    </tr>

                </tbody>
            </table>
            </div>
        </div>
        <div class="col-md-12 line1"></div>
        <div style="width: 100%;margin-top: 10px">
            <div ><span class="head">修理工艺</span></div>
            <div class="col-md-12 div-left">
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 动火
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 脚手架
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 吊车运输
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 功能测试
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 化学清洗
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 船厂提供螺栓螺母及垫片等材料
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 补漆
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 提供照明
                        <span></span>
                    </label>
                </div>

                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 清舱除气
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 拆装花钢板地格栅
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 布置安全通道
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 需船厂提供维修场地
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 清洁
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 提供通风
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 压力测试
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 拆装栏杆等铁舾件
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 船东提供材料
                        <span></span>
                    </label>
                </div>
                <div class="form-group col-md-3">
                    <label class="mt-checkbox">
                        <input type="checkbox"  value="option1"> 其它请填
                        <span></span>
                    </label>
                </div>
            </div>
            <div class="col-md-12 div-left"">
                <textarea class="form-control" rows="4" placeholder="请填写修理工艺"></textarea>
            </div>
        </div>
    </div>

    <div class="form-actions" >
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green">保存</button>
                <button type="button" class="btn blue">提交</button>
                <button type="button" class="btn red">删除</button>
                <button type="button" class="btn default">重置</button>
                <button type="button" class="btn green">保存为工程单范本</button>
            </div>
        </div>
    </div>
</form>

<script>
    function delTr(obj) { //删除行  
        $(obj).parent().parent().remove();
    }

    function addTr() {  //增加行
        if($("table tbody tr:visible").length==0){
            $("#default_table tbody").append('<tr>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><button type="button" onclick="delTr(this)" class="btn red">删除</button></td>' +
                    '</tr>');
        }else {
            $("#default_table tbody tr:last").after('<tr>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><input type="text" class="td-text"></td>' +
                    '<td><button type="button" onclick="delTr(this)" class="btn red">删除</button></td>' +
                    '</tr>');
        }
    }
</script>