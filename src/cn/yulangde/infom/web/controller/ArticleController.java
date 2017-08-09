package cn.yulangde.infom.web.controller;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.yulangde.infom.common.bean.Article;
import cn.yulangde.infom.common.bean.BasicInfo;
import cn.yulangde.infom.common.bean.Category;
import cn.yulangde.infom.common.bean.FriendLink;
import cn.yulangde.infom.common.bean.SimplePage;
import cn.yulangde.infom.service.IArticleService;
import cn.yulangde.infom.service.ICategoryService;
import cn.yulangde.infom.service.ILinkService;

@Controller
public class ArticleController {
	@Autowired
	private ICategoryService service;
	@Autowired
	private IArticleService articleService;
	@Autowired
	private ILinkService linkservice;
	@RequestMapping("index.html")
	public String a(Model model,HttpSession session){
		//网站访问次数加一
		Long selectHitCount = articleService.selectHitCount();
		model.addAttribute("HitCount", selectHitCount);
		//查找栏目
		List<Category> selectAll = service.selectAll();
		//model.addAttribute("categorylist", selectAll);
		
		//查找每个栏目下面的新闻(相当于在dao层级联查询)
		for (Category category : selectAll) {
			Set<Article> set = articleService.selectSetByCid(category.getCode());
			category.setArticles(set);
		}
		
		List<FriendLink> friendLinks = linkservice.selectAll();
		BasicInfo selectBasic = linkservice.selectBasic(1L);
		session.setAttribute("categorylist", selectAll);
		session.setAttribute("friendLinks", friendLinks);
		session.setAttribute("Basicinfo", selectBasic);
		return "index";
	}
	//列举所有栏目下面的新闻
	@RequestMapping("list.html")
	public String at(Model model,Integer id,String name){
		//查找每个栏目下面的新闻
		System.out.println(name);
		
		List<Article> selectByCid = articleService.selectByCid(id);
		System.out.println(selectByCid);
		model.addAttribute("news", selectByCid);
		model.addAttribute("name", name);
		return "list";
	}
	@RequestMapping("admin.html")
	public String aa(){
		return "manager/home";
	}
	
	@RequestMapping("articleList.html")
	public String az(){
		return "manager/articleList";
	}
	@RequestMapping("articleList.action")
	public String ai(@RequestParam(required=false,defaultValue="1") Integer pageNo,String key,String con,Model model,HttpSession session){
		System.out.println(key+"zehsicon:"+con);
		System.out.println("这是分页传回的page:"+pageNo);
		String con1 = "%"+con+"%";
		List<Article> selectDynanicNew = articleService.selectDynanicNew(key, con1,pageNo);
		
		SimplePage sp = new SimplePage();
		
		//设置一页显示多少条数据
		sp.setPage(5);
		//设置分多少页
		sp.setPageDataNum(articleService.selectNewsCount());
		//设置当前页
		sp.setPageNo(pageNo);
		model.addAttribute("list", selectDynanicNew);
		model.addAttribute("simplePage", sp);
		model.addAttribute("pageCount", sp.getPageCount());
		model.addAttribute("pageNo", sp.getPageNo());
		
		System.out.println(selectDynanicNew);
		model.addAttribute("articless", selectDynanicNew);
	
		return "manager/articleListContent";
	}
	//删除信息
	@RequestMapping("deleteArticle.action")
	public String at(Long id){
		System.out.println(id);
		articleService.deleteByPrimaryKey(id);
		return "manager/articleList";
	}
	//更新信息
	@RequestMapping("updateArticle.html")
	public String we(Long id,Model model){
		System.out.println(id);
		Article selectByPrimaryKey = articleService.selectByPrimaryKey(id);
		System.out.println(selectByPrimaryKey);
		List<Category> selectAll = service.selectAll();
		model.addAttribute("categorylist", selectAll);
		model.addAttribute("ariticle", selectByPrimaryKey);
		return "manager/updateArticleInfo";
	}
	//更新信息
	@RequestMapping("updateArticle.action")
	public String wg(Article article,Model model,Integer categorycode,HttpSession session){
		
		Category category = new Category();
		System.out.println(categorycode);
		category.setCode(categorycode);
		article.setCategory(category);
		System.out.println(article);
		articleService.updateByPrimaryKey(article);
		session.invalidate();
		return "manager/updateArticleInfo";
	}
	
