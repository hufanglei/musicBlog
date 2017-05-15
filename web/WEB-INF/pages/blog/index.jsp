<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--当前页面的三要素-->
    <title>博客首页</title>
    <meta name="Keywords" content="关键词,关键词">
    <meta name="description" content="">
    <%@include file="../common/common.jsp"%>

</head>
<body>


<!--消息提示框-->


<!--start 弹出登录框-->
<!--end 弹出登录框-->

<!--start header -->
<%@include file="../common/header.jsp"%>
<!--start end -->


<!--start container-->
        <div class="wrapbox">
            <div class="w_left">

                <!--头部信息-->
                <div class="cheader" id="cheaderbox">

                </div>
                <div class="clearfix"></div>

                <!--内容区域信息-->
                <div class="cntbox">
                    <ul id="databox">
                    </ul>

                    <!--start 加载更多-->
                    <div class="loadmore">
                        <a href="javascript:void(0)" onclick="blog.loadData(this)"><i class="iconfont icon-bell"></i> <span class="text">加载更多数据</span></a>
                    </div>
                    <!--end 加载更多-->

                </div>
            </div>

            <!--右侧-->
            <div class="w_right">
                <div class="topic-title">
                    <h2 class="fl">热门话题</h2>
                    <div class="fr">3人评论</div>
                </div>
                <div class="pr">
                    <div class="iover"></div>
                    <a href="" >
                      <img src="${basePath}/resource/images/9.jpg" alt="" width="360" height="190"/>
                    </a>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>

<!--end container-->



<!--start footer-->
<%@include file="../common/footer.jsp"%>
<!--end footer-->
<script type="text/javascript" src="${basePath}/resource/js/index.js"></script>


</body>
</html>
