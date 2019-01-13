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
<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">书</h1>


        </div>
        <h3>欢迎饲养员</h3>

        <form class="m-t" role="form" id="login-form" >
            <div class="form-group">
                <input type="text" class="form-control" id="adminname" placeholder="用户名" >
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" placeholder="密码" >
            </div>
            <button type="submit"  id="submit" class="btn btn-primary block full-width m-b">登 录</button>


        </form>
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
                url: '/admin/login',
                data: {"adminname": $("#adminname").val(), "password": $("#password").val()},
                global: false,
                success: function (data) {
                    if (data.code == 200) {

                        window.location.href = "${pageContext.request.contextPath}/admin/index.jsp";
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

