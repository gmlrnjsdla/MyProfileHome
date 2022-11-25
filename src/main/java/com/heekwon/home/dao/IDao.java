package com.heekwon.home.dao;

import java.util.ArrayList;

import com.heekwon.home.dto.MemberDto;
import com.heekwon.home.dto.QBoardDto;

public interface IDao {
	
	public void joinOkDao(String mid, String mpw, String mname, String memail);
	public String loginOkDao(String mid);
	public MemberDto memberInfoDao(String mid);
	public int modifyOkDao(String mpw, String mname, String memail, String mid);
	
	
	
	public int writeQuestionDao(String qid, String qname, String qcontent, String qemail);
	public ArrayList<QBoardDto> listDao();
	public QBoardDto contentViewDao(String qnum);
	public void questionModifyOkDao(String qcontent, String qemail, String qnum);
	public void questionDeleteDao(String qnum);
}
