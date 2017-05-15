<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <!--当前页面的三要素-->
  <title>博客后台管理首页</title>
  <meta name="Keywords" content="关键词,关键词">
  <meta name="description" content="">
  <%@include file="../common/common.jsp"%>
  <style>
      .h_tabbox{
           width: 1200px;
           background: #f9f9f9;
           margin: 20px auto 0;
           padding:6px;
           position:relative;
      }
      .h_tabbox table {
          width: 100%;
          border-collapse: collapse;
      }
      .h_tabbox table tr th{
        background: #ccc;
      }
      .h_tabbox table tr td , th{
          border: 1px solid #fff;
          padding: 4px 12px;;
          color:#666;
          font-size: 12px;;
      }

      @media screen and (max-width: 1200px) {
        .h_tabbox{width: 100%;}
      }
      .green{
        color:green;
      }
      .red{
        color:red;
      }

      /*分页相关 start*/
      .tzPage{font-size: 12px;
          position: absolute;
          bottom: -42px;
          right: 0px;}
      .tzPage a{text-decoration:none;border:solid 1px #ccc;color:#999;}
      .tzPage a,.tzPage span{display:block;float:left;padding:0em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;line-height: 22px;height: 22px;}
      .tzPage .current{background:#e5e5e5;color:#999;border:solid 1px #e5e5e5;}
      .tzPage .current.prev,.tzPage .current.next{color:#999;border:1px solid #e5e5e5;background:#fff;}
      .tm_psize_go{margin-right:4px;float:left;height:24px;line-height:33px;position:relative;border:1px solid #e5e5e5;color:#999}
      #tm_pagego{height:22px;width:30px;float:left;text-align:center;border:1px solid #e5e5e5;line-height: 22px;color:#999}
      .sortdesc{border-top:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
      .sortasc{border-bottom:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
      /*分页相关 end*/

  </style>
</head>
<body>
       <%@include file="../common/header.jsp"%>

        <div class="h_tabbox">
            <a href="${basePath}/admin/add.do"><i class="iconfont icon-add"></i>添加专题</a>
            <%--<c:forEach var="num"  begin="1" end="26" >--%>
                <%--<span>${hfl:getChar(num)}</span>--%>
            <%--</c:forEach>--%>
           <table>
               <thead>
                   <tr>
                       <th>ID</th>
                       <th>标题</th>
                       <th>分类</th>
                       <th>作者</th>
                       <th>时间</th>
                       <th>点击数/评论数</th>
                       <th>发布状态</th>
                       <th>是否置顶</th>
                       <th>操作</th>
                   </tr>
               </thead>
               <tbody id="tbody" data-itemcount="${itemCount}">
                  <c:forEach var="blog" items="${blogs}" varStatus="bindex">
                      <tr>
                        <td><input type="checkbox" value="${blog.id}"/></td>
                        <td><a href="${basePath}/blog/detail/${blog.id}.do" >${blog.title}===${hfl:getChar(bindex.index+1)}</a></td>
                        <td>${blog.name}</td>
                        <td>${blog.username}</td>
                        <td>${hfl:dateFormat(blog.createTime,'yyyy/mm/dd HH:mm:ss')} </td>
                        <td>${blog.hits}/${blog.comments}</td>
                        <td><a href="javascript:void(0);" onclick="adminBlog.status(this)" class="${blog.status==1?'green':'red'}" data-opid="${blog.id}" data-mark="${blog.status}">${blog.status==1?"发布":"未发布"}</a></td>
                        <td><a href="javascript:void(0);" onclick="adminBlog.isTop(this)" class="${blog.isTop==1?'green':'red'}" data-opid="${blog.id}" data-mark="${blog.isTop}">${blog.isTop==1?"是":"否"}</a></td>
                        <td>
                          <a href="${basePath}/admin/edit/${blog.id}.do">修改</a>
                          <a href="javascript:void(0)" onclick="adminBlog.del(this)"  data-opid="${blog.id}">删除</a>
                        </td>
                      </tr>
                  </c:forEach>
               </tbody>
           </table>
           <div id="h_page"></div>

        </div>


<script src="${basePath}/resource/js/page.js"></script>
 <script>
   $(function(){
       adminBlog.init($("#tbody").data("itemcount"));
   });

   var adminBlog = {

       init:function(itemCount){
           $("#h_page").tzPage(itemCount, {
             num_display_entries : 5, //主体页数
             num_edge_entries : 4,//边缘页数
             current_page : 0,//指明选中页码
             items_per_page : 10, //每页显示多少条
             prev_text : "首页",
             next_text : "尾页",
             showGo:true,//显示
             showSelect:true,
             callback : function(pageNo, psize) {//会回传两个参数一个当前页，显示的页数
               adminBlog.loadData(pageNo,psize);
             }
           });
       },
       loadData: function (pageNo,psize) {
           $.ajax({
               type:"post",
               url:basePath + "/admin/loadTemplate.do",
               data:{pageNo:pageNo*psize , pageSize:psize},
               success: function (data) {
                   if(data){
                       var html = "";
                       var blogArr = data.blogs;
                       for(var i=0,len=blogArr.length;i<len;i++){
                           var blog = blogArr[i];
                           html+="<tr>"+
                                   "	<td><input type='checkbox' value='"+blog.id+"'/></td>"+
                                   "<td><a href='"+basePath+"/blog/detail/"+blog.id+".do' >"+blog.title+"</a></td>" +
                                   "	<td>"+blog.name+"</td>"+
                                   "	<td>"+blog.username+"</td>"+
                                   "	<td>"+blog.createTime+"</td>"+
                                   "	<td>"+blog.hits+"/"+blog.comments+"</td>"+
                                   "    <td><a href='javascript:void(0);' onclick='adminBlog.status(this)' class='"+(blog.status==1?'green':'red')+"' data-opid='"+blog.id+"' data-mark='"+blog.status+"'>"+(blog.status==1?'发布':'未发布')+"</a></td>"+
                                   "    <td><a href='javascript:void(0);' onclick='adminBlog.isTop(this)' class='"+(blog.isTop==1?'green':'red')+"' data-opid='"+blog.id+"' data-mark='"+blog.isTop+"'>"+(blog.isTop==1?'是':'否')+"</a></td>"+
                                   "	<td>"+
                                   "	  <a href='${basePath}/admin/edit/"+blog.id+".do'>修改</a>"+
                                   "      <a href='javascript:void(0)' onclick='adminBlog.del(this)'  data-opid='${blog.id}'>删除</a>  "+
                                   "	</td>"+
                                   "</tr>";
                       }

                       $("#tbody").html(html);
                   }
               },
               error: function (res) {
                   messageTip.tip("请求失败");
               }
           });
       },
       del:function(obj){
           if(confirm("您确认删除吗？")){
               var id = $(obj).data("opid");
               $.ajax({
                   type:"post",
                   url:basePath + "/admin/delete.do",
                   data:{id:id},
                   success: function (data) {
                       messageTip.tip(data=="success"?"删除成功！":"删除失败！");
                       $(obj).parents("tr").fadeOut("slow",function(){
                           $(this).remove();
                       });
                   },
                   error: function (res) {
                       console.log(res);
                       messageTip.tip("删除失败");
                   }
               });
           }
       },
       status:function(obj){
           var id = $(obj).data("opid");
           var status = $(obj).data("mark");
           var mark = status==1?0:1;
           $(obj).toggleClass("green red").html(status==1?"未发布":"发布");
           $(obj).data("mark",mark);
           $.ajax({
                type:"post",
                url:basePath+"/admin/status.do",
                data:{id:id,status:mark},
                success:function(data){
                    if(data=="success"){
                        messageTip.tip(data=="success"?"操作已成功！":"操作失败！");
                    }
                },
                error: function () {
                    messageTip.tip("请求失败！")
                }
           });
       },
       isTop:function(obj){
           var id = $(obj).data("opid");
           var isTop = $(obj).data("mark");
           var mark = isTop==1?0:1;
           $(obj).toggleClass("green red").html(isTop==1?"否":"是");
           $(obj).data("mark",mark);
           $.ajax({
               type:"post",
               url:basePath+"/admin/status.do",
               data:{id:id,isTop:mark},
               success:function(data){
                   if(data=="success"){
                       messageTip.tip(data=="success"?"操作已成功！":"操作失败！");
                   }
               },
               error: function () {
                   messageTip.tip("请求失败！")
               }
           });
       }

   };

 </script>
</body>
</html>
