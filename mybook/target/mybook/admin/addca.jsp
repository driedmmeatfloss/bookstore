
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加类别</title>


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
                        <form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/book/addca" method="post" style="margin-top: 50px">
                            <div>
                                <div class="form-group">
                                    <label for="category" class="col-sm-2 control-label">类别名字:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="category" name="category"  placeholder="请输入类别名字" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group" >
                                <div class="col-sm-offset-2 col-sm-10" >
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








<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>


</body>
</html>