
package com.team5.zzoom.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.team5.zzoom.model.InquiryVO;

@Mapper
public interface InquiryDAO {
	public int insert(InquiryVO inquiry);

	public int getCount();

	public List<InquiryVO> getBoardList(int start);

	public InquiryVO getInquiry(int inquiry_id);

	public int update(InquiryVO inquiry);

	public int delete(int inquiry_id);
}
