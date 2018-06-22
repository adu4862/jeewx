<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="panel-fit">
<head>
    <link rel="icon" href="/control/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/control/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/main.css">
    <script src="http://my-photos.changs1992.cn/jquery.min.js"></script>
    <script type="text/javascript" src="http://my-photos.changs1992.cn/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="http://my-photos.changs1992.cn/easyui-lang-zh_CN.js"></script>
    <script src="http://my-photos.changs1992.cn/sea.js"></script>


</head>
<body class="m-innerbody easyui-layout layout panel-noscroll">
<header>
</header>
<div class="panel window panel-htop" id="panel window panel-htop"
     style="display: block; width: 500px; left: 525px; top: 477px; z-index: 9008;visibility: hidden;">
    <div class="panel-header panel-header-noborder window-header" style="width: 480px;">
        <div class="panel-title">修改账号信息</div>
        <div class="panel-tool"><a href="javascript:;" class="panel-tool-close"></a></div>
    </div>
    <div id="dialog" class="m-iformbox panel-body panel-body-noborder window-body" title=""
         style="width: 500px; height: 360px;">
        <iframe src="${frameUrl}"></iframe>
    </div>
</div>

<div class="panel layout-panel layout-panel-north panel-htop" style="width: 1600px; left: 0px; top: 0px;">
    <div data-options="region:'north',border:false" style="padding: 20px; width: 1400px; height: 106px;" title=""
         class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <form id="searchForm">
            <table class="m-form">
                <tbody>
                <tr>
                    <th><label>账号姓名</label></th>
                    <td>
                        <input class="easyui-textbox textbox-f" style="height: 30px; width: 150px; display: none;"
                               textboxname="realName"><span class="textbox" style="width: 148px; height: 28px;"><input
                            id="_easyui_textbox_input1" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 140px;"><input
                            type="hidden" class="textbox-value" name="realName" value=""></span>
                    </td>
                    <th><label>账号ID</label></th>
                    <td><input class="easyui-textbox textbox-f" style="height: 30px; width: 150px; display: none;"
                               textboxname="userId"><span class="textbox" style="width: 148px; height: 28px;"><input
                            id="_easyui_textbox_input2" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 140px;"><input
                            type="hidden" class="textbox-value" name="userId" value=""></span></td>
                    <th><label>账号类型</label></th>
                    <td>
                        <select id="account_userType_id" class="easyui-combobox combobox-f combo-f textbox-f"
                                style="height: 30px; width: 150px; display: none;" textboxname="userType"
                                comboname="userType">
                        </select><span class="textbox combo" style="width: 148px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input10"
                                                                                 type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 122px;"><input
                            type="hidden" class="textbox-value" name="userType" value=""></span>
                    </td>
                    <th><label>注册日期</label></th>
                    <td>
                        <input id="register_time" data-options="editable: false"
                               class="easyui-datebox datebox-f combo-f textbox-f"
                               style="height: 30px; width: 150px; display: none;" textboxname="registerTime"
                               comboname="registerTime"><span class="textbox combo datebox"
                                                              style="width: 148px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input7" type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly textbox-prompt"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 122px;"><input
                            type="hidden" class="textbox-value" name="registerTime" value=""></span>
                    </td>
                    <th><label>登录日期</label></th>
                    <td>
                        <input id="login_date" data-options="editable: false"
                               class="easyui-datebox datebox-f combo-f textbox-f"
                               style="height: 30px; width: 150px; display: none;" textboxname="loginDate"
                               comboname="loginDate"><span class="textbox combo datebox"
                                                           style="width: 148px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input8" type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly textbox-prompt"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 122px;"><input
                            type="hidden" class="textbox-value" name="loginDate" value=""></span>
                    </td>
                </tr>
                <tr>
                    <th><label>登录名</label></th>
                    <td><input class="easyui-textbox textbox-f" style="height: 30px; width: 150px; display: none;"
                               textboxname="loginName"><span class="textbox" style="width: 148px; height: 28px;"><input
                            id="_easyui_textbox_input3" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 140px;"><input
                            type="hidden" class="textbox-value" name="loginName" value=""></span></td>
                    <th><label>是否锁定</label></th>
                    <td>
                        <select id="account_isLocked_id" class="easyui-combobox combobox-f combo-f textbox-f"
                                style="height: 30px; width: 150px; display: none;" textboxname="isLocked"
                                comboname="isLocked">
                        </select><span class="textbox combo" style="width: 148px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input9" type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 122px;"><input
                            type="hidden" class="textbox-value" name="isLocked" value=""></span>
                    </td>
                    <th><label>所在机构</label></th>
                    <td><input class="easyui-textbox textbox-f" style="height: 30px; width: 150px; display: none;"
                               textboxname="orgName"><span class="textbox" style="width: 148px; height: 28px;"><input
                            id="_easyui_textbox_input4" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 140px;"><input
                            type="hidden" class="textbox-value" name="orgName" value=""></span></td>
                    <th>&nbsp;</th>
                    <td>
                        <a class="u-btn blue" id="search-btn"><i class="ico ico-search"></i>查询</a>
                        <a class="u-btn white" id="reset-btn"><i class="ico ico-del"></i>清除</a>
                    </td>
                    <th>&nbsp;</th>
                    <td>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
