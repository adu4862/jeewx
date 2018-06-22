<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>订单管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://my-photos.changs1992.cn/main.css">
    <script src="http://my-photos.changs1992.cn/jquery.min.js"></script>
    <script type="text/javascript" src="http://my-photos.changs1992.cn/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="http://my-photos.changs1992.cn/easyui-lang-zh_CN.js"></script>
    <script src="http://my-photos.changs1992.cn/sea.js"></script>

</head>
<body class="easyui-layout m-innerbody layout panel-noscroll">
<!-- 内页头部-->
<div class="panel layout-panel layout-panel-north panel-htop" style="width: 1000px; left: 0px; top: 0px;">
    <div data-options="region:'north',border:false" style="padding: 20px; width: 960px; height: 106px;" title=""
         class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <!-- 表单 -->
        <form id="searchForm">
            <table class="m-form">
                <tbody>
                <tr>
                    <th>
                        <label>登录名</label>
                    </th>
                    <td>
                        <input class="easyui-textbox textbox-f" style="height: 30px; width: 200px; display: none;"
                               textboxname="loginName"><span class="textbox" style="width: 198px; height: 28px;"><input
                            id="_easyui_textbox_input1" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 190px;"><input
                            type="hidden" class="textbox-value" name="loginName" value=""></span>
                    </td>
                    <th>
                        <label>用户姓名</label>
                    </th>
                    <td>
                        <input class="easyui-textbox textbox-f" style="height: 30px; width: 200px; display: none;"
                               textboxname="userName"><span class="textbox" style="width: 198px; height: 28px;"><input
                            id="_easyui_textbox_input2" type="text" class="textbox-text validatebox-text textbox-prompt"
                            autocomplete="off" tabindex="" placeholder=""
                            style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 190px;"><input
                            type="hidden" class="textbox-value" name="userName" value=""></span>
                    </td>
                    <th>
                        <label>机构</label>
                    </th>
                    <td>
                        <select id="org-list" class="easyui-combobox combobox-f combo-f textbox-f"
                                style="height: 30px; width: 200px; display: none;" textboxname="org" comboname="org">
                        </select><span class="textbox combo" style="width: 198px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input10"
                                                                                 type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 172px;"><input
                            type="hidden" class="textbox-value" name="org" value=""></span>
                    </td>
                    <th>
                        <label>商品类型</label>
                    </th>
                    <td>
                        <select id="goods-type-list" class="easyui-combobox combobox-f combo-f textbox-f"
                                style="height: 30px; width: 200px; display: none;" textboxname="goodsType"
                                comboname="goodsType">
                        </select><span class="textbox combo" style="width: 198px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input11"
                                                                                 type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 172px;"><input
                            type="hidden" class="textbox-value" name="goodsType" value=""></span>
                    </td>
                </tr>
                <tr>
                    <th>
                        <label>状态</label>
                    </th>
                    <td>
                        <select id="status-list" class="easyui-combobox combobox-f combo-f textbox-f"
                                style="height: 30px; width: 200px; display: none;" textboxname="status"
                                comboname="status">
                        </select><span class="textbox combo" style="width: 198px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input12"
                                                                                 type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 172px;"><input
                            type="hidden" class="textbox-value" name="status" value=""></span>
                    </td>
                    <th>
                        <label>消费日期</label>
                    </th>
                    <td>
                        <input id="startTime" data-options="editable: false"
                               class="easyui-datebox datebox-f combo-f textbox-f"
                               style="height: 30px; width: 200px; display: none;" textboxname="startTime"
                               comboname="startTime"><span class="textbox combo datebox"
                                                           style="width: 198px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input8" type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly textbox-prompt"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 172px;"><input
                            type="hidden" class="textbox-value" name="startTime" value=""></span>
                    </td>
                    <th>
                        <label>~</label>
                    </th>
                    <td>
                        <input id="endTime" data-options="editable: false"
                               class="easyui-datebox datebox-f combo-f textbox-f"
                               style="height: 30px; width: 200px; display: none;" textboxname="endTime"
                               comboname="endTime"><span class="textbox combo datebox"
                                                         style="width: 198px; height: 28px;"><span
                            class="textbox-addon textbox-addon-right" style="right: 0px; top: 0px;"><a
                            href="javascript:;" class="textbox-icon combo-arrow" icon-index="0" tabindex="-1"
                            style="width: 18px; height: 28px;"></a></span><input id="_easyui_textbox_input9" type="text"
                                                                                 class="textbox-text validatebox-text validatebox-readonly textbox-prompt"
                                                                                 autocomplete="off" tabindex=""
                                                                                 readonly="readonly" placeholder=""
                                                                                 style="margin: 0px 18px 0px 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 172px;"><input
                            type="hidden" class="textbox-value" name="endTime" value=""></span>
                    </td>
                    <th></th>
                    <td>
                        <a id="search-btn" class="u-btn blue"><i class="ico ico-search"></i>查询</a>
                        <a id="reset-btn" class="u-btn white"><i class="ico ico-del"></i>清除</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
        <!-- /表单 -->
    </div>
