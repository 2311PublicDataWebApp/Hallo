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

	@Override
	public MemberVO checkMemberLogin(MemberVO mOne) {
		MemberVO member = mStore.checkMemberLogin(session, mOne);
		return member;
	}
}
