<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<style>
    .line1{  border-bottom:solid 2px #337ab7; height:1px;margin-top: 10px  }
    .head{height:40px;width: 100%;background-color: #C0C9CC}
    .content{margin-top: 20px;padding-left: 30px}
    .td-select{width: 90%;height: 100%}
    .td-checkbox{width: 20px;height: 20px}
    #selectAll{width: 20px;height: 20px}
</style>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title tabbable-line">
                    <div id="bootstrap_alerts_demo"></div>
                    <div class="caption caption-md">
                        <div style="display: inline-block">
                            <i class="icon-microphone font-green"></i>
                            <span class="caption-subject bold font-green uppercase">比价信息</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-12 line1"></div>
                    <div class="col-md-12 head"><h4>工程单概要</h4></div>
                    <div class="col-md-12 content" >
                        <div class="col-md-2">
                            <img src="http://shipinfo.oss-cn-shanghai.aliyuncs.com/system/compare.png"/>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="shipId" class="col-sm-4 control-label">
                                        <fmt:message key="repair_vessel_name"/>：<%--船舶名称--%></label>
                                    <label style="width: auto;padding-left: 0px;" id="shipId"
                                           class="col-sm-5 control-label label-top">${repairSpec.shipName}</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="type" class="col-sm-4 control-label">
                                        <fmt:message key="repair_spec_type"/> ：<%--维修类型--%></label>
                                    <label style="width: auto;padding-left: 0px;" id="type"
                                           class="col-sm-5 control-label label-top">${repairSpec.type}</label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <fmt:formatDate value="${repairSpec.planStartDate}" pattern="yyyy-MM-dd" var="data"/>
                                    <label for="planStartDate" class="col-sm-4 control-label"><fmt:message key="repair_spec_plan_date"/> <%--计划进场日期--%>：</label>
                                    <label style="width: auto;padding-left: 0px;" id="planStartDate"
                                           class="col-sm-5 control-label label-top">${data}</label>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="planDays" class="col-sm-4 control-label">
                                        <fmt:message key="repair_spec_estimate_day"/>： <%--预估天数--%></label>
                                    <label style="width: auto;padding-left: 0px;" id="planDays"
                                           class="col-sm-5 control-label label-top">${repairSpec.planDays}</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="planCost" class="col-sm-4 control-label">
                                        <fmt:message key="repair_spec_plan_cost"/> ： <%--预估费用--%></label>
                                    <label style="width: auto;padding-left: 0px;" id="planCost"
                                           class="col-sm-5 control-label label-top">${repairSpec.planCost}</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-12 line1"></div>
                    <div class="col-md-12 head"><h4>导入excel</h4></div>
                    <div class="col-md-12 content">
                        <table class="table table-striped table-bordered table-hover table-checkable order-column"
                               id="default_table" style="width: 98%" >
                            <thead>
                                <tr style="background-color: #8CD2E5">
                                    <td style="width:5%"> <input type="checkbox" id="selectAll" /></td>
                                    <th style="width: 30%">选择船厂</th>
                                    <th style="width: 30%">导入Excel</th>
                                    <th style="width: 20%">
                                        <button type="button" onclick="" class="btn red" id="deletes"><fmt:message key="go_delete"/> <%--删除--%></button>&nbsp;
                                        <button  type="button" onclick="addTr(this)" class="btn green"><fmt:message key="go_add"/> <%--添加--%></button>
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="table-tbody">
                                <tr style="display: none"></tr>
                                <c:if test="${! empty enquiries}" >
                                    <c:forEach items="${enquiries}" var="e">
                                        <tr class="addTr">
                                            <td ><input type="checkbox" class="td-checkbox" data-total="${e.quoteTotlePrice}" data-name="${e.privateShipyardName}"/></td>
                                            <td><select class="td-select" onchange="selectShipyard(this)">
                                                <option value=0>--<fmt:message key="compare_select_shipyard"/> --</option><%--请选择船厂--%>
                                                <c:forEach items="${shipyards}" var="s">
                                                    <option value="${s.id}"
                                                            <c:if test="${s.id==e.privateShipyardId}">
                                                                selected
                                                            </c:if>

                                                    > ${s.name} </option>
                                                </c:forEach>

                                                </select>
                                            </td>
                                            <td >
                                                <form action="enquiry/importExcel" method="post" enctype="multipart/form-data">
                                                    <input name="shipyardId" type="hidden" value="${e.privateShipyardId}"/>
                                                    <input name="repairSpecId" type="hidden" value="${repairSpec.id}"/>
                                                    <input type="file" name="file" class="col-md-6"/>
                                                    <button type="button" style="float: right;width: 40%" class="col-md-6 btn blue"  onclick="importExcel(this)">导入Excel</button>
                                                </form>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12 modal-footer" style="margin-top:50px;text-align: center">
                    <button type="button" onclick="compare()" class="btn btn-primary" data-dismiss="modal">比价</button>
                </div>
            </div>
        </div>
    </div>
<div id="make" class="modal fade" tabindex="-1" data-backdrop="make" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #4bccd8">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">比价信息</h4>
            </div>
            <div id="modal-body" class="modal-body col-md-12">

            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline"><fmt:message key="repair_spec_close"/> <%--关闭--%></button>
            </div>
        </div>
    </div>
</div>
<a href="#make" id="compare"  data-toggle="modal"  class="btn btn-sm margin-bottom-5 green" style="display: none"></a>
<script type="text/javascript">

    function addTr() {  //增加行
        var html= '<tr class="addTr">' +
                '<td > <input type="checkbox" class="td-checkbox" data-total="" data-name=""/></td>' +
                '<td><select class="td-select" onchange="selectShipyard(this)">'
        $.ajax({
            "url": 'enquiry/shipyard',
            "type": 'get',
            "success": function (data) {
                html += "<option value=0>--<fmt:message key='compare_select_shipyard'/> --</option>";/*请选择船厂*/
                var data=data.shipyards;
                for (var i = 0; i < data.length; i++) {
                    html += "<option value=" + data[i].id + ">" + data[i].name + "</option>"
                }
                html+='</select></td>' +
                        '<td >' +
                        '<form action="enquiry/importExcel" method="post" enctype="multipart/form-data">' +
                        '<input name="shipyardId" type="hidden" value=""/>'+
                        '<input name="repairSpecId" type="hidden" value="${repairSpec.id}"/>'+
                        '<input  type="file" name="file" class="col-md-6" value="<fmt:message key='compare_select_excel'/> "/>' +/*选择Excel*/
                        '<button type="button" style="float: right;width: 40%" class="col-md-6 btn blue"  onclick="importExcel(this)">导入Excel</button></form></td>' +
                        '<td></td>'+
                        '</tr>';
                $("#default_table tbody tr:last").after(html);
            }
        })
    }
    function importExcel(obj) {

        if(check(obj)){
            $(obj).parent().ajaxSubmit({
                success:function (data) {
                    if(data.mes == 1){
                        $(obj).parent().parent().next().html("<h4 style='color: green'>SUCCESS</h4>");
                        $(obj).parent().parent().parent().find("input").attr("data-total",data.total);
                        $(obj).parent().parent().parent().find("input").attr("data-name",data.name);
                    }else {
                        $(obj).parent().parent().next().html("<h4 style='color: red'><fmt:message key='compare_excel_error'/> </h4>");/*失败或者Excel格式不正确*/
                    }
                }
            });
        }
    }
    function check(obj) {
        var excel_file = $(obj).prev().val();
        var shipyardId=$(obj).parent().parent().parent().find("select").val();
        if (excel_file == "" || excel_file.length == 0) {
            alert("<fmt:message key='compare_select_file'/> ");/*请选择文件！*/
            return false;
        } else if(shipyardId == "" || shipyardId == 0){
            alert("<fmt:message key='compare_select_shipyard'/> ");/*请选择船厂*/
            return false;
        } else {
            return true;
        }
    }
    function selectShipyard(obj) {
        //寻找当前对象的父节点，再去找父节点的下一个节点，在下一个节点中找到第一个input
        $(obj).parent().next().find("input[name='shipyardId']").val($(obj).val());
    }








    //比价
    function compare(){
        var count=0;
        var html2="";
        $(".td-checkbox").each(function () {
            if ($(this).prop("checked")) {
                count++;

                html2+= '<div class="form-group col-md-8">' +
                        '<label class="control-label"><fmt:message key="shipyard_name"/>：</label>' + <!--船厂名称-->
                        '<label class="control-label">'+$(this).attr('data-name')+'</label>' +
                        '</div>' +
                        '<div class="form-group col-md-4">' +
                        '<label  class="control-label"><fmt:message key='offer_total_amount'/>：</label>' +/*报价总额*/
                        '<label class="control-label">'+$(this).attr('data-total')+'</label>' +
                        '</div>'


            }
        });
        if (count == 0) {
            alert("<fmt:message key='compare_select_one'/>");/*至少选择一个!*/
            return;
        }
        $("#modal-body").html(html2);

        $("#compare").click();
    }
</script>

<script type="text/javascript">
    $(function () {
        $("#selectAll").change(function(){

            $("#selectAll").prop("checked",this.checked);
            if($("#selectAll").prop("checked")){
                $(".td-checkbox").each(function () {
                    $(this).prop("checked","checked");
                });
            }else{
                $(".td-checkbox").each(function () {
                    $(this).attr("checked",false);
                });
            }
        });

        $("#deletes").click(function(e){
            //e.preventDefault();
            var t=confirm("<fmt:message key='go_delete_confirm'/> ");/*确定要删除吗？*/
            if(t) {
                if($("#selectAll").prop("checked")){
                    $("#selectAll").prop("checked",false);
                }
                var count = 0;
                $(".td-checkbox").each(function () {
                    if ($(this).prop("checked")) {
                        count++
                        $(this).parent().parent().remove();
                    }
                });

                if (count == 0) {
                    alert("<fmt:message key='compare_select_one'/> ");/*至少选择一个!*/
                    return;
                }
            }
        });
    });
</script>