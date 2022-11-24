package com.heekwon.home.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heekwon.home.dao.IDao;
import com.heekwon.home.dto.MemberDto;
import com.heekwon.home.dto.QBoardDto;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "index")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping(value = "profile")
	public String profile() {
		
		return "profile";
	}
	
	@RequestMapping(value = "contact")
	public String contact() {
		
		return "contact";
	}
	
	@RequestMapping(value = "login")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value = "loginOk")
	public String loginOk(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		String dbpw = dao.loginOkDao(mid);
		
		if(dbpw == null) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다. 다시확인해주세요!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			if(!dbpw.equals(mpw)) {
				PrintWriter out;
				try {
					response.setContentType("text/html;charset=utf-8");
					out = response.getWriter();
					out.println("<script>alert('아이디 혹은 비밀번호가 일치하지 않습니다. 다시확인해주세요!');history.go(-1);</script>");
					out.flush();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("sessionID", mid);
				
				return "redirect:index";
			}
		}
		
		return "login";
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "join")
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "joinOk")
	public String joinOk(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		MemberDto dto = dao.memberInfoDao(mid);
		if(dto == null) {
			dao.joinOkDao(mid, mpw, mname, memail);
			
			model.addAttribute("mid", mid);
			model.addAttribute("mname", mname);
			
		}else {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('이미 가입된 아이디입니다. 다시확인해주세요!');history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "joinOk";
	}
	
	@RequestMapping(value = "question")
	public String question(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("sessionID");
		
		
		if(sid==null) {
			model.addAttribute("mid", "GUEST");
			model.addAttribute("mname", "GUEST");
			model.addAttribute("memail", "");
		}else {
			MemberDto dto = dao.memberInfoDao(sid);
			String mid = dto.getMid();
			String mname = dto.getMname();
			String memail = dto.getMemail();
			model.addAttribute("mid", mid);
			model.addAttribute("mname", mname);
			model.addAttribute("memail", memail);
		}
		
		return "question";
	}
	
	@RequestMapping(value = "questionOk")
	public String questionOk(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String qid = request.getParameter("qid");
		String qname = request.getParameter("qname");
		String qcontent = request.getParameter("qcontent");
		String qemail = request.getParameter("qemail");
		
		int questionFlag = dao.writeQuestionDao(qid, qname, qcontent, qemail);
		
		if(questionFlag == 1) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('질문하기 성공!!');window.location='list';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "question";
	}
	
	
	@RequestMapping(value = "member_modify")
	public String member_modify(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		HttpSession session = request.getSession();
		String sid = (String)session.getAttribute("sessionID");
		
		MemberDto dto = dao.memberInfoDao(sid);
		model.addAttribute("minfo", dto);
		
		return "member_modify";
	}
	
	@RequestMapping(value = "modifyOk")
	public String modifyOk(HttpServletRequest request, Model model, HttpServletResponse response) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		int modifyFlag = dao.modifyOkDao(mpw, mname, memail, mid);
		
		if(modifyFlag == 1) {
			PrintWriter out;
			try {
				response.setContentType("text/html;charset=utf-8");
				out = response.getWriter();
				out.println("<script>alert('회원정보 수정 성공!!');window.location='index';</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "redirect:index";
	}

	//====================================================================================================//
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request, Model model) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		ArrayList<QBoardDto> dtos = dao.listDao();
		
		model.addAttribute("list", dtos);
		
		return "list";
	}
	
	
	
	
	
	
	
	
	
	
	
}
