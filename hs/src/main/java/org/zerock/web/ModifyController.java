package org.zerock.web;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

@Controller
public class ModifyController {
	
	private static final Logger logger = Logger.getLogger(ModifyController.class);

	@Inject
	BoardService service;
	
	@GetMapping("/modify")
	public void delGet(BoardVO vo, Model model){
		logger.info("modify get!!!!!");
		logger.info(vo.toString());
		
		model.addAttribute("vo",service.read(vo.getBno()));
	}
	
	@PostMapping("/modify")
	public String delPost(BoardVO vo,Criteria cri,RedirectAttributes rttr){
		
		logger.info("modify post!!!!!");
		logger.info(vo.toString());
		logger.info(cri);
	
		service.modify(vo);
		
		rttr. addAttribute("page",cri.getPage());
		rttr. addAttribute("type",cri.getType());
		rttr. addAttribute("keyword",cri.getKeyword());
		
		return "redirect:board/main";
	}

}
