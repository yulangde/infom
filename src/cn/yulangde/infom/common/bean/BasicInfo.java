package cn.yulangde.infom.common.bean;

public class BasicInfo {
    private Long id;

    private String content;

    private String name;

    private String copr;

	private BasicInfo() {
	}
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getCopr() {
		return copr;
	}



	public void setCopr(String copr) {
		this.copr = copr;
	}



	@Override
	public String toString() {
		return "BasicInfo [id=" + id + ", content=" + content + ", name=" + name + ", copr=" + copr + "]";
	}

    
}