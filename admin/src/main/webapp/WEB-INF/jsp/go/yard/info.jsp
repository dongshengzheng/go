<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="yard"></go:navigater>
<div><span>查看船厂信息</span></div>
<div class="xline" style="border-bottom:solid 3px #337ab7; height:2px;"></div>
<div style="margin-bottom: 30px;margin-top: 20px">
    <div style="display:inline-block;width: 300px;height: 200px;margin-right: 20px">
        <img style="width: 300px;height: 200px" src="/ship.jpg">
    </div>
    <div style="display:inline-block;">
        <p>中原（广东）建造有限公司Ltd</p>
        <p style="font-size:12px;">“中远（大连）造船厂是中远船务集团的核心子企业。它的主要业务是船舶与海洋工程修理、<br/>
            转换和和新的建筑。船厂有一个面积120000平方米，总用地3200米以上的深水泊位3个码头、8<br/>
            码头修船，2门式起重机（200吨），1门式起重机（400吨）和各种设施，期间近年来，中远（<br/>
            大连）造船厂做了一个修船到船舶和海上修理、转换
        </p>
        <div></div>
    </div>
</div>
<div style="margin: 0 auto;width:250px;">
    <ul class="nav nav-pills">
        <li class="active">
            <a href="#tab11" data-toggle="tab">一般信息</a>
        </li>
        <li>
            <a href="#tab12" data-toggle="tab">设备信息</a>
        </li>
    </ul>
</div>
<div class="xline" style="border-bottom:solid 3px #337ab7; height:2px;"></div>
<div class="portlet light bordered" >
    <div class="portlet-body">
        <div class="tabbable tabbable-tabdrop">
            <div class="tab-content">
                <div class="tab-pane active" id="tab11">
                    <p>中原（广东）建造有限公司Ltd</p>
                </div>
                <div class="tab-pane" id="tab12">
                    <p> Howdy, I'm in Section 2. </p>
                </div>
            </div>
        </div>
    </div>
</div>