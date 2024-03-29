package com.hallo.boot.member.service.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.member.store.MemberStore;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;
import com.hallo.boot.qna.domain.vo.QnaVO;

@Service
public class MemberServiceLogic implements MemberService {

	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession session;

	// 회원가입
	@Override
	public int memberInsert(MemberVO member) {
		int result = mStore.memberInsert(session, member);
		return result;
	}

	// 정보수정
	@Override
	public int memberUpdate(MemberVO member) {
		int result = mStore.memberUpadate(session, member);
		return result;
	}

	// 회원탈퇴
	@Override
	public int memberDelete(String memberId) {
		int result = mStore.memberDelete(session, memberId);
		return result;
	}

	// 아이디 찾기
	@Override
	public MemberVO getOneById(String memberId) {
		 MemberVO result = mStore.getOneById(session, memberId);
		return result;
	}

	// 로그인
	@Override
	public MemberVO checkMemberLogin(MemberVO mOne) {
		MemberVO member = mStore.checkMemberLogin(session, mOne);
		return member;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////// ADMIN 관련 코드 /////////////////////////////////
	// Admin 회원 목록 조회
	@Override
	public List<MemberVO> selectAdminMemberList(QnaPageInfo pInfo) {
		List<MemberVO> mList = mStore.selectAdminMemberList(session,pInfo);
		return mList;
	}
	// Admin 회원 totalCount
	@Override
	public int getMemberAdminTotalCount(Map<String, String> paramMap) {
		int totalCount = mStore.selectAdminMemberTotalCount(session, paramMap);
		return totalCount;
	}
	// Admin 회원 검색 결과 조회
	@Override
	public List<MemberVO> searchMemberAdminByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap) {
		List<MemberVO> searchList = mStore.searchMemberAdminByKeyword(session, pInfo, paramMap);
		return searchList;
	}

	// Admin 회원 목록 검색 결과 조회
	@Override
	public MemberVO selectAdminMemberById(String memberId) {
		MemberVO member = mStore.selectAdminMemberById(session, memberId);
		return member;
	}

	@Override
	public int getAdminMemberTotalCount() {
		int totalCount = mStore.selectAdminTotalCount(session);
		return totalCount;
	}

	@Override
	public List<MemberVO> selectDBMemberList(NoticePageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<MemberVO> mList = mStore.selectDBMemberList(session, rowBounds);
		return mList;
	}





}
