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
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            条件查询
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <form class="form-inline" role="form">

                                            <div class="form-group">

                                            </div>
                                            <div class="form-group">
                                                <label  for="bookname">书名:</label>
                                                <input type="text" class="form-control"
                                                       id="bookname" name="bookname"
                                                       placeholder="请输入姓名">
                                            </div>

                                            <div class="form-group">
                                                <label  for="category">种类:</label>
                                                <select class="form-control"
                                                        id="category" name="category"
                                                        >

                                                </select>
                                            </div>

                                            <button type="button" class="btn btn-primary" onclick="queryByTj()">查询</button>

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
                <h4 class="modal-title" id="myModalLabel">详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" action="book" method="post" enctype="multipart/form-data">

                    <!--书名-->
                    <div class="form-group">
                        <label for="bname" class="col-sm-2 control-label">书名:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bname" name="bname" >
                        </div>
                    </div>
                    <!--作者-->
                    <div class="form-group">
                        <label for="author" class="col-sm-2 control-label">作者:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="author" name="author" >
                        </div>
                    </div>
                    <!--出版社-->
                    <div class="form-group">
                        <label for="publish" class="col-sm-2 control-label">出版社:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="publish" name="publish" >
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
                    <!--数量-->
                    <div class="form-group">
                        <label for="publish" class="col-sm-2 control-label">数量:</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="number" name="number" >
                        </div>
                    </div>

                    <!--图片-->
                    <div class="form-group">


                        <div class="col-sm-12" id="pics">

                        </div>
                    </div>


                </form>
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



    function queryByTj(){
        tb.bootstrapTable("refresh",{query:{pageNumber:1}})
        $("#bookname").val("");
        $("#category").val(-1);

    }


    let tb="";


    function queryData(){


        tb = $("#tb").bootstrapTable({
            url:"/book/queryBook",
            pagination:true,
            sidePagination:"server",
            pageNumber:1,
            pageSize:5,
            pageList:[3,5,8],
            queryParamsType:"undefined",
            queryParams:function(p){

                var np = {

                    pageNumber:p.pageNumber,
                    pageSize:p.pageSize,
                    bookname:$("#bookname").val(),
                    category:$("#category").val()
                }
                return np;
            },

            columns:[{
                field: 'checkStatus',checkbox: true,

            },{
                field:"id",
                title:"序号"
            },{
                field:"bookname",
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
                field:"number",
                title:"数量"
            },{
                title:"操作",
                formatter:function(value,row,index){
                    if(row.number>0){
                        return "<a href='javascript:void(0)' id='info' class='btn btn-primary'>详情</a> | <a href='javascript:void(0)' id='borrow' class='btn btn-primary'>借书</a>";
                    }
                    return "<a href='javascript:void(0)' id='info' class='btn btn-primary'>详情</a> | 数量不足";

                },
                events:etevents

            },]
        });

    }
    window.etevents={
        'click #info':function(event,value,row,index){
            $("#bname").val(row.bookname);
            $("#author").val(row.author);
            $("#publish").val(row.publish);
            $("#categoryid").val(row.caid);
            $("#number").val(row.number);

            let pic = "<img id='img'  src='${pageContext.request.contextPath}/image/"+row.picurl+"'>"
            $("#pics").html(pic);
            $("#myModal").modal("show");


        },
        'click #borrow':function(event,value,row,index){
            $.post("/record/borrow",{id : row.id},function (msg) {
                if (msg.code == 500) {
                 alert(msg.msg);
                 return;
                }
                alert("租赁成功");
                queryByTj()
            },"json")


        }

    }




</script>

</body>

</html>
