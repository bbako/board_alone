package org.zerock.web;


import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = Logger.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@GetMapping("/main")
	public void mainGet(Criteria cri, Model model) {

		logger.info("get main .....");
		logger.info(cri);

		int listSize = service.listAll(cri).size();
		model.addAttribute("listSize", listSize);

		model.addAttribute("list", service.listAll(cri));

		PageMaker pageMaker = new PageMaker(cri, service.totalCount(cri));

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);

	}

	@GetMapping("/register")
	public void register() {
		logger.info("register get......");
	}

	@PostMapping("/register")
	public String registerPost(BoardVO vo) {

		logger.info("register post!!!!!!!");

		logger.info(vo);

		service.regist(vo);

		//rttr.addFlashAttribute("msg", "SUCCESS");
		
		

		return "redirect:/board/main";

	}

}
