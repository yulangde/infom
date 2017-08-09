package cn.yulangde.infom.dao;

import cn.yulangde.infom.common.bean.BasicInfo;

public interface BasicInfoMapper {
	BasicInfo selectByPrimaryKey(Long id);
	
    void deleteByPrimaryKey(Long id);

    void insert(BasicInfo record);

    void updateByPrimaryKey(BasicInfo record);
}