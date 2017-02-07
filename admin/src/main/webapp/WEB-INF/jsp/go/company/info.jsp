<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="owner"></go:navigater>
<style type="text/css">
    body, html{width: 100%;height: 100%;}
    #img{width:90%;height:200px;}
    #allmap{height:300px;width:50%;}
    .com-info{height:40px}

</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=sH45FS0Pd1v58SSDcltpILGWyLkSn959"></script>
<div><img src="/info.png"><span>公司信息</span></div>
<div id="up" style="margin-bottom:10px"><img id="img" src="/ship.jpg"/></div>
<div id="down" style="margin-top:20px">
    <div id="allmap" style="float:left;margin-right:20px"></div>
    <div style="float:left">
        <div class="com-info"><span>上海东曦船务有限公司</span></div>
        <div class="com-info"><span>公司法人：</span></div>
        <div class="com-info"><span>公司电话：</span></div>
        <div class="com-info"><span>网址：</span></div>
        <div class="com-info"><span>地址：</span></div>
        <div class="com-info"><span>邮编：</span></div>
        <div class="com-info"><span>联系人：</span></div>
        <div class="com-info"><span>联系方式：</span></div>
    </div>
</div>
<script type="text/javascript">
        // 百度地图API功能
        var myGeo = new BMap.Geocoder();
        var map = new BMap.Map("allmap");
        //地址解析的函数
        var value_address_1 = "上海市浦东新区浦东假日酒店";
        myGeo.getPoint(value_address_1, function (point) {
            if (point) {
                map.centerAndZoom(point, 15);
                map.addOverlay(new BMap.Marker(point));
            }
        }, "全国");
        map.enableScrollWheelZoom();
        var opts = {type: BMAP_NAVIGATION_CONTROL_LARGE};
        map.addControl(new BMap.NavigationControl(opts));
</script>
