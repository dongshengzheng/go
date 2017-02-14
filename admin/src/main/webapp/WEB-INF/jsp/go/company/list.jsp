<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="owner"></go:navigater>
<style type="text/css">
    #img{width:90%;height:200px;}
    #allmap{height:300px;width:50%;}
    .com-info{height:40px}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=sH45FS0Pd1v58SSDcltpILGWyLkSn959"></script>



<div style="margin-bottom: 10px"><img src="/img/info.png">&nbsp;&nbsp;&nbsp;<span>公司信息</span></div>
<c:if test="${! empty company}" var="cp">
    <div id="up" style="margin-bottom:10px"><img id="img" src="/img/ship.jpg"/></div>
    <div id="down" style="margin-top:20px;height: 300px">
<%--
        <div id="allmap" style="float:left;margin-right:20px"></div>
--%>
        <div class="span11" style="float: left">
            <form method="post" id="geocoding_form">
                <label for="address">Address:</label>
                <div class="input">
                    <input type="submit" class="btn" value="Search" />
                </div>
            </form>
            <div class="popin">
                <div id="map"></div>
            </div>
        </div>
        <div style="float:left">
            <div class="com-info"><span>${company.name}</span></div>
            <div class="com-info"><span><fmt:message key="company_legal_person"/>：${company.legalPerson}</span></div>
            <div class="com-info"><span><fmt:message key="company_tel"/>：${company.tel}</span></div>
            <div class="com-info"><span><fmt:message key="company_website"/>：${company.website}</span></div>
            <div class="com-info"><span><fmt:message key="company_address"/>：<span id="address">${company.address}</span></span></div>
            <div class="com-info"><span><fmt:message key="company_postal_code"/>：${company.postalCode}</span></div>
            <div class="com-info"><span><fmt:message key="company_contact_name"/>：${company.contactName}</span></div>
            <div class="com-info"><span><fmt:message key="company_contact_tel"/>：${company.contactTel}</span></div>
        </div>
    </div>
</c:if>
<c:if test="${!cp }">

</c:if>
<%--
<script type="text/javascript">
    // 百度地图API功能
    var myGeo = new BMap.Geocoder();
    var map = new BMap.Map("allmap");
    //地址解析的函数
    var value_address_1 = $('#address').html();
    myGeo.getPoint(value_address_1, function (point) {
        if (point) {
            map.centerAndZoom(point, 15);
            map.addOverlay(new BMap.Marker(point));
        }
    }, "全国");
    map.enableScrollWheelZoom();
    var opts = {type: BMAP_NAVIGATION_CONTROL_LARGE};
    map.addControl(new BMap.NavigationControl(opts));
</script>--%>
<script>
    $(document).ready(function() {
        GMaps.geocode({
            address: $('#address').html(),
            callback: function (results, status) {
                if (status == 'OK') {
                    var latlng = results[0].geometry.location;
                    map.setCenter(latlng.lat(), latlng.lng());
                    map.addMarker({
                        lat: latlng.lat(),
                        lng: latlng.lng()
                    });
                }
            }
        });
    });
</script>
