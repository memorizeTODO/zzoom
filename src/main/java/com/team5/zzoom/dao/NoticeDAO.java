package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.NoticeVO;

@Mapper
public interface NoticeDAO {
	

	public int insert(NoticeVO notice);
	public int getCount();
	public List<NoticeVO> getBoardList(int start);
	public NoticeVO getNotice(int notice_id);
	public int update(NoticeVO notice);
	public int delete(int notice_id);
	public int noticeCount(int notice_id);
}
