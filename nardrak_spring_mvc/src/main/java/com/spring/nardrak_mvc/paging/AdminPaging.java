package com.spring.nardrak_mvc.paging;

public class AdminPaging {
	
	private int pageSize = 10; // 페이지 당 글수
	private int totalCount = 0; // 전체 글 수
	private int pageNum = 0; // 페이지 카운트
	
	private int startRow = 1; // 시작 글 번호
	private int endRow = 0; // 끝 글 번호
	private int currentPage = 0; // (현재) 페이지 번호
	
	private int startBlock = 0; // 시작 블록
	private int pageBlock = 5; // 페이지 블록 수
	private int endBlock = 0; // 끝 블록
	
	private int prev = 0; // 이전
	private int next = 0; // 다음
	
	// 생성자 - 페이지 번호를 입력 받는다.
	public AdminPaging(String page) {
		if(page == null) {
			this.currentPage = 1;
		}
		else {
			this.currentPage = Integer.parseInt(page);
		}
	}
	// 전체 갯수를 받으면 
	public void setCount(int totalCount) {
		this.totalCount = totalCount;
		
		startRow = (currentPage-1) * pageSize + 1;
		endRow = (currentPage) * pageSize;
		System.out.println("고객 리스트 : "+startRow+"~"+endRow);
		
		pageCalculator();
	}
	
	public void pageCalculator() {
		if(totalCount > 0) {
			
			//전체 페이지수
			pageNum = totalCount / pageSize + (totalCount % pageSize == 0? 0: 1);
			
			// 시작 블록은 현재페이지/페이지 당 글번호 +나머지 값 있으면 +1
			startBlock = currentPage/pageSize +(currentPage % pageSize == 0? 0:1);
			
			endBlock = startBlock + pageBlock-1;
			
			// 마지막 블록이 전체 페이지 보다 커지면 동일하게
			if(endBlock > pageNum) endBlock = pageNum;
			
			// 이전버튼 :  시작 블록이 페이지당 글 수 보다 크면  시작 블록 -= 블록수 
			if(startBlock > pageSize) prev = startBlock - pageBlock;
			
			// 다음버튼 :  블록 시작이 전체 페이지 수 보다 작으면 시작 += 블록수
			if(startBlock < pageNum) next = startBlock + pageBlock;
			
		}
	}
	
	// 디폴트 생성자
	public AdminPaging() {}
	
	// 매개변수 생성자
	public AdminPaging(int pageSize, int totalCount, int pageNum, int startRow, int endRow,
			int currentPage, int startBlock, int pageBlock, int endBlock, int prev, int next) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.pageNum = pageNum;
		this.startRow = startRow;
		this.endRow = endRow;
		this.currentPage = currentPage;
		this.startBlock = startBlock;
		this.pageBlock = pageBlock;
		this.endBlock = endBlock;
		this.prev = prev;
		this.next = next;
	}
	
	// getter, setter
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getstartBlock() {
		return startBlock;
	}

	public void setstartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getEndBlock() {
		return endBlock;
	}

	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}
	
	// toString
	@Override
	public String toString() {
		return "AdminPaging [pageSize=" + pageSize + ", totalCount=" + totalCount + ", pageNum=" + pageNum
				+", startRow=" + startRow + ", endRow=" + endRow + ", currentPage="
				+ currentPage + ", startBlock=" + startBlock + ", pageBlock=" + pageBlock + ", endBlock=" + endBlock
				+ ", prev=" + prev + ", next=" + next + "]";
	}
	
	
}
