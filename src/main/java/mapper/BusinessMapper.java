package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Business;
import model.Search;

public interface BusinessMapper {

	// 기업 정보 가져오기
	@Select("select * from business where bid = #{bId}")
	Business getBusiness(String bId);

	// 기업 리스트
	@Select("select * from business")
	List<Business> businessList();

	// 기업 정보 입력(회원가입)
	@Insert("insert into business values(#{bId}, #{bpw}, #{bname}, #{address}, #{salary}, #{welfare}, #{ceo}, #{sales}, #{employees}, #{type}, #{industry}, #{detailIndustry}, #{homepage}, #{content})")
	int insertBusiness(Business business);

	// 기업 정보 수정
	@Update("update business set bid=#{bId}, bpw=#{bpw}, bname=#{bname}, address=#{address}, salary=#{salary}, welfare=#{welfare}, ceo=#{ceo}, sales=#{sales}, employees=#{employees}, type=#{type}, industry=#{industry}, detailindustry=#{detailIndustry}, homepage=#{homepage}, content=#{content} where bid=#{bId}")
	int updateBusiness(Business business);

	// 기업 정보 삭제
	@Delete("delete from business where bid = #{bId}")
	int deleteBusiness(String bId);

	// 기업 유형(type)별 리스트
	@Select("select * from business where type=#{type}")
	List<Business> typeList(String type);

	// 기업 해당 산업(industry)별 리스트
	@Select("select * from business where industry=#{industry}")
	List<Business> industryList(String industry);

	// 기업 해당 상세 산업(industry)별 리스트
	@Select("select * from business where industry=#{industry} and detailindustry=#{detailIndustry}")
	List<Business> detailIndustryList(String industry, String detailIndustry);

	// 기업 검색어 리스트
	@Select("select * from business where upper(${part}) like upper(#{searchData})")
	List<Business> searchBusinessList(Search search);
}