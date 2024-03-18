package com.hallo.boot.member.store;

import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.member.domain.vo.MemberVO;

public interface MemberStore {

	/**
	 * 회원 로그인 Store
	 * @param session
	 * @param mOne
	 * @return member
	 */
	MemberVO checkMemberLogin(SqlSession session, MemberVO mOne);

}
