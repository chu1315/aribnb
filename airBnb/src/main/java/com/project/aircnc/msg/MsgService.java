package com.project.aircnc.msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MsgService {
	
	@Autowired
	private MsgMapper mapper;
	
	public int crtMsg(int i_user, String room_title,int i_host, int loginUser_i_user) {
		
		MsgVO mvo = new MsgVO();
		mvo.setHost_num(i_user);
		mvo.setMs_title(room_title);
		mvo.setI_host(i_host);
		mvo.setI_user(loginUser_i_user);
		
		return mapper.crtMsg(mvo);
	}
	
	public List<MsgVO> msgList(MsgVO param) {
		return mapper.msgList(param);
	}
	public List<DtlMsgVO> msgDetailList (DtlMsgVO param) {
		return mapper.msgDetailList(param);
	}
	
	public int insMsg(DtlMsgVO param) {
		return mapper.insMsg(param);
	}
	
	public int delMsgOne() {
		return mapper.delMsgOne();
	}
	public int delMsgTwo(int i_mlist) {
		return mapper.delMsgTwo(i_mlist);
	}
	public int delMsgThree(int i_mlist) {
		return mapper.delMsgThree(i_mlist);
	}
	public int delMsgFour() {
		return mapper.delMsgFour();
	}
	
}
