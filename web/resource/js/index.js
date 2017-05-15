
var blog = {
    pageNo:0,
    pageSize:10,
    mark:true,
    timer:null,
    loadData:function(obj){
        blog.pageNo++;
        blog.load(obj);
    },
    load:function(obj){
        if(blog.timer) clearTimeout(blog.timer);
        blog.timer = setTimeout(function(){
            if(!blog.mark) return;
            var pageno = blog.pageNo * blog.pageSize;
            var pagesize = blog.pageSize;
            var params = {
                pageNo : pageno,
                pageSize : pagesize
            };
            $.ajax({
                type:"post",
                url:basePath + "/blog/loadData.do",
                data:params,
                success:function(data){
                    if(data && data.length>0){
                        var html = "";
                        data.forEach(function(blog){
                            var desc = blog.description;
                            if(desc.length>150)desc=desc.substring(0,150)+"...";
                            html +=   "<li>"+
                            "	<a href="+basePath+"/blog/detail/"+blog.id+".do class='imgbox pr'  >"+
                            "		<div class='iover'></div>"+
                            "		<img width='200' height='124' src="+basePath+"/"+blog.img+" alt=''/>"+
                            "	</a>"+
                            "	<div class='stbox'>"+
                            "		<h3 class='title'><a href="+basePath+"/blog/detail/"+blog.id+".do><i class='iconfont icon-star'></i>"+blog.title+"</a></h3>"+
                            "		<p class='info'>"+
                            "			<span><i class='iconfont icon-time'></i>"+blog.createTime+"   &nbsp;&nbsp;</span>"+
                            "			<span><i class='iconfont icon-comment'></i>"+blog.comments+"</span>  &nbsp;&nbsp;"+
                            "			<span><i class='iconfont icon-music'></i>"+blog.hits+"</span>"+
                            "		</p>"+
                            "		<p class='desc'>"+desc+"</p>"+
                            "	</div>"+
                            "</li>";
                        });
                        $("#databox").append(html);
                        imgerr.init();
                        //置底
                        if(blog.pageNo>=1){
                            document.body.scrollTop = document.body.scrollHeight - 100;
                        }
                    }else{
                        blog.mark = false;
                        $(obj).removeAttr("onclick").find(".text").text("数据加载完毕");
                    }
                }
            });
        },200);
    },
    loadTop: function () {
        var params = {pageSize:3};
        $.ajax({
            type:"post",
            url:basePath + "/blog/loadDataTop.do",
            data:params,
            success: function (data) {

                if(data){
                    var html = "";
                    data.forEach(function(obj,index){
                        if(index==0){
                            html+= "<div class='bg_pic pr'>"+
                            "                        <div class='iover'></div>"+
                            "                        <a href='"+basePath+"/blog/detail/"+obj.id+".do"+"' ><img src='"+basePath+"/"+obj.img+"' alt='' width='533' height='300'/></a>"+
                            "                        <a href='"+basePath+"/blog/detail/"+obj.id+".do"+"' class='btext'>"+
                            "                            <h1 class='cp_h1'>"+obj.title+"</h1>"+
                            "                        </a>"+
                            "                    </div>";
                        }else{
                            html+=  "<div class='small_pic pr'>"+
                            "             <div class='iover'></div>"+
                            "                   <a href='"+basePath+"/blog/detail/"+obj.id+".do"+"'><img src='"+basePath+"/"+obj.img+"' alt='' width='257' height='145'/></a>"+
                            "             <a href='"+basePath+"/blog/detail/"+obj.id+".do"+"' class='btext2'>"+obj.title+"</a>"+
                            "         </div>";
                        }
                    });
                    $("#cheaderbox").html(html);

                }
                imgerr.init();
            }
            
        }); 
    }
    
};


$(function () {
    blog.load(null);
    blog.loadTop();
});