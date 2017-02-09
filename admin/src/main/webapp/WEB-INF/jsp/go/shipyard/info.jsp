<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="yard"></go:navigater>
<style>
    .col-sm-6 ,.col-sm-12{
        padding-left: 0px;
        font-size: 10px;
    }
    .form-group{
        margin-bottom: 0px;
    }
    .dock{
        background-color: #9adad6;
    }
    table th,td{ text-align:center}
</style>
<div><img src="/img/top.png"/><span>查看船厂信息</span></div>
<div style="border-bottom:solid 2px #337ab7; height:1px;margin-top: 10px"></div>
<div style="margin-bottom: 30px;margin-top: 3px">
    <div style="display:inline-block;width: 35%;margin-right: 10px">
        <img style="width:100%; height: 200px" src="/img/ship.jpg">
    </div>
    <div style="display:inline-block;width: 55%;margin-top: -1px">
        <p style="margin: 0px">中原（广东）建造有限公司</p>
        <p style="font-size: 12px">“中远（大连）造船厂是中远船务集团的核心子企业。它的主要业务是船舶与海洋工程修
            理、转换和和新的建筑。船厂有一个面积120000平方米，总用地3200米以上的深水泊位3个码头、8
            码头修船，2门式起重机（200吨），1门式起重机（400吨）和各种设施，期间近年来，中远（
            大连）造船厂做了一个修船到船舶和海上修理、转换
        </p>
        <div class="timeline-body-content">
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label" style="padding-left: 0px;">短名称：大连远洋运输公司</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label" style="padding-left: 0px;">集团公司：中远</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">国家：中国</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">区域：中国北方</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">位置：大连，辽宁省</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">地址：80，中远里，大连，辽宁省</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">经度：121°41′19″E</label>

                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">纬度：39°0′26″N</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">电话：(86)-21-58600111</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">电子邮件：cosco-shipyard.com BIS</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">网站：http://www.cosic.com.cn</label>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin: 0 auto;width:250px;">
    <ul class="nav nav-pills" style="margin-bottom: 0px">
        <li class="active">
            <a href="#tab11" data-toggle="tab">一般信息</a>
        </li>
        <li>
            <a href="#tab12" data-toggle="tab">设备信息</a>
        </li>
    </ul>
</div>

<div  style="border-bottom:solid 2px #337ab7; height:1px;"></div>
<div class="portlet light bordered" style="padding: 0px;">
    <div class="portlet-body">
        <div class="tabbable tabbable-tabdrop">
            <div class="tab-content">
                <div class="tab-pane active" id="tab11">
                    <p>中原（广东）建造有限公司Ltd</p>
                </div>
                <div class="tab-pane" id="tab12">
                    <div class="portlet-body">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab_1_1" data-toggle="tab"> 码头信息 </a>
                            </li>
                            <li>
                                <a href="#tab_1_2" data-toggle="tab"> 泊位信息 </a>
                            </li>
                            <li>
                                <a href="#tab_1_3" data-toggle="tab"> 设施信息 </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tab_1_1">
                                <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <table class="table table-hover">
                                            <thead class="dock">
                                            <tr >
                                                <th rowspan="2"> 序号 </th>
                                                <th rowspan="2"> 类型 </th>
                                                <th rowspan="2"> 姓名 </th>
                                                <th rowspan="2"> 能力（T） </th>
                                                <th rowspan="2"> 提升能力 </th>
                                                <th colspan="3"> 维</th>
                                                <th rowspan="2"> 起重机 </th>
                                                <th rowspan="2"> 备注 </th>

                                            </tr>
                                            <tr>
                                                <th>长度（m）</th>
                                                <th>宽度（m）</th>
                                                <th>草案（m）</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td> 1 </td>
                                                <td> 浮船坞 </td>
                                                <td> 大连 </td>
                                                <td> 300000 </td>
                                                <td></td>
                                                <td>360</td>
                                                <td>66</td>
                                                <td>27</td>
                                                <td>20Tx39Mx1,30Tx39Mx1</td>
                                                <td></td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_1_2">
                                <div class="portlet-body">
                                    <div class="table-scrollable">
                                        <table class="table table-hover">
                                            <thead class="dock">
                                            <tr >
                                                <th > 序号 </th>
                                                <th > 总长（m） </th>
                                                <th > 草案（m） </th>
                                                <th > 能力（T） </th>
                                                <th > 起重机 </th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td> 1 </td>
                                                <td> 240 </td>
                                                <td> 0 </td>
                                                <td> 100000 </td>
                                                <td>20Tx39Mx1,30Tx39Mx1</td>
                                            </tr>
                                            <tr>
                                                <td> 2 </td>
                                                <td> 240 </td>
                                                <td> 0 </td>
                                                <td> 100000 </td>
                                                <td>20Tx39Mx1,30Tx39Mx1</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_1_3">
                                <div >
                                    <center class="dock">起重机信息</center>
                                    <div class="portlet-body" style="padding: 0px">
                                    <div class="table-scrollable">
                                        <table class="table table-hover">
                                            <thead >
                                            <tr >
                                                <th > 序号 </th>
                                                <th > 类型 </th>
                                                <th > 能力（T） </th>
                                                <th > 单元 </th>
                                                <th > 备注 </th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td> 1 </td>
                                                <td> 门式起重机 </td>
                                                <td> 200 </td>
                                                <td> 3 </td>
                                                <td>在车间</td>
                                            </tr>
                                            <tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                </div>
                                <div >
                                    <center class="dock">拖船信息</center>
                                    <div class="portlet-body" style="padding: 0px">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead >
                                                <tr >
                                                    <th > 序号 </th>
                                                    <th > 类型 </th>
                                                    <th > 能力（T） </th>
                                                    <th > 单元 </th>
                                                    <th > 备注 </th>

                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td> 1 </td>
                                                    <td> 门式起重机 </td>
                                                    <td> 200 </td>
                                                    <td> 3 </td>
                                                    <td>在车间</td>
                                                </tr>
                                                <tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div >
                                    <center class="dock">其他信息</center>
                                    <div class="portlet-body" style="padding: 0px">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <tbody>
                                                <tr>
                                                    <td> 格构斜臂式起重机 </td>
                                                    <td> 40台 </td>
                                                </tr>
                                                <tr>
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
    </div>
</div>