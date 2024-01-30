package kr.co.gudi.marketing.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MusicChartDAO {

	List<String> musicArtistCall(List<String> artNameArray);
	
}
