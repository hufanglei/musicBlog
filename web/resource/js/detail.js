$(function(){
    relation.load();       //展示相关期刊
    relation.loadComment(null);  //加载评论
    relation.init();    //初始化 显示未编辑完的评论缓存
});

var relation = {
    //初始化 取出未编辑完的评论缓存
    init:function(){
        if(window.localStorage){
            var blogid = $("body").data("opid");
            var text = localStorage.getItem("blogdetail_"+blogid);
            $("#content").val(text);
        }
    },

    //相关期刊
    load:function(){
        var typeId = $("body").data("typid");
        var opId   = $("body").data("opid");
        var params  = {typeId : typeId , filterId:opId};
        $.ajax({
            type:"post",
            data:params,
            url:basePath + "/blog/relation.do",
            success:function(data){
                var html = "";
                if(data!=null && data.length>0){
                    for(var i=0,len=data.length;i<len;i++){
                        html += "<li>"+
                        "        <a href='"+basePath+"/blog/detail/"+data[i].id+".do '>"+
                        "          <img  src='"+basePath+"/"+data[i].img+"' alt='"+data[i].title+"'>"+
                        "        </a><a   href='"+basePath+"/blog/detail/"+data[i].id+".do ' class='rp_t' title='"+data[i].title+"'>"+data[i].title+"</a>"+
                        "</li>";
                    }
                    var slen = 4 - data.length;
                    for(var i=0 ; i <slen ; i++){
                        html +=  "<li>"+
                        "        <a >"+
                        "          <img  src='"+basePath+"/resource/images/noimage.gif' alt='暂无图片'>"+
                        "        </a>"+
                        "</li>";
                    }
                    $("#relationbox").html(html);
                    imgerr.init();
                }else{
                    $(".relation").remove();
                }
            }
        });

    },
    savemark:true,
    //保存评论
    saveComment:function(obj){
        if(!relation.savemark)return;
        //判断是否登录
        var userName = $("#username").text();
        if(isEmpty(userName)){
            loginDialog.login();
            return;
        }
        var content = $("#content").val();
        if(isEmpty(content)){
            messageTip.tip("评论不能为空，请输入");
            $("#content").focus();
            return;
        }
        var blogId = $("body").data("opid");
        $("#content").val("").focus();
        relation.savemark = false;
        $(obj).removeAttr("onclick").find(".text").text("保存中...");
        $.ajax({
            type:"post",
            url: basePath + "/blog/saveComment.do",
            data:{
                description : content,
                blogId : blogId
            },
            success:function(data){
                var html = "";
                $("#commentUL").prepend(
                    "<li class='comment'>"+
                    "                <div class='info '>"+
                    "                    <div class='i_left'>"+
                    "                        <a href='javscript:void(0);' class='name'>"+userName+"</a>"+
                    "                        <a href='javscript:void(0);' class='level'>member</a>"+
                    "                    </div>"+
                    "                    <div class='i_right'>"+
                    "                        <a href='javscript:void(0);' data-replayid='"+data.id+"'>回复</a>"+
                    "                    </div>"+
                    "                    <div class='clearfix'></div>"+
                    "                </div>"+
                    "                <div class='content'>"+
                    "                    <div class='mb10'>"+data.description+"</div>"+
                    "                    <div>刚刚</div>"+
                    "                </div>"+
                    "                <hr>"+
                    "            </li>");
                relation.savemark = true;
                $(obj).attr("onclick" ,"relation.saveComment(this)").find(".text").text("发表评论");
                if(window.localStorage){
                    var blogid = $("body").data("opid");
                    var text = localStorage.removeItem("blogdetail_"+blogid);
                }
            }
        });
    },
    timer :null,
    loadCommentMark:true,
    pageNo:0,
    pageSize:10,
    loadComments: function (obj) {
        relation.pageNo++;
        relation.loadComment(obj);
    },
    loadComment:function(obj){
        if(this.timer)clearTimeout(this.timer);
        this.timer = setTimeout(function(){
            if(!relation.loadCommentMark) return;
            var pageno = relation.pageNo * relation.pageSize;
            var pagesize = relation.pageSize;
            var blogId = $("body").data("opid");
            var params = {
                pageNo : pageno,
                pageSize : pagesize,
                blogId : blogId
            };
            $.ajax({
                type:"post",
                url: basePath + "/blog/loadComments.do",
                data:params,
                success:function(data){
                    if(data  && data.length>0){
                        var html = "";
                        for(var i=0;i<data.length;i++){
                            html+="<li class='comment'>"+
                            "                <div class='info '>"+
                            "                    <div class='i_left'>"+
                            "                        <a href='javscript:void(0);' class='name'>"+data[i].username+"</a>"+
                            "                        <a href='javscript:void(0);' class='level'>member</a>"+
                            "                    </div>"+
                            "                    <div class='i_right'>"+
                            "                        <a href='javscript:void(0);' data-replayid='"+data[i].id+"'>回复</a>"+
                            "                    </div>"+
                            "                    <div class='clearfix'></div>"+
                            "                </div>"+
                            "                <div class='content'>"+
                            "                    <div class='mb10'>"+data[i].description+"</div>"+
                            "                    <div>"+data[i].createTime+"</div>"+
                            "                </div>"+
                            "                <hr>"+
                            "            </li>";
                        }
                        $("#commentUL").append(html);
                        //置底
                        if(relation.pageNo>=1){
                            document.body.scrollTop = document.body.scrollHeight - 100;
                        }
                    }else{
                        relation.loadCommentMark =  false;
                        $(obj).removeAttr("onclick").find(".text").text("数据加载完毕");
                    }
                }
            });
        },200);
    },
    //本地存储评论内容
    setCacheData:function(obj){
        var val = $(obj).val();
        if(window.localStorage){
            var blogid = $("body").data("opid");
            localStorage.setItem("blogdetail_"+blogid , val);
        }
    }
};