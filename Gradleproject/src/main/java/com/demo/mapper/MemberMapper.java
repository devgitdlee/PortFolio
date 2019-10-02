package com.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.demo.vo.BoardVO;
import com.demo.vo.MemberVO;
import com.demo.vo.ResultType;

@Mapper
public interface MemberMapper {
	public List<MemberVO> selectMemberList();
	public List<ResultType> callSpjoininsert(MemberVO vo);
	public List<ResultType> callSpjoinupdate(MemberVO vo);
	public int selectIidcheck(String userid);
	public int logincheck(String userid, String passwd);
	public List<MemberVO> callSploginprosess(String userid, String passwd);
	public List<BoardVO> boardselect();
	public void callSpboardinsert(BoardVO vo);
	public List<BoardVO> boardread(int bid);
}