<div class="panel layout-panel layout-panel-center panel-htop" style="width: 1600px; left: 0px; top: 146px;">
    <div data-options="region:'center',border:false" style="padding: 0px 20px 20px; width: 1400px; height: 1020px;"
         title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <!-- 数据表格 -->
        <div class="m-datagrid panel-noscroll">
            <div class="panel datagrid panel-htop easyui-fluid" style="width: 1400px;">
                <div class="datagrid-wrap panel-body panel-body-noheader" title=""
                     style="width: 1600px; height: 1018px;">
                    <div class="m-toolbar datagrid-toolbar" id="account_toolbar_id">


                        <a id="modify_id" class="u-toolbtn"><i class="ico ico-modify"></i>修改课程</a>

                        <a id="insert_id" class="u-toolbtn"><i class="ico ico-modify"
                                                               href="javascript:insertCourse();"></i>添加课程</a>
                        <a id="delete_id" class="u-toolbtn"><i class="ico ico-modify"></i>删除课程</a>
                    </div>
                    <div class="datagrid-view" style="width: 1600px; height: 952px;">
                        <div class="datagrid-view1" style="width: 0px;">
                            <div class="datagrid-header" style="width: 0px; height: 24px;">
                                <div class="datagrid-header-inner" style="display: block;">
                                    <table class="datagrid-htable" border="0" cellspacing="0" cellpadding="0"
                                           style="height: 25px;">
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="datagrid-body" style="width: 0px; margin-top: 0px; height: 927px;">
                                <div class="datagrid-body-inner"></div>
                            </div>
                            <div class="datagrid-footer" style="width: 0px;">
                                <div class="datagrid-footer-inner" style="display: none;"></div>
                            </div>
                        </div>
                        <div class="datagrid-view2" style="width: 1600px;">
                            <div class="datagrid-header" style="width: 1600px; height: 24px;">
                                <div class="datagrid-header-inner" style="display: block;">
                                    <table class="datagrid-htable" border="0" cellspacing="0" cellpadding="0"
                                           style="height: 25px;">
                                        <tbody>
                                        <tr class="datagrid-header-row">
                                            <td field="ck">
                                                <div class="datagrid-header-check"><input type="checkbox"></div>
                                            </td>
                                            <td field="userId">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>课程ID</span><span
                                                        class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="realName">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>课程名</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="loginName" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>年级</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="orgName" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>时间</span><span
                                                        class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="userTypeName" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>教室</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="statusName" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName"
                                                     style=""><span>年龄跨度</span><span class="datagrid-sort-icon"></span>
                                                </div>
                                            </td>
                                            <td field="loginEmail" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>老师</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="loginMobile" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>学费</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="isLocked">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>预招人数</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="currentLoginTime">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>状态</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="lastLoginTime">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>宣传图</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="lastLoginTime">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>报名须知</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="lastLoginTime">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>详情介绍</span><span class="datagrid-sort-icon"></span></div>
                                            </td>

                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="datagrid-body" style="width: 1600px; margin-top: 0px; height: 927px;">
                                <table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                    <c:forEach items="${courseList}" var="user">
                                        <tr id="datagrid-row-r1-2-0" datagrid-row-index="0" class="datagrid-row">
                                            <td field="ck">
                                                <div style="" class="datagrid-cell-check"><input type="checkbox"
                                                                                                 name="ck"
                                                                                                 value=""></div>
                                            </td>
                                            <td field="course_id">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="DYDEV01600000000000">${user.course_id}</span></div>
                                            </td>
                                            <td field="subject">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="DYDEV01600000000000">${user.subject}</span></div>
                                            </td>
                                            <td field="class_name">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="js001">${user.class_name}</span></div>
                                            </td>
                                            <td field="time">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="js001">${user.time}</span></div>
                                            </td>
                                            <td field="classroom">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="大洋学校">${user.classroom}</span></div>
                                            </td>
                                            <td field="age">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName"><span
                                                        title="教师">${user.age}</span></div>
                                            </td>
                                            <td field="teacher">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="正常">${user.teacher}</span></div>
                                            </td>
                                            <td field="cost">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="">${user.cost}</span></div>
                                            </td>
                                            <td field="number">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName"><span
                                                        title="">${user.number}</span></div>
                                            </td>
                                            <td field="status">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName">
                                                    <span title="否">${user.status}</span></div>
                                            </td>
                                            <td field="iamge_url">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName"><span
                                                        title="2018-06-21 13:51:32">${user.iamge_url}</span></div>
                                            </td>
                                            <td field="information">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName"><span
                                                        title="2018-06-21 11:50:07">${user.information}</span></div>
                                            </td>
                                            <td field="details">
                                                <div style="height:auto;"
                                                     class="datagrid-cell datagrid-cell-c1-loginName"><span
                                                        title="2018-06-06 14:17:05">${user.details}</span></div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="datagrid-footer" style="width: 1600px;">
                                <div class="datagrid-footer-inner" style="display: none;"></div>
                            </div>
                        </div>
                        <table id="account-Manager-list" class="easyui-datagrid datagrid-f" title=""
                               data-options="border:true,emptyMsg:'暂无数据',fit:true,rownumbers:false,pagination:true,pageSize: 20,url:'',method:'post',toolbar:'#account_toolbar_id'"
                               style="display: none;">
                            <thead>
                            <tr>
                                <th data-options="field:'ck',checkbox:true"></th>
                                <th data-options="field:'userId',formatter:parent.formatCellTooltip" width="150"
                                    sortable="true">账号ID
                                </th>
                                <th data-options="field:'realName',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">账号姓名
                                </th>
                                <th data-options="field:'loginName',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">登录名
                                </th>
                                <th data-options="field:'orgName',formatter:parent.formatCellTooltip" width="120"
                                    sortable="true">所在机构
                                </th>
                                <th data-options="field:'userTypeName',formatter:parent.formatCellTooltip" width="70"
                                    sortable="true">账号类型
                                </th>
                                <th data-options="field:'statusName',formatter:parent.formatCellTooltip" width="50"
                                    sortable="true">状态
                                </th>
                                <th data-options="field:'loginEmail',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">邮箱
                                </th>
                                <th data-options="field:'loginMobile',formatter:parent.formatCellTooltip" width="90"
                                    sortable="true">手机号码
                                </th>
                                <th data-options="field:'isLocked',formatter:parent.formatYesOrNo" width="70"
                                    sortable="true">是否锁定
                                </th>
                                <th data-options="field:'currentLoginTime',formatter:parent.formatDateTimeSec"
                                    width="130" sortable="true">最近登录时间
                                </th>
                                <th data-options="field:'lastLoginTime',formatter:parent.formatDateTimeSec" width="130"
                                    sortable="true">上次登录时间
                                </th>
                                <th data-options="field:'lastModifyTime',formatter:parent.formatDateTimeSec" width="130"
                                    sortable="true">更新日期
                                </th>
                            </tr>
                            </thead>
                        </table>
                        <style type="text/css" easyui="true">
                            .datagrid-header-rownumber {
                                width: 29px
                            }

                            .datagrid-cell-rownumber {
                                width: 29px
                            }

                            .datagrid-cell-c1-userId {
                                width: 141px
                            }

                            .datagrid-cell-c1-realName {
                                width: 91px
                            }

                            .datagrid-cell-c1-loginName {
                                width: 91px
                            }

                            .datagrid-cell-c1-orgName {
                                width: 111px
                            }

                            .datagrid-cell-c1-userTypeName {
                                width: 61px
                            }

                            .datagrid-cell-c1-statusName {
                                width: 41px
                            }

                            .datagrid-cell-c1-loginEmail {
                                width: 91px
                            }

                            .datagrid-cell-c1-loginMobile {
                                width: 81px
                            }

                            .datagrid-cell-c1-isLocked {
                                width: 61px
                            }

                            .datagrid-cell-c1-currentLoginTime {
                                width: 121px
                            }

                            .datagrid-cell-c1-lastLoginTime {
                                width: 121px
                            }

                            .datagrid-cell-c1-lastModifyTime {
                                width: 121px
                            }
                        </style>
                    </div>
                    <div class="datagrid-pager pagination">
                        <table cellspacing="0" cellpadding="0" border="0">
                            <tbody>
                            <tr>
                                <td><select class="pagination-page-list">
                                    <option>10</option>
                                    <option>20</option>
                                    <option>30</option>
                                    <option>40</option>
                                    <option>50</option>
                                </select></td>
                                <td>
                                    <div class="pagination-btn-separator"></div>
                                </td>
                                <td><a href="javascript:;"
                                       class="l-btn l-btn-small l-btn-plain l-btn-disabled l-btn-plain-disabled"
                                       group="" id=""><span class="l-btn-left l-btn-icon-left"><span
                                        class="l-btn-text l-btn-empty">&nbsp;</span><span
                                        class="l-btn-icon pagination-first">&nbsp;</span></span></a></td>
                                <td><a href="javascript:;"
                                       class="l-btn l-btn-small l-btn-plain l-btn-disabled l-btn-plain-disabled"
                                       group="" id=""><span class="l-btn-left l-btn-icon-left"><span
                                        class="l-btn-text l-btn-empty">&nbsp;</span><span
                                        class="l-btn-icon pagination-prev">&nbsp;</span></span></a></td>
                                <td>
                                    <div class="pagination-btn-separator"></div>
                                </td>
                                <td><span style="padding-left:6px;">第</span></td>
                                <td><input class="pagination-num" type="text" value="1" size="2"></td>
                                <td><span style="padding-right:6px;">共1页</span></td>
                                <td>
                                    <div class="pagination-btn-separator"></div>
                                </td>
                                <td><a href="javascript:;"
                                       class="l-btn l-btn-small l-btn-plain l-btn-disabled l-btn-plain-disabled"
                                       group="" id=""><span class="l-btn-left l-btn-icon-left"><span
                                        class="l-btn-text l-btn-empty">&nbsp;</span><span
                                        class="l-btn-icon pagination-next">&nbsp;</span></span></a></td>
                                <td><a href="javascript:;"
                                       class="l-btn l-btn-small l-btn-plain l-btn-disabled l-btn-plain-disabled"
                                       group="" id=""><span class="l-btn-left l-btn-icon-left"><span
                                        class="l-btn-text l-btn-empty">&nbsp;</span><span
                                        class="l-btn-icon pagination-last">&nbsp;</span></span></a></td>
                                <td>
                                    <div class="pagination-btn-separator"></div>
                                </td>
                                <td><a href="javascript:;" class="l-btn l-btn-small l-btn-plain" group="" id=""><span
                                        class="l-btn-left l-btn-icon-left"><span
                                        class="l-btn-text l-btn-empty">&nbsp;</span><span
                                        class="l-btn-icon pagination-load">&nbsp;</span></span></a></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="pagination-info">显示1到8,共8记录</div>
                        <div style="clear:both;"></div>
                    </div>
                </div>
            </div>
            <!-- 表格工具栏 -->

            <!-- /表格工具栏 -->
        </div>
        <!-- /数据表格 -->
    </div>
