package org.tjhuey.wechat.init.service;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * <p>Description: </p>
 * Path: org.tjhuey.wechat.init.service
 * <p>Title: TodayInHistoryService.java</p>
 * Company: resource.huey.org>
 * @author huey
 * @date 2017年3月30日
 * @version 1.0
 */
public class TodayInHistoryService {

	/**
	 * 发起http get请求获取网页源代码
	 * 
	 * @param requestUrl
	 * @return
	 */
	private static String httpRequest(String requestUrl) {
		StringBuffer buffer = null;

		try {
			// 建立连接
			URL url = new URL(requestUrl);
			HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();
			httpUrlConn.setDoInput(true);
			httpUrlConn.setRequestMethod("GET");

			// 获取输入流
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

			// 读取返回结果
			buffer = new StringBuffer();
			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}

			// 释放资源
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			httpUrlConn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}

	
	
	/**
	 * 从html中抽取出历史上的今天信息
	 * 
	 * @param html
	 * @return
	 */
	private static String extract(String html) {
		System.out.println(html);
		StringBuffer buffer = null;
		// 日期标签：区分是昨天还是今天
		String dateTag = getMonthDay(0);

		Pattern p = Pattern.compile("(.*)(<ul class=\"oh\" id=\"container\">)(.*?)(</ul>)(.*)");
		Matcher m = p.matcher(html);
		if (m.matches()) {
			buffer = new StringBuffer();
			if (m.group(3).contains(getMonthDay(-1)))
				dateTag = getMonthDay(-1);

			// 拼装标题
			buffer.append("≡≡ ").append("历史上的").append(dateTag).append(" ≡≡").append("\n\n");

			// 抽取需要的数据
			for (String info : m.group(3).split("  ")) {
				info = info.replace(dateTag, "").replaceAll("</?[^>]+>", "").trim().replace("&nbsp;", "").replace("—●", "");
				// 在每行末尾追加2个换行符
				if (!"".equals(info)) {
					buffer.append(info).append("\n\n");
				}
			}
		}
		// 将buffer最后两个换行符移除并返回
		return (null == buffer) ? null : buffer.substring(0, buffer.lastIndexOf("\n\n"));
	}

	/**
	 * 获取前/后n天日期(M月d日)
	 * 
	 * @return
	 */
	private static String getMonthDay(int diff) {
		DateFormat df = new SimpleDateFormat("M月d日");
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DAY_OF_YEAR, diff);
		return df.format(c.getTime());
	}

	/**
	 * 封装历史上的今天查询方法，供外部调用
	 * 
	 * @return
	 */
	public static String getTodayInHistoryInfo() {
		// 获取网页源代码
		String html = httpRequest("http://www.todayonhistory.com/");
		// 从网页中抽取信息
		String result = extract(html);

		return result;
	}

	/**
	 * 通过main在本地测试
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
		
//		String STRING = "<div class=\"t\"> <span>1941年3月17日</span> <a href=\"http://www.todayonhistory.com/3/17/17114.html\" class=\"txt\" target=\"_blank\">中华民国第10任立法院院长王金平出生</a> </div>";
//		Pattern p = Pattern.compile("(.*)(<div class=\"t\">)(.*?)(</div>)(.*)");
//		Matcher m = p.matcher(STRING);
//        boolean matches = m.matches();
//        System.out.println(matches);
//        if (matches) {
//        	System.out.println(m.group(1));
//        	System.out.println(m.group(2));
//        	System.out.println(m.group(3));
//			
//		}
		
//		String info = TodayInHistoryService.getTodayInHistoryInfo();
	}
}