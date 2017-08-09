package cn.yulangde.infom.service;

import java.util.List;

import cn.yulangde.infom.common.bean.Category;

public interface ICategoryService {
	List<Category> selectAll();

	void deleteByPrimaryKey(Long id);

    void insert(Category record);

    Category selectByPrimaryKey(Long id);

    void updateByPrimaryKey(Category record);
}
