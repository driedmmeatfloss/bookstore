<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>图书列表</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-4">
        <h2>图书列表</h2>
    </div>

</div>

<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="text-center animated fadeInRightBig">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">

                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="form_basic.html#">选项1</a>
                                </li>
                                <li><a href="form_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <!--查询区域-->
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">

                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <form class="form-inline" role="form">
                                            <div class="form-group">

                                                <button type="button" onclick="show()" class="btn btn-primary" >新增</button>

                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                            <table class="table table-bordered table-responsive table-striped
                            table-condensed table-hover" id="tb" >

                            </table>
                        </div>
                        <!--查询区域 end-->



                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal"  role="form"  method="post" >

                    <!--书名-->
                    <div class="form-group">
                        <label for="adminname" class="col-sm-2 control-label">用户名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="adminname" name="adminname" placeholder="请输入用户名">
                        </div>
                    </div>
                    <!--作者-->
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码:</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="submit" onclick="add()" class="btn btn-primary">添加</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>





<!-- 全局js -->
<script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>

<!-- 自定义js -->
<script src="${pageContext.request.contextPath}/js/content.js?v=1.0.0"></script>

<script src="${pageContext.request.contextPath}/js/plugins/layer/laydate/laydate.js"></script>

<script>
    $(function () {

        queryData();


    });

    function add() {
        $.post("/admin/add",{adminname : $("#adminname").val(),password : $("#password").val()},function (msg) {
            if (msg.code == 200) {

                $("#myModal").modal("hide");
                window.location.reload();
            }

        },"json")
    }

    function show() {
        $("#myModal").modal("show");
    }


    let tb="";
    let start = 0;
    function queryByTj(){
        tb.bootstrapTable("refresh",{query:{pageNumber:1}})
    }




    function queryData(){

        tb = $("#tb").bootstrapTable({
            url:"/admin/admin",
            pagination:true,
            sidePagination:"server",
            pageNumber:1,
            pageSize:5,
            pageList:[3,5,8],
            queryParamsType:"undefined",
            queryParams:function(p){
                start=(p.pageNumber-1)*p.pageSize;
                var np = {
                    pageNumber:p.pageNumber,
                    pageSize:p.pageSize,

                }
                return np;
            },

            columns:[{
                field: 'checkStatus',checkbox: true,

            },{
                field:start,
                title:"序号"
            },{
                field:"adminname",
                title:"用户名"
            },{
                field:"password",
                title:"密码",
                formatter:function(value,row,index) {
                    if (row.id==1) {
                        return "****";
                    }
                    return value;
                }

            },{
                title:"操作",
                formatter:function(value,row,index){
                    let i = ${sessionScope.a.id};
                   if(i==1){
                       if(row.id != 1){
                           return "<a href='javascript:void(0)' id='info' class='btn btn-primary'>删除</a>";
                       }
                       return "没有权限";
                   }

                    return "没有权限";


                },
                events:etevents

            },]
        });

    }
    window.etevents={
        'click #info':function(event,value,row,index){

            $.post("/admin/deleteAdmin",{id : row.id},function (msg) {
                if (msg.code == 200) {

                    location.reload();
                }

            },"json")

        },

    }




</script>

</body>

</html>
