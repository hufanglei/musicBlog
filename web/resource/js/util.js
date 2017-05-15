function dom(id){
	return document.getElementById(id);
}

//封装css，给元素赋样式
function css(dom , opts){
	for(var key in opts){
		var val = opts[key];
		if(typeof val == 'number'){
			val += 'px';
		}
		dom['style'][key] = val;
	}
}

//颜色随机数 rgba(0,0,0,1) , op透明度，不写就1
function randDomColor(op){
	var r = Math.floor(Math.random()*256);
	var g = Math.floor(Math.random()*256);
	var b = Math.floor(Math.random()*256);
	return "rgba("+r+","+g+","+b+","+(op||1)+")";
}

/**
 * 判断非空
 *
 * @param val
 * @returns {Boolean}
 */
function isEmpty(val) {
	val = $.trim(val);
	if (val == null)
		return true;
	if (val == undefined || val == 'undefined')
		return true;
	if (val == "")
		return true;
	if (val.length == 0)
		return true;
	if (!/[^(^\s*)|(\s*$)]/.test(val))
		return true;
	return false;
}

function isNotEmpty(val) {
	return !isEmpty(val);
}


