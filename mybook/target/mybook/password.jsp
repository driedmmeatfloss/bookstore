
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改密码</title>


     <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">

</head>
<body>

<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="text-center animated fadeInRightBig">
                <div class="ibox float-e-margins">

                    <div class="ibox-content">
                        <form class="form-horizontal" role="form" id="pwd"  method="post" style="margin-top: 50px">
                            <div>
                                <div class="form-group">
                                    <label for="oldpwd" class="col-sm-2 control-label">原密码:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="oldpwd" name="oldpwd"  placeholder="请输入原密码" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newpwd" class="col-sm-2 control-label">新密码:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newpwd" name="newpwd"  placeholder="请输入原密码" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="newpwd1" class="col-sm-2 control-label">确认密码:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="newpwd1" name="newpwd1"  placeholder="请确认密码" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group" >
                                <div class="col-sm-offset-2 col-sm-10" >
                                    <button type="button" onclick="pwd()"  class="btn btn-default">修改</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>








<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
<script>
    $.validator.setDefaults({
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: "span",
        errorPlacement: function (error, element) {
            if (element.is(":radio") || element.is(":checkbox")) {
                error.appendTo(element.parent().parent().parent());
            } else {
                error.appendTo(element.parent());
            }
        },
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"

    });
    $(document).ready(function () {

        var icon = "<i class='fa fa-times-circle'></i> ";
        $("#pwd").validate({
            rules: {
                oldpwd: {
                    required: true,
                    minlength: 5
                },
                newpwd: {
                    required: true,
                    minlength: 5
                },
                newpwd1: {
                    required: true,
                    minlength: 5,
                    equalTo: "#newpwd"
                },

            },
            messages: {
                oldpwd: {
                    required: icon + "请输入您的原密码",
                    minlength: icon + "密码必须5个字符以上"
                },
                newpwd: {
                    required: icon + "请输入您的新密码",
                    minlength: icon + "密码必须5个字符以上"
                },
                newpwd1: {
                    required: icon + "请再次输入密码",
                    minlength: icon + "密码必须5个字符以上",
                    equalTo: icon + "两次输入的密码不一致"
                }

            }
        });
    });
    function pwd(){
        console.log($("#oldpwd").val())
        $.post("/user/pwd",{oldpwd : $("#oldpwd").val(),newpwd: $("#newpwd").val()},function (msg) {
            if (msg.code == 500) {
                alert(msg.msg);
                return;
            }
            window.location.href="/user/logout";
        },"json")
    }
</script>

</body>
</html>