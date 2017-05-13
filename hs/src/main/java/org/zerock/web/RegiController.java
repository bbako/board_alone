package org.zerock.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.BoardVO;
import org.zerock.service.BoardService;

@Controller
public class RegiController {
	private static final Logger logger = Logger.getLogger(BoardController.class);

	@Inject
	BoardService service;
	
	@GetMapping("/register")
	public void register() {
		logger.info("register get......");
	}

	@PostMapping("/register")
	public String registerPost(BoardVO vo) {

		logger.info("register post!!!!!!!");

		logger.info(vo);
		
		logger.info(vo.getTitle().length());
		
		if(vo.getTitle().length()==0){
			
			return "redirect:/register";
			
		}

		service.regist(vo);

		return "redirect:/board/main?msg=SUCCESS";

	}

}
