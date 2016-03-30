package com.house.agency.dao;

import java.util.List;

import com.house.agency.entity.Building;
import com.house.agency.param.BuildingQueryParam;


public interface IBuildingDao {

	int save(Building param);
	int update(Building param);
	int deleteById(String id);
	Building getDataById(String id);
	
	int count(BuildingQueryParam param);
	List<Building> query(BuildingQueryParam param, int start, int end);
	List<Building> list(BuildingQueryParam param);
}