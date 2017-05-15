<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-8-7
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--当前页面的三要素-->
    <title>html模板</title>
    <meta name="Keywords" content="关键词,关键词">
    <meta name="description" content="">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1470449611_333003.css">
    <!--css,js-->
    <!--首页css-->
    <link rel="stylesheet" href="http://localhost:8080/musicBlog/resource/css/index.css"/>
    <!--音轨css-->
    <link rel="stylesheet" href="http://localhost:8080/musicBlog/resource/css/musicBar.css"/>


</head>
<body>


<!--start header -->
<div class="header">
    <div class="headerbox">
        <div class="c_left">
            <a href="javascript:void(0)" class="logo">
                <!-- <img src="" alt=""> -->
                这里放160*60的logo
            </a>
            <ul class="nav">
                <li><a href="javascript:void(0)"><i class="iconfont icon-home"></i>首页</a></li>
                <li><a href="javascript:void(0)"><i class="iconfont icon-star"></i>专题</a></li>
                <li><a href="javascript:void(0)"><i class="iconfont icon-bell"></i>社区</a></li>
                <li><a href="javascript:void(0)"><i class="iconfont icon-music"></i>单曲</a></li>
            </ul>
        </div>
        <div class="c_right">
            <a href="#">注册</a>
            <a href="#">登陆</a>
        </div>
    </div>
</div>
<!--start end -->

<!--start container-->
<div class="container ">

    <!--start 音乐海报区-->
    <div class="mbox">
        <img src="http://demo.cssmoban.com/cssthemes2/cctp_37_pixel/css/images/slide-1.jpg" alt="" width="960"
             height="350">
        <!-- 定位层1 音轨 -->
        <div id="yinguiwrapbox"></div>
        <!-- 定位层2  -->
        <div id="p_cover"></div>
        <div class="tit_over ">
            <h1> <i class="iconfont icon-music fz32 " style="display: inline-block"></i>当美好事物的改变的时候，我们总是去拥抱!!!</h1>

            <p class="mb40">2016-08-06 @hfl
                <span id="ftime">00:00</span> /
                <span id="dtime">00:00</span>
                <span id="perc">0%</span>
            </p>
            <a href="javascript:void(0)" class="ke_op mt64 ">
                <i class="iconfont icon-play fz64 " style="padding-right: 0"></i>
            </a>
        </div>
    </div>
    <!--end 音乐海报区-->


    <!--start content-->
    <div class="content">
        <p class="mt28 mb20">一首歌唱到最后还会剩下什么？</p>

        <p class="mb20">无非相遇别离、无非是找到自己的位置，并安然地待下去。除此之外，别无其他。值得庆幸的是，我们依然能够剔除掉表面的玩意，内敛而踏实地活着。在灿烂的夜晚里，依然能够笑着流出了泪。</p>

        <p>本期音乐为华语摇滚乐专题。</p>
        <audio src="http://localhost:8080/musicBlog/resource/mp3/1.mp3" id="audio"
               class="mt16"></audio>
        <div class="process" style="display: none;">
            <div id="percent"></div>
        </div>
    </div>
    <!--end content-->

    <!--start 推荐区-->
    <div class="relation mt64">
        <h1><i class="iconfont icon-star fz32"></i>相似主题</h1>
        <ul class="mt16">
            <li>
                <a href="javascript:void(0)">
                    <img  src="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/9912/cover.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/9913/cover.jpg" alt=""></a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/9914/cover.jpg" alt="">
                </a>
            </li>
            <li>
                <a href="javascript:void(0)">
                    <img src="http://7xkszy.com2.z0.glb.qiniucdn.com/pics/albums/9915/cover.jpg" alt=""></a>
            </li>
        </ul>
        <div class="clearfix"></div>
    </div>
    <!--end 推荐区-->

    <!--start 评论区-->
    <div class="comments mt64">
        <!--start 评论框-->
        <div class="areabox">
            <textarea placeholder="请在这里输入评论..."></textarea>
            <div class="sutn">
                <a href="javscript:void(0)" class="fr"><i class="iconfont icon-star"></i>发表评论</a>
            </div>
        </div>
        <!--end 评论框-->
        <hr>
        <div class="commentbox">
            <div class="comment">
                <div class="info ">
                    <div class="i_left">
                        <a href="javscript:void(0);" class="name">kingsley</a>
                        <a href="javscript:void(0);" class="level">member</a>
                    </div>
                    <div class="i_right">
                        <a href="javscript:void(0);">回复</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="content">
                    <div class="mb10">我非常羡慕和向往你这样热爱生活的自由创业者。</div>
                    <div>2 个月 1 周 以前</div>
                </div>
                <hr>
            </div>
            <div class="comment">
                <div class="info ">
                    <div class="i_left">
                        <a href="javscript:void(0);" class="name">kingsley</a>
                        <a href="javscript:void(0);" class="level">member</a>
                    </div>
                    <div class="i_right">
                        <a href="javscript:void(0);">回复</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="content">
                    <div class="mb10">我非常羡慕和向往你这样热爱生活的自由创业者。</div>
                    <div>2 个月 1 周 以前</div>
                </div>
                <hr>
            </div>
            <div class="comment">
                <div class="info ">
                    <div class="i_left">
                        <a href="javscript:void(0);" class="name">kingsley</a>
                        <a href="javscript:void(0);" class="level">member</a>
                    </div>
                    <div class="i_right">
                        <a href="javscript:void(0);">回复</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="content">
                    <div class="mb10">我非常羡慕和向往你这样热爱生活的自由创业者。</div>
                    <div>2 个月 1 周 以前</div>
                </div>
                <hr>
            </div>
        </div>
    </div>
    <br><br>
    <!--end 评论区-->
</div>
<!--end container-->



<script type="text/javascript" src="http://localhost:8080/musicBlog/resource/js/jquery-1.11.2.min.js"></script>
<script src="http://localhost:8080/musicBlog/resource/js/util.js"> </script>
<script src="http://localhost:8080/musicBlog/resource/js/musicBar.js"> </script>
<script src="http://localhost:8080/musicBlog/resource/js/musicAudio.js"> </script>


</body>
</html>
