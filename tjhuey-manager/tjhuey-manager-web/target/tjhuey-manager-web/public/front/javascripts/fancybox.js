define(["require","fancyBox","thumbs"],function(require){
	var path01 = require.toUrl("fancyBox/../jquery.fancybox.css"),
		style01 = $("<link type='text/css' rel='stylesheet' href="+ path01 +" />");
	style01.appendTo($("head"));
	$("body").on('click','.previewbtn',function(){
		$(this).siblings(".fancybox-container").children(".fancybox").eq(0).trigger("click");
	});
	$('.fancybox').fancybox({
		'type': 'image'
	});
});

//弹窗2016-05-25
function hopta(obj)
{
	$("."+obj).show();
	var winx=parseInt($("."+obj).find(".l-hopmain").outerWidth()/2),
		winy=parseInt($("."+obj).find(".l-hopmain").outerHeight()/2),
		oDiv=$("."+obj).find(".l-hopmain");
		oDiv.css({
			"margin-left":"-"+winx+"px",
			"margin-top":"-"+winy+"px"
		})
		$("."+obj).find(".l-colse").click(function(){
			$("."+obj).hide();
		})
}