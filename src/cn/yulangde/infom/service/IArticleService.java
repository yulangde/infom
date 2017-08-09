package cn.yulangde.infom.service;

import java.util.List;
import java.util.Set;

import cn.yulangde.infom.common.bean.Article;

public interface IArticleService {
	void deleteByPrimaryKey(Long id);

    void insert(Article record);

    Article selectByPrimaryKey(Long id);
    List<Article> selectByCid(Integer id);
    Set<Article> selectSetByCid(Integer id);
    //按照标题，作者 栏目查找新闻
    List<Article> selectDynanicNew(String key,String cont,Integer pageNo);
    //查找所有文章的数量
    Integer selectNewsCount();
    
    void updateByPrimaryKey(Article record);
    
	Long selectHitCount();
}
