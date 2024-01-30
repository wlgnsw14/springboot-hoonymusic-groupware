package kr.co.gudi.marketing.dto;

import org.apache.ibatis.type.Alias;

@Alias("music")
public class MusicChartDTO {
	private String art_name;

	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	
	
}
