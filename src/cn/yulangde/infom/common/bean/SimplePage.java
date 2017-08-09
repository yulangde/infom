package cn.yulangde.infom.common.bean;

import java.io.Serializable;

public class  SimplePage  implements Serializable{

	private static final long serialVersionUID = 1L;

	/**
	 * 总共有多少页
	 * */
	private int pageCount=0;
	
	/**
	 * 当前第几页
	 * */
	private int pageNo=1;//从1开始
	
	/**
	 * 每页显示多少条数据
	 * */
	private int page=10;
	
	/**
	 * 当前页应该显示第几条数据  start
	 * */
	private int pageStart=0;
	
	
	/**
	 * 当前页应该显示第几条数据  end
	 * */
	private int pageEnd=0;

	/**
	 * 数据总量
	 * */
	private int pageDataNum=0;
	
	

	

	@Override
	public String toString() {
		return "分页对象 [总共有(pageCount)  " + pageCount + " 页, 当前第(pageNo)  " + pageNo
				+ " 页, 每页显示(page) " + page + " 条数据, 显示数据为[pageStart,pageEnd] : ["+pageStart+","+pageEnd+"] ";
	}

	public SimplePage() {
		super();
	}

	//-----------------------------set--------------------
	
	/**
	 * 设置当前页面
	 * */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
		
			//可以计算 开始数据 和 结束 数据
			if(this.pageNo<=1){
				this.pageStart=0;
				if(this.pageDataNum - this.page < 0){
					this.pageEnd = (this.pageDataNum)-1;
				}else{
					this.pageEnd = (this.page)-1;
				}
			}else{
				System.out.println("..."+this.pageNo+"......"+this.pageCount+".....");
				if(this.pageNo<this.pageCount){
					this.pageStart=((this.pageNo-1)*page+1)-1;
					this.pageEnd =(page*this.pageNo)-1;
				}else{
					this.pageStart = ((this.pageNo-1)*page+1)-1;
					this.pageEnd = (this.pageDataNum)-1;
				}
			}
			//System.out.println("------------"+this.pageStart+"--------"+this.pageEnd+"---------------------");
		
	}

	/**
	 * 设置数据总量
	 * 
	 * 233/8
	 * 
	 * */
	public void setPageDataNum(int pageDataNum) {
		//通过总量 计算得到 总有多少页
		
		//System.out.println("共"+pageDataNum+"条数据,每页显示:"+page+"条数据");
		int abc = 0;
		abc = pageDataNum/page;
		if( pageDataNum%page >0){
			abc+=1;
		}
		this.pageCount = abc;
		this.pageDataNum = pageDataNum;
		//System.out.println("最终"+this.pageCount+"页");
		//System.out.println("当前页："+this.pageNo);
		setPageNo(this.pageNo);
	}
	
	/**
	 * 设置每页显示数
	 * */
	public void setPage(int page) {
		
		if(page>0){
			this.page = page;
			setPageDataNum(this.pageDataNum);
		}
	}
	
	
	
	//-----------------------------get--------------------	
	/**
	 * 获取页面总数
	 * */
	public int getPageCount() {
		return pageCount;
	}
	/**
	 * 获取当前页面
	 * */
	public int getPageNo() {
		return pageNo;
	}
	/**
	 * 获取每页显示数
	 * */
	public int getPage() {
		return page;
	}
	/**
	 * 获取当前页，数据的开始
	 * */
	public int getPageStart() {
		return pageStart;
	}
	/**
	 * 获取当前页，数据的结束
	 * */
	public int getPageEnd() {
		return pageEnd;
	}
	/**
	 * 获取数据总量
	 * */
	public int getPageDataNum() {
		return pageDataNum;
	}
	
	
}
