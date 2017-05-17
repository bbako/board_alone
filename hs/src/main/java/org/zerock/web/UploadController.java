package org.zerock.web;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.util.UploadFileUtils;

@Controller
@RequestMapping("/uploadAjax")
public class UploadController {

	static final Logger logger=Logger.getLogger(UploadController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@PostMapping
	public ResponseEntity<String> uploadPost(MultipartFile file) throws IOException{
		
		logger.info("upload post!!!!!");
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: "+file.getContentType());
		
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath , file.getOriginalFilename(), file.getBytes()),HttpStatus.OK);
		
	}
	
}
