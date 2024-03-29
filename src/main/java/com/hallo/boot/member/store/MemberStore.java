package com.hallo.boot.member.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.hallo.boot.member.domain.vo.MemberVO;
import com.hallo.boot.notice.domain.vo.NoticePageInfo;
import com.hallo.boot.qna.domain.vo.QnaPageInfo;

public interface MemberStore {

	/**
	 * 회원가입 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int memberInsert(SqlSession session, MemberVO member);

	/**
	 * 정보수정 Store
	 * @param session
	 * @param member
	 * @return
	 */
	int memberUpadate(SqlSession session, MemberVO member);

	/**
	 * 회원탈퇴
	 * @param session
	 * @param memberId
	 * @return
	 */
	int memberDelete(SqlSession session, String memberId);

	/**
	 * 아이디 찾기
	 * @param session
	 * @param memberId
	 * @return
	 */
	MemberVO getOneById(SqlSession session, String memberId);

	/**
	 * 회원 로그인 Store
	 * @param session
	 * @param mOne
	 * @return member
	 */
	MemberVO checkMemberLogin(SqlSession session, MemberVO mOne);

	
	
	////////////////////////////////////// ADMIN 관련 코드 /////////////////////////////////
	

	int selectAdminMemberTotalCount(SqlSession session, Map<String, String> paramMap);

	MemberVO selectAdminMemberById(SqlSession session, String memberId);

	List<MemberVO> selectAdminMemberList(SqlSession session, QnaPageInfo pInfo);

	int selectAdminTotalCount(SqlSession session);

	List<MemberVO> searchMemberAdminByKeyword(SqlSession session, QnaPageInfo pInfo, Map<String, String> paramMap);

	List<MemberVO> selectDBMemberList(SqlSession session, RowBounds rowBounds);

}
