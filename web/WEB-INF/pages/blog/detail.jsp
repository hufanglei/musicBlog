<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
  <!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!--当前页面的三要素-->
  <title>博客详情页</title>
  <meta name="Keywords" content="关键词,关键词">
  <meta name="description" content="">
  <%@include file="../common/common.jsp"%>
  <!--音轨css-->
  <link rel="stylesheet" href="${basePath}/resource/css/musicBar.css"/>


</head>
<body data-typid="${blog.catagoryId}" data-opid="${blog.id}">

<!--start header -->
<%@include file="../common/header.jsp"%>
<!--start end -->

<!--start container-->
<div class="container" >

  <!--start 音乐海报区-->
  <div class="mbox">
    <img src="${basePath}/${blog.img}" alt="" width="960"
         height="350">
    <!-- 定位层1 音轨 -->
    <div id="yinguiwrapbox"></div>
    <!-- 定位层2  -->
    <%--<div id="p_cover"></div>--%>
    <div class="tit_over ">
      <h1> <i class="iconfont icon-music fz32 " style="display: inline-block"></i>${blog.title}</h1>

      <p class="mb40">${blog.createTime} @${blog.username}
        <span id="ftime">${blog.musictime}</span> /
        <span id="dtime">00:00</span>
        <span id="perc">0%</span>
      </p>
      <a href="javascript:void(0)" class="ke_op mt64 ">
        <i class="iconfont icon-play fz48 " style="padding-right: 0"></i>
      </a>
    </div>
  </div>
  <!--end 音乐海报区-->


  <!--start content-->
  <div class="content">
   <p class="mt28 mb20"> ${blog.description} </p>

    <%--<p class="mb20">无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。</p>--%>

    <%--<p>本期音乐为华语摇滚乐专题。</p>--%>
    <audio src="${basePath}/${blog.musiclink}" id="audio"  class="mt16"></audio>
    <div class="process" style="display: none;">
      <div id="percent"></div>
    </div>
  </div>
  <!--end content-->

  <!--start 推荐区-->
  <div class="relation mt64">
    <h1><i class="iconfont icon-star fz32"></i>相似主题</h1>
    <ul class="mt16 " id="relationbox">
    </ul>
    <div class="clearfix"></div>
  </div>
  <!--end 推荐区-->

  <!--start 评论区-->
  <div class="comments mt64" id="comments">
    <!--start 评论框-->
    <div class="areabox">
      <textarea id="content"  maxlength="400" oninput="if(value.length>400)value=value.slice(0,400)"  onkeyup="relation.setCacheData(this)" placeholder="请输入评论（少于400字）..."></textarea>
      <div class="sutn">
        <a href="javscript:void(0)" onclick="relation.saveComment(this)" class="fr"><i class="iconfont icon-star"></i><span class="text">发表评论</span></a>
      </div>
    </div>
    <!--end 评论框-->
    <hr>

    <div class="commentbox">
        <ul id="commentUL">
        </ul>
    </div>
  </div>
  <br><br>
  <!--end 评论区-->

    <!--start 加载更多-->
    <div class="loadmore">
        <a href="javascript:void(0)" onclick="relation.loadComments(this)"><i class="iconfont icon-bell"></i> <span class="text">加载更多评论</span></a>
    </div>
    <!--end 加载更多-->
</div>
<!--end container-->



<!--start footer-->
<%@include file="../common/footer.jsp"%>
<!--end footer-->

<script type="text/javascript" src="${basePath}/resource/js/musicBar.js"> </script>
<script type="text/javascript" src="${basePath}/resource/js/musicAudio.js"> </script>
<script type="text/javascript" src="${basePath}/resource/js/detail.js"> </script>

</body>
</html>
