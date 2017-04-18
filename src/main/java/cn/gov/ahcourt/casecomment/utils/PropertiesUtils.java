package cn.gov.ahcourt.casecomment.utils;

import java.util.Properties;

import org.springframework.core.io.FileSystemResourceLoader;
import org.springframework.core.io.Resource;

public class PropertiesUtils {

	private static Properties prop = null;
	
	private PropertiesUtils() {
	}

	static {
		try {
			FileSystemResourceLoader fl = new FileSystemResourceLoader();
			Resource resource = fl.getResource("classpath:sysconfig.properties");
			prop = new Properties();
			prop.load(resource.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getProperty(String key) {
		if (prop != null) {
			return prop.getProperty(key);
		}
		return null;
	}

}
