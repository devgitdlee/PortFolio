package com.demo.demoproject;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.demo.config.TilesConfig;
import com.demo.mapper.MemberMapper;
import com.demo.vo.BoardVO;
import com.demo.vo.MemberVO;
import com.demo.vo.ResultType;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.mysql.cj.xdevapi.JsonArray;

@Controller
public class MainController {
	
	@Autowired
	private MemberMapper memMapper;

	//@RequestMapping(value="/")
	@RequestMapping("/")
	public String indexView(){
		//List<MemberVO> list = memMapper.selectMemberList();
		return "index";
	}
	
	@ResponseBody
	@RequestMapping("/join")
	public ModelAndView joinview(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("joinForm");
		
		//List<MemberVO> list = memMapper.selectMemberList();
		return mv;
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public ModelAndView joininsert(MemberVO vo) {
		System.out.println("지금 움직이나?");
		System.out.println("주소:"+vo.getAddress());
		System.out.println("이름:"+vo.getUsername());
		List<ResultType> list = memMapper.callSpjoininsert(vo);
		System.out.println(list.toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/userid/check", method = RequestMethod.POST)
	public @ResponseBody int checkid(HttpServletRequest req, String userid) {
		System.out.println("user!!! : "+userid);
		int result = memMapper.selectIidcheck(userid);
		/*
		 * JSONObject obj = new JSONObject(); obj.put("flag", result);
		 * System.out.println(obj);
		 */

		return result;
	}
	
	@RequestMapping(value="/userid/login", method = RequestMethod.POST)
	@ResponseBody
	public int logincheck(@ModelAttribute("MemberVO") MemberVO vo) {
		String userid = vo.getUserid();
		String passwd = vo.getUserpasswd();
		System.out.println("loginuser!!! : "+userid);
		System.out.println("loginpassword!!! : "+passwd);
		int result = memMapper.logincheck(userid, passwd);

		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public ModelAndView loginview(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		
		//List<MemberVO> list = memMapper.selectMemberList();
		return mv;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView login(MemberVO vo) {
		System.out.println("login 실행되나?");
		String userid = vo.getUserid();
		//List<MemberVO> list = memMapper.callSploginprosess(userid, passwd);
		System.out.println(userid);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		
		
		
		return mv;
		
	}

	@ResponseBody
	@RequestMapping(value="/board", method = RequestMethod.GET)
	public ModelAndView boardview(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board");
		//List<BoardVO> list = memMapper.boardselect();
		//mv.addObject("list", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/check", method = RequestMethod.GET)
	public JSONObject Jsonboard () {
		List<BoardVO> list = memMapper.boardselect();
		JSONObject result = new JSONObject();
		JSONArray jsonarray = new JSONArray();
		JSONObject json = new JSONObject();
		for (int i=0; i<list.size(); i++) {
			json = new JSONObject();
			json.put("bid",list.get(i).getbid()); 
			json.put("btitle",list.get(i).getbtitle());
			json.put("bname",list.get(i).getbname());
			json.put("bdate",list.get(i).getbdate());
			
			jsonarray.add(json);
		}
		result.put("board",jsonarray);
		System.out.println(result);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/boardread", method = RequestMethod.GET)
	public ModelAndView boardreadview(int bbid){
		ModelAndView mv = new ModelAndView();
		int bid = bbid;
		List<BoardVO> list = memMapper.boardread(bid);
		mv.setViewName("board/boardread");
		mv.addObject("btitle", list.get(0).getbtitle());
		mv.addObject("bname", list.get(0).getbname());
		mv.addObject("bcontent", list.get(0).getbcontent());
		mv.addObject("bdate", list.get(0).getbdate());
		mv.addObject("bhit", list.get(0).getbhit());
		//List<BoardVO> list = memMapper.boardselect();
		//mv.addObject("list", list);
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/board/read", method = RequestMethod.GET)
	public JSONObject boardread(int bid) {
		System.out.println("bid:"+bid);
		List<BoardVO> list = memMapper.boardread(bid);
		JSONObject json = new JSONObject();
		for (int i=0; i<list.size(); i++) {
			json.put("btitle",list.get(i).getbtitle());
			json.put("bname",list.get(i).getbname());
			json.put("bcontent",list.get(i).getbcontent());
			json.put("bdate",list.get(i).getbdate());
			json.put("bhit", list.get(i).getbhit());
		}
				
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/boardwrite", method = RequestMethod.GET)
	public ModelAndView boardwirte() {
		System.out.println("/board/boardwrite");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/boardwrite");
				
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/boardwrite", method = RequestMethod.POST)
	public ModelAndView bordinsert(BoardVO vo) {
		System.out.println("게시판 글쓰기 실행되나?");
		System.out.println(vo.getbname());
		System.out.println(vo.getbtitle());
		System.out.println(vo.getbcontent());
		vo.setbdate("2019");
		
		memMapper.callSpboardinsert(vo);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board");
				
		return mv;
	}
	
	
}
