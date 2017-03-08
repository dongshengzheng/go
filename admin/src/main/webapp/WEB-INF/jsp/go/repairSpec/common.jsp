<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    #menu {
        width: 30px;
        height: auto;
        position: fixed;
        top: 35%;
        right: 10px;
        margin-top: -135px;
    }

    #menu ul {
        display: block;
        list-style: none;
        padding: 0;
    }

    #menu ul li a {
        width: 30px;
        height: 60px;
        padding: 15px 0;
        line-height: 15px;
        text-align: center;
        background-color: #fbfcfd;
        color: lightseagreen;
        display: block;
        font-size: 10px;
    }

    #menu ul li a:hover, #menu ul li a.cur {
        background-color: lightseagreen;
        color: #fbfcfd;
    }

    .modal-dialog {
        position: relative;
        width: 75%;
        margin: auto;
    }

    .modal-content {
        padding: 10px;
    }
</style>
<%--右侧悬浮滚动条--%>
<div id="menu">
    <ul>
        <li><a data-item="#item1" class="cur">通用服务</a></li>
        <li><a data-item="#item2">坞修工程</a></li>
        <li><a data-item="#item3">船体工程</a></li>
        <li><a data-item="#item4">机械工程</a></li>
        <li><a data-item="#item5">电气工程</a></li>
        <li><a data-item="#item6">冷藏工程</a></li>
        <li><a data-item="#item7">特种设备</a></li>
        <li><a data-item="#item8">其他</a></li>
        <li><a data-item="#item9">完成</a></li>
    </ul>
</div>

<table>
    <%--维修详单行模板--%>
    <tr class="details-control-child  detail-row" data-parent=""
        style="display: none;" id="detail-row-temp">
        <td><input type="checkbox" disabled class="status-control"
                   style="display:none"
                   checked="checked"></td>
        <td>维修详单</td>
        <td><a class="editDetail" data-model="dialog"
               onclick="markDetailName(this)"></a></td>
        <td><input name="repairDetailId" class="repairDetailId"></td>
        <td></td>
        <td>
            <button type="button" onclick="deleteDetail(this)">删除
            </button>
        </td>
    </tr>
    <%--新增行模板--%>
    <tr style="display: none;" id="item-row-temp1">
        <td><input type="checkbox" disabled class="status-control"></td>
        <td>code</td>
        <td></td>
        <td></td>
        <td></td>
        <td><a class="add-remark" data-toggle="modal" onclick="addRemark(this)" onmouseover="showRemark(this)"
               onmouseout="showRemark(this)"
               href="#responsive">添加备注</a>
            <textarea class="remark-text" name="" cols="60" rows="10" wrap="hard" placeholder="暂未添加备注"
                      style="display: none"></textarea></td>
        <td></td>
    </tr>
    <tr style="display: none;" id="item-row-temp2">
        <td><input type="checkbox" disabled class="status-control"></td>
        <td>code</td>
        <td></td>
        <td></td>
        <td><a class="add-remark" data-toggle="modal" onclick="addRemark(this)" onmouseover="showRemark(this)"
               onmouseout="showRemark(this)"
               href="#responsive">添加备注</a>
            <textarea class="remark-text" name="" cols="60" rows="10" wrap="hard" placeholder="暂未添加备注"
                      style="display: none"></textarea></td>
        <td></td>
    </tr>
</table>

<div id="responsive" class="modal fade" tabindex="-1" aria-hidden="true" data-id="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">添加备注</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                            <textarea id="dialog-text" class="form-control" rows="10"
                                      style="resize: none;" placeholder="请添加备注信息"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn dark btn-outline">取消</button>
                <button type="button" data-dismiss="modal" class="btn green save-remark">确认</button>
            </div>
        </div>
    </div>
</div>

<%--触发详单弹窗--%>
<a style="display:none" href="repairSpecDetail/addModelDetail?shipName=&catagory=&code=" id="add-detail"
   data-model="dialog">新增详单</a>
<%--用于工程单号--%>
<input type="hidden" id="type1proOrderNo" value=1>
<input type="hidden" id="type2proOrderNo" value=1>
<input type="hidden" id="type3proOrderNo" value=1>
<input type="hidden" id="type4proOrderNo" value=1>
<input type="hidden" id="type5proOrderNo" value=1>
<input type="hidden" id="type6proOrderNo" value=1>
<input type="hidden" id="type7proOrderNo" value=1>
<input type="hidden" id="type8proOrderNo" value=1>


