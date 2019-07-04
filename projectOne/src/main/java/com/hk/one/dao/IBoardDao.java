package com.hk.one.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.BoardDto;

public interface IBoardDao {
	
	// 파일저장 메소드
	String saveFile(MultipartFile file);
	// 게시물 목록 출력
	public List<BoardDto> selectList();
	// 게시글 추가
	public boolean insert(BoardDto dto);
	// 글 삭제(isDel 컬럼을 1로 변경)
	public boolean delete(int seq);
	// 게시글 보기
	public BoardDto selectOne(int seq);
	// 글 수정하기
	public boolean updateBoard(BoardDto dto);
	// 글 다중삭제
	public boolean mulDel(String[] seq);
	// 조회수 증가
	public boolean readcount(int seq);
}
