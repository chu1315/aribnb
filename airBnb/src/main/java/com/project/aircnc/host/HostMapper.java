package com.project.aircnc.host;

import org.apache.ibatis.annotations.Mapper;

import com.project.aircnc.common.BuildTypeVO;
import com.project.aircnc.common.FaciliteVO;
import com.project.aircnc.common.GestSpaceVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.SafePlantVO;
import com.project.aircnc.common.SpaceInfoVO;

@Mapper
public interface HostMapper {
	public int insHostSaveOne(HostUserVO param);
	public int getI_Host(HostUserVO param);
	public int insHostSaveTwo(BuildTypeVO param);
	public int insHostSaveThree(FaciliteVO param);
	public int insHostSaveThree1(SafePlantVO param);
	public int insHostSaveFour(GestSpaceVO param);
	public int insHostSaveFive(SpaceInfoVO param);
	
}
