/**
 * Created with IntelliJ IDEA.
 * User: Watson
 * Date: 2014/6/23
 * Time: 20:25
 */
var Storage = function () {

  var handleValidation = function () {
    // for more info visit the official plugin documentation:
    // http://docs.jquery.com/Plugins/Validation

    var form = $('#storage');
    var err = $('.alert-danger', form);
    var success = $('.alert-success', form);

    //noinspection JSUnusedLocalSymbols
    form.validate({
      errorElement: 'span',
      errorClass: 'help-block',
      focusInvalid: false,
      ignore: "",
      rules: {
        goodsNum: {
          minlength: 2,
          maxlength: 4,
          required: true
        },
        goodsCount: {
          required: true,
          digits: true
        },
        goodsPrice: {
          required: true,
          digits: true
        }
      },

      invalidHandler: function (event, validator) { //display error alert on form submit
        success.hide();
        err.show();
        App.scrollTo(err, -200);
      },

      errorPlacement: function (error, element) { // render error placement for each input type
        var icon = $(element).parent('.input-icon').children('i');
        icon.removeClass('fa-check').addClass("fa-warning");
        icon.attr("data-original-title", error.text()).tooltip({'container': 'body'});
      },

      highlight: function (element) { // hightlight error inputs
        $(element)
          .closest('.form-group').addClass('has-error'); // set error class to the control group
      },

      unhighlight: function (element) { // revert the change done by hightlight

      },

      success: function (label, element) {
        var icon = $(element).parent('.input-icon').children('i');
        $(element).closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
        icon.removeClass("fa-warning").addClass("fa-check");
      },

      submitHandler: function (form) {
        success.show();
        err.hide();
      }
    });
  };

  var handleWysihtml5 = function () {
    if (!jQuery().wysihtml5) {

      return;
    }

    //noinspection JSJQueryEfficiency
    if ($('.wysihtml5').size() > 0) {
      //noinspection JSUnresolvedVariable
      $('.wysihtml5').wysihtml5({
        "stylesheets": [ctx + "/static/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
      });
    }
  };

  var jsresetform = function () {
    $("input").val("");
  };

  return {
    check: function () {
      //noinspection JSUnresolvedVariable
      var checkUrl = ctx + "/storage/check/" + $("#goodsNum").val();
      $.ajax({
        type: "POST",
        url: checkUrl,
        data: $('#storage').serializeForm(),
        beforeSend: function () {
          //AJAX请求完成时显示提示，防止表单重复提交
          App.blockUI($("body"));
        },
        complete: function () {
          //AJAX请求完成时隐藏loading提示
          App.unblockUI($("body"));
        },
        success: function (data) {
          if (data.data) {
            //noinspection JSUnresolvedVariable
            $("#pkid").val(data.data.pkid);
            bootbox.confirm("此商品信息已存在,是否要更新?", function (result) {
              if(result) {
                Storage.save();
              }else {
                $("#goodsCount").val(data.data.goodsCount);
                $("#goodsPrice").val(data.data.goodsPrice);
              }
            });
          } else {
            Storage.save();
          }
        }
      });
    },

    checkVW: function () {
      //noinspection JSUnresolvedVariable
      var checkUrl = ctx + "/storage/check/" + $("#goodsNum").val();
      $.ajax({
        type: "POST",
        url: checkUrl,
        data: $('#storage').serializeForm(),
        success: function (data) {
          if (data.data) {
            $("#soldVW").show();
            $("#entryVW").hide();
            $("#goodsPrice").val(data.data.goodsPrice);
            $("#goodsName").val(data.data.goodsName);
            //noinspection JSUnresolvedVariable
            $("#pkid").val(data.data.pkid);

            //noinspection JSUnresolvedVariable
            if(data.data.saleInfos == null || data.data.saleInfos == "") {
              $("#entryCount").hide();
              //noinspection JSJQueryEfficiency
              $("#soldCount").show();

              $($("#soldCount").parent()).removeClass("col-md-4").addClass("col-md-7");

              if(data.data.goodsCount == "" || data.data.goodsCount == null) {
                bootbox.alert("请求错误,请刷新后重试!");
              }else {
                //noinspection JSDuplicatedDeclaration
                var html = new StringBuffer();
                //noinspection JSDuplicatedDeclaration
                for (var i = 0; i < data.data.goodsCount; i++) {
                  html.append('<button onclick="Storage.tocart();" type="button" class="btn btn-default">');
                  html.append(i + 1);
                  html.append('</button>');
                }
                $("#soldCountGroup").html(html.toString());
              }
            }else {
              var totalCount = 0;
              //noinspection JSUnresolvedVariable
              $.each(data.data.saleInfos, function(idx, item) {
                //noinspection JSUnresolvedVariable
                totalCount = totalCount + parseInt(item.saleCount);
              });

              if(totalCount == 0) {
                bootbox.alert("请求错误,请刷新后重试!");
              }else {
                //noinspection JSDuplicatedDeclaration
                var html = new StringBuffer();
                //noinspection JSDuplicatedDeclaration
                for (var i = 0; i < totalCount; i++) {
                  html.append('<button onclick="Storage.tocart();" type="button" class="btn btn-default">');
                  html.append(i + 1);
                  html.append('</button>');
                }
                $("#soldCountGroup").html(html.toString());
              }
            }

          } else {
            $("#entryVW").show();
            $("#soldVW").hide();
            $("#entryCount").show();
            $("#soldCount").hide();
            $("#goodsPrice").val("");
            $("#goodsCount").val("");
            $("#pkid").val("");
          }
        }
      });
    },

    tocart: function () {
      //noinspection JSPrimitiveTypeWrapperUsage
      var item = new Object();
      //noinspection JSJQueryEfficiency
      item.id = $("#pkid").val();
      item.code = $("#goodsNum").val();
      item.saleCount = $(this).text();
      item.name = $("#goodsName").val();

      Cart.addCart(item);

    },

    save: function () {
      if (!$("#storage").valid())
        return;

      //noinspection JSUnresolvedVariable
      var saveUrl = ctx + "/storage/save";
      $.ajax({
        type: "POST",
        url: saveUrl,
        data: $('#storage').serializeForm(),
        beforeSend: function () {
          //AJAX请求完成时显示提示，防止表单重复提交
          App.blockUI($("body"));
        },
        complete: function () {
          //AJAX请求完成时隐藏loading提示
          App.unblockUI($("body"));
        },
        success: function (data) {
          if (data.success) {
            bootbox.alert("保存成功");
            $('#storage')[0].reset();
          }else{
            bootbox.alert("数据错误保存失败");
            COMMONS.validFail("storage",data);
          }
        }
      });
    },

    init: function () {
      handleWysihtml5();
      handleValidation();
      jsresetform();
    }

  };
}();

var Cart = function(){
  var cart = {};

  var initCart = function(data){
    $("#cart_"+data.id).remove();
    $("#cartDiv").append(ich.addCart(data));
    $("#cart_"+data.id).data("goods",data);
    $("#cart_"+data.id+" button").click(function(){
      Cart.removeCart($(this).parent());
    });
  };

  return {
    /**
     * {id:,name:,code:,saleCount:}
     */
    addCart:function(good){
      if(!good) return;
      var data = {id:good.id,name:good.name,code:good.code,saleCount:good.saleCount};

      data.tileStyle =COMMONS.randomColorStyle()
      cart[data.id] = data;
      initCart(data);
    },
    removeCart:function(my){
      var data = $(my).data("goods");
      delete cart[data.id];
      $(my).remove();
    }
  };
}();

$(function () {
  Storage.init();
  CameraBarcodeResolve.init("#goodsNum");
});