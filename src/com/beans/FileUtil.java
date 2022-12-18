package com.beans;



import javax.servlet.http.HttpServletRequest;import org.apache.tomcat.jni.File;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			return new MultipartRequest(req,saveDirectory, maxPostSize, "UTF-8");
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/*public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory=req.getServletContext().getRealPath(directory);
		File file=new File(sDirectory+File.separator+filename);
		if(file.exists()) {
			file.delete();			
		}
	}*/
}
