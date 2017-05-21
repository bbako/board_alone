package org.zerock.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {

	static final Logger logger = Logger.getLogger(SubController.class);
	
	@Inject
	ReplyService reservice;
	
	
	@GetMapping
	public ResponseEntity<Map<String, Object>> replyGet(BoardVO vo, Model model, Criteria cri){
		logger.info("reply get!!!!");
		logger.info(vo);
		logger.info(cri);		

		PageMaker pagemaker = new PageMaker(cri, reservice.retotal(vo));
		
		pagemaker.setCri(cri);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ReplyVO> list = reservice.read(vo.getBno(),cri);
		
		map.put("list", list);
		map.put("pageMaker", pagemaker);
		
		ResponseEntity<Map<String, Object>> entity=null;		
		
		entity= new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
		
		logger.info(entity);
		
		return entity;
		
		
	}
	
	@PostMapping
	public ResponseEntity<String> replyPost(@RequestBody ReplyVO vo){

		logger.info("reply post!!!!");
		logger.info(vo);
		
		ResponseEntity<String> entity=null;
		
		reservice.recreate(vo);
		logger.info("reply post success");
		
		entity= new ResponseEntity<String>("success",HttpStatus.OK);
		
		logger.info(entity);
		
		return entity;
		
		
	}
	
	
	
}
