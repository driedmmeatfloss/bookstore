
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户注册</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">


</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">书</h1>

        </div>
        <h3>欢迎小主</h3>
        <p>快人一步</p>
        <form class="m-t" role="form" id="register" action="/user/register" method="post">
            <div class="form-group">
                <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" >
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" >
            </div>
            <div class="form-group">
                <input type="password" id="confirm_password"  name="confirm_password" class="form-control" placeholder="请再次输入密码" >
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="age" name="age" placeholder="年龄" >
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="realname" name="realname" placeholder="真实姓名" >
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="cardid" name="cardid" placeholder="身份证号" >
            </div>

            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>

            <p class="text-muted text-center"><small>已经有账户了？</small><a href="/user/log">点此登录</a>
            </p>

        </form>
    </div>
</div>

<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/validate/messages_zh.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/js/plugins/iCheck/icheck.min.js"></script>
<script>
    $.validator.addMethod(
        "checkUsername",
        function(value,element,params){
            var flag = false;
            $.ajax({
                "async":false,
                "url":"${pageContext.request.contextPath}/user/checkUsername",
                "data":{"username":value},
                "type":"POST",
                "dataType":"json",
                "success":function(data){
                    if(data != null){
                        return flag = true;
                    }
                    return flag = false;
                }
            });
            return !flag;
        }
    );

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
        $("#register").validate({
            rules: {
                username: {
                    required : true,
                    checkUsername : true
                },
                password: {
                    required: true,
                    minlength: 5
                },
                confirm_password: {
                    required: true,
                    minlength: 5,
                    equalTo: "#password"
                },
                age:"required",
                realname:"required",
                cardid:"required"
            },
            messages: {
                username: {
                    required: icon + "请输入您的用户名",
                    checkUsername : icon + "用户名已存在",

                },
                password: {
                    required: icon + "请输入您的密码",
                    minlength: icon + "密码必须5个字符以上"
                },
                confirm_password: {
                    required: icon + "请再次输入密码",
                    minlength: icon + "密码必须5个字符以上",
                    equalTo: icon + "两次输入的密码不一致"
                },
                age:{
                    required: icon +"请输入年龄"
                },
                realname:{
                    required: icon +"请输入真实姓名"
                },
                cardid:{
                    required: icon+"请输入身份证"
                }


            }
        });
    });
</script>


</body>

</html>
