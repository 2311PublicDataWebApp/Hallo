package com.hallo.boot.member.service;

import com.hallo.boot.member.domain.vo.MemberVO;

public interface MemberService {

	/**
	 * 회원가입 Service
	 * @param member
	 * @return
	 */
	int memberInsert(MemberVO member);

	/**
	 * 회원 정보수정
	 * @param member
	 * @return
	 */
	int memberUpdate(MemberVO member);

	/**
	 * 회원 탈퇴
	 * @param memberId
	 * @return
	 */
	int memberDelete(String memberId);

	/**
	 * 아이디 찾기 
	 * @param memberId
	 * @return
	 */
	MemberVO getOneById(String memberId);

	/**
	 * 회원 로그인 Service
	 * @param mOne
	 * @return member
	 */
	MemberVO checkMemberLogin(MemberVO mOne);

}
