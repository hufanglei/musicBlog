/*点击按钮的时候--伪装文件上传*/
var uploadTo = null;
function openBrowse(obj,to){ 
	//判断浏览器的兼容性问题
	var ie=navigator.appName=="Microsoft Internet Explorer" ? true : false; 
	if(ie){ //如果是ie浏览器
		document.getElementById("file").click(); 
	}else{
		var a=document.createEvent("MouseEvents");//FF的处理 
		a.initEvent("click", true, true);  
		document.getElementById("file").dispatchEvent(a); 
	} 
	uploadTo = to;
}; 

// 	Attributes	设置或返回文件或文件夹的属性
// 	DateCreated	返回指定文件或文件夹的创建时间
// 	DateLastAccessed	返回最近访问文件或文件夹的创建时间
// 	DateLastModified	返回最后修改指定文件和文件夹的日期和日期
// 	Drive	返回指定文件或文件夹所在的驱动器的驱动器号
// 	Name	设置或返回文件或文件夹的名称
// 	ParentFolder	返回指定文件或文件夹的父文件夹对象
// 	Path	返回指定文件或文件夹或驱动器的路径
// 	ShortName	返回短名称
// 	ShortPath	返回短路径
// 	Size	对于文件,以字节为单位返回指定文件的大小.
// 	对于文件夹,以字节为单位返回文件夹中包含的所有子文件夹中的所有文件和子文件夹的大小
// 	Type	返回文件或文件夹的信息.
function uploadFile() {
	try{
		//获取文件上传的js列表对象
	    var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
	    if(fileObj.size>11145728){
	    	tzCommon.error("请上传小于10MB的文件", "error",true);
	    	return;
	    }
	    var ftype = fileObj.type.toLowerCase();
	    if(ftype!="image/jpeg" && ftype!="image/png" && ftype!="image/gif" && ftype!="audio/mp3"){
	    	tzCommon.error("请上传图片或者Mp3文件(jpg/png/gif/mp3)", "error",true);
	    	return;
	    }
	    
	    var imgsrc = $(uploadTo).data("img");
	    //创建一个FormData 对象
	    var form = new FormData();
	    //设置文件上传的文件对象
	    form.append("doc", fileObj);
	    //设定头像上传的目录
	    form.append("dir",$(uploadTo).data("dir"));
	    form.append("zip",$(uploadTo).data("zip")||"");
	    form.append("small",$(uploadTo).data("small")||"");
	    form.append("swidth",$(uploadTo).data("swidth")||"");
	    form.append("sheight",$(uploadTo).data("sheight")||"");
	    form.append("oldName",imgsrc||"");
	    // 创建一个ajax对象
	    var xhr = new XMLHttpRequest();
	    //开始和后台的upload.jsp页面进行交换
	    xhr.open("post", basePath+"/upload/file.do", true);
	    //上传成功进入的毁掉函数
	    xhr.onreadystatechange = function(){
			if(xhr.readyState==4 && xhr.status==200){//状态4和200代表和服务器端交互成功
				//获取上传成功的返回数据
				var data = xhr.responseText.trim();
				var jdata = eval("("+data+")");
				jdata["target"]=uploadTo;
				tz_uploadsuccess($(uploadTo),jdata);
			}
		};
		//监听文件上传的进度
	    xhr.upload.addEventListener("progress", progressFunction, false);
		//发送文件上传的进度
	    xhr.send(form);
	}catch(e){
		
	}
	
};

//上传进度的回调函数
function progressFunction(event) {
	var prograssbarDom = document.getElementById("prograssbar");
     if (prograssbarDom && event.lengthComputable) {
    	var percent = event.loaded / event.total;
		var p = Math.floor(percent*100);
		prograssbarDom.style.height = p+"%";
     }
} ; 