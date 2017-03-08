<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="go" uri="http://www.ctoangels.com/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<go:navigater path="repairSpec"></go:navigater>
<div id="gridChart" style="width: 500px; height: 300px; overflow: scroll"></div>
<script type="text/javascript">
/** 
 * 时间对象的格式化; 
 */  
Date.prototype.format = function(format) {  
    /* 
     * eg:format="yyyy-MM-dd hh:mm:ss"; 
     */  
    var o = {  
        "M+" : this.getMonth() + 1, // month  
        "d+" : this.getDate(), // day  
        "h+" : this.getHours(), // hour  
        "m+" : this.getMinutes(), // minute  
        "s+" : this.getSeconds(), // second  
        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
        "S" : this.getMilliseconds()  
        // millisecond  
    }  
  
    if (/(y+)/.test(format)) {  
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
                        - RegExp.$1.length));  
    }  
  
    for (var k in o) {  
        if (new RegExp("(" + k + ")").test(format)) {  
            format = format.replace(RegExp.$1, RegExp.$1.length == 1  
                            ? o[k]  
                            : ("00" + o[k]).substr(("" + o[k]).length));  
        }  
    }  
    return format;  
}  
//parse a date in yyyy-mm-dd format
function parseDate(input) {
  var parts = input.match(/(\d+)/g);
  // new Date(year, month [, date [, hours[, minutes[, seconds[, ms]]]]])
  return new Date(parts[0], parts[1]-1, parts[2]); // months are 0-based
}
</script>
<script>
var rows,columns;
$(document).ready(function(){
    var chartdata = [          
                    {                      
                "id": "2012-12-01",         
                date: new Date("2012-12-01"),
                "field": 2,                 
                "tableStartName": 67,                 
                "name": 42,                 
                "elementProperty": 75,                 
                "value": 45,                 
                "group": 48,                 
                "key": 23                  
                    },                     
                    {                      
                        "id": "2012-12-02",         
                date: new Date("2012-12-02"),
                "field": 87,                 
                "tableStartName": 62,                 
                "name": 91,                 
                "elementProperty": 18,                 
                "value": 38,                 
                "group": 50,                 
                "key": 20                  
                    },                     
                    {                      
                        "id": "2012-12-03",         
                date: new Date("2012-12-03"),
                "field": 25,                 
                "tableStartName": 73,                 
                "name": 26,                 
                "elementProperty": 63,                 
                "value": 104,                 
                "group": 85,                 
                "key": 61                  
                    },                     
                    {                      
                        "id": "2012-12-04",         
                date: new Date("2012-12-04"),
                "field": 71,                 
                "tableStartName": 111,                 
                "name": 31,                 
                "elementProperty": 30,                 
                "value": 100,                 
                "group": 53,                 
                "key": 26                  
                    },                     
                    {                      
                        "id": "2012-12-05",         
                date: new Date("2012-12-05"),
                "field": 20,                 
                "tableStartName": 70,                 
                "name": 22,                 
                "elementProperty": 56,                 
                "value": 23,                 
                "group": 32,                 
                "key": 58                  
                    }                     
                ]                          

 ; 
    
   
   var data = eval(chartdata);
   rows = data.length;
   // 除Id外的属性长度
   columns = getJsonLength(data[0]);
   $("#gridChart").handsontable({
     startRows: 40,
     startCols: 40,
     rowHeaders: false,
     colHeaders: true,
     minSpareCols: 1,
     minSpareRows: 1,
     colHeaders: ["柱1","柱2","柱3","柱4","柱5","柱6","柱7"],
columns: [
{data: "field"},
{data: "tableStartName"},
{data: "name"},
{data: "elementProperty"},
{data: "value"},
{data: "group"},
{data: "key"}
]
   });
   $("#gridChart").handsontable("loadData", data);
});
// 获取json对象的长度
function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}
function SerializeJsonToStr(oJson) {
    if( typeof (oJson) == typeof (false)) {
        return oJson;
    }
    if(oJson == null) {
        return "null";
    }
    if( typeof (oJson) == typeof (0))
        return oJson.toString();
    if( typeof (oJson) == typeof ('') || oJson instanceof String) {
        oJson = oJson.toString();
        oJson = oJson.replace(/\r\n/, '\\r\\n');
        oJson = oJson.replace(/\n/, '\\n');
        oJson = oJson.replace(/\"/, '\\"');
        return '"' + oJson + '"';
    }
    if( oJson instanceof Date) {
        return "parseDate('"+oJson.format("yyyy-MM-dd")+"')";
    }
    if( oJson instanceof Array) {
        var strRet = "[";
        for(var i = 0; i < oJson.length; i++) {     
            var value = SerializeJsonToStr(oJson[i]); 
            if(value != "null"){                
             if(strRet.length > 1){
                 strRet += ",";                
             }
             strRet += value;   
            }            
        }
        strRet += "]";
        return strRet;
    }
    if( typeof (oJson) == typeof ( {})) {
        var strRet = "{";
        var rowFlag = false;
        for(var p in oJson) {
            if(strRet.length > 1)
                strRet += ",";
             var value = SerializeJsonToStr(oJson[p]);
            if(value != null && value != "null"){
                strRet += '"' + p.toString() + '":' +value ;                
                rowFlag = true;
            }            
        }
        strRet += "}";
        if(!rowFlag){
            return "null";
        }
        return strRet;
    }
}
// 对话框确定按钮
function ok(){
    var $container = $("#gridChart");
    var handsontable = $container.data('handsontable');
    var data = handsontable.getData();
    var json =SerializeJsonToStr(data);
    // 多次多行替换
    // json = json.replace(new RegExp(',{}','gm')  ,"");
    // json = json.replace(new RegExp('"parseDate(','gm')  ,"parseDate(");
    // json = json.replace(new RegExp(')",','gm')  ,"),");
    alert(json);
    var chartData = eval('('+json+')');
    return chartData;
}
function filterNull(key,value){
    if(value==null){
        return;
    }
    if(key == "date"){
        // 返回格式化日期
        // return parseDate(value.replace(new RegExp('T00:00:00.000Z','gm')  ,""));
    }
    return value;
}
</script>
