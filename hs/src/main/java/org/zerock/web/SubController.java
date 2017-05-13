package org.zerock.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

@Controller
@RequestMapping("/sub")
public class SubController {
	
	static final Logger logger = Logger.getLogger(SubController.class);
	
	@Inject
	BoardService service;
		
	@Inject
	ReplyService reservice;
	
	
	@GetMapping
	public void subGet(BoardVO vo, Model model, Criteria cri){
		logger.info("sub get!!!!");
		logger.info(vo);
		logger.info(cri);		
		logger.info(cri.getPage());	
		
		vo = service.read(vo.getBno());
		
		logger.info(vo);	
		model.addAttribute("vo",vo);
		model.addAttribute("cri",cri);

		
	}
	
}

