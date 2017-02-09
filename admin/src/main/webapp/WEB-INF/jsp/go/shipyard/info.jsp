<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    .dataTables_length{
        display: none;
    }
    #wharfDetail_paginate,#berthDetail_paginate{
        display: none;
    }
</style>
<div><img src="/img/top.png"/><span>查看船厂信息</span></div>
<div style="border-bottom:solid 2px #337ab7; height:1px;margin-top: 10px"></div>
<div style="margin-bottom: 30px;margin-top: 3px">
    <div style="display:inline-block;width: 35%;margin-right: 10px">
        <img style="width:100%; height: 200px" src="/img/ship.jpg">
    </div>
    <div style="display:inline-block;width: 55%;margin-top: -1px">
        <p style="margin: 0px">${shipyard.name}</p>
        <p style="font-size: 12px">“中远（大连）造船厂是中远船务集团的核心子企业。它的主要业务是船舶与海洋工程修
            理、转换和和新的建筑。船厂有一个面积120000平方米，总用地3200米以上的深水泊位3个码头、8
            码头修船，2门式起重机（200吨），1门式起重机（400吨）和各种设施，期间近年来，中远（
            大连）造船厂做了一个修船到船舶和海上修理、转换
        </p>
        <div class="timeline-body-content">
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label" style="padding-left: 0px;">短名称：${shipyard.shortName}</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label" style="padding-left: 0px;">集团公司：${shipyard.groupCompany}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">国家：${shipyard.country}</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">区域：${shipyard.area}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">位置：${shipyard.location}</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">地址：${shipyard.address}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">经度：${shipyard.longitude}</label>

                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">纬度：${shipyard.latitude}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">电话：${shipyard.tel}</label>
                </div>
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">电子邮件：${shipyard.email}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label  class="col-sm-12 control-label">网站：${shipyard.website}</label>
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
                    <div style="text-align:center">装换项目</div>
                    <div style="float: left;width: 33%">
                        <div class="portlet-body">
                            <center class="dock">convemsion项目</center>
                            <table class="table table-hover">
                                <thead>
                                <tr >
                                    <th > 序号 </th>
                                    <th > 项目 </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${! empty convemsions}" var="co">
                                    <c:forEach items="${convemsions}" var="con" varStatus="status">
                                        <tr>
                                            <td> ${status.count} </td>
                                            <td> ${con.item} </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!co}">
                                    <tr>
                                        <td colspan="2"> 无Convemsion Projects 信息 </td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                    </div>
                    </div>
                    <div style="float: left;width:33%">
                        <div class="portlet-body">
                                <center class="dock">修复工程</center>
                                <table class="table table-hover">
                                    <thead>
                                    <tr >
                                        <th > 序号 </th>
                                        <th > 项目 </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${! empty repairs}" var="r">
                                        <c:forEach items="${repairs}" var="re" varStatus="status">
                                            <tr>
                                                <td> ${status.count} </td>
                                                <td> ${re.item} </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!r}">
                                        <tr>
                                            <td colspan="2"> 无Repairing Projects 信息 </td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                    <div style="float: left;width:33%">
                        <div class="portlet-body">
                                <center class="dock">大客户</center>
                                <table class="table table-hover">
                                    <thead>
                                    <tr >
                                        <th > 序号 </th>
                                        <th > 项目 </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${! empty majors}" var="m">
                                        <c:forEach items="${majors}" var="ma" varStatus="status">
                                            <tr>
                                                <td> ${status.count} </td>
                                                <td> ${ma.item} </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!m}">
                                        <tr>
                                            <td colspan="2"> 无Major Projects 信息 </td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
                        </div>
                    </div>
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
                                        <table class="table table-hover" id="wharfDetail">
                                            <thead class="dock">
                                            <tr >
                                                <th rowspan="2"> 序号 </th>
                                                <th rowspan="2"> 类型 </th>
                                                <th rowspan="2"> 姓名 </th>
                                                <th rowspan="2"> 能力（T） </th>
                                                <th rowspan="2"> 提升能力 </th>
                                                <th colspan="3"> 维</th>
                                                <th rowspan="2"> 起重机 </th>
                                                <th rowspan="2"> 备注  </th>

                                            </tr>
                                            <tr>
                                                <th>长度（m）</th>
                                                <th>宽度（m）</th>
                                                <th>草案（m）</th>
                                            </tr>
                                            </thead>

                                        </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_1_2">
                                <div class="portlet-body">
                                    <table class="table table-hover" id="berthDetail">
                                        <thead class="dock">
                                        <tr >
                                            <th > 序号 </th>
                                            <th > 总长（m） </th>
                                            <th > 草案（m） </th>
                                            <th > 能力（T） </th>
                                            <th > 起重机 </th>

                                        </tr>
                                        </thead>
                                    </table>
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
                                            <c:if test="${! empty cranes}" var="c">
                                                <c:forEach items="${cranes}" var="cr" varStatus="status">
                                                    <tr>
                                                        <td> ${status.count} </td>
                                                        <td> ${cr.type} </td>
                                                        <td> ${cr.capacity} </td>
                                                        <td> ${cr.unit} </td>
                                                        <td> ${cr.remark}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${!c}">
                                                <tr>
                                                    <td colspan="5"> 无起重机信息 </td>
                                                </tr>
                                            </c:if>
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
                                                <c:if test="${! empty tugboats}" var="t">
                                                    <c:forEach items="${tugboats}" var="tu" varStatus="status">
                                                        <tr>
                                                            <td> ${status.count} </td>
                                                            <td> ${tu.type} </td>
                                                            <td> ${tu.capacity} </td>
                                                            <td> ${tu.unit} </td>
                                                            <td> ${tu.remark}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!t}">
                                                    <tr>
                                                        <td colspan="5"> 无拖船信息 </td>
                                                    </tr>
                                                </c:if>
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
                                                <c:if test="${! empty others}" var="o">
                                                    <c:forEach items="${others}" var="ot">
                                                        <tr>
                                                            <td> ${ot.type} </td>
                                                            <td> ${ot.remark} </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!o}">
                                                    <tr>
                                                        <td colspan="2"> 无其他信息 </td>
                                                    </tr>
                                                </c:if>
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

<%--显示码头信息--%>
<script type="text/javascript">
    var defTable;
    var id=${shipyard.id};
    $(document).ready(function () {
        defTable = $('#wharfDetail').DataTable({
            "ordering": false,
            "autoWidth": false,
            "ajax": {
                "url": "shipyard/wharf?id="+id,
                "type": "post",
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "columns": [
                {
                    "data": "id",
                },
                {
                    "data": "type",
                },
                {
                    "data": "name",
                },
                {
                    "data": "capacity",
                },
                {
                    "data": "liftCapacity",
                },
                {
                    "data": "length",
                },
                {
                    "data": "width",
                },
                {
                    "data": "protocol",
                },
                {
                    "data": "cranes",
                },
                {
                    "data": "remark",
                },
            ],
        });


    });

</script>

<%--显示泊位信息--%>
<script type="text/javascript">
    var defTable;
    var id=${shipyard.id};
    $(document).ready(function () {
        defTable = $('#berthDetail').DataTable({
            "ordering": false,
            "autoWidth": false,
            "ajax": {
                "url": "shipyard/berth?id="+id,
                "type": "post",
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "columns": [
                {
                    "data": "id",
                },
                {
                    "data": "loa",
                },
                {
                    "data": "draft",
                },
                {
                    "data": "capacity",
                },
                {
                    "data": "cranes",
                },
            ],
        });


    });

</script>