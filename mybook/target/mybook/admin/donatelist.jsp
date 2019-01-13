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

   <style>
       #img{
           width: 200px;
           height: 300px;
           margin-left: 150px;
           max-width: 100%;
           max-height: 100%;
       }
   </style>
</head>

<body class="gray-bg">
<div class="row wrapper border-bottom white-bg page-heading">
    <div class="col-sm-4">
        <h2>捐赠列表</h2>
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
                <h4 class="modal-title" id="myModalLabel">详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="/donate/queryDonate" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="hidden">
                    <!--书名-->
                    <div class="form-group">
                        <label for="bname" class="col-sm-2 control-label">书名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bname" name="bname" placeholder="请输入书籍名字">
                        </div>
                    </div>
                    <!--作者-->
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="author" name="author" placeholder="请输入书籍作者">
                        </div>
                    </div>
                    <!--出版社-->
                    <div class="form-group">
                        <label for="publish" class="col-sm-2 control-label">出版社:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="publish" name="publish" placeholder="请输入出版社">
                        </div>
                    </div>

                    <!--所在类别-->
                    <div class="form-group">
                        <label for="categoryid" class="col-sm-2 control-label">所在类别</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="categoryid" name="categoryid" >

                            </select>
                        </div>
                    </div>


                    <!--图片-->
                    <div class="form-group">

                        <div class="col-sm-12" id="pics">

                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="pass" onclick="pass()" class="btn btn-primary">通过</button>
                <button type="button" id="refuse" onclick="refuse()" class="btn btn-primary">拒绝</button>
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
        queryAllCas();
        queryData();


    });
    function pass() {

       $.post("/donate/pass",{id : $("#hidden").val()},function (msg) {
           if (msg.code == 200) {

               $("#myModal").modal("hide");
               window.location.reload();
           }

        },"json")
    }
    function refuse() {
        $.post("/donate/refuse",{id : $("#hidden").val()},function (msg) {
            if (msg.code == 200) {

                $("#myModal").modal("hide");
                window.location.reload();
            }

        },"json")

    }

    function queryAllCas() {
        $.post("/book/getAllCas","",function (msg) {
            console.log(msg);
            let ops="<option value='-1' >==请选择类别==</option>";
            $.each(msg,function (i,ca) {
                ops+="<option value='"+ca.id+"'>"+ca.category+"</option>"
            })
            $("#category").html(ops);
            $("#categoryid").html(ops);


        },"json")
    }


    let tb="";

    let start  = 0;




    function queryData(){


        tb = $("#tb").bootstrapTable({
            url:"/donate/queryAllDonate",
            pagination:true,
            sidePagination:"server",
            pageNumber:1,
            pageSize:3,
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
                field:"username",
                title:"用户"

            },{
                field:"name",
                title:"书名"
            },{
                field:"category",
                title:"种类"

            },{
                field:"publish",
                title:"出版社"
            },{
                field:"author",
                title:"作者"
            },{
                field:"status",
                title:"是否审核",
                formatter:function(value,row,index) {
                    if (0 == value) {
                        return "未审核";
                    } else if(1==value){
                        return "通过";
                    }else {
                        return "未通过";
                    }
                }
            },{
                title:"操作",
                formatter:function(value,row,index){

                    var info = "<a href='javascript:void(0)' id='info' class='btn btn-primary'>详情</a>";

                    return info;
                },
                events:etevents

            },]
        });

    }
    window.etevents={
        'click #info':function(event,value,row,index){
            $("#hidden").val(row.id)
            $("#bname").val(row.name);
            $("#author").val(row.author);
            $("#publish").val(row.publish);
            $("#categoryid").val(row.caid);


            let pic = "<img id='img' src='${pageContext.request.contextPath}/image/"+row.picurl+"'>"
            $("#pics").html(pic);
            if(row.status == 1 || row.status == 2){
                $("#pass").attr("style","display:none;");
                $("#refuse").attr("style","display:none;");
            }

            $("#myModal").modal("show");


        },

    }




</script>

</body>

</html>
