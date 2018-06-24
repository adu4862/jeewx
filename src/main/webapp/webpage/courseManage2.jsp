<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="jquery,ui,easy,easyui,web">
    <meta name="description" content="easyui help you build your web page easily!">
    <title>课程管理</title>
    <link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/demo/demo.css">
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="http://www.w3cschool.cc/try/jeasyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        var url;

        function newUser() {
            $('#dlg').dialog('open').dialog('setTitle', 'New User');
            $('#fm').form('clear');
            url = 'modifyCourseController.do?addCourse';
            // var vals = $("#modifyAccountForm").serialize();
            // $.post("modifyCourseController.do?addCourse", vals, function (data) {
            //     // alert("前台取得值：\n" + vals+"\n后台取得值：\n"+data);
            //     window.location.reload();
            //     $('#dd').dialog('close');
            // });
        }

        function editUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $('#dlg').dialog('open').dialog('setTitle', 'Edit User');
                $('#fm').form('load', row);
                url = 'modifyCourseController.do?updateOrder&course_id='+row.course_id;
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

        function removeUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '是否确认删除该课程?', function (r) {
                    if (r) {
                        $.post('modifyCourseController.do?removeCourse', {course_id: row.course_id}, function (result) {
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


<table id="dg" title="课程管理" class="easyui-datagrid" style="width:1400px;height:750px"
       url="modifyCourseController.do?getAllCourse"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="course_id" width="50">课程ID</th>
        <th field="subject" width="50">课程名</th>
        <th field="class_name" width="50">年级</th>
        <th field="age" width="50">年龄跨度</th>
        <th field="time" width="50">时间</th>
        <th field="classroom" width="50">教室</th>
        <th field="teacher" width="50">老师</th>
        <th field="cost" width="50">学费</th>
        <th field="number" width="50">预招人数</th>
        <th field="status" width="50">状态</th>
        <th field="iamge_url" width="50">宣传图</th>
        <th field="information" width="50">报名须知</th>
        <th field="details" width="50">详情介绍</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:600px;height:280px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle">User Information</div>
    <form id="fm" method="post" novalidate>
        <div class="fitem">
            <label>课程名:</label>
            <input name="subject" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>年级:</label>
            <input name="class_name" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>年龄跨度:</label>
            <input name="age" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>时间:</label>
            <input name="time" class="easyui-validatebox" validType="true">
        </div>
        <div class="fitem">
            <label>教室:</label>
            <input name="classroom" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>老师:</label>
            <input name="teacher" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>学费:</label>
            <input name="cost"  validType="number">
        </div>
        <div class="fitem">
            <label>预招人数:</label>
            <input name="number" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>状态:</label>
            <input name="status" class="easyui-validatebox"  required="true">
        </div>
        <div class="fitem">
            <label>宣传图:</label>
            <input name="image_url" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>报名须知:</label>
            <input name="information" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>详情介绍:</label>
            <input name="details" class="easyui-validatebox"  required="true">
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">Save</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')">Cancel</a>
</div>
</body>
</html>