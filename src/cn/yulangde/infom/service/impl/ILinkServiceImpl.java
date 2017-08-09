package cn.yulangde.infom.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yulangde.infom.common.bean.BasicInfo;
import cn.yulangde.infom.common.bean.FriendLink;
import cn.yulangde.infom.dao.BasicInfoMapper;
import cn.yulangde.infom.dao.FriendLinkMapper;
import cn.yulangde.infom.service.ILinkService;

@Service
public class ILinkServiceImpl implements ILinkService {
	@Autowired
	private BasicInfoMapper basicdao;
	@Autowired
	private FriendLinkMapper dao;

	@Override
	public void deleteByPrimaryKey(Long id) {
		dao.deleteByPrimaryKey(id);
	}

	@Override
	public void insert(FriendLink record) {
		dao.insert(record);
	}

	@Override
	public FriendLink selectByPrimaryKey(Long id) {
		FriendLink selectByPrimaryKey = dao.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

	@Override
	public void updateByPrimaryKey(FriendLink record) {
		dao.updateByPrimaryKey(record);

	}

	@Override
	public List<FriendLink> selectAll() {
		List<FriendLink> selectAll = dao.selectAll();
		return selectAll;
	}

	@Override
	public void updateBasic(BasicInfo record) {
		basicdao.updateByPrimaryKey(record);
	}

	@Override
	public BasicInfo selectBasic(Long id) {
		BasicInfo selectByPrimaryKey = basicdao.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

}
