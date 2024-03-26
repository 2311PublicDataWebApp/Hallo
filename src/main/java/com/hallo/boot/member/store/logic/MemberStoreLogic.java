package com.hallo.boot.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.store.MemberStore;

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
}
