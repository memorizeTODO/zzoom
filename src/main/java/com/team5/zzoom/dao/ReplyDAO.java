package com.team5.zzoom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team5.zzoom.model.ReplyVO;

@Mapper
public interface ReplyDAO {
	
	 List<ReplyVO> getReplylist(int inquiry_id);

}
