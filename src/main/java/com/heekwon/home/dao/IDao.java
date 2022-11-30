package com.heekwon.home.dao;

import java.util.List;

import com.heekwon.home.dto.Criteria;
import com.heekwon.home.dto.MemberDto;
import com.heekwon.home.dto.QBoardDto;

public interface IDao {
	
	//회원 관리
	public void joinOkDao(String mid, String mpw, String mname, String memail);
	public String loginOkDao(String mid);
	public MemberDto memberInfoDao(String mid);
	public int modifyOkDao(String mpw, String mname, String memail, String mid);
	
	
	//게시판
	public int writeQuestionDao(String qid, String qname, String qcontent, String qemail);
	public List<QBoardDto> listDao(Criteria cri);
	public QBoardDto contentViewDao(String qnum);
	public void questionModifyOkDao(String qcontent, String qemail, String qnum);
	public void questionDeleteDao(String qnum);
	
	//게시판 총 글의 개수
	public int boardAllCount();
}
