package com.gxuwz.leave.util;

public class Paging{

	private int everyPage;          //每页显示的数量
	private int totalPage;          //总页数
	private int totalCount;         //总数量
	private int currentPage;        //当前页
	private int beginIndex;         //起始页
	private boolean hasPre;     //是否有上一页
	private boolean hasNext;    //是否有下一页
	
	
	public Paging() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Paging(int everyPage, int totalPage, int totalCount, int currentPage, int beginIndex, boolean hasPre,
			boolean hasNext) {
		super();
		this.everyPage = everyPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.beginIndex = beginIndex;
		this.hasPre = hasPre;
		this.hasNext = hasNext;
	}
	public int getEveryPage() {
		return everyPage;
	}
	public void setEveryPage(int everyPage) {
		this.everyPage = everyPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBeginIndex() {
		return beginIndex;
	}
	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}
	public boolean isHasPre() {
		return hasPre;
	}
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	

}
	
	

