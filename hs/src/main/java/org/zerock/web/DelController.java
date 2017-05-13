package org.zerock.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

@Controller
public class DelController {
	
	private static final Logger logger = Logger.getLogger(DelController.class);

	@Inject
	BoardService service;
	
	@GetMapping("/delete")
	public String delGet(BoardVO vo){
		logger.info("delete get!!!!!");
		logger.info(vo.toString());
		
		service.delete(vo.getBno());
		
		return "redirect:board/main";
	}
}
