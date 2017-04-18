package cn.gov.ahcourt.casecomment.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class TimeUtils {

	private static SimpleDateFormat dateFormatLocal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.CHINA);
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.CHINA);

	public static String formatDate() {
		return dateFormat.format(System.currentTimeMillis());
	}

	public static String formatDate(Date date) {
		return dateFormat.format(date);
	}

	public static String format() {
		return dateFormatLocal.format(System.currentTimeMillis());
	}

	public static String format(long milliseconds) {
		return dateFormatLocal.format(milliseconds);
	}

	public static String format(Date date) {
		return dateFormatLocal.format(date);
	}

	public static Date parse(String source) throws ParseException {
		return dateFormatLocal.parse(source);
	}

	public static Calendar getCalendar(Date date) {
		Calendar c = dateFormatLocal.getCalendar();
		c.setTime(date);
		return c;
	}

	public static String ParseExcelDate(String exceldate) {
		if (StringUtils.isNotBlank(exceldate)) {
			String[] montharr = { "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" };
			String[] dates = exceldate.split("-");
			for (int i = montharr.length; i > 0; i--) {
				if (exceldate.contains(montharr[i - 1])) {
					dates[1] = "" + i;
					break;
				}
			}
			try {
				Date date = dateFormat.parse(exceldate);
				if (date != null) {
					return exceldate;
				}
			} catch (Exception e) {
			}
			return dates[2] + "-" + dates[1] + "-" + dates[0];
		}
		return null;
	}

}