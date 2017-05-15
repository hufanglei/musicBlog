$(function(){
	loginDialog.loginSuccess();
	toTop.init();
	imgerr.init();

});

//图像错误 默认显示处理
var imgerr = {
	init:function(){
		$("img").on("error" ,function(){
			$(this).attr("src" , basePath+"/resource/images/noimage.gif");
		});
	}
};

//提示框
var messageTip = {
	tip:function(message){
		$("#messagetip").remove();
		var html ="<div id='messagetip'>"+
		"         <i class='iconfont icon-bell'></i> "+ message +
		"         </div>";
		$("body").append(html);
		$("#messagetip").stop(true).animate({top:0}).delay(3000).animate({top:-59});
		$("#messagetip").on("click",function(){
			$("#messagetip").stop(true,true).animate({top:-59},600);
		});
	}
};

//置顶
var toTop = {
	init:function(){
		$(window).scroll(function(){
			var top = $(this).scrollTop();
			$("#toTop")[top>=200?"show":"hide"](200);
		});
		$("#toTop").on("click",function(){
			$("html,body").animate({scrollTop:0},500);
		});
	}
};

var loginDialog = {
	logout:function(obj){
		$.ajax({
			type:"post",
			url:basePath + "/login/logout.do",
			success:function(data){
			   if(data == "success"){
				   var html = "<a href='javascript:void(0)'>注册</a> "+
					   "         <a href='javascript:void(0)' onclick='loginDialog.login()'>登陆</a>";
				   $("#loginbox").html(html);
				   window.location.href = basePath;
			   }
			}
		});
	},
	loginSuccess:function(){
		$.ajax({
			type:"post",
			url:basePath + "/login/success.do",
			success:function(data){
				var html = "";
				//登录成功
				if(data){
					 html = "<a href='javascript:void(0)' onclick='loginDialog.logout(this)'>"+
						"        <i class='iconfont icon-bell'></i>退出"+
						"         </a>"+
						"         <a  href='" + basePath + "/admin/index.do"+"' id='username' title='"+data.username+"'>"+data.username+"</a>";

				}else {
					 html = "<a href='javascript:void(0)'>注册</a> " +
						"         <a href='javascript:void(0)' onclick='loginDialog.login()'>登陆</a>";
				}
				$("#loginbox").html(html);
			}
		});
	},
	login:function(){
		$("#login_dialog").remove();
		$("body").append("<div id='login_dialog'>"+
		"    <div class='loginwrap'>"+
		"        <div class='logo'>"+
		"            <a href=''>"+
		"                <img src='http://localhost:8080/musicBlog/resource/images/logo.gif' alt='logo'/>"+
		"            </a>"+
		"        </div>"+
		"        <div class='cnt_i'>"+
		"           <p><input type='text' class='inp' id='email' value='690328661@qq.com' placeholder='请输入账号...' autocomplete='false' autofocus='true'/></p>"+
		"           <p><input type='text' class='inp' id='password' placeholder='请输入密码...' value=''/></p>"+
		"           <p  class='lbtn'><a href='javascript:void(0)' class='subbtn'><i class='iconfont icon-bell'></i>登陆</a></p>"+
		"        </div>"+
		"    </div>"+
		"</div>"+
		"<div class='dialogcover'></div>");

		$("#login_dialog").next().off("click").on("click",function(){
			$("#login_dialog").add(this).fadeOut("slow",function(){
				  $(this).remove();
			});
		});

		//给登录按钮绑定点击事件  点击时候出发登录方法
		$("#login_dialog").find(".subbtn").off("click").on("click",loginMain);

		//给dom对象添加回车事件  回车触发发登录按钮的点击事件
		$(document).keydown(function (e) {
			if(e.keyCode == 13){
				$("#login_dialog").find(".subbtn").trigger("click");
			}
		});

		//点击登录的主方法
		function loginMain(){
			var $btn = $(this);
			var email = $("#email").val();
			var password = $("#password").val();
			if(isEmpty(email)){
				messageTip.tip("请输入email..")
				$("#email").focus();
				return;
			}
			if(isEmpty(password)){
				messageTip.tip("请输入密码..");
				$("#password").focus();
				return;
			}
			var params = {email:email , password:password};
			//杀掉当前的点击事件
			$btn.off("click").text("登录中...").css("background","red");
			$.ajax({
				type:"post",
				url:basePath + "/login/logined.do",
				data:params,
				success:function(data){
					$btn.on("click",loginMain).text("登录").css("background","#384A38");
					if(data=="success"){
						messageTip.tip("登录成功...");
						$("#login_dialog").next().trigger("click");
						//window.location.href =  window.location.href;
						loginDialog.loginSuccess();
						//更改登陆用户信息
					}else if(data == "email_null"){
						messageTip.tip("请输入邮箱");
						$("#email").focus();
					}else if(data == "password_null"){
						messageTip.tip("请输入密码");
						$("#password").focus();
					}else{
						messageTip.tip("请输入正确的用户名和密码");
						$("#password").val("").focus();
					}
				},
				error:function(msg){
					$btn.on("click",loginMain).text("登录").css("background","#384A38");
				}
			});
		}

	}
};