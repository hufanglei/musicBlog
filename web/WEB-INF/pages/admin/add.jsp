<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
      <%@include file="../common/taglib.jsp"%>
      <html>
       <head>
       <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <!--当前页面的三要素-->
          <title>新增/更新页面</title>
                          <meta name="Keywords" content="关键词,关键词">
      <meta name="description" content="">
      <%@include file="../common/common.jsp"%>
      <style>
       input[readonly]{
           background:#e5e5e5;
       }
       .h_tabbox{
          width: 1200px;
          background: #f9f9f9;
          margin: 20px auto 0;
          padding:6px;
          position:relative;
       }
       .container .mbox {
           width: 960px;;
       }
       .h_tabbox  h1{padding:18px 0;
           font-size:18px;
       }
       .container .mbox .tit_over{
           background:rgba(0,0,0,0.5) ;
       }
       .container .mbox .tit_over h1 {
           line-height:100px ;
           overflow: hidden;
           width:640px;
           height: 100px;
           margin: 80px auto 10px;

       }
       .container .mbox .tit_over h1 input{
           width: 100%;
           height: 100%;
           background: transparent;
           border: none;
           outline: none;
           text-align: center;
           color:#fff;
           font-size: 32px;;
       }
       .container .content  .cntarea{
           width: 100%;
           height: 100%;
           background: transparent;
           border: 0;
           outline: none;
           color:#000;
           font-size: 14px;;
           height: 118px;overflow-y:auto;
           padding: 10px;
       }
       .container .mbox .tit_over .ke_op {
           top: 250px;
       }
       .edit{
           border:2px dotted #ccc;height: 120px;overflow-y:auto;
       }
       .buttoncnt{
           text-align: center;
           height: 120px;

       }

        .buttoncnt a{
           padding:5px 30px;
           color:#fff;

       }
       .buttoncnt .rtn{
           background: #666;

       }
       .buttoncnt a:last-child{
           background: green;
       }
       .buttoncnt .rtn:hover{
           background: #999;
       }
       .buttoncnt a:last-child:hover{
           background: #5f8011;
       }
       .mcontent p{
           margin-top: 12px;
       }
       .mcontent p input{
           width: 100%;
           border: 1px solid #ddd;
           padding: 10px;
           outline: none;
       }
      .ke_op2{
          position: absolute;
          left: 445px;
          top: 251px;
          left: 54%;
          color: #fff;
          /* margin-left: 11px; */
          display: block;
          height: 64px;
          margin: 0 auto;
          width: 64px;
          border-radius: 50%;
          line-height: 58px;
      }

  </style>
