package com.project.aircnc.host;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.aircnc.common.BuildTypeVO;
import com.project.aircnc.common.FaciliteVO;
import com.project.aircnc.common.GestSpaceVO;
import com.project.aircnc.common.HostPicVO;
import com.project.aircnc.common.HostUserVO;
import com.project.aircnc.common.MyUtils;
import com.project.aircnc.common.SafePlantVO;
import com.project.aircnc.common.SpaceInfoVO;
import com.project.aircnc.common.TUserVO;

@Service
public class HostService {
	@Autowired
	HostMapper mapper;
	
	public int getI_Host(HostUserVO param) {
		System.out.println("getI_Host param.get : " + param.getI_user());
		return mapper.getI_Host(param);
	}
	
	public int insHostSaveOne(HostUserVO param) {
		param.setAddr(param.getAddr()+param.getAddrDetail());
		return mapper.insHostSaveOne(param);
	}
	
	
	public void upload(MultipartFile file, HttpSession hs, int i_host) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");		
				
		
		String realPath = hs.getServletContext().getRealPath("/"); //루트 절대경로 가져오기
		String imgFolder = realPath + "/resources/img/host/" + i_host;
		
		String pic_nm = MyUtils.saveFile(imgFolder, file);

//		HostPicVO param = new HostPicVO();
//		param.setI_user(loginUser.getI_user());
//		System.out.println("upload Service loginUser i_user : " + loginUser.getI_user());
//		param.setI_host(i_host);
//		System.out.println("upload Servicei_host : " + i_host);
		
		int i_user = loginUser.getI_user();
		System.out.println("service upload i_user : " + i_user);
		System.out.println("service upload i_host : " + i_host);
		System.out.println("service upload pic_nm : " + pic_nm);

		mapper.upload(i_user, i_host, pic_nm);
	}
	
	
}
