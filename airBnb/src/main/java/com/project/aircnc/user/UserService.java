package com.project.aircnc.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.aircnc.common.TUserVO;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	public int join(TUserVO param) {
		
		return mapper.join(param);
	}
	
	public int login (TUserVO param ,HttpSession hs) {
		int result= 0;
		TUserVO vo;
		vo = mapper.login(param);
		
		// result 0: 오류. 1: 로그인 성공. 2: 비밀번호 틀림 . 3: 아이디 없음
		if (vo.getE_mail() != null) { 
			String pw= param.getC_pw();
			if(pw.equals(vo.getC_pw())) {
				vo.setC_pw(null);
				hs.setAttribute("loginUser",vo);
				result= 1;
			} else {
				result = 2;
			}
		} else {
			result= 3; // 내가 적은 e_mail과 일치하는 이메일이 없는경우  즉,아이디 없음
		}
		
		return result;
	}
	
	public int chkE_mail(String e_mail) {

		System.out.println("서비스들어옴");
		return mapper.chkE_mail(e_mail);
	}
}
