package com.project.aircnc.msg;

import java.util.List;

public interface MsgMapper {
	public int crtMsg(MsgVO param);
	
	public List<MsgVO> msgList(MsgVO param);
	public List<DtlMsgVO> msgDetailList(DtlMsgVO param);
	
	public int insMsg(DtlMsgVO param);
	
	public int delMsgOne();
	public int delMsgTwo(int i_mlist);
	public int delMsgThree(int i_mlist);
	public int delMsgFour();
}
