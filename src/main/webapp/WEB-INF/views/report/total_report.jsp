<%--
  Created by IntelliJ IDEA.
  User: Watson
  Date: 2014/6/16
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/commons/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="menu" content="BIZ_OPT_STORAGE_TOTALREPORT">
  <!-- BEGIN PAGE LEVEL STYLES -->
  <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/plugins/select2/select2_metro.css"/>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
  <!-- END PAGE LEVEL STYLES -->
</head>
<body>
<!-- BEGIN PAGE HEADER-->
<div class="row">
  <div class="col-md-12">
    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
    <h3 class="page-title">
      总报表查询
    </h3>
    <ul class="page-breadcrumb breadcrumb">
      <li>
        <i class="fa fa-home"></i>
        <a href="${ctx}/">主页</a>
        <i class="fa fa-angle-right"></i>
        <a>管理员功能</a>
        <i class="fa fa-angle-right"></i>
        <a href="${ctx}/groupReport">总报表查询</a>
      </li>
      <li><a href="#"></a></li>
    </ul>
    <!-- END PAGE TITLE & BREADCRUMB-->
  </div>
</div>
<!-- END PAGE HEADER-->

<!-- BEGIN PAGE CONTENT-->
<div class="row">
  <div class="col-md-12">
    <!-- BEGIN EXAMPLE TABLE PORTLET-->
    <div class="portlet box grey">


      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-globe"></i>总报表查询
        </div>
        <div class="actions">
          <div class="btn"></div>
          <a id="exportExcel" class="btn blue"><i class="fa fa-cloud-download"></i> 导出为 Excel</a>
        </div>
      </div>


      <div class="portlet-body">
        <table class="table table-striped table-bordered table-hover" id="tpTable">
          <thead>
          <tr>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>捐赠人</th>
            <th>商品单价</th>
            <th>售出总价</th>
            <th>捐品数量</th>
            <th>已售</th>
            <th>库存</th>
          </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
    </div>
    <!-- END EXAMPLE TABLE PORTLET-->
  </div>
</div>
<!-- END PAGE CONTENT-->
<form id="exportExcelForm" target="_blank" method="get">
</form>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="${ctx}/static/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${ctx}/static/assets/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/static/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${ctx}/static/viewlogics/goods/goodsInfo.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctx}/static/viewlogics/report/total_report.js"></script>
</body>
</html>
