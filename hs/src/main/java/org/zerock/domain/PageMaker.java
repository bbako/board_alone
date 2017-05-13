package org.zerock.domain;

public class PageMaker {

	int total, start, end, current;
	boolean prev, next;

	private Criteria cri;

	public PageMaker(Criteria cri, int total) {
		this.start = start;
		this.end = end;
		this.current = cri.getPage();
		this.prev = prev;
		this.next = next;
		this.total = total;
		calc();
	}

	private void calc() {
		int temp = (int) (Math.ceil(current / 10.0)) * 10;
		start = temp - 9;
		end = temp * 10 > total ? (int) (Math.ceil(total / 10.0)) : temp;

		
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = this.cri.getPage();
	}

	public boolean isPrev() {
		
		if(this.start==1){
			return false;
		}
		
		return true;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		if(this.end==(int)(Math.ceil(total/10.0))){
			return false;
		}
		return true;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [total=" + total + ", start=" + start + ", end=" + end + ", current=" + current + ", prev="
				+ prev + ", next=" + next + ", cri=" + cri + "]";
	}
	
	

}
