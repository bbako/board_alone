package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardDAO {
	
	public String getTime() ;
	
	public List<BoardVO> listAll(Criteria cri);

	public int totalCount(Criteria cri);
	
	public void creat(BoardVO vo);
	
	public BoardVO read(int bno);
	
	public void delete(int bno);
	
	public void modify(BoardVO vo);
	
	public void updateReCnt(int bno, int amount);
	
	public void addAttach(String fullName);
}
