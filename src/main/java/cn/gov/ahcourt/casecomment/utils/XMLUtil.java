package cn.gov.ahcourt.casecomment.utils;

import java.io.File;
import java.io.InputStream;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;

public class XMLUtil {
	
	public static <T> T toBean(String filepath, Class<T> cls) {
		XStream xstream = new XStream(new DomDriver());
		xstream.processAnnotations(cls);
		@SuppressWarnings("unchecked")
		T t = (T) xstream.fromXML(new File(filepath));
		return t;
	}

	public static <T> T toBean(File xmlfile, Class<T> cls) {
		XStream xstream = new XStream(new DomDriver());
		xstream.processAnnotations(cls);
		@SuppressWarnings("unchecked")
		T t = (T) xstream.fromXML(xmlfile);
		return t;
	}

	public static <T> T toBean(InputStream is, Class<T> cls) {
		XStream xstream = new XStream(new DomDriver());
		xstream.processAnnotations(cls);
		@SuppressWarnings("unchecked")
		T t = (T) xstream.fromXML(is);
		return t;
	}

}
