package org.zerock.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
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
	
	@Transactional
	@GetMapping
	public void subGet(BoardVO vo, Model model, Criteria cri){
		logger.info("sub get!!!!");
		logger.info(vo);
	
		vo = service.read(vo.getBno());		

		logger.info("flist------------------------------------");
		List<String> flist = new ArrayList<String>();
		
		if (service.getFiles(vo.getBno())!=null) {
			
			logger.info(service.getFiles(vo.getBno()));
			
			for (int i = 0; i < service.getFiles(vo.getBno()).size(); i++) {
				
				flist.add(service.getFiles(vo.getBno()).get(i));
				
			}
		}
		
		
		logger.info(flist);
		logger.info(vo);	
		model.addAttribute("vo",vo);
		model.addAttribute("cri",cri);
		model.addAttribute("flist",flist);

		
	}
	
}

