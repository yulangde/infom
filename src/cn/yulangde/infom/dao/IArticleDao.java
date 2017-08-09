package cn.yulangde.infom.dao;

import java.util.List;
import java.util.Set;

import cn.yulangde.infom.common.bean.Article;

public interface IArticleDao {

	void deleteByPrimaryKey(Long id);

    void insert(Article record);

    Article selectByPrimaryKey(Long id);
    List<Article> selectByCid(Long id);
    Set<Article> selectSetByCid(Integer id);
    //按照标题，作者 栏目分页查找新闻
    List<Article> selectDynanicNew(String key,String cont,Integer pageNo);
    //查找所有文章的数量
    Integer selectNewsCount();
    
    void updateByPrimaryKey(Article record);

	List<Article> selectByCid(Integer id);
	
	
	Long selectHitCount();
}
