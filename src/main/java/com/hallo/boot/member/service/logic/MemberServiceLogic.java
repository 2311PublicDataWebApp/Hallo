package com.hallo.boot.member.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.service.MemberService;
import com.hallo.boot.member.store.MemberStore;

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
}
