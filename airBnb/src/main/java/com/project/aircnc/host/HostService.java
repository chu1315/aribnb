package com.project.aircnc.host;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.BuildTypeVO;
import com.project.aircnc.common.FaciliteVO;
import com.project.aircnc.common.GestSpaceVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.SafePlantVO;
import com.project.aircnc.common.SpaceInfoVO;

@Service
public class HostService {
	@Autowired
	HostMapper mapper;
	
	public int getI_Host(HostUserVO param) {
		return mapper.getI_Host(param);
	}
	public int insHostSaveOne(HostUserVO param) {
		param.setAddr(param.getAddr()+param.getAddrDetail());
		return mapper.insHostSaveOne(param);
	}
	
	public int insHostSaveTwo(BuildTypeVO param) {
		return mapper.insHostSaveTwo(param);
	}
	
	public int insHostSaveThree(FaciliteVO param) {
		return mapper.insHostSaveThree(param);
	}
	
	public int insHostSaveThree1(SafePlantVO param) {
		return mapper.insHostSaveThree1(param);
	}
	
	public int insHostSaveFour(GestSpaceVO param) {
		return mapper.insHostSaveFour(param);
	}
	
	public int insHostSaveFive(SpaceInfoVO param) {
		// 문자열 치환
//		param.setExpa(MyUtils.getSTRFilter(param.getExpa()));
//		param.setLoca_info(MyUtils.getSTRFilter(param.getLoca_info()));
//		param.setRoom_info(MyUtils.getSTRFilter(param.getRoom_info()));
//		param.setTraf_info(MyUtils.getSTRFilter(param.getTraf_info()));
		
		return mapper.insHostSaveFive(param);
	}
	
	
}
