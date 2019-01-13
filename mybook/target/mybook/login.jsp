
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>登录</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">

</head>

<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                    <h1>[ 书 ]</h1>
                </div>
                <div class="m-b"></div>
                <h4>欢迎前来 <strong>解锁技能</strong></h4>


                <strong>还没有账号？ <a href="/user/reg">立即注册&raquo;</a></strong>
            </div>
        </div>
        <div class="col-sm-5">
            <form id="login-form" id="login-form">
                <h4 class="no-margins">解锁技能：</h4>
                <p class="m-t-md"></p>
                <input type="text" class="form-control uname" id="username"  placeholder="用户名" />
                <input type="password" class="form-control pword m-b" id="password"  placeholder="密码" />

                <button class="btn btn-success btn-block"  id="submit" >登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 青岛大学 || 书
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<script>
    $(function () {
        //给id为ajaxSubmit的按钮提交表单
        $("#submit").on("click", function () {

            $("#login-form").ajaxForm({
                type :'post',
                url: '/user/login',
                data: {"username": $("#username").val(), "password": $("#password").val()},
                global: false,
                success: function (data) {
                    if (data.code == 200) {

                        window.location.href = "/index1.jsp";
                    }
                    else {

                        alert(data.msg);
                    }
                }
            });
        });

    });




</script>

</body>

</html>

