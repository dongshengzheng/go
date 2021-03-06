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
    .col-sm-6, .col-sm-12 {
        font-size: 10px;
    }

    .form-group {
        margin-bottom: 0px;
    }

    .dock {
        background-color: #9adad6;
    }

    table th, td {
        text-align: center
    }

    .dataTables_length {
        display: none;
    }

    #wharfDetail_paginate, #berthDetail_paginate {
        display: none;
    }

    #line1 {
        border-bottom: solid 2px #337ab7;
        height: 1px;
        margin-top: 10px
    }

    #line2 {
        border-bottom: solid 2px #337ab7;
        height: 1px;
    }
    .label_left{
        padding-left: 0px;
    }
</style>
<div><a href="shipyard" data-target="navTab"><img src="/img/top.png"/></a><span><fmt:message key="shipyard_review_info"/> <%--查看船厂信息--%></span></div>
<div id="line1"></div>
<div style="margin-top: 20px;height: 50%">
    <div class="col-sm-5">
        <img style="width:100%; height: 250px" src="/img/ship.jpg">
    </div>
    <div class="col-sm-7">
        <p style="margin: 0px">${shipyard.name}</p>
        <p style="font-size: 12px" id="des">${shipyard.des}
        </p>
        <div class="timeline-body-content">
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left" ><fmt:message key="shipyard_short_name"/> <%--简称--%>：${shipyard.shortName}</label>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"><fmt:message key="shipyard_group"/> <%--集团公司--%>：${shipyard.groupCompany}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"><fmt:message key="shipyard_nation"/> <%--国家--%>：${shipyard.country}</label>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left" ><fmt:message key="shipyard_area"/> <%--区域--%>：${shipyard.area}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"><fmt:message key="shipyard_location"/> <%--位置--%>：${shipyard.location}</label>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"  ><fmt:message key="shipyard_address"/> <%--地址--%>：${shipyard.address}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"><fmt:message key="shipyard_longitude"/> <%--经度--%>：${shipyard.longitude}</label>

                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left" ><fmt:message key="shipyard_latitude"/> <%--纬度--%>：${shipyard.latitude}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left" ><fmt:message key="shipyard_tel"/> <%--电话--%>：${shipyard.tel}</label>
                </div>
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left" ><fmt:message key="shipyard_email"/> <%--电子邮件--%>：${shipyard.email}</label>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="col-sm-12 control-label label_left"><fmt:message key="shipyard_website"/> <%--网站--%>：${shipyard.website}</label>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-12" style="margin-left: 40%;margin-top: 40px">
    <ul class="nav nav-pills" style="margin-bottom: 0px">
        <li class="active">
            <a href="#tab11" data-toggle="tab"><fmt:message key="shipyard_basic_det"/> <%--基本信息--%></a>
        </li>
        <li>
            <a href="#tab12" data-toggle="tab"><fmt:message key="shipyard_faci_equipment"/> <%--设备设施--%></a>
        </li>
    </ul>
</div>

