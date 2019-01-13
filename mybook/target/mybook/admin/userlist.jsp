<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户列表</title>

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
                                <div class="panel-heading" role="tab" id="headingOne">

                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        <form class="form-inline" role="form">
                                            <div class="form-group">


                                                <button type="button" id="remove"   class="btn btn-success">删除</button>
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


    let tb="";

    function queryByTj(){
        tb.bootstrapTable("refresh",{query:{pageNumber:1}})
    }




    function queryData(){
        $("#remove").on("click", function () {
            window.location.reload();

            // $("#table").bootstrapTable('getSelections');为bootstrapTable自带的，所以说一定要使用bootstrapTable显示表格,#table：为table的id
            var rows = $("#tb").bootstrapTable('getSelections');
            console.log(rows);
            if (rows.length == 0) {// rows 主要是为了判断是否选中，下面的else内容才是主要
                alert("请先选择要删除的记录!");
                return;
            } else {
                var arrays = new Array();// 声明一个数组
                $(rows).each(function () {// 通过获得别选中的来进行遍历
                    arrays.push(this.id);// cid为获得到的整条数据中的一列
                });

                var idcard = arrays.join(','); // 获得要删除的id



                $.post("/admin/delete", "deleteid=" + idcard, function (msg) {
                    console.log(deleteid)
                }, "json")
            }
        })

        tb = $("#tb").bootstrapTable({
            url:"/admin/getUser",
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

                }
                return np;
            },

            columns:[{
                field: 'checkStatus',checkbox: true,

            },{
                field:"id",
                title:"序号"
            },{
                field:"username",
                title:"用户名"
            },{
                field:"age",
                title:"年龄"

            },{
                field:"realname",
                title:"真实姓名"
            },{
                field:"cardid",
                title:"身份证"
            }]
        });

    }




</script>

</body>

</html>
