package com.hk.one.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.MemberDto;

@Repository
public class MemberDao implements IMemberDao {
	
	private String namespace="Member.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberDto> getAllMember() {
		return sqlSession.selectList(namespace + "getAllMember");
	}

	@Override
	public MemberDto getMember(int mem_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean joinMember(MemberDto member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteMember(String mem_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateMember(MemberDto member) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberDto existMember(String mem_id, String mem_pw) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkIdMember(String mem_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkEmailMember(String mem_email) {
		// TODO Auto-generated method stub
		return false;
	}

}
