package com.hallo.boot.member.service;

import java.util.List;
import java.util.Map;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

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

	
	
	
	
	
	
	
	
	
	////////////////////////////////// ADMIN 관련 코드 ///////////////////////////////////////

	int getMemberAdminTotalCount(Map<String, String> paramMap);

	List<MemberVO> searchMemberAdminByKeyword(QnaPageInfo pInfo, Map<String, String> paramMap);

	MemberVO selectAdminMemberById(String memberId);

	List<MemberVO> selectAdminMemberList(QnaPageInfo pInfo);

	int getAdminMemberTotalCount();

	List<MemberVO> selectDBMemberList(NoticePageInfo pi);

	


}
