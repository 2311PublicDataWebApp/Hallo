package com.hallo.boot.member.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.store.MemberStore;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;

@Repository
public class MemberStoreLogic implements MemberStore{

	// 회원가입
	@Override
	public int memberInsert(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	// 정보수정
	@Override
	public int memberUpadate(SqlSession session, MemberVO member) {
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}

	@Override
	public int memberDelete(SqlSession session, String memberId) {
		int result = session.delete("MemberMapper.deleteMember", memberId);
		return result;
	}

	// 아이디 찾기
	@Override
	public MemberVO getOneById(SqlSession session, String memberId) {
		MemberVO result = session.selectOne("MemberMapper.getOneById", memberId);
		return result;
	}

	// 로그인
	@Override
	public MemberVO checkMemberLogin(SqlSession session, MemberVO mOne) {
		MemberVO member = session.selectOne("MemberMapper.checkMemberLogin", mOne);
		return member;
	}

	
	
	
	
	
	////////////////////////////////////// ADMIN 관련 코드 /////////////////////////////////
	@Override
	public List<MemberVO> selectAdminMemberList(SqlSession session, QnaPageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> mList 
		= session.selectList("MemberMapper.selectAdminMemberList", null, rowBounds);
		return mList;
	}

	@Override
	public int selectAdminMemberTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("MemberMapper.searchMemberAdminTotalCount", paramMap);
		return totalCount;
	}

	@Override
	public List<MemberVO> searchMemberAdminByKeyword(SqlSession session, QnaPageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> searchList = session.selectList("MemberMapper.searchAdminMemberByKeyword", paramMap, rowBounds);
		return searchList;
	}

	@Override
	public MemberVO selectAdminMemberById(SqlSession session, String memberId) {
		MemberVO member = session.selectOne("MemberMapper.selectAdminMemberById", memberId);
		return member;
	}

	@Override
	public int selectAdminTotalCount(SqlSession session) {
		int totalCount = session.selectOne("MemberMapper.selectAdminTotalCount");
		return totalCount;
	}

	@Override
	public List<MemberVO> selectDBMemberList(SqlSession session, RowBounds rowBounds) {
		List<MemberVO> mList = session.selectList("MemberMapper.selectDBMemberList", null, rowBounds);
		return mList;
	}


}
