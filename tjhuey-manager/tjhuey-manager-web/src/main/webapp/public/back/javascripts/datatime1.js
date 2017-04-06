require(["jquery","easyui"],function($){
	Date.prototype.formatDate = function (format) //author: meizz
	{
	    var o = {  
	        "M+": this.getMonth() + 1, //month
	        "d+": this.getDate(),    //day
	        "h+": this.getHours(),   //hour
	        "m+": this.getMinutes(), //minute
	        "s+": this.getSeconds(), //second
	        "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
	        "S": this.getMilliseconds() //millisecond
	    }  
	    if (/(y+)/.test(format)) format = format.replace(RegExp.$1,  
	    (this.getFullYear() + "").substr(4 - RegExp.$1.length));  
	    for (var k in o) if (new RegExp("(" + k + ")").test(format))  
	        format = format.replace(RegExp.$1,  
	      RegExp.$1.length == 1 ? o[k] :  
	        ("00" + o[k]).substr(("" + o[k]).length));  
	    return format;  
	}
	
	function formatDateText(date) {
	        return date.formatDate("yyyy/MM/dd");
	}
	
	easyloader.locale = "zh_CN";
	var nowDate = new Date(),
		nowYear = nowDate.getFullYear(),
		nowMonth = nowDate.getMonth()+1,
		nowDay = nowDate.getDate()
	var nowTime = nowYear+"/"+ (nowMonth>10? nowMonth : ("0"+nowMonth))+"/"+(nowDay>10? nowDay : ("0"+nowDay));//+" "+nowHours+":"+nowMinutes+":"+nowSeconds;
	using("datetimebox",function(){
		$('.easyui-datetimebox').each(function(){
			$.parser.parse();
			var defaultVal = $(this).val();
			
			$(this).datetimebox({
				width: 243,
				height: 30,
				value:function(){
					return defaultVal;
				}(),
				formatter: formatDateText,  
			    showSeconds: false,
			    panelWidth: 243,
			    editable: false,
			    onShowPanel: function(){
			    	$(this).next().css({
			    		"border-color": "#5A9CCB",
						"box-shadow": "0 0 5px #5A9CCB"
			    	});
			    },
			    onHidePanel: function(){
			    	$(this).next().css({
			    		"border-color": "#ccc",
						"box-shadow": "none"
			    	});
			    }
			});
		});
	});
});