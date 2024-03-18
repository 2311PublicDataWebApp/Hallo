package com.hallo.boot.member.service;

import com.hallo.boot.member.domain.vo.MemberVO;

public interface MemberService {

	/**
	 * 회원 로그인 Service
	 * @param mOne
	 * @return member
	 */
	MemberVO checkMemberLogin(MemberVO mOne);

}
