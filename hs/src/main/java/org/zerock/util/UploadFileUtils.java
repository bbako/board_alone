package org.zerock.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger  =Logger.getLogger(UploadFileUtils.class);

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws IOException{
		
		UUID uid = UUID.randomUUID();
		
		String savedName = uid.toString() + "_"+originalName;
		
		String savedPath = calcPath(uploadPath);
		
		File target = new File(uploadPath + savedPath, savedName);
		
		FileCopyUtils.copy(fileData, target);
		
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		String uploadedFileName = null;
		
		if (MediaUtils.getMediaType(formatName)!=null) {
			
			uploadedFileName = makeThum(uploadPath, savedPath, savedName);
			
		}else {
			uploadedFileName=makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
		
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) {
		
		String iconName = uploadPath + path + File.separator+fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	public static String calcPath(String uploadPath){
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String dataPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		makeDir(uploadPath, yearPath, dataPath);
		
		logger.info("datapath: "+dataPath);
		
		return dataPath;
		
	}
	
	

	private static void makeDir(String uploadPath, String... paths){
		
		if (new File(paths[paths.length-1]).exists()) {
			
			logger.info("paths" + paths);
			
			return;
			
		}
		
		 for (String path : paths) {
			File dirPath = new File(uploadPath+  path);
			
			if(! dirPath.exists()){
				
				dirPath.mkdir();
				
				logger.info("make dir???? "+dirPath.mkdir());
			}
		}
		
	}
	
	
	public static String makeThum(String uploadPath, String path, String fileName) throws IOException{
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,100);
		
		String thumName= uploadPath + path + File.separator+"_s_"+fileName;
		
		File newFile = new File(thumName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(),newFile);
		
		return thumName.substring(uploadPath.length()).replace(File.separatorChar,'/');
		
	}
	
	
	
}
