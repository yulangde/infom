package cn.yulangde.infom.dao;

import java.util.List;

import cn.yulangde.infom.common.bean.Category;

public interface CategoryMapper {
	List<Category> selectAll();
	
    void deleteByPrimaryKey(Long id);

    void insert(Category record);

    Category selectByPrimaryKey(Long id);
    Category selectByName(String name);
    Category selectByCode(Integer code);
    //级联查询
    Category selectAllNews(Integer code);
    void updateByPrimaryKey(Category record);
}