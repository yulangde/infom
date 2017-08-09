package cn.yulangde.infom.dao;

import java.util.List;

import cn.yulangde.infom.common.bean.FriendLink;

public interface FriendLinkMapper {
    void deleteByPrimaryKey(Long id);

    void insert(FriendLink record);

    FriendLink selectByPrimaryKey(Long id);

    void updateByPrimaryKey(FriendLink record);
    
    List<FriendLink> selectAll();
}