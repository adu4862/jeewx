<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>订单管理</title>
    <%--<link href="plug-in/login/css/zice.style.css" rel="stylesheet" type="text/css" />--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <link rel="stylesheet" type="text/css" href="webpage/demo.css">


    <style type="text/css">
        #fm {
            margin: 0;
            padding: 10px 30px;
        }

        .ftitle {
            font-size: 14px;
            font-weight: bold;
            color: #666;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .fitem {
            margin-bottom: 5px;
        }

        .fitem label {
            display: inline-block;
            width: 80px;
        }
    </style>
    <script type="text/javascript" src="webpage/jquery.min.js"></script>
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>--%>
    <script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script>
    <%--<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>--%>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
    <script type="text/javascript">
        var url;

        function newUser() {
            $('#dlg').dialog('open').dialog('setTitle', 'New User');
            $('#fm').form('clear');
            url = 'modifyOrderController.do?addOrder';

        }

        function editUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $('#dlg').dialog('open').dialog('setTitle', 'Edit User');
                $('#fm').form('load', row);
                url = 'modifyOrderController.do?updateOrder&orderId=' + row.orderId;
            }
        }

        function saveUser() {
            $('#fm').form('submit', {
                url: url,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.success) {
                        $('#dlg').dialog('close');		// close the dialog
                        $('#dg').datagrid('reload');	// reload the user data
                    } else {
                        $.messager.show({
                            title: 'Error',
                            msg: result.msg
                        });
                    }
                }
            });
        }

        $.extend($.fn.datagrid.methods, {
            toExcel: function (jq, filename) {
                return jq.each(function () {
                    var uri = 'data:application/vnd.ms-excel;base64,'
                        ,
                        template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
                        , base64 = function (s) {
                            return window.btoa(unescape(encodeURIComponent(s)))
                        }
                        , format = function (s, c) {
                            return s.replace(/{(\w+)}/g, function (m, p) {
                                return c[p];
                            })
                        }

                    var alink = $('<a style="display:none"></a>').appendTo('body');
                    var view = $(this).datagrid('getPanel').find('div.datagrid-view');

                    var table = view.find('div.datagrid-view2 table.datagrid-btable').clone();
                    var tbody = table.find('>tbody');
                    view.find('div.datagrid-view1 table.datagrid-btable>tbody>tr').each(function (index) {
                        $(this).clone().children().prependTo(tbody.children('tr:eq(' + index + ')'));
                    });

                    var head = view.find('div.datagrid-view2 table.datagrid-htable').clone();
                    var hbody = head.find('>tbody');
                    view.find('div.datagrid-view1 table.datagrid-htable>tbody>tr').each(function (index) {
                        $(this).clone().children().prependTo(hbody.children('tr:eq(' + index + ')'));
                    });
                    hbody.prependTo(table);

                    var ctx = {worksheet: name || 'Worksheet', table: table.html() || ''};
                    alink[0].href = uri + base64(format(template, ctx));
                    alink[0].download = filename;
                    alink[0].click();
                    alink.remove();
                })
            }
        });

        function toExcel() {
            $("#dg").datagrid('toExcel', "订单统计表.xls");
        }

        function searchOrder() {
            var val = $('#class_type').combobox("getValue");   // 获取值
            // alert(val);
            $('#dg').datagrid('load', {
                course_id: $('#course_id').val(),
                name: $('#name').val(),
                subject: $('#subject').val(),
                startDate: $('#startDate').val(),
                endDate: $('#endDate').val(),
                class_type :val
            });


        }

        function removeUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '是否确认删除该订单?', function (r) {
                    if (r) {
                        $.post('modifyOrderController.do?removeOrder', {orderId: row.orderId}, function (result) {
                            if (result.success) {
                                $('#dg').datagrid('reload');	// reload the user data
                            } else {
                                $.messager.show({	// show error message
                                    title: 'Error',
                                    msg: result.msg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }
    </script>


</head>
<body>


<table id="dg" title="订单管理" class="easyui-datagrid" style="width:1400px;height:750px"
       url="modifyOrderController.do?getAllOrder"
       pageSize="50"
       pageList="[50, 100, 200, 300, 500, 1000]"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="course_id" width="50">课程ID</th>
        <th field="subject" width="50">报名班级</th>
        <th field="name" width="50">姓名</th>

        <th field="sex" width="50">性别</th>

        <%--<th field="born" width="50">出生年月</th>--%>
        <th field="age" width="50">年龄</th>
        <th field="school" width="50">就读学校</th>
        <th field="grade" width="50">年级</th>
        <th field="hobby" width="50">兴趣</th>
        <th field="phone" width="50">电话</th>
        <th field="address" width="50">地址</th>
        <th field="father_name" width="50">家长名字</th>
        <th field="father_phone" width="50">家长电话</th>

        <%--<th field="mother_phone" width="50">母亲电话</th>--%>
        <%--<th field="openId" width="50">openId</th>--%>
        <th field="cost" width="50">费用</th>
        <th field="orderId" width="50">订单号</th>
        <%--<th field="payed" width="50">是否支付</th>--%>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>--%>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toExcel()">导出EXCEL</a>

    <div id="tb" style="padding:3px">
        <span>班级分类:</span>
        <select class="easyui-combobox" id="class_type" name="class_type"  style="line-height:26px;border:1px solid #ccc">
            <option value="0">全部 </option>
            <option value="1">艺术类(上午)</option>
            <option value="2"> 艺术类(下午)</option>
            <option value="3"> 文化类（上午）</option>
            <option value="4">文化类(下午)</option>
        </select>


        <span>课程ID:</span>
        <input id="course_id" style="line-height:26px;border:1px solid #ccc">
        <span>姓名:</span>
        <input id="name" style="line-height:26px;border:1px solid #ccc">
        <span>报名班级:</span>
        <input id="subject" style="line-height:26px;border:1px solid #ccc">
        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="searchOrder() ">查询</a>
        <span>日期查询:</span>
        <input type="text" name="datefilter" value=""/>
        <input type="hidden" name="startDate" id="startDate">
        <input type="hidden" name="endDate" id="endDate">

    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" novalidate>
        <div class="fitem">
            <label>姓名:</label>
            <input name="name" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>年龄:</label>
            <input name="age" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>性别:</label>
            <input name="sex" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>出生年月:</label>
            <input name="born" class="easyui-validatebox" validType="true">
        </div>
        <div class="fitem">
            <label>就读学校:</label>
            <input name="school" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>年级:</label>
            <input name="grade" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>兴趣:</label>
            <input name="hobby" validType="number">
        </div>
        <div class="fitem">
            <label>电话:</label>
            <input name="phone" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>地址:</label>
            <input name="address" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>家长名字:</label>
            <input name="father_name" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>家长电话:</label>
            <input name="father_phone" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>母亲名字:</label>
            <input name="mother_name" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>openId:</label>
            <input name="openId" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>费用:</label>
            <input name="cost" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>订单号:</label>
            <input name="orderId" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>是否支付:</label>
            <input name="payed" class="easyui-validatebox" required="true">
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
</body>
<script type="text/javascript">

    $(function () {
        var myoptions = {
            applyClass: 'btn-sm btn-success',
            cancelClass: 'btn-sm btn-default',
            locale: {
                applyLabel: '确认',
                cancelLabel: '清空',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                firstDay: 1,
                daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                    '七月', '八月', '九月', '十月', '十一月', '十二月'],
            },
            ranges: {

                //'最近1小时': [moment().subtract('hours',1), moment()],
                '今日': [moment(), moment()],
                '昨日': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')],
                '最近7日': [moment().subtract(6, 'days'), moment()],
                '最近30日': [moment().subtract(29, 'days'), moment()],
                '本月': [moment().startOf("month"), moment().endOf("month")],
                '上个月': [moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month")]
            },
            opens: 'right',    // 日期选择框的弹出位置
            separator: '-',
            showWeekNumbers: false,     // 是否显示第几周
            format: 'MM/DD/YYYY'
        }
        $('input[name="datefilter"]').daterangepicker(myoptions);

        // $('input[name="datefilter"]').daterangepicker({
        //     autoUpdateInput: false,
        //     locale: {
        //         cancelLabel: 'Clear'
        //     }
        // });

        $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
            // $(this).val(picker.startDate + ' -' + picker.endDate);
            $('#startDate').val(picker.startDate + '');
            $('#endDate').val('' + picker.endDate);
            searchOrder();
            // $.ajax({
            //     url: 'modifyOrderController.do?getAllOrder',
            //     type: 'POST',
            //     dataType: 'json',
            //     cache: false, //上传文件不需要缓存
            //     data: {
            //             course_id: $('#course_id').val(),
            //             name: $('#name').val(),
            //             subject: $('#subject').val(),
            //             startDate:picker.startDate,
            //             endDate:picker.endDate
            //     },
            //     processData: false, // 告诉jQuery不要去处理发送的数据
            //     contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            //     success: function (data) {
            //
            //
            //     },
            //     error: function (data) {
            //     }
            // })

        });
        $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {

        });

    });
</script>
</html>