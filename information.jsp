
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <title>用户信息</title>
        <style>
            header{
                background-color:#F8F8F8;
                height:110px;
                border:1px solid #F0F0F0;
            }

            header span{
                float:left;
                margin-top:7px;
            }
            body{
                font-famile:"微软雅黑";

            }
            header a{
                float:right;
                margin-top:2px;
                margin-left:30px;
            }
            #div1 {
                width: 40%;
                float: left;
                text-align: left;
                padding-left: 20px;
            }

            #div2 {
                width: 50%;
                float: left;
                text-align: right;
                padding-right: 10px;
            }

            li {
                display: inline;
            }
            article {
                width: 100%;
                height: 1050px
            }

            aside {
                /*margin: 0 auto;*/
                width: 100%;
                height: 80px;
            }

            #as1 {
                width: 20%;
                height: 80px;
                background-color: #121212;
                margin-left: 20%;
                text-align: left;
                float: left;
            }

            #as2 {
                width: 20%;
                height: 80px;
                background-color: #121212;
                text-align: left;
                float: left;
            }

            #as3 {
                width: 20%;
                height: 80px;
                background-color: #121212;
                text-align: left;
                float: left;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="center">
                <img src="../phone/8.png" alt="商城"  width="8%" height="5%" style="margin-left: 150px;margin-top: 0px" />
                <!--<h1><span style="text-align: center; color: palevioletred;float: right;margin-right: 50px;margin-top: 0px">遇见书店</span></h1>-->
                <div style="float: right;margin-right: 130px;margin-top: 20px;font-size: 40px;color:#4671D5;font-family: 等线">遇见书店</div>
            </div>
        </header>
        <hr/>
        <article>

            <br><br>

            <aside>
                <div id="as1">
                    <h2>
                        <!--<a href="video/lanqiu.mp4" target="Myiframe" style="padding-left: 100px;color: #FFF5EE">动作库</a>-->
                        <a href="/ZbiaoDemo/NameInformation" target="Myiframe" style="padding-left: 100px;color: #FFF5EE">信息查询</a>
                    </h2>

                </div>
                <div id="as2">
                    <h2>
                        <a href="/ZbiaoDemo/BuyInformation" target="Myiframe" style="padding-left: 100px;color: #FFF5EE">交易记录</a>
                    </h2>

                </div>
                <div id="as3">
                    <h2>
                        <a href="/ZbiaoDemo/CarInformation" target="Myiframe" style="padding-left: 100px;color: #FFF5EE">购物车
                        </a>
                    </h2>

                </div>
                <!--<div id="as4">
                    <h2>
                        <a href="赛事视频.mp4" target="Myiframe" style="padding-left: 100px;color: #FFF5EE">教学视频
                        </a>
                    </h2>
    
                </div>-->
            </aside>
            <section>
                <div id="se1">
                    <iframe src="" name="Myiframe" width="60%" height="600px"  style="align-content: center;margin-left: 20%;">

                    </iframe>
                </div>

            </section>


        </article>

    </body>
</html>
