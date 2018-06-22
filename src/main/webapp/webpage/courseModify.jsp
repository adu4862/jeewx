<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link rel="icon" href="/control/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/control/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/easyui.css">
<link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/main.css">
<script src="http://my-photos.changs1992.cn/jquery.min.js"></script>
<script type="text/javascript" src="http://my-photos.changs1992.cn/jquery.easyui.min.js"></script>
<script type="text/javascript" src="http://my-photos.changs1992.cn/easyui-lang-zh_CN.js"></script>
<script src="http://my-photos.changs1992.cn/sea.js"></script>
<script type="text/javascript">
    var CONTEXT_PATH = '/control';
    var CONTEXT_URL = 'http://10.0.2.12:80/control/';
    var i18n_language = 'zh_CN';
    var DLS_URL = "http://10.0.2.12:8008/dls/download";
    var IS_CCE = "1";
    var USER_TYPE = "6";

    seajs.config({
        base: "http://10.0.2.12:80/control/js/module/",
        preload: ["formatter"]
    });

    if (i18n_language == "") {
        i18n_language = "zh_CN";
    }
    seajs.use(["lang/" + i18n_language, "formatter", "dialog", "page.condition"]);
</script>
<!DOCTYPE html>
<html>
<header>
</header>
<body class="m-iform">
<div class="iform-inner">
    <form id="modifyAccountForm" method="post">
        <table class="m-form single-col">
            <tr>
                <th style="width:6em"><label>*账号类型:</label></th>
                <td>
                    <select class="easyui-combobox" name="userTypeName" data-options="required:true,readonly:true"
                            style="height:26px; width:100%;"></select>
                </td>
            </tr>
            <tr>
                <th><label>*姓名:</label></th>
                <td><input class="easyui-textbox" name="realName" style="height:26px; width:100%;"
                           data-options="required:true,validType:{name,maxLength:[32]},tipPosition:'bottom'"></td>
            </tr>
            <tr>
                <th><label>邮箱:</label></th>
                <td><input class="easyui-textbox" name="loginEmail" style="height:26px; width:100%;"
                           data-options="validType:{email:null,maxLength:[32]},tipPosition:'bottom'"></td>
            </tr>
            <tr>
                <th><label>手机号码:</label></th>
                <td><input class="easyui-textbox" name="loginMobile" style="height:26px; width:100%;"
                           data-options="validType:{telephone:null},tipPosition:'bottom'"></td>
            </tr>
            <tr>
                <th><label>身份证号码:</label></th>
                <td><input class="easyui-textbox" name="idCardNo" style="height:26px; width:100%;"
                           data-options="validType:{idCardNo:null},tipPosition:'bottom'"></td>
            </tr>
        </table>
        <div class="ifrom-btns">
            <a class="u-btn blue btn_save">保存</a>
            <a class="u-btn white btn_cancel">取消</a>
        </div>
        <input type="hidden" name="userType">
        <input type="hidden" name="userId">
    </form>
</div>
</body>
<script type="text/javascript">
    $(function () {
        seajs.use("applicationcenter/account/modifyAccount", function (modifyAccount) {
            modifyAccount.initDialog({
                modify_account_success: '修改账号成功！',
                modify_account_failed: '修改账号失败！'
            });
        });
    });
</script>
</html>