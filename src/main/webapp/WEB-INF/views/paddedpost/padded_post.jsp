<%--
  Created by IntelliJ IDEA.
  User: Watson
  Date: 2014/8/7
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/commons/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="menu" content="BIZ_OPT_PADDEDPOST">
</head>
<body>
<!-- BEGIN PAGE HEADER-->
<div class="row">
  <div class="col-md-12">
    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
    <h3 class="page-title">
      商品补差价
    </h3>
    <ul class="page-breadcrumb breadcrumb">
      <li>
        <i class="fa fa-home"></i>
        <a href="${ctx}/">主页</a>
        <i class="fa fa-angle-right"></i>
        <a>管理员功能</a>
        <i class="fa fa-angle-right"></i>
        <a href="${ctx}/paddedPost">商品补差价</a>
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
    <div class="tabbable tabbable-custom boxless">
      <div class="tab-content">
        <div class="tab-pane active" id="tab_0">
          <div class="portlet box green">
            <div class="portlet-title">
              <div class="caption"><i class="fa fa-reorder"></i>商品补差价</div>
              <div>
                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                        id="swf" width="100%" height="100%"
                        codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab">
                  <param name="movie" value="${ctx}/static/assets/plugins/camera-barcode-resolve/decode.swf"/>
                  <param name="quality" value="high"/>
                  <param name="allowScriptAccess" value="always"/>
                  <embed src="${ctx}/static/assets/plugins/camera-barcode-resolve/decode.swf" quality="high" bgcolor="#869ca7"
                         width="1" height="1" name="swf" align="middle"
                         play="true" loop="false" quality="high" allowScriptAccess="always"
                         type="application/x-shockwave-flash"
                         pluginspage="http://www.macromedia.com/go/getflashplayer">
                  </embed>
                </object>
              </div>
            </div>
            <div class="portlet-body form">
              <!-- BEGIN FORM-->
              <form action="#" class="form-horizontal" id="paddedPost">

                <div class="form-body">

                  <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    有错误请检查.
                  </div>
                  <div class="alert alert-success display-hide">
                    <button class="close" data-close="alert"></button>
                    校验成功.
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">补差额/补差件<span class="required">*</span></label>

                    <div class="col-md-4">
                      <div class="radio-list input-icon right input-group">
                        <label class="radio-inline">
                          <input type="radio" name="paddedPostRadios" id="dftRadio" value="0" checked> 补差额
                        </label>
                        <label class="radio-inline">
                          <input type="radio" name="paddedPostRadios" value="1"> 补差件
                        </label>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <label class="col-md-3 control-label">商品编号:<span class="required">*</span></label>

                    <div class="col-md-4">
                      <div class="input-icon right input-group">
                        <i class="fa"></i>
                        <input id="goodsNum" name="goodsNum" type="text" class="form-control charity_input ime_disabled" placeholder="如:A01">
                      </div>
                    </div>
                  </div>

                  <div id="paddedPostContent">
                    <div class="form-group" id="paddedPostDiv">
                      <label class="col-md-3 control-label">补差金额:<span class="required">*</span></label>

                      <div class="col-md-4">
                        <div class="input-icon right">
                          <i class="fa"></i>
                          <input id="paddedPostValue" name="paddedPostValue" type="text" class="form-control charity_input ime_disabled" placeholder="不能为空">
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-actions fluid">
                    <div class="col-md-offset-3 col-md-9">
                      <button type="button" class="btn green" onclick="PaddedPost.save();">提交</button>
                      <button type="reset" name="reset" class="btn yellow">重置</button>
                    </div>
                  </div>

                </div>

              </form>
              <!-- END FORM-->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="${ctx}/static/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${ctx}/static/jquery/jquery-serializeForm.min.js" type="text/javascript"></script>
<script src="${ctx}/static/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctx}/static/assets/plugins/jquery-validation/dist/additional-methods.min.js" type="text/javascript"></script>
<script src="${ctx}/static/assets/plugins/jquery-validation/src/localization/messages_zh.js" type="text/javascript"></script>
<script src="${ctx}/static/assets/plugins/camera-barcode-resolve/camera-barcode-resolve.js" type="text/javascript"></script>
<script src="${ctx}/static/viewlogics/paddedpost/padded_post.js" type="text/javascript"></script>

<!-- END PAGE CONTENT-->
</body>
</html>
