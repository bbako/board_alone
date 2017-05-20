package org.zerock.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/display")
public class DisplayController {
	
	static final Logger logger=Logger.getLogger(DisplayController.class);

	@ResponseBody
	@GetMapping(produces={"image/jpg"})
	public byte[] displayGet(String fileName) throws Exception {
		
		logger.info("display get!!!!!");
		logger.info("fileName: "+fileName);
	
		InputStream fin = new FileInputStream("c:\\zzz\\up\\"+fileName);
		
		byte[] arr= IOUtils.toByteArray(fin);
		
		return arr;

	}
	

}
