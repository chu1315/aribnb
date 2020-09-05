package com.project.aircnc.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.AddSchVO;
import com.project.aircnc.common.HostUserVO;

@Service
public class SearchSearvice {
	
	@Autowired
	private SearchMapper mapper;

	public List<HostUserVO> searchList(String addr) {
		
		List<HostUserVO> list = mapper.searchListTwo(addr);
		
		
		return list;
	}
	
	
	
	
	/*
	 * public List<HostListVO> hostList(SearchVO param)throws
	 * java.text.ParseException, ParseException{ // chin chout 사이 일수 계산
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyy-mm-dd"); Date startDate =
	 * sdf.parse(String.valueOf(param.getChin())); Date endDate =
	 * sdf.parse(String.valueOf(param.getChout())); //두날짜 사이의 시간 차이(ms)를 하루 동안의
	 * ms(24시*60분*60초*1000밀리초) 로 나눈다. long diffDay = (endDate.getTime() -
	 * startDate.getTime() ) / (24*60*60*1000); //System.out.println(diffDay+"일");
	 * param.setDate(diffDay); ///////////////////////////////// List<HostListVO>
	 * list = new ArrayList<HostListVO>(); list = mapper.hostList(param); // 숙소 이미지
	 * 가져오기 for (HostListVO hostListVO : list) {
	 * hostListVO.setList(mapper.room_img_list(hostListVO)); } // 요금 최소 값
	 * param.setMin_fee(mapper.avgFee(param).getMin_fee());
	 * 
	 * 
	 * 
	 * return list; }
	 */
}
