<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/9/20
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加书籍</title>


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
                        <form class="form-horizontal" role="form" action="/donate/donate" method="post" enctype="multipart/form-data">

                            <!--书名-->
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">书名:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="请输入书籍名字">
                                </div>
                            </div>
                            <!--作者-->
                            <div class="form-group">
                                <label for="author" class="col-sm-2 control-label">作者:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="author" name="author" placeholder="请输入书籍作者">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="author" class="col-sm-2 control-label">出版社:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="publish" name="publish" placeholder="请输入出版社">
                                </div>
                            </div>


                            <!--所在类别-->
                            <div class="form-group">
                                <label for="caid" class="col-sm-2 control-label">所在类别</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="caid" name="caid" >

                                    </select>
                                </div>
                            </div>

                            <!--数量-->
                            <div class="form-group">
                                <label for="number" class="col-sm-2 control-label">数量:</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="number" name="number" placeholder="请输入书籍数量">
                                </div>
                            </div>

                            <!--图片-->
                            <div class="form-group">
                                <button type="button" class="btn btn-primary"  onclick="addpic()">上传图片</button>
                                <div class="col-sm-10" id="pics">

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
    $(function () {
        queryAllCas();
    });
    function queryAllCas() {
        $.ajax({
            type:"post",
            url:"/book/getAllCas",
            data:"",
            dataType:"json",
            success:function (msg) {

                var ops = "<option value='-1'>==请选择==</option>";
                $.each(msg,function (i,ca) {
                    ops+="<option value='"+ca.id+"'>"+ca.category+"</option>";
                });
                $("#caid").html(ops);
            }

        });
    }
    let i = 0;
    function addpic() {
        let ss = "请选择: <input type='file' id='img' name='img' required/>"
        $("#pics").append(ss);
    }
</script>
</body>
</html>