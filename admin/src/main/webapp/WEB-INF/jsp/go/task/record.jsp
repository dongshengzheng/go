<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<go:navigater path="progress"></go:navigater>
<style>
    table ,tr,td{
        border: solid 2px #9C9C9C
    }
    .borders{
        border: solid 1px #9C9C9C;
    }
</style>
<form action="" method="post" class="form-horizontal" id="defForm">
    <div class="profile-content">
        <div class="row col-md-11" >
            <div class="col-md-12"><h4>记录报告</h4></div>
            <div class="col-md-12" style="padding-left:0px;padding-right: 0px
">
                <div class="timeline-body-content">
                    <table class="table table-bordered">
                        <tr>
                            <td>D-001</td>
                            <td>XXXXXX</td>
                            <td>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</td>
                            <td><a href="#">工程状态修改</a></td>
                            <td><a href="#">工程详单查看</a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-md-12"><h4>详情记录</h4></div>
            <div class="col-md-12 borders">
               <div style="padding-top: 15px;padding-bottom: 15px">
                   <div class="col-md-9" style="padding: 0px">
                       <div  id="example1"  style=" height: 250px; overflow: hidden;"></div>
                   </div>
                   <div class="col-md-3"style=" height: 250px;padding: 0px">
                       <textarea style="width: 100%;height:100%;" placeholder="备注:"></textarea>
                   </div>
               </div>
            </div>
            <div class="col-md-12 " ><h4>上传照片</h4></div>
            <div class="col-md-12 borders" >
                <div class="col-md-4" style="padding: 5px;">
                    <button id="upload_logo" ><img id="logo-img"
                         src="http://shipinfo.img-cn-shanghai.aliyuncs.com/${company.logo}?x-oss-process=image/resize,m_fill,h_100,w_100"
                         style="display: block;width: 100px;height: 100px"
                         onerror="nofind(1)"/></button>
                    <input type="hidden" id="logo" name="logo" value="${company.logo}">
                </div>
            </div>
            <div class="col-md-12"><h4>上传相关文件</h4></div>
            <div class="col-md-12 borders">
                <div style="padding: 10px;">
                    <table class="table" id="table_attachment">
                       <tbody>
                           <tr>
                               <td id="one" rowspan="1" width="100px"><input id="attachment" type="button" value="浏览本地"/></td>
                           </tr>
                       </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</form>
<script>
    initUploaders_logo("upload_logo", "shipinfo", "${staticPath}/", "logo-img", "logo");
    initUploaders_attachment("attachment", "shipinfo", "${staticPath}/", "table_attachment","one");

   /* var id=$("#id").val();*/
    var width=$(window).width();
    /*$("#example1").width(width*0.5);*/
    var dataJson;
    var h;
    $.ajax({
        url:'modelDetail/reqs',
        type:'POST', //GET
        async:true,    //或false,是否异步

        success:function(data){
            dataJson=data.reqs;
            console.log(dataJson);
            var datas = eval(dataJson);
            var container = document.getElementById('example1'),
                    storedData = {},
                    savedKeys,
                    resetState,
                    stateLoaded,
                    hot;

            hot = new Handsontable(container, {
                data: datas,
                rowHeaders: true,
                colHeaders: true,
                colWidths: [width*0.3,width*0.05,width*0.05,width*0.05,width*0.05,width*0.05],
                minRows:10,
                colHeaders: ["要求和描述/材料规格","单位","数量","单价","系数","总价"],
                columnSorting: true,
                columns: [
                    {data: "des"},
                    {data: "unit"},
                    {data: "count"},
                    {data:  "tariff"},
                    {data:  "discount"},
                    {data:  "total"}
                ],
                manualColumnMove: false,
                manualColumnResize: true,
                manualRowMove: true,
                manualRowResize: true,
                minSpareRows: 1,
                contextMenu: true,
                persistentState: true
            });
            h=hot;

            resetState = document.querySelector('.reset-state');
            stateLoaded = document.querySelector('.state-loaded');

        },
        error:function(xhr,textStatus){
            console.log('错误');
        }
    });
    function handsontableData() {
        return h.getData();
    }


</script>
