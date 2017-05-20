package org.zerock.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/upload")
public class UploadController {

	static final Logger logger=Logger.getLogger(UploadController.class);
	
	@ResponseBody
	@PostMapping( produces = "application/text; charset=utf8")


	public String uploadPost(MultipartFile file) throws IOException{
		 
		logger.info("upload post!!!!!");
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: "+file.getContentType());
		
		UUID uid = UUID.randomUUID();
		
		String saveName = uid.toString() +"_"+file.getOriginalFilename();
		
		File target = new File("c:\\zzz\\up",saveName);
		
		FileCopyUtils.copy(file.getBytes(), target);
		
		logger.info("saveName:  "+saveName);
		
		return saveName;
		
		
	}
	
	@GetMapping("/fdelete")
	public void delget(String fileName){
		
		logger.info("del get......");
		
		logger.info(fileName);
		
		new File("c:\\zzz\\up\\"+fileName.replace('/', File.separatorChar)).delete();
		
	}
	
	
}