</head>
<body data-opid="${blog.id}">
       <%@include file="../common/header.jsp"%>
       <div class="h_tabbox">
           <a href="${basePath}/admin/index.do"><i class="iconfont icon-back"></i>返回列表</a>
           <hr/>
           <h1>添加主题</h1>

           <!--start container-->
           <div class="container" >
               <input type="file" class="hidden" id="file" name="file"  accept="image/jpeg,image/png,image/gif,audio/mp3"  onchange="uploadFile()" />
               <audio  id="audio" data-dir="blog/mp3" data-link="${blog.musiclink}"></audio>

               <!--start 音乐海报区-->
               <div class="mbox">
                   <img id="img" data-img="${blog.img}" data-dir="blog/images" src="${basePath}/${blog.img}" class="h_imgs"  width="960" height="350"/>
                   <!-- 定位层1 音轨 -->
                   <div id="yinguiwrapbox"></div>
                   <!-- 定位层2  -->
                   <%--<div id="p_cover"></div>--%>
                   <div class="tit_over ">
                       <h1 class="edit">
                           <input type="text" id="title" value="${blog.title}"/>
                       </h1>
                       <p class="mb40"> ${user.username} @ 刚刚
                           <span id="ftime">${blog.musictime}</span> /
                           <span id="dtime">00:00</span>
                           <span id="perc">0%</span>
                       </p>
                       <a href="javascript:void(0)" onclick="openBrowse(this,'#img')"  class="ke_op mt64 ">
                           <i class="iconfont icon-upload fz32 " style="padding-right: 0"></i>
                       </a>
                       <a href="javascript:void(0)" onclick="adminBlog.playMusic(this)"  class="ke_op2 mt64 ">
                           <i class="iconfont icon-play fz32 " style="padding-right: 0"></i>
                       </a>
                   </div>
               </div>
               <!--end 音乐海报区-->

               <div class="content edit mt28">
                   <textarea class="cntarea"  id="description" >${blog.description}</textarea>
               </div>
               <!--start content-->
               <div class="mcontent  mt28">
                   <a href="javascript:void(0)" onclick="openBrowse(this,'#audio')"  class="ke_op mt64 ">
                       <i class="iconfont icon-mp3type fz32 " style="padding-right: 0"></i>
                   </a>
                   <p><input type="hidden"  id="musiclink"        value="${blog.musiclink}"/> </p>
                   <p>音乐歌者：<input type="text"  id="musictor"   value="${blog.musictor}"/> </p>
                   <p>音乐标题：<input type="text"  id="musictitle" value="${blog.musictitle}" /> </p>
                   <p>音乐大小：<input type="text"  id="musicsize" readonly="readonly" onfocus="this.blur()" value="${blog.musicsize}"/> </p>
                   <p>音乐时长：<input type="text"  id="musictime" readonly="readonly"  onfocus="this.blur()" value="${blog.musictime}"/> </p>

               </div>
               <!--end content-->
               <div class="buttoncnt  mt28">
                   <select id="catagoryId">
                       <option value="">--请选择分类--</option>
                       <option value="1" ${blog.catagoryId==1?"selected=selected":""}>摇滚</option>
                       <option value="2" ${blog.catagoryId==2?"selected=selected":""}>流行</option>
                       <option value="3" ${blog.catagoryId==3?"selected=selected":""}>民谣</option>
                       <option value="4" ${blog.catagoryId==4?"selected=selected":""}>黑暗</option>

                   </select>
                   <a href="${basePath}/admin/index.do"  class="rtn"><i class="iconfont icon-back"></i>返回列表</a>
                   <a href="javascript:void(0);" onclick="adminBlog.save(this)" ><i class="iconfont icon-save"></i>保存期刊</a>
               </div>

           </div>
           <!--end container-->

       </div>


   <script>
        var adminBlog = {
             save:function(obj){
                 var title = $("#title").val();
                 var description = $("#description").val();
                 var catagoryId =  $("#catagoryId").val();
                 var img =  $("#img").data("img");
                 var musiclink = $("#musiclink").val();
                 var musictor = $("#musictor").val();
                 var musictitle = $("#musictitle").val();
                 var musicsize =$("#musicsize").val();
                 var musictime =$("#musictime").val();

                 var params = {
                     title:title,
                     description:description,
                     categoryId:catagoryId,
                     img:img,
                     musiclink:musiclink,
                     musictor:musictor,
                     musictitle:musictitle,
                     musicsize:musicsize,
                     musictime:musictime
                 };

                 //编辑状态下有一个ID
                 var opid =  $("body").data("opid");
                 var method =  "save";
                 //如果编辑状态
                 if(isNotEmpty(opid)){
                    params["id"] = opid;
                    method = "update";
                 }

                 $.ajax({
                     type:"post",
                     url:basePath + "/admin/"+method+".do",
                     data:params,
                     success:function(data){
                         if(data=="success"){
                             messageTip.tip(method=="save"?"保存成功":"更新成功");
                             setTimeout(function(){
                                 window.location.href = basePath + "/admin/index.do";
                             },1000);
                         }
                     }

                 });
             },
             init:function(){
                $(".h_imgs").on("error" ,function(){
                    $(this).attr("src" , basePath+"/resource/images/noimage.gif");
                });
             },
             audioDom:  document.getElementById("audio"),
             playMusic:function(obj) {
                 var $this = this;
                 var $i = $(obj).find("i");
                 if ($i.hasClass("icon-play")) {
                     $i.removeClass("icon-play").addClass("icon-pause");
                     $this.audioDom.play();
                 } else {
                     $i.removeClass("icon-pause").addClass("icon-play");
                     $this.audioDom.pause();
                 }
             }
        };
        adminBlog.init();
        imgerr.init();
        function tz_uploadsuccess(to,jdata){
            if(jdata.target=="#img"){
                $(jdata.target).data("img",jdata.url).attr("src",basePath+"/"+jdata.url+"?"+new Date().getTime());
            }else if(jdata.target=="#audio"){
                $(jdata.target).attr("src",basePath+"/"+jdata.url).data("link",jdata.url);
                $("#musictitle").val(jdata.name);
                $("#musicsize").val(jdata.size);
                $("#musiclink").val(jdata.url);
                adminBlog.audioDom.oncanplaythrough =function(){
                    var time = this.duration;
                    var m = Math.ceil(time / 60 );
                    var s = Math.ceil(time % 60);
                    if(m<10)m="0"+m;
                    if(s<10)s="0"+s;
                    $("#musictime").val(m+":"+s);
                }
            }
        }
  </script>

       <script type="text/javascript" src="${basePath}/resource/js/upload.js"></script>
</body>
</html>
