package com.project.aircnc.msg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MsgService {
	
	@Autowired
	private MsgMapper mapper;
	
	public int crtMsg(MsgVO param) {
		return mapper.crtMsg(param);
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
