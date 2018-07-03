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
    <%--<link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/themes/default/easyui.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/themes/icon.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="http://www.w3cschool.cc/try/jeasyui/demo/demo.css">--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <link rel="stylesheet" type="text/css" href="webpage/demo.css">
    <link type="text/css" rel="stylesheet" href="plug-in/weixin/css/jquery.fileupload.css"/>
    <script type="text/javascript" src="plug-in/weixin/js/jquery.fileupload.js"></script>
    <script type="text/javascript" src="plug-in/weixin/js/jquery.fileupload-process.js"></script>
    <script type="text/javascript" src="plug-in/weixin/js/jquery.fileupload-image.js"></script>


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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/export.js"></script>
    <script type="text/javascript">
        var url;

        function newUser() {
            $('#dlg').dialog('open').dialog('setTitle', '新增');
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
                $('#dlg').dialog('open').dialog('setTitle', '编辑');
                $('#fm').form('load', row);
                url = 'modifyCourseController.do?updateOrder&course_id=' + row.course_id;
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

        // $(function () {
        //     'use strict';
        //     // Change this to the location of your server-side upload handler:
        //     var url = 'weixinArticleController.do?upload',
        //         uploadButton = $('<button/>')
        //             .addClass('btn btn-primary')
        //             .prop('disabled', true)
        //             .text('上传中...')
        //             .on('click', function () {
        //                 var $this = $(this), data = $this.data();
        //                 $this.off('click').text('正在上传...').on('click', function () {
        //                     $this.remove();
        //                     data.abort();
        //                 });
        //                 data.submit().always(function () {
        //                     $this.remove();
        //                 });
        //             });
        //     $('#fileupload').fileupload({
        //         url: url,
        //         dataType: 'json',
        //         autoUpload: false,
        //         acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        //         maxFileSize: 2000000, // 2 MB
        //         disableImageResize: /Android(?!.*Chrome)|Opera/
        //             .test(window.navigator.userAgent),
        //         previewMaxWidth: 290,
        //         previewMaxHeight: 160,
        //         previewCrop: true
        //     }).on('fileuploadadd', function (e, data) {
        //         $("#files").text("");
        //         data.context = $('<div/>').appendTo('#files');
        //         $.each(data.files, function (index, file) {
        //             //var node = $('<p/>').append($('<span/>').text(file.name));
        //             //fileupload
        //             var node = $('<p/>');
        //             if (!index) {
        //                 node.append('<br>').append(uploadButton.clone(true).data(data));
        //             }
        //             node.appendTo(data.context);
        //         });
        //     }).on('fileuploadprocessalways', function (e, data) {
        //         var index = data.index,
        //             file = data.files[index],
        //             node = $(data.context.children()[index]);
        //         if (file.preview) {
        //             node.prepend('<br>').prepend(file.preview);
        //         }
        //         if (file.error) {
        //             node
        //                 .append('<br>')
        //                 .append($('<span class="text-danger"/>').text(file.error));
        //         }
        //         if (index + 1 === data.files.length) {
        //             data.context.find('button')
        //                 .text('上传')
        //                 .prop('disabled', !!data.files.error);
        //         }
        //     }).on('fileuploadprogressall', function (e, data) {
        //         var progress = parseInt(data.loaded / data.total * 100, 10);
        //         $('#progress .progress-bar').css(
        //             'width',
        //             progress + '%'
        //         );
        //     }).on('fileuploaddone', function (e, data) {
        //         console.info(data);
        //         var file = data.files[0];
        //         //var delUrl = "<a class=\"js_removeCover\" onclick=\"return false;\" href=\"javascript:void(0);\">删除</a>";
        //         $("#imgName").text("").append(file.name);
        //         $("#progress").hide();
        //         var d = data.result;
        //         if (d.success) {
        //             var link = $('<a>').attr('target', '_blank').prop('href', d.attributes.viewhref);
        //             $(data.context.children()[0]).wrap(link);
        //             console.info(d.attributes.viewhref);
        //             $("#image_url").val(d.attributes.url);
        //         } else {
        //             var error = $('<span class="text-danger"/>').text(d.msg);
        //             $(data.context.children()[0]).append('<br>').append(error);
        //         }
        //     }).on('fileuploadfail', function (e, data) {
        //         $.each(data.files, function (index, file) {
        //             var error = $('<span class="text-danger"/>').text('File upload failed.');
        //             $(data.context.children()[index])
        //                 .append('<br>')
        //                 .append(error);
        //         });
        //     }).prop('disabled', !$.support.fileInput)
        //         .parent().addClass($.support.fileInput ? undefined : 'disabled');
        // });


        //检查图片的格式是否正确,同时实现预览
        function setImagePreview(obj, localImagId, imgObjPreview) {

            var formData = new FormData();
            formData.append('file', $('#idFile')[0].files[0]);  //添加图片信息的参数
            formData.append('sizeid', 123);  //添加其他参数
            $.ajax({
                url: 'weixinArticleController.do?upload',
                type: 'POST',
                dataType: 'json',
                cache: false, //上传文件不需要缓存
                data: formData,
                processData: false, // 告诉jQuery不要去处理发送的数据
                contentType: false, // 告诉jQuery不要去设置Content-Type请求头
                success: function (data) {
                    var imgUrl = data.attributes.url;
                    // $('#image_url').val(imgUrl);
                    $("#image_url").val(imgUrl);
                    // var rs = eval("("+data+")");
                    // if(rs.state==1){
                    //     tipTopShow('上传成功！');
                    // }else{
                    //     tipTopShow(rs.msg);
                    // }
                },
                error: function (data) {
                    tipTopShow("上传失败");
                }
            })
            var array = new Array('gif', 'jpeg', 'png', 'jpg', 'bmp'); //可以上传的文件类型
            if (obj.value == '') {
                $.messager.alert("让选择要上传的图片!");
                return false;
            }
            else {
                var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用
                ////布尔型变量
                var isExists = false;

                //循环判断图片的格式是否正确
                for (var i in array) {
                    if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
                        //图片格式正确之后，根据浏览器的不同设置图片的大小
                        if (obj.files && obj.files[0]) {
                            //火狐下，直接设img属性
                            imgObjPreview.style.display = 'block';
                            imgObjPreview.style.width = '400px';
                            imgObjPreview.style.height = '400px';
                            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                            imgObjPreview.src = window.URL.createObjectURL(obj.files[0]);
                        }
                        else {
                            //IE下，使用滤镜
                            obj.select();
                            var imgSrc = document.selection.createRange().text;
                            //必须设置初始大小
                            localImagId.style.width = "400px";
                            localImagId.style.height = "400px";
                            //图片异常的捕捉，防止用户修改后缀来伪造图片
                            try {
                                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                                localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader=").src = imgSrc;
                            }
                            catch (e) {
                                $.messager.alert("您上传的图片格式不正确，请重新选择!");
                                return false;
                            }
                            imgObjPreview.style.display = 'none';
                            document.selection.empty();
                        }
                        isExists = true;
                        return true;
                    }
                }
                if (isExists == false) {
                    $.messager.alert("上传图片类型不正确!");
                    return false;
                }
                return false;
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
        <th field="class_type_name" width="50">班级类型</th>
        <th field="subject" width="50">课程名</th>
        <th field="class_name" width="50">年级</th>
        <th field="age" width="50">年龄跨度</th>
        <th field="time" width="50">时间</th>
        <th field="classroom" width="50">教室</th>
        <th field="teacher" width="50">老师</th>
        <th field="cost" width="50">学费</th>
        <th field="number" width="50">预招人数</th>
        <th field="status" width="50">状态</th>
        <th field="image_url" width="50">宣传图</th>
        <th field="information" width="50">报名须知</th>
        <th field="details" width="50">详情介绍</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">编辑</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="toExcel()">导出EXCEL</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:600px;height:680px;padding:10px 20px"
     closed="true" buttons="#dlg-buttons">
    <div class="ftitle"></div>
    <form id="fm" method="post" novalidate>
        <div class="fitem">
            <label>班级分类:</label>
            <select class="easyui-combobox" id="class_type" name="class_type"  style="line-height:26px;border:1px solid #ccc">
                <option value="1">艺术类(上午)</option>
                <option value="2"> 艺术类(下午)</option>
                <option value="3"> 文化类（上午）</option>
                <option value="4">文化类(下午)</option>
            </select>
        </div>
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
            <input name="time" class="easyui-validatebox" required="true">
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
            <input name="cost" validType="number" required="true">
        </div>
        <div class="fitem">
            <label>预招人数:</label>
            <input name="number" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>状态:</label>
            <input name="status" class="easyui-validatebox" required="true">
        </div>

        <input name="image_url" id="image_url" type="hidden">

        <div class="fitem">
            <label>报名须知:</label>
            <input name="information" class="easyui-validatebox" required="true">
        </div>
        <div class="fitem">
            <label>详情介绍:</label>
            <input name="details" class="easyui-validatebox">
        </div>

        <div>
            选择宣传图:<input id="idFile" style="width:224px" runat="server" name="pic"
                        onchange="javascript:setImagePreview(this,localImag,preview);" type="file"/>
        </div>
        预　　览:
        <div id="localImag">
            <%--预览，默认图片--%>
            <img id="preview" alt="预览图片" onclick="over(preview,divImage,imgbig);" src="img/5691.jpg"
                 style="width: 400px; height: 400px;"/>
        </div>

    </form>
</div>
<div id="dlg-buttons">
    <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
    <a href="#" class="easyui-linkbutton" iconCls="icon-cancel"
       onclick="javascript:$('#dlg').dialog('close')">取消</a>
</div>
</body>
</html>