package cn.yulangde.infom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yulangde.infom.common.bean.Category;
import cn.yulangde.infom.dao.CategoryMapper;
import cn.yulangde.infom.service.ICategoryService;

@Service
public class ICategoryServiceImpl implements ICategoryService {
	@Autowired
	private CategoryMapper dao;
	@Override
	public void deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		dao.deleteByPrimaryKey(id);
		System.out.println("删除目录成功");
	}

	@Override
	public void insert(Category record) {
		Category name = dao.selectByName(record.getName());
		Category selectByCode = dao.selectByCode(record.getCode());
		if (name==null&&selectByCode==null) {
			dao.insert(record);
			System.out.println("插入目录成功");
		}else {
			System.out.println("该栏目的编号或者名称已经存在！");
		}
	}

	@Override
	public Category selectByPrimaryKey(Long id) {
		Category selectByPrimaryKey = dao.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

	@Override
	public void updateByPrimaryKey(Category record) {
		Category name = dao.selectByName(record.getName());
		Category selectByCode = dao.selectByCode(record.getCode());
		if (name==null&&selectByCode==null) {
			dao.updateByPrimaryKey(record);
			System.out.println("更新目录成功");
		}else {
			System.out.println("该栏目的编号或者名称已经存在！");
		}
	}

	@Override
	public List<Category> selectAll() {
		List<Category> selectAll = dao.selectAll();
		System.out.println(selectAll);
		return selectAll;
	}

}
