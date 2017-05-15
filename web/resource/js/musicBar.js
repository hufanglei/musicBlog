
//音轨小盒子
var musicBar = {
	arr:[],
	mw:2,//小盒子的宽度
	init:function(boDom){
		//获得外面的盒子对象
		var boxDom = dom("yinguiwrapbox");
		//获得外面的盒子宽度
		var boxDomWidth= boxDom.clientWidth;
		var cells = Math.floor(boxDomWidth / this.mw);
		// 追加元素的方式1
		/*var html = '';
		 for(var i=0;i<=cells;i++){
		 html += "<span class='items' style='left:"+i*this.mw+"px;background:"+randDomColor(1)+"'></span>";
		 }
		 boxDom.innerHTML = html;*/
		//追加元素的方式2 动态追加
		//给大盒子补全宽度
		css(boxDom , {width : (cells+1) * this.mw});//遍历的时候是=，故多了一个小盒子，所以+1
		for(var i=0;i<=cells;i++){
			var spanDom = document.createElement("span");
			//给spanDom赋样式
			spanDom["className"] = "items";
			css(spanDom , {left:i*musicBar.mw , width:musicBar.mw-1});
			boxDom.appendChild(spanDom);
			//将全部的小盒子放入arr中，然后控制其高度，高度随机对接成功后，便可实现最后效果了
			musicBar.arr.push(spanDom);
		}
	}
};

//解析音乐成一个1024长度的数字数组
var parseMusic = {
	mark:false, //控制是否解析

	init:function(){//ie11以上的浏览器才支持
		//1:音频上下文===html5+ajax+audioContext   html5+audio+audioContext
		window.AudioContext = window.AudioContext || window.webkitAudioContext || window.mozAudioContext || window.msAudioContext;
		/*动画执行的兼容写法*/
		window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.msRequestAnimationFrame;
		//2:初始化音轨对象
		var audioContext = new window.AudioContext();
		return audioContext;
	},

	parse:function(audioContext,audioDom,callback){
		try{
			//拿到播放器去解析你音乐文件
			var audioBufferSouceNode = audioContext.createMediaElementSource(audioDom);
			//创建解析对象
			var analyser = audioContext.createAnalyser();
			//将source与分析器连接
			audioBufferSouceNode.connect(analyser);
			//将分析器与destination连接，这样才能形成到达扬声器的通路
			analyser.connect(audioContext.destination);
			//调用解析音频的方法
			parseMusic.data(analyser,callback);
		}catch(e){

		}
	},

	data:function(analyser,callback){
		if(parseMusic.mark){
			//讲音频转换一个数组
			var array = new Uint8Array(analyser.frequencyBinCount);
			analyser.getByteFrequencyData(array);
			//通过回调函数返回
			if(callback)callback(array);
			requestAnimationFrame(function(){
				parseMusic.data(analyser,callback);
			});
		}
	}
};


window.onload = function(){
	musicBar.init();      //测试音轨
	var audioDom = dom("audio");//点击音乐触发函数
	var audioContext = parseMusic.init();
	audioDom.onplay = function(){
		parseMusic.mark = true;
		//获取音轨解析对象
		var len = musicBar.arr.length;
		parseMusic.parse(audioContext , audioDom , function(dataArr){
			for(var i = 0 ; i<len ;i++){
				musicBar.arr[i].style.height = dataArr[i] + "px";    //      background: linear-gradient(#fc0 10%,red 100%);
				musicBar.arr[i].style.background = "linear-gradient("+randDomColor(1)+"25% ,#fc0 50%,red 100%)";    //      background: linear-gradient(#fc0 10%,red 100%);
			}
		});
	}
}