	//发布新闻
	@RequestMapping("articlePublisur.html")
	public String ax(Model model){
		List<Category> selectAll = service.selectAll();
		model.addAttribute("categorylist", selectAll);
		return "manager/articlePublisur";
	}
	
	//添加新闻
	@RequestMapping("articlePublisur.action")
	public String ae(Article article,Integer category_code){
		article.setPublisurDate(new Date());
		article.setClickTimes(0);
		Category category = new Category();
		category.setCode(category_code);
		article.setCategory(category);
		System.out.println(category_code+"\t90909090\t"+article);
		articleService.insert(article);
		return "manager/articlePublisur";
	}
	//目录列表
	@RequestMapping("categoryList.html")
	public String ac(Model model){
		List<Category> selectAll = service.selectAll();
		model.addAttribute("categorylist", selectAll);
		return "manager/categoryList";
	}
	
	//添加栏目
	@RequestMapping("addCategory.html")
	public String aq(){
		
		return "manager/addCategory";
	}
	//添加栏目
	@RequestMapping("addCategory.action")
	public String aw(Category record){
		System.out.println("-=-addCategory=-="+record);
		service.insert(record);
		return "manager/addCategory";
	}
	
	@RequestMapping("deleteCategory.action")
	public String ar(Long id){
		System.out.println("删除目录成功！");
		System.out.println(id);
		service.deleteByPrimaryKey(id);
		return "manager/addCategory";
	}
	
	@RequestMapping("content.html")
	public String ap(Long id,Model model,String name){
		System.out.println(id);
		Article key = articleService.selectByPrimaryKey(id);
		model.addAttribute("content", key);
		//这是设置栏目信息
		model.addAttribute("name", name);
		return "content";
	}
	
	//基础设置
	@RequestMapping("baseSet.html")
	public String ay(Model model){
		List<FriendLink> selectAll = linkservice.selectAll();
		//System.out.println(selectAll);
		//查找公司信息
		BasicInfo selectBasic = linkservice.selectBasic(1L);
		model.addAttribute("basicinfo", selectBasic);
		model.addAttribute("friendLink", selectAll);
		return "manager/baseSet";
	}
	//ajax异步交互数据  需要返回json对象的数据
/*	@RequestMapping("Flink.action")
	public String ab(Model model){
		List<FriendLink> selectAll = linkservice.selectAll();
		System.out.println("Flink"+selectAll);
		model.addAttribute("friendLink", selectAll);
		return "manager/baseSet";
	}*/
	
	@RequestMapping("deleteFriend.action")
	public String ag(Long id){
		System.out.println(id);
		linkservice.deleteByPrimaryKey(id);
		return "manager/baseSet";
	}
	@RequestMapping("friendLink.action")
	public String at(FriendLink friendLink){
		System.out.println(friendLink);
		if (friendLink.getName()!=""&&friendLink.getUrl()!="") {
			linkservice.insert(friendLink);
		}else {
			System.out.println("链接名或者链接为空！");
		}
		return "redirect:baseSet.html";
	}
	
	@RequestMapping("updateBasicSet.action")
	public String ag(BasicInfo basicInfo){
		System.err.println(basicInfo);
		linkservice.updateBasic(basicInfo);
		return "manager/baseSet";
	}
	@RequestMapping("adminIndex.html")
	public String ajg(){
		return "manager/index";
	}
	
	@RequestMapping("logout.action")
	public String ajp(HttpSession session){
		session.removeAttribute("AdminLogin");
		return "redirect:index.html";
	}
	@RequestMapping("adminIndex.action")
	public String aj(HttpSession session,String user,String password){
		if ("admin".equals(user)&&"admin".equals(password)) {
			session.setAttribute("AdminLogin", user);
		}
		return "redirect:admin.html";
	}
	
	@RequestMapping("deleteAllArticle.action")
	public String aewr(Long[] checkboxid){
		for (Long article : checkboxid) {
			System.out.println("发送到发送到："+article);
			articleService.deleteByPrimaryKey(article);
		}
		return "redirect:admin.html";
	}
	
}