</div>
<script type="javascript">
    function insertCourse() {
        $("#panel window panel-htop").style.visibility = visible;
    }
</script>

<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="">
        <div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">请选择</div>
        <div id="_easyui_combobox_i2_1" class="combobox-item">学生</div>
        <div id="_easyui_combobox_i2_2" class="combobox-item">教师</div>
        <div id="_easyui_combobox_i2_3" class="combobox-item">家长</div>
        <div id="_easyui_combobox_i2_4" class="combobox-item">大洋员工</div>
        <div id="_easyui_combobox_i2_5" class="combobox-item">管理员</div>
    </div>
</div>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="">
        <div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">请选择</div>
        <div id="_easyui_combobox_i1_1" class="combobox-item">是</div>
        <div id="_easyui_combobox_i1_2" class="combobox-item">否</div>
    </div>
</div>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;">
        <div class="datebox-calendar-inner">
            <div class="calendar" style="width: 176px; height: 176px;">
                <div class="calendar-header">
                    <div class="calendar-nav calendar-prevmonth"></div>
                    <div class="calendar-nav calendar-nextmonth"></div>
                    <div class="calendar-nav calendar-prevyear"></div>
                    <div class="calendar-nav calendar-nextyear"></div>
                    <div class="calendar-title"><span class="calendar-text">六月 2018</span></div>
                </div>
                <div class="calendar-body" style="height: 154px;">
                    <table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0">
                        <thead>
                        <tr>
                            <th>日</th>
                            <th>一</th>
                            <th>二</th>
                            <th>三</th>
                            <th>四</th>
                            <th>五</th>
                            <th>六</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="calendar-first">
                            <td class="calendar-day calendar-other-month calendar-sunday calendar-first "
                                abbr="2018,5,27" style="">27
                            </td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,28" style="">28</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,29" style="">29</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,30" style="">30</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,31" style="">31</td>
                            <td class="calendar-day " abbr="2018,6,1" style="">1</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,2" style="">2</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,3" style="">3</td>
                            <td class="calendar-day " abbr="2018,6,4" style="">4</td>
                            <td class="calendar-day " abbr="2018,6,5" style="">5</td>
                            <td class="calendar-day " abbr="2018,6,6" style="">6</td>
                            <td class="calendar-day " abbr="2018,6,7" style="">7</td>
                            <td class="calendar-day " abbr="2018,6,8" style="">8</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,9" style="">9</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,10" style="">10</td>
                            <td class="calendar-day " abbr="2018,6,11" style="">11</td>
                            <td class="calendar-day " abbr="2018,6,12" style="">12</td>
                            <td class="calendar-day " abbr="2018,6,13" style="">13</td>
                            <td class="calendar-day " abbr="2018,6,14" style="">14</td>
                            <td class="calendar-day " abbr="2018,6,15" style="">15</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,16" style="">16</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,17" style="">17</td>
                            <td class="calendar-day " abbr="2018,6,18" style="">18</td>
                            <td class="calendar-day " abbr="2018,6,19" style="">19</td>
                            <td class="calendar-day " abbr="2018,6,20" style="">20</td>
                            <td class="calendar-day " abbr="2018,6,21" style="">21</td>
                            <td class="calendar-day calendar-today calendar-selected " abbr="2018,6,22" style="">22</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,23" style="">23</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,24" style="">24</td>
                            <td class="calendar-day " abbr="2018,6,25" style="">25</td>
                            <td class="calendar-day " abbr="2018,6,26" style="">26</td>
                            <td class="calendar-day " abbr="2018,6,27" style="">27</td>
                            <td class="calendar-day " abbr="2018,6,28" style="">28</td>
                            <td class="calendar-day " abbr="2018,6,29" style="">29</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,30" style="">30</td>
                        </tr>
                        <tr class="calendar-last">
                            <td class="calendar-day calendar-other-month calendar-sunday calendar-first "
                                abbr="2018,7,1" style="">1
                            </td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,2" style="">2</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,3" style="">3</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,4" style="">4</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,5" style="">5</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,6" style="">6</td>
                            <td class="calendar-day calendar-other-month calendar-saturday calendar-last "
                                abbr="2018,7,7" style="">7
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="calendar-menu" style="display: none;">
                        <div class="calendar-menu-year-inner"><span
                                class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year"
                                                                                            type="text"></span><span
                                class="calendar-nav calendar-menu-next"></span></div>
                        <div class="calendar-menu-month-inner"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="" style="overflow: hidden;">
        <div class="datebox-calendar-inner">
            <div class="calendar" style="width: 176px; height: 176px;">
                <div class="calendar-header">
                    <div class="calendar-nav calendar-prevmonth"></div>
                    <div class="calendar-nav calendar-nextmonth"></div>
                    <div class="calendar-nav calendar-prevyear"></div>
                    <div class="calendar-nav calendar-nextyear"></div>
                    <div class="calendar-title"><span class="calendar-text">六月 2018</span></div>
                </div>
                <div class="calendar-body" style="height: 154px;">
                    <table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0">
                        <thead>
                        <tr>
                            <th>日</th>
                            <th>一</th>
                            <th>二</th>
                            <th>三</th>
                            <th>四</th>
                            <th>五</th>
                            <th>六</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="calendar-first">
                            <td class="calendar-day calendar-other-month calendar-sunday calendar-first "
                                abbr="2018,5,27" style="">27
                            </td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,28" style="">28</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,29" style="">29</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,30" style="">30</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,5,31" style="">31</td>
                            <td class="calendar-day " abbr="2018,6,1" style="">1</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,2" style="">2</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,3" style="">3</td>
                            <td class="calendar-day " abbr="2018,6,4" style="">4</td>
                            <td class="calendar-day " abbr="2018,6,5" style="">5</td>
                            <td class="calendar-day " abbr="2018,6,6" style="">6</td>
                            <td class="calendar-day " abbr="2018,6,7" style="">7</td>
                            <td class="calendar-day " abbr="2018,6,8" style="">8</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,9" style="">9</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,10" style="">10</td>
                            <td class="calendar-day " abbr="2018,6,11" style="">11</td>
                            <td class="calendar-day " abbr="2018,6,12" style="">12</td>
                            <td class="calendar-day " abbr="2018,6,13" style="">13</td>
                            <td class="calendar-day " abbr="2018,6,14" style="">14</td>
                            <td class="calendar-day " abbr="2018,6,15" style="">15</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,16" style="">16</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,17" style="">17</td>
                            <td class="calendar-day " abbr="2018,6,18" style="">18</td>
                            <td class="calendar-day " abbr="2018,6,19" style="">19</td>
                            <td class="calendar-day " abbr="2018,6,20" style="">20</td>
                            <td class="calendar-day " abbr="2018,6,21" style="">21</td>
                            <td class="calendar-day calendar-today calendar-selected " abbr="2018,6,22" style="">22</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,23" style="">23</td>
                        </tr>
                        <tr class="">
                            <td class="calendar-day calendar-sunday calendar-first " abbr="2018,6,24" style="">24</td>
                            <td class="calendar-day " abbr="2018,6,25" style="">25</td>
                            <td class="calendar-day " abbr="2018,6,26" style="">26</td>
                            <td class="calendar-day " abbr="2018,6,27" style="">27</td>
                            <td class="calendar-day " abbr="2018,6,28" style="">28</td>
                            <td class="calendar-day " abbr="2018,6,29" style="">29</td>
                            <td class="calendar-day calendar-saturday calendar-last " abbr="2018,6,30" style="">30</td>
                        </tr>
                        <tr class="calendar-last">
                            <td class="calendar-day calendar-other-month calendar-sunday calendar-first "
                                abbr="2018,7,1" style="">1
                            </td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,2" style="">2</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,3" style="">3</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,4" style="">4</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,5" style="">5</td>
                            <td class="calendar-day calendar-other-month " abbr="2018,7,6" style="">6</td>
                            <td class="calendar-day calendar-other-month calendar-saturday calendar-last "
                                abbr="2018,7,7" style="">7
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="calendar-menu" style="display: none;">
                        <div class="calendar-menu-year-inner"><span
                                class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year"
                                                                                            type="text"></span><span
                                class="calendar-nav calendar-menu-next"></span></div>
                        <div class="calendar-menu-month-inner"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="layout-split-proxy-h"></div>
<div class="layout-split-proxy-v"></div>
</body>
</html>