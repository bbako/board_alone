package org.zerock.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/remodify")
public class ReModifyController {

static final Logger logger = Logger.getLogger(SubController.class);
	
	@Inject
	ReplyService reservice;
	
	
	@PostMapping
	public ResponseEntity<String> replyPost(@RequestBody ReplyVO vo){

		logger.info("remodify post!!!!");
		logger.info(vo);
		
		ResponseEntity<String> entity=null;
		reservice.reupdate(vo);
		entity= new ResponseEntity<String>("success",HttpStatus.OK);
		
		logger.info(entity);
		
		return entity;
		
		
	}
	
	
	
}
