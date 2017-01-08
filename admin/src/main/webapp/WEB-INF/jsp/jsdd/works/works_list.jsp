<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="xianyu" uri="http://www.xianyu.com.cn/jsp/jstl/common" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<xianyu:navigater path="works"></xianyu:navigater>
<div class="row">
    <input type="hidden" value='<fmt:message key="sys.site.url"/>' id="siteUrl">
    <div class="col-md-12">
        <div class="portlet light bordered">
            <div class="portlet-body">
                <div class="table-toolbar">
                </div>
                <table class="table table-striped table-bordered table-hover table-checkable order-column"
                       id="default_table">
                    <thead>
                    <tr>
                        <th width="10px">
                            <input type='checkbox' id="defaultCheck"/>
                        </th>
                        <th>物品名称</th>
                        <th>递交日期</th>
                        <th>收藏者</th>
                        <th>审核状态</th>
                        <th>首页推荐</th>
                    </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var defTable;
    $(document).ready(function () {
        defTable = $('#default_table').DataTable({
            "ordering": false,
            "pagingType": "simple_numbers",
            "processing": true,
            "autoWidth": false,
            "serverSide": true,
            "ajax": {
                "url": "works/list",
                "type": "post",
                "data": function (data) {
                    data.keyword = $("#keyword").val();
                }
            },
            "language": {
                "url": "<%=basePath%>assets/global/plugins/datatables/cn.txt"
            },
            "createdRow": function (row, data, index) {
                $('td:eq(0)', row).html("<input type='checkbox' name='chx_default' value='" + data.id + "'/>");
            },
            "lengthMenu": [[5, 40, 60], [5, 40, 60]],
            "columns": [
                {"data": "id"},
                {
                    "data": "name",
                    "render": function (data,type,row) {
                        return  '<a href="javascript:;" onclick="goIntoWorkInfo('+row.id+')" >' + row.name + '</a>'
                    }
                },
                {
                    "data": "createDate", "type": "date",
                    "render": function (data) {
                        var date = new Date(data);
                        return date.Format("yyyy-MM-dd");
                    }
                },
                {"data": "collector"},
                {
                    "data": "status",
                    "render": function (data, type, row) {
                        if (data == 1) {
                            return '<a href="javascript:;" onclick="check(' + row.id + ',3)" class="btn btn-success btn-xs">通过</a>'
                                    + '<a href="javascript:;" onclick="check(' + row.id + ',2)" class="btn btn-danger btn-xs">不通过</a>';
                        } else if (data == 3) {
                            return "通过"
                        } else {
                            return "不通过";
                        }
                    }
                },
                {
                    "data": "slide",
                    "render": function (data, type, row) {
                        if (data == 0 || typeof data == 'undefined') {
                            return '<a href="javascript:;" onclick="slide(' + row.id + ',1)" class="btn btn-success btn-xs">轮播</a>'
                        } else {
                            return '<a href="javascript:;" onclick="slide(' + row.id + ',0)" class="btn btn-danger btn-xs">不轮播</a>';
                        }
                    }
                },

            ],
            "drawCallback": function (settings) {
                drawICheck('defaultCheck', 'chx_default');
            },
            "initComplete": function () {
                initSearchForm(null, "搜索字典类型");
            }
        });
    });

    function check(id, status) {
        if (confirm("确定审核？")) {
            $.post("/works/check", {id: id, status: status}, function () {
                refreshTable();
            });

        }

    }

    function slide(id, slide) {
        if (confirm("确定提交？")) {
            $.post("/works/slide", {id: id, slide: slide}, function () {
                refreshTable();
            });
        }
    }


    function refreshTable(toFirst) {
        //defaultTable.ajax.reload();
        if (toFirst) {//表格重绘，并跳转到第一页
            defTable.draw();
        } else {//表格重绘，保持在当前页
            defTable.draw(false);
        }
    }

    function goIntoWorkInfo(id){
        console.log(id);
        console.log($("#siteUrl").val()+"1111111111111");
        if(id !=null){
            window.open($("#siteUrl").val()+"works/detail/"+id,"_self");
        }
    }
</script>