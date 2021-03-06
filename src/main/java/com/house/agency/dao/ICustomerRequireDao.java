package com.house.agency.dao;

import java.util.List;

import com.house.agency.data.home.CustomerRequireHomeData;
import com.house.agency.entity.CustomerRequire;
import com.house.agency.param.CustomerRequireQueryParam;

public interface ICustomerRequireDao {

	int save(CustomerRequire param);

	int update(CustomerRequire param);

	int deleteById(String id);

	CustomerRequire getDataById(String id);

	int count(CustomerRequireQueryParam param);

	List<CustomerRequire> query(CustomerRequireQueryParam param, int start, int end);

	int countData(CustomerRequireQueryParam param);

	List<CustomerRequireHomeData> queryData(CustomerRequireQueryParam param, int start, int end);
	
	List<CustomerRequire> queryAll(CustomerRequireQueryParam param);
	
	CustomerRequireHomeData getDataByRequireId(String requireId);
}
