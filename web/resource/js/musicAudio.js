$(function () {
    //初始化播放器
    hflAudio.init(function (ok, time, percent) {
        /*if(ok){
         $("#ftime").html(time);
         }else{
         $("#dtime").html(time);
         }*/
        $("#" + (ok ? "ftime" : "dtime")).html(time);
        if (!ok) {
            //$("#percent").css({width:percent + "%"});
            $("#percent").width(percent + "%");
            $("#perc").html("<span style='display:inline-block' class='sc'>"+Math.floor(percent) + "%"+"</span>");
            $("#p_cover").css({bottom: percent + "%", height: (100-percent) + "%"});
        }

    });
    hflPlay.init();

});

//执行音乐播放的业务代码
var hflPlay = {
    init: function () {
        $(".ke_op").on("click", function () {
            var $i = $(this).find("i");
            hflAudio[$i.toggleClass("icon-play icon-pause").hasClass("icon-play") ? "stop" : "play"]();
            $(this).animate({top:$i.hasClass("icon-pause") ? 17 : 199} , "slow");
            $(".ke_op").toggleClass("r");
        });
    }
};

//音乐播放器
var hflAudio = {
    audioDom: null,
    init: function (callback) {
        this.audioDom = document.getElementById("audio");
        this.time(callback);
    },
    play: function () {  //播放
        this.audioDom.play();
    },
    stop: function () {   //暂停
        this.audioDom.pause();
    },
    time: function (callback) {   //时间
        var $this = this;
        //总播放时间的函数canplaythrough
        this.audioDom.addEventListener("canplaythrough", function () {
            if (callback)callback.call(this, true, $this.formatTime(this.duration));
        });
        //播放中的函数 timeupdate
        this.audioDom.addEventListener("timeupdate", function () {
            var ctime = this.currentTime;
            var percent = (ctime / this.duration ) * 100;
            if (callback)callback.call(this, false, $this.formatTime(this.currentTime), percent);
        });
    },
    formatTime: function (mt) {
        var m = Math.floor(mt / 60);
        var s = Math.floor(mt % 60);
        if (m < 10) m = "0" + m;
        if (s < 10) s = "0" + s;
        return m + ":" + s;
    },
    percent: function () {  //进度显示

    },
    mute: function () {   //静音

    },
    next: function () { //下一首

    },
    pre: function () {  //上一首

    },
    loadLrc: function () {  //加载歌词

    }
};