<div id="line2" class="col-sm-12"></div>
<div class="portlet light bordered" style="padding: 0px;">
    <div class="portlet-body">
        <div class="tabbable tabbable-tabdrop">
            <div class="tab-content">
                <div class="tab-pane active" id="tab11">
                    <div style="text-align:center"><fmt:message key="shipyard_result_pro"/> <%--业绩项目--%></div>
                    <div class="col-sm-4">
                        <div class="portlet-body">
                            <center class="dock"><fmt:message key="shipyard_convemsion_pro"/> <%--convemsion项目--%></center>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th> <fmt:message key="shipyard_no"/> </th><%--序号--%>
                                    <th><fmt:message key="shipyard_item"/> </th><%--项目--%>
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
                                        <td colspan="2"> <fmt:message key="shipyard_convemsion_pro_no"/> </td><%--无Convemsion Projects 信息--%>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="portlet-body">
                            <center class="dock"><fmt:message key="shipyard_repairing_pro"/> <%--修复工程--%></center>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th> <fmt:message key="shipyard_no"/> </th><%--序号--%>
                                    <th><fmt:message key="shipyard_item"/> </th><%--项目--%>
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
                                        <td colspan="2"><fmt:message key="shipyard_repairing_pro_no"/> </td><%--无修复工程信息--%>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="portlet-body">
                            <center class="dock"><fmt:message key="shipyard_major_clients"/> <%--重大项目--%></center>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th> <fmt:message key="shipyard_no"/> </th><%--序号--%>
                                    <th><fmt:message key="shipyard_item"/> </th><%--项目--%>
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
                                        <td colspan="2"><fmt:message key="shipyard_major_clients_no"/> </td><%--无重大项目信息--%>
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
                                <a href="#tab_1_1" data-toggle="tab"> <fmt:message key="shipyard_dock_det"/> <%--码头信息--%> </a>
                            </li>
                            <li>
                                <a href="#tab_1_2" data-toggle="tab"> <fmt:message key="shipyard_berth_det"/> <%--泊位信息--%> </a>
                            </li>
                            <li>
                                <a href="#tab_1_3" data-toggle="tab"> <fmt:message key="shipyard_facility_det"/> <%--设施信息--%> </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade active in" id="tab_1_1">
                                <div>
                                    <div class="portlet-body">
                                        <table class="table table-hover" id="wharfDetail">
                                            <thead class="dock">
                                            <tr>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_no"/> </th><%--序号--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_type"/> </th><%--类型--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_name"/> </th><%--姓名--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_capacity"/> </th><%--能力（T）--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_lift_capacity"/> </th><%--提升能力--%>
                                                <th colspan="3"> <fmt:message key="shipyard_dock_dimension" /></th><%--维--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_cranes"/> </th><%--起重机--%>
                                                <th rowspan="2"> <fmt:message key="shipyard_dock_remark"/> </th><%--备注--%>

                                            </tr>
                                            <tr>
                                                <th><fmt:message key="shipyard_dock_length"/> <%--长度--%>（m）</th>
                                                <th><fmt:message key="shipyard_dock_width"/> <%--宽度--%>（m）</th>
                                                <th><fmt:message key="shipyard_dock_draft"/> <%--吃水--%>（m）</th>
                                            </tr>
                                            </thead>

                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_1_2">
                                <div class="portlet-body">
                                    <table class="table table-hover" id="berthDetail">
                                        <thead class="dock">
                                        <tr>
                                            <th> <fmt:message key="shipyard_berth_no"/> <%--序号--%></th>
                                            <th> <fmt:message key="shipyard_berth_loa"/> <%--总长--%>（m）</th>
                                            <th> <fmt:message key="shipyard_berth_draft"/><%--吃水--%>（m）</th>
                                            <th> <fmt:message key="shipyard_berth_capacity"/><%--能力--%>（T）</th>
                                            <th> <fmt:message key="shipyard_berth_cranes"/><%--起重机--%></th>

                                        </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="tab_1_3">
                                <div>
                                    <center class="dock"><fmt:message key="shipyard_cranes_det"/> <%--起重机信息--%></center>
                                    <div class="portlet-body" style="padding: 0px">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th> <fmt:message key="shipyard_cranes_no"/> <%--序号--%></th>
                                                    <th> <fmt:message key="shipyard_cranes_type"/><%--类型--%></th>
                                                    <th> <fmt:message key="shipyard_cranes_capacity"/><%--能力--%>（T）</th>
                                                    <th> <fmt:message key="shipyard_cranes_unit"/><%--单元--%></th>
                                                    <th> <fmt:message key="shipyard_cranes_remark"/><%--备注--%></th>

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
                                                        <td colspan="5"> <fmt:message key="shipyard_cranes_det_no"/> <%--无起重机信息--%></td>
                                                    </tr>
                                                </c:if>
                                                <tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <center class="dock"><fmt:message key="shipyard_tugboats_det"/> <%--拖船信息--%></center>
                                    <div class="portlet-body" style="padding: 0px">
                                        <div class="table-scrollable">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th> <fmt:message key="shipyard_tugboats_no"/> </th><%--序号--%>
                                                    <th> <fmt:message key="shipyard_tugboats_type"/></th><%--类型--%>
                                                    <th> <fmt:message key="shipyard_tugboats_capacity"/>（T）</th><%--能力--%>
                                                    <th> <fmt:message key="shipyard_tugboats_unit"/></th><%--单元--%>
                                                    <th> <fmt:message key="shipyard_tugboats_remark"/></th><%--备注--%>

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
                                                        <td colspan="5"> <fmt:message key="shipyard_tugboats_det_no"/> </td><%--无拖船信息--%>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <center class="dock"><fmt:message key="shipyard_others_det"/> <%--其他信息--%></center>
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
                                                        <td colspan="2"> <fmt:message key="shipyard_others_det_no"/> </td><%--无其他信息--%>
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
    var id =${shipyard.id};
    $(document).ready(function () {
        defTable = $('#wharfDetail').DataTable({
            "ordering": false,
            "autoWidth": false,
            "ajax": {
                "url": "privateShipyard/wharf?id=" + id,
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
    var id =${shipyard.id};
    $(document).ready(function () {
        defTable = $('#berthDetail').DataTable({
            "ordering": false,
            "autoWidth": false,
            "ajax": {
                "url": "privateShipyard/berth?id=" + id,
                "type": "post",
            },
            "language": {
                "url": "http://windyeel.oss-cn-shanghai.aliyuncs.com/global/plugins/datatables/cn.txt"
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

<%--船厂信息的介绍的文字的展开和合并--%>
<script type="text/javascript">
    Subt();
    function Subt() {
        var s = $("#des").html();
        $("#des").html("");
        $("#des").append("<span id='part'></span>");
        $("#part").after("<a id='info'></a>");
        $("#part").html(s.substring(0, 200));
        $("#info").attr("href", "##");
        $("#info").html(s.length > 200 ? "...[<fmt:message key='shipyard_describe_detailed'/> ]" : "");/*详细*/
        $("#info").click(function () {
            if ($("#info").html() == "...[<fmt:message key='shipyard_describe_detailed'/>]") {/*详细*/
                $("#info").html("<fmt:message key='shipyard_describe_retract'/>");/*收起*/
                $("#part").html(s);
            } else {
                $("#info").html("...[<fmt:message key='shipyard_describe_detailed'/>]");/*详细*/
                $("#part").html(s.substring(0, 200));
            }
        });
    }
</script>