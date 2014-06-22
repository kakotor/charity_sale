<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/commons/commons.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="menu" scope="page"><sitemesh:getProperty property="meta.menu"/></c:set>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="zh" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="zh" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="zh" class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <meta name="MobileOptimized" content="320">
  <title>爱心义卖-管理后台</title>
  <!-- 全局css -->
  <link href="${ctx}/static/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
  <!-- 全局css -->
  <!-- 页面css -->
  <link href="${ctx}/static/assets/plugins/select2/select2_metro.css" rel="stylesheet" type="text/css" />
  <!-- 页面css -->
  <!-- 主题css -->
  <link href="${ctx}/static/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/css/style.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
  <link href="${ctx}/static/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
  <link href="${ctx}/static/assets/css/custom.css" rel="stylesheet" type="text/css"/>
  <!-- 主题css -->
  <!-- 引入js文件 -->
  <!-- 核心插件 -->
  <!--[if lt IE 9]>
  <script src="${ctx}/static/assets/plugins/respond.min.js"></script>
  <script src="${ctx}/static/assets/plugins/excanvas.min.js"></script>
  <![endif]-->
  <script src="${ctx}/static/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
  <script src="${ctx}/static/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
  <script src="${ctx}/static/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
  <!-- 页面插件 -->
  <script src="${ctx}/static/assets/scripts/app.js" type="text/javascript"></script>
  <sitemesh:head/>
  <script type="text/javascript">
    var ctx = '${ctx}';
    jQuery(document).ready(function() {
      // 页面初始化
      App.init('${ctx}/static');
    });
  </script>
</head>
<body class="page-header-fixed">
  <!-- 头条 -->
  <div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- 顶部导航条 -->
    <div class="header-inner">
      <!-- BEGIN LOGO -->
      <a class="navbar-brand" href="${ctx}/">
        <img src="${ctx}/static/assets/img/logo.png" alt="logo" class="img-responsive" />
      </a>
      <!-- END LOGO -->
      <!-- 相应菜单toggler -->
      <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <img src="${ctx}/static/assets/img/menu-toggler.png" alt="" />
      </a>
      <!-- 导航条菜单 -->
      <ul class="nav navbar-nav pull-right">
      </ul>
    </div>
  </div>
  <div class="clearfix"></div>
  <!-- 容器 -->
  <div class="page-container">
    <!-- 左侧导航条 -->
    <div class="page-sidebar navbar-collapse collapse">
      <!-- 导航条菜单 -->
      <ul class="page-sidebar-menu">
        <li>
          <!-- 显隐按钮 -->
          <div class="sidebar-toggler hidden-xs"></div>
        </li>
        <li class="start ${menu==''?'active':''}">
          <a href="${ctx}/">
            <i class="fa fa-home"></i>
            <span class="title">首页</span>
            <span class="selected"></span>
          </a>
        </li>
        <li class="last ${menu=='storage'?'active':''}">
          <a href="javascript:;">
            <i class="fa fa-table"></i>
            <span class="title">业务功能</span>
            <span class="selected"></span>
            <span class="arrow open"></span>
          </a>
          <ul class="sub-menu">
            <li class="${menu=='storage'?'active':''}">
              <a href="${ctx}/goStorage">
                商品录入
              </a>
            </li>
            <li class="${menu=='groupReport'?'active':''}">
              <a href="${ctx}/goGroupReport">
                组内销售查询
              </a>
            </li>
          </ul>
        </li>
        <li class="last ${menu=='adminAccountManager'?'active':''}">
          <a href="javascript:;">
            <i class="fa fa-wrench"></i>
            <span class="title">管理员功能</span>
            <span class="selected"></span>
            <span class="arrow open"></span>
          </a>
          <ul class="sub-menu">
            <li class="${menu=='adminAccountManager'?'active':''}">
              <a href="${ctx}/goAdminAccountManager">
                账号管理
              </a>
            </li>
            <li class="${menu=='totalReport'?'active':''}">
              <a href="${ctx}/totalReport">
                总报表查询
              </a>
            </li>
          </ul>
        </li>
        <li class="last ${menu=='priceTag'?'active':''}">
          <a href="javascript:;">
            <i class="fa fa-cogs"></i>
            <span class="title">系统功能</span>
            <span class="selected"></span>
            <span class="arrow open"></span>
          </a>
          <ul class="sub-menu">
            <li class="${menu=='priceTag'?'active':''}">
              <a href="${ctx}/priceTag">
                生成价签
              </a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- 主页面显示区域 -->
    <div class="page-content">
      <sitemesh:body/>
    </div>
  </div>
  <!-- 底条 -->
  <div class="footer">
    <div class="footer-inner">
      2014 &copy; Charity by <a class="text-info" href="http://www.quyeying.com" target="_blank">QuYeYing</a>
    </div>
    <div class="footer-tools">
			<span class="go-top">
			<i class="fa fa-angle-up"></i>
			</span>
    </div>
  </div>
</body>
</html>
