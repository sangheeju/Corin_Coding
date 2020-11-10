package kr.co.korogom.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	
	private String type;
	private String keyword;
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");		
	}
	
}
