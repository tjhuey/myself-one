/*
*通用弹窗显示
*/
define(['jquery'],function(){
	//通用弹窗 需要手工创建div
	$.fn.dialog = function(){
		var enterHandle = function(e){
			if(e.keyCode == 13){
				e.preventDefault();
			}
		};
		$('body').bind('keydown',enterHandle);
		var dialog = $(this);
		var body = $("body");
		dialog.show();
		if(body.outerHeight()>$(window).outerHeight()){
			var width01 = body.outerWidth();
			body.css({
				"overflow":"hidden"
			});
			var width02 = body.outerWidth();
			body.css({
				'padding-right': width02-width01
			});
		}
		var cont = dialog.children(".dialog-cont"),
			close = dialog.find(".dialog-close,.dialog-console");
		var width = cont.outerWidth(),
			height = cont.outerHeight(),
			w = dialog.outerWidth(),
			h = dialog.outerHeight();
		cont.css({
			"left" : (w-width)/2,
			"top" : (h-height)/2,
			"opacity": 0,
			"margin-top": -30
		}).stop().animate({
			"opacity": 1,
			"margin-top": 0
		},300);
		close.click(function(){
			cont.stop().animate({
				"margin-top": 30
			},300,function(){
				cont.css("margin-top", -30);
			});
			dialog.fadeOut(300);
			body.css({
				"overflow": "auto",
				"padding-right": 0
			});
			$('body').unbind('keydown',enterHandle);
		});
		$(window).resize(resetPosition);
		function resetPosition(){
			var newHeight = cont.outerHeight(),
				newWidth = cont.outerWidth(),
				newW = dialog.outerWidth(),
				newH = dialog.outerHeight();
			if(!(newHeight == height && newWidth == width && newW == w && newH == h)){
				cont.css({
					"left" : (newW-newWidth)/2,
					"top" : (newH-newHeight)/2
				});
			}
		}
	}
	
	//图片预览弹窗
	$.fn.preview = function(href){
		if(!href){
			var href = $(this).data("url") || $(this).attr("src"),
				alt = $(this).data("alt") || $(this).attr("alt");
		}
		var box = $("<div class='back-dialog'></div>"),
			boxbg = $("<div class='dialog-bg'></div>"),
			boxcont = $("<div class='dialog-cont dialog-preview'></div>"),
			boxclose = $("<div class='dialog-close'></div>"),
			newimg = new Image();
		newimg.src = href;
		newimg.onerror=function(){
			this.src="/public/common/default.jpg";
		}
		var img = $(newimg);
		boxclose.appendTo(boxcont);
		img.appendTo(boxcont);
		boxbg.appendTo(box);
		boxcont.appendTo(box);
		box.appendTo('body');
		boxcont.css('visibility','hidden');
		img.get(0).onload = function(){
			var width = img.width(),
				height = img.height();
			var w = $(window).width(),
				h = $(window).height();
			var imgScale = width / height,
				scale = w / h;
			if( width >= w * 0.8 && imgScale >= scale){
				img.width(w*0.8);
			}else if( height > h*0.8 && imgScale < scale){
				img.height(h*0.8);
			}
			box.dialog();
			boxcont.css('visibility','visible');
		}
	}
	
	// reset alert警告弹窗
	window.alert = function(msg,callback){
		var box = $("<div class='dialog' style='z-index:999999;'></div>"),
			boxbg = $("<div class='dialog-bg'></div>"),
			boxcont = $("<div class='dialog-cont back-alertcont'></div>"),
			boxttext = $("<div class='back-alertmsg'>"+msg+"</div>"),
			boxhandle = $("<div class='back-alerthandle'></div>"),
			alertSure = $("<input type='button' class='bgbtn dialog-console' value='确定' />");
		alertSure.appendTo(boxhandle);
		boxttext.appendTo(boxcont);
		boxhandle.appendTo(boxcont);
		boxbg.appendTo(box);
		boxcont.appendTo(box);
		box.appendTo($("body")).dialog();
		var enterHandle = function(e){
			if(e.keyCode == 13){
				e.preventDefault();
			}
		};
		$('body').bind('keydown',enterHandle);
		alertSure.click(function(){
			setTimeout(function(){box.remove();},300);
			if(callback){
				callback();
			}
			$('body').unbind('keydown',enterHandle);
		});
	}
	// reset confirm确认弹窗
	window.confirm = function(msg,callback){
		var box = $("<div class='dialog' style='z-index:999999;'></div>"),
			boxbg = $("<div class='dialog-bg'></div>"),
			boxcont = $("<div class='dialog-cont back-alertcont'></div>"),
			boxttext = $("<div class='back-alertmsg'>"+msg+"</div>"),
			boxhandle = $("<div class='back-alerthandle'></div>"),
			alertSure = $("<input type='button' class='bgbtn dialog-console' value='确定' />"),
			alertConsole = $("<input type='button' class='bdbtn dialog-console' value='取消' />");
		alertSure.appendTo(boxhandle);
		alertConsole.appendTo(boxhandle);
		boxttext.appendTo(boxcont);
		boxhandle.appendTo(boxcont);
		boxbg.appendTo(box);
		boxcont.appendTo(box);
		box.appendTo($("body")).dialog();
		var enterHandle = function(e){
			if(e.keyCode == 13){
				e.preventDefault();
			}
		};
		$('body').bind('keydown',enterHandle);
		alertConsole.click(function(){
			setTimeout(function(){box.remove();},300);
			$('body').unbind('keydown',enterHandle);
		});
		alertSure.click(function(){
			setTimeout(function(){box.remove();},300);
			if(callback){
				callback();
			}
			$('body').unbind('keydown',enterHandle);
		});
	}
	
	//等待弹窗
	window.waitingDialog = function(){
		var newDialog = $('<div class="dialog putmoney-waiting"><div class="dialog-bg"></div><div class="waiting-box"></div></div>');
		newDialog.appendTo('body').dialog();
	}
	
	//弱提示弹窗
	window.weakDialog = function(msg){
		var newMsg = $('<li><span class="weak-type"><i class="weak-true"></i></span><span class="weak-msg">'+msg+'</span><i class="weak-close">×</i></li>'),
			weakDialog = $('<ul id="weak-dialog"></ul>');
		var ifWeak = $('#weak-dialog');
		if(ifWeak.length > 0){
			newMsg.prependTo(ifWeak);
			if(ifWeak.children('li').length > 10){
				ifWeak.children('li').last().remove();
			}
		}else{
			newMsg.appendTo(weakDialog);
			weakDialog.appendTo('body');
		}
		setTimeout(function(){
			newMsg.remove();
		},5000);
		$('.weak-close').click(function(){
			$(this).parent().remove();
		});
	}
});
