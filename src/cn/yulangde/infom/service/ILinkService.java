package cn.yulangde.infom.service;

import java.util.List;

import cn.yulangde.infom.common.bean.BasicInfo;
import cn.yulangde.infom.common.bean.FriendLink;

public interface ILinkService {
	void deleteByPrimaryKey(Long id);

    void insert(FriendLink record);

    FriendLink selectByPrimaryKey(Long id);

    void updateByPrimaryKey(FriendLink record);
    
    List<FriendLink> selectAll();
    
    void updateBasic(BasicInfo record);
    
    BasicInfo selectBasic(Long id);
}
