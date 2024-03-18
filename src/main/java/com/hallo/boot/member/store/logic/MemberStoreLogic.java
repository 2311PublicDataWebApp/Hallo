package com.hallo.boot.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public MemberVO checkMemberLogin(SqlSession session, MemberVO mOne) {
		MemberVO member = session.selectOne("MemberMapper.checkMemberLogin", mOne);
		return member;
	}

}
