package cn.yulangde.infom.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yulangde.infom.common.bean.Article;
import cn.yulangde.infom.common.bean.Category;
import cn.yulangde.infom.dao.CategoryMapper;
import cn.yulangde.infom.dao.IArticleDao;
import cn.yulangde.infom.service.IArticleService;

@Service
public class IArticleServiceImpl implements IArticleService {
	@Autowired
	private IArticleDao dao;
	@Autowired
	private CategoryMapper categorydao;
	@Override
	public void deleteByPrimaryKey(Long id) {
		dao.deleteByPrimaryKey(id);
		System.out.println();
	}

	@Override
	public void insert(Article record) {
		// TODO Auto-generated method stub
		dao.insert(record);
		System.out.println("保存新闻成功");
	}

	@Override
	public Article selectByPrimaryKey(Long id) {
		Article article = dao.selectByPrimaryKey(id);
		Integer clickTimes = article.getClickTimes();
		clickTimes=clickTimes+1;
		article.setClickTimes(clickTimes);
		dao.updateByPrimaryKey(article);
		return article;
	}

	@Override
	public void updateByPrimaryKey(Article record) {
		dao.updateByPrimaryKey(record);
		System.out.println("更新信息成功");
	}

	@Override
	public List<Article> selectByCid(Integer id) {
		List<Article> selectByCid = dao.selectByCid(id);
		System.out.println("查找信息成功");
		return selectByCid;
	}

	@Override
	public Set<Article> selectSetByCid(Integer id) {
		Set<Article> selectSetByCid = dao.selectSetByCid(id);
		System.out.println("查找set集合成功："+selectSetByCid);
		return selectSetByCid;
	}

	@Override
	public List<Article> selectDynanicNew(String key,String con,Integer page) {
		List<Article> selectDynanicNew = dao.selectDynanicNew(key,con,page);
		for (Article article : selectDynanicNew) {
			Category category = categorydao.selectByCode(article.getCategory().getCode());
			article.setCategory(category);
		}
		System.out.println("查找出来的新闻："+selectDynanicNew);
		return selectDynanicNew;
	}

	@Override
	public Long selectHitCount() {
		Long selectHitCount = dao.selectHitCount();
		return selectHitCount;
	}

	@Override
	public Integer selectNewsCount() {
		Integer count = dao.selectNewsCount();
		return count;
	}

}
