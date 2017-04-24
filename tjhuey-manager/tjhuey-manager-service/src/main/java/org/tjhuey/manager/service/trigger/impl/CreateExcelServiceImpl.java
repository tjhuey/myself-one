package org.tjhuey.manager.service.trigger.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tjhuey.common.utils.AdvertisementUtil.Location;
import org.tjhuey.manager.pojo.t_advertisements;
import org.tjhuey.manager.service.common.AdvertisementsService;
import org.tjhuey.manager.service.trigger.CreateExcelService;

@Service
public class CreateExcelServiceImpl implements CreateExcelService {

	@Autowired
	private AdvertisementsService advertisementsService;

	@Override
	public String createExcel() throws Exception {
		// 创建excel，参考例1

		String path = "F:\\testExcel\\";
		File f_path = new File(path);
		if (!f_path.exists()) {
			f_path.mkdirs();
		}
		// 定义文件名
		String fileName = path + this.getFileName("import_log_");

		// 放在指定文件夹下
		File file = new File(fileName);

		// 创建工作簿
		Workbook wb = new HSSFWorkbook();
		CreationHelper createHelper = wb.getCreationHelper();
		// 创建工作表
		Sheet sheet = wb.createSheet("new sheet");

		/**
		 * 我们目前有什么：
		 * 
		 * 最终目标： 每5秒钟创建一个excel，要求文件名不重复
		 */

		String[] header = { "ID", "名称", "添加时间", "排序时间", "所在位置",
				"图片路径", "图片分辨率", "图片大小", "图片格式", "广告链接", "链接打开方式", "0.下架;1上架" };

		// 创建一个行对象，代表着第一行
		Row row = sheet.createRow((short) 0);
		CellStyle style = wb.createCellStyle();
		style.setFillForegroundColor(IndexedColors.ORANGE.getIndex());
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		// 设置表头
		for (int i = 0; i < header.length; i++) {
			Cell cell = row.createCell(i);
			cell.setCellValue(createHelper.createRichTextString(header[i]));
			cell.setCellStyle(style);
		}
		// null 为map 对象 暂时为null
		List<t_advertisements> advertisementsFront = advertisementsService.getAdvertisementsFront(Location.HOME_TURN_ADS, 10);
		
		for (int i = 0; i < advertisementsFront.size(); i++) {
			row = sheet.createRow(i + 1);
			t_advertisements advertisement = advertisementsFront.get(i);
			String[] logBeanStr = this.getAdvertisement(advertisement);
			for (int j = 0; j < logBeanStr.length; j++) {
				row.createCell(j).setCellValue(
						createHelper.createRichTextString(logBeanStr[j]));
			}
		}
		// 生成excel
		FileOutputStream fileOut = new FileOutputStream(file);
		wb.write(fileOut);
		fileOut.close();

		sendEmail(fileName);
		return fileName;
	}

	private String[] getAdvertisement(t_advertisements advertisement) {
		return new String[] {advertisement.getId()+"",advertisement.getName(),advertisement.getTime()+"",advertisement.getOrderTime()+"",advertisement.getLocation()+"",
				advertisement.getImageUrl(),advertisement.getImageResolution(),advertisement.getImageSize(),advertisement.getImageFormat(),advertisement.getUrl(),
				advertisement.getTarget()+"",advertisement.getIsUse()+""};
	}

	/**
	 * @方法名: getFileName
	 * @功能描述: 获取不同的生成的文件名
	 * @param pre
	 * @return
	 * @作者 huey
	 * @日期 2016年12月4日
	 */
	private String getFileName(String pre) {

		String fileName = pre
				+ new SimpleDateFormat("YY_MM_dd_hh_mm_ss").format(new Date())
				+ ".xls";
		return fileName;
	}

	public void sendEmail(String fileName) throws AddressException, MessagingException {
		/**
		 * 1、通过session创建邮件的配置信息 2、创建代表邮件内容的Message对象（JavaMail创建的邮件是基于MIME协议的）
		 * 3、创建Transport对象、连接服务器、发送Message、关闭连接
		 */
		Properties props = new Properties();
		// 配置项参考文档
		// 邮件服务器的地址
		props.setProperty("mail.host", "smtp.sina.com");
		props.setProperty("mail.transport.protocol", "smtp");
		// 开启认证
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props);
		// 调试完毕后，注释调
		session.setDebug(true);

		/**
		 * 2、创建代表邮件内容的Message对象（JavaMail创建的邮件是基于MIME协议的）
		 */
		MimeMessage message = new MimeMessage(session);
		// 发件人
		message.setFrom(new InternetAddress("tjhuey@sina.com"));
		// 设置主题
		message.setSubject("您好，这是本次的报表");
		// 设置收件人
		message.setRecipient(RecipientType.TO, new InternetAddress(
				"1139743605@qq.com"));
		// 设置正文
		// 设置正文
		// 纯文本的邮件
		//message.setText("2016年12月5日 09:30:53，这是本次的报表");
		// 类似于springMVC的文件上传
		// 包含文本和附件
		MimeMultipart mulpart = new MimeMultipart();
		MimeBodyPart bodyPart = new MimeBodyPart();
		// 第一部分、邮件的正文
		bodyPart.setContent(
				"<span style='color:red;'>2017年4月20日 09:30:53</span>，这是本次的报表",
				"text/html;charset=UTF-8");
		mulpart.addBodyPart(bodyPart);

		// 第二部分、附件
		bodyPart = new MimeBodyPart();
		// 引入文件的数据源
		bodyPart.setDataHandler(new DataHandler(new FileDataSource(new File(
				fileName))));
		// 定义文件的名称
		bodyPart.setFileName("import_Log_test.xls");
		mulpart.addBodyPart(bodyPart);

		// 放入MimeMultipart对象
		message.setContent(mulpart);

		/**
		 * 3、创建Transport对象、连接服务器、发送Message、关闭连接
		 */
		Transport tran = session.getTransport();
		tran.connect("smtp.sina.com", "tjhuey@sina.com", "hueyaa123005");
		tran.sendMessage(message, message.getAllRecipients());
		// 关闭连接
		tran.close();
	}

}