<script>
    <%--范本选择下拉列表的初始化及更新--%>
    $(document).ready(initRepairModelDetailList())
    function initRepairModelDetailList() {
        $.ajax({
            "url": 'repairSpec/getModelDetailList',
            "type": 'get',
            "success": function (data) {
                var html = "";
                html += "<option value=-1>--请选择维修详单范本--</option>"
                html += "<option value=0>--新增详单--</option>";
                for (var i = 0; i < data.length; i++) {
                    html += "<option value=" + data[i].id + ">" + data[i].proName + "</option>"
                }
                $(".model-detail-select").html(html);
            }
        })
    }

    $(".model-detail-select").on("change", function () {
        var thisOne = $(this);
        var shipName = $("#shipName").val();
        var id = thisOne.val();
        var catagory = thisOne.attr("data-catagory");
        var code = thisOne.attr("data-code");
        if (id == -1) {
            return;
        }
        //自增详单号
        if (catagory == "通用服务") {
            var no = $("#type1proOrderNo").val();
            proOrderNo = "G-" + foo(no);
            $("#type1proOrderNo").val(no * 1 + 1);
        } else if (catagory == "坞修工程") {
            var no = $("#type2proOrderNo").val();
            proOrderNo = "D-" + foo(no);
            $("#type2proOrderNo").val(no * 1 + 1);
        } else if (catagory == "船体工程") {
            var no = $("#type3proOrderNo").val();
            proOrderNo = "H-" + foo(no);
            $("#type3proOrderNo").val(no * 1 + 1);
        } else if (catagory == "机械工程") {
            var no = $("#type4proOrderNo").val();
            proOrderNo = "M-" + foo(no);
            $("#type4proOrderNo").val(no * 1 + 1);
        } else if (catagory == "电气工程") {
            var no = $("#type5proOrderNo").val();
            proOrderNo = "E-" + foo(no);
            $("#type5proOrderNo").val(no * 1 + 1);
        } else if (catagory == "冷藏工程") {
            var no = $("#type6proOrderNo").val();
            proOrderNo = "R-" + foo(no);
            $("#type6proOrderNo").val(no * 1 + 1);
        } else if (catagory == "特种设备") {
            var no = $("#type7proOrderNo").val();
            proOrderNo = "S-" + foo(no);
            $("#type7proOrderNo").val(no * 1 + 1);
        } else if (catagory == "坞修工程") {
            var no = $("#type8proOrderNo").val();
            proOrderNo = "O-" + foo(no);
            $("#type7proOrderNo").val(no * 1 + 1);
        }
        $(".marked-select").removeClass("marked-select");
        thisOne.addClass("marked-select");
        $('#add-detail').attr("href", "repairSpecDetail/addModelDetail?shipName=" + shipName + "&catagory=" + catagory + "&code=" + code + "&proOrderNo=" + proOrderNo + "&id=" + id);
        $('#add-detail').click();
    })

    function markDetailName(obj) {
        $(".marked-detail-name").removeClass("marked-detail-name");
        $(obj).addClass("marked-detail-name");
    }

    function foo(str) {
        str = '00' + str;
        return str.substring(str.length - 3, str.length);
    }
</script>

<script>
    //右侧悬浮滚动条
    $(document).ready(function () {
        $(window).scroll(function () {
            var top = $(document).scrollTop();          //定义变量，获取滚动条的高度
            var menu = $("#menu");                      //定义变量，抓取#menu
            var items = $("#content").find(".item");    //定义变量，查找.item
            var curId = "";                             //定义变量，当前所在的楼层item #id
            items.each(function () {
                var m = $(this);                        //定义变量，获取当前类
                var itemsTop = m.offset().top;        //定义变量，获取当前类的top偏移量
                if (top >= itemsTop - 300) {
                    curId = "#" + m.attr("id");
                } else {
                    return false;
                }
            });
            var curLink = menu.find(".cur");
            if (curId && curLink.attr("data-item") != curId) {
                curLink.removeClass("cur");
                menu.find("[data-item='" + curId + "']").addClass("cur");
            }
        });
    });

    $('#menu a').on('click', function () {
        $(document).scrollTop($($(this).attr('data-item')).offset().top - 300);
    })

    <%--显示备注--%>
    function showRemark(obj) {
        $(obj).siblings('.remark-text').toggle();
    }
    function addRemark(obj) {
        var text = $(obj).siblings('.remark-text').text()
        $('#dialog-text').val(text);
        $('.marked-add-remark').removeClass("marked-add-remark");
        $(obj).addClass('marked-add-remark');
    }

    $('.save-remark').on('click', function () {
        var text = $('#dialog-text').val();
        $('.marked-add-remark').removeClass("marked-add-remark").siblings('.remark-text').text(text);
    })
</script>