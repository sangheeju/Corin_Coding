package kr.co.korogom.domain;

import org.springframework.web.util.UriComponentsBuilder;



import lombok.Data;

@Data
public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("perPageNum",this.getPerPageNum())
				.queryParam("page",this.getPage())
				.queryParam("type",this.getSearchType())
				.queryParam("keyword",this.getKeyword());
		
		return builder.toUriString();
	}
}
