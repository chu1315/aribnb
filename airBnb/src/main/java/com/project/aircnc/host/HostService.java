package com.project.aircnc.host;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		param.setAddr(param.getAddr()+" "+param.getAddrDetail());
		return mapper.insHostSaveOne(param);
	}
	
	
	public void upload(MultipartFile file, HttpSession hs, int i_host) {
		TUserVO loginUser = (TUserVO)hs.getAttribute("loginUser");		
				
		
//		String realPath = hs.getServletContext().getRealPath("/"); //루트 절대경로 가져오기
//		String imgFolder = realPath + "/resources/img/host/" + i_host;
		String imgFolder = "C:/Users/현욱/git/aribnb/airBnb/src/main/webapp/resources/img/host/"+i_host;
		String pic_nm = MyUtils.saveFile(imgFolder, file);
		
		int i_user = loginUser.getI_user();

		mapper.upload(i_user, i_host, pic_nm);
	}
	
	public void thumUpload(MultipartFile file, HttpSession hs, int i_user, int i_host) {
		
//		String realPath = hs.getServletContext().getRealPath("/"); //루트 절대경로 가져오기 web-app까지의 경로
//		String imgFolder = realPath + "/resources/img/thum/";
		String imgFolder = "C:/Users/현욱/git/aribnb/airBnb/src/main/webapp/resources/img/thum/";
		String pic_nm = MyUtils.saveFile(imgFolder, file);
		

		mapper.thumUpload(i_user, i_host, pic_nm);
	}
	
	
	
}