</div>
<!-- /内页头部-->

<!-- 内页主体-->
<div class="panel layout-panel layout-panel-center panel-htop" style="width: 1000px; left: 0px; top: 146px;">
    <div data-options="region:'center',border:false" style="padding: 0px 20px 20px; width: 960px; height: 1020px;"
         title="" class="panel-body panel-body-noheader panel-body-noborder layout-body">
        <!-- 数据表格 -->
        <div class="m-datagrid">
            <div class="panel datagrid panel-htop easyui-fluid" style="width: 960px;">
                <div class="datagrid-wrap panel-body panel-body-noheader" title=""
                     style="width: 958px; height: 1018px;">
                    <div class="m-toolbar datagrid-toolbar" id="toolbar">
                        <a id="orderExportBtn" class="u-toolbtn"><i class="ico ico-add"></i>导出订单</a>
                        <a id="downloadUrl" style="display: none;" href=""></a>
                    </div>
                    <div class="datagrid-view" style="width: 958px; height: 952px;">
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
                        <div class="datagrid-view2" style="width: 958px;">
                            <div class="datagrid-header" style="width: 958px; height: 24px;">
                                <div class="datagrid-header-inner" style="display: block;">
                                    <table class="datagrid-htable" border="0" cellspacing="0" cellpadding="0"
                                           style="height: 25px;">
                                        <tbody>
                                        <tr class="datagrid-header-row">
                                            <td field="ck">
                                                <div class="datagrid-header-check"><input type="checkbox"></div>
                                            </td>
                                            <td field="orderId">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-orderId"><span>订购记录ID</span><span
                                                        class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="loginName">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-loginName">
                                                    <span>登录名</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="userName">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-userName">
                                                    <span>用户姓名</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="userInSchool">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-userInSchool">
                                                    <span>用户所在学校</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="goodsType">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-goodsType">
                                                    <span>商品类型</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="goodsName">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-goodsName">
                                                    <span>商品名称</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="orderTime">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-orderTime">
                                                    <span>消费时间</span><span class="datagrid-sort-icon"></span></div>
                                            </td>
                                            <td field="status" class="">
                                                <div class="datagrid-cell datagrid-sort datagrid-cell-c1-status"><span>状态</span><span
                                                        class="datagrid-sort-icon"></span></div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="datagrid-body"
                                 style="width: 958px; margin-top: 0px; height: 927px; overflow-x: hidden;">
                                <table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0">
                                    <tbody>
                                    <tr id="datagrid-row-r1-2-0" class=""
                                        style="height: 1px; border-color: transparent; background: transparent;">
                                        <td field="ck"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell-check"></div>
                                        </td>
                                        <td field="orderId"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-orderId"></div>
                                        </td>
                                        <td field="loginName"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-loginName"></div>
                                        </td>
                                        <td field="userName"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-userName"></div>
                                        </td>
                                        <td field="userInSchool"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-userInSchool"></div>
                                        </td>
                                        <td field="goodsType"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-goodsType"></div>
                                        </td>
                                        <td field="goodsName"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-goodsName"></div>
                                        </td>
                                        <td field="orderTime"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-orderTime"></div>
                                        </td>
                                        <td field="status"
                                            style="height: 1px; border-color: transparent; background: transparent;">
                                            <div style="height: 1px; border-color: transparent; background: transparent;"
                                                 class="datagrid-cell datagrid-cell-c1-status"></div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="datagrid-footer" style="width: 958px;">
                                <div class="datagrid-footer-inner" style="display: none;"></div>
                            </div>
                        </div>
                        <table id="order-info-list" class="easyui-datagrid datagrid-f" style="display: none;"
                               data-options="emptyMsg:'暂无数据',url:'http://10.0.2.12:80/control/operation/api/goodsMgmt/order/list',method:'get',pagination:true,toolbar:'#toolbar'">
                            <thead>
                            <tr>
                                <th data-options="field:'ck',checkbox:true"></th>
                                <th data-options="field:'orderId',formatter:parent.formatCellTooltip" width="150"
                                    sortable="true">订购记录ID
                                </th>
                                <th data-options="field:'loginName',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">登录名
                                </th>
                                <th data-options="field:'userName',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">用户姓名
                                </th>
                                <th data-options="field:'userInSchool',formatter:parent.formatCellTooltip" width="120"
                                    sortable="true">用户所在学校
                                </th>
                                <th data-options="field:'goodsType',formatter:parent.formatCellTooltip" width="120"
                                    sortable="true">商品类型
                                </th>
                                <th data-options="field:'goodsName',formatter:parent.formatCellTooltip" width="100"
                                    sortable="true">商品名称
                                </th>
                                <th data-options="field:'orderTime',formatter:parent.formatDateTimeSec" width="150"
                                    sortable="true">消费时间
                                </th>
                                <th data-options="field:'status',formatter:parent.formatCellTooltip" width="80"
                                    sortable="true">状态
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

                            .datagrid-cell-c1-orderId {
                                width: 141px
                            }

                            .datagrid-cell-c1-loginName {
                                width: 91px
                            }

                            .datagrid-cell-c1-userName {
                                width: 91px
                            }

                            .datagrid-cell-c1-userInSchool {
                                width: 111px
                            }

                            .datagrid-cell-c1-goodsType {
                                width: 111px
                            }

                            .datagrid-cell-c1-goodsName {
                                width: 91px
                            }

                            .datagrid-cell-c1-orderTime {
                                width: 141px
                            }

                            .datagrid-cell-c1-status {
                                width: 71px
                            }
                        </style>
                        <div class="datagrid-empty" style="top: 25px;">暂无数据</div>
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
                                <td><span style="padding-right:6px;">共0页</span></td>
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
                        <div class="pagination-info">显示0到0,共0记录</div>
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
<!-- /内页主体-->

<script>
    $(function () {
        seajs.use("operationcenter/goods/orderMgmt", function (orderMgmt) {
            orderMgmt.init();
        });
    });
</script>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="">
        <div id="_easyui_combobox_i1_0" class="combobox-item combobox-item-selected">请选择</div>
        <div id="_easyui_combobox_i1_1" class="combobox-item">大洋学校</div>
    </div>
</div>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="">
        <div id="_easyui_combobox_i2_0" class="combobox-item combobox-item-selected">请选择</div>
        <div id="_easyui_combobox_i2_1" class="combobox-item">应用</div>
        <div id="_easyui_combobox_i2_2" class="combobox-item">资源</div>
    </div>
</div>
<div class="panel combo-p panel-htop" style="position: absolute; z-index: 10; display: none;">
    <div class="combo-panel panel-body panel-body-noheader" title="" id="">
        <div id="_easyui_combobox_i3_0" class="combobox-item combobox-item-selected">请选择</div>
        <div id="_easyui_combobox_i3_1" class="combobox-item">已完成</div>
        <div id="_easyui_combobox_i3_2" class="combobox-item">待支付</div>
        <div id="_easyui_combobox_i3_3" class="combobox-item">已取消</div>
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
