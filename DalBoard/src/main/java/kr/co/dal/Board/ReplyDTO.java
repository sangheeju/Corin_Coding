package kr.co.dal.Board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyDTO {

	private int reno;
	private String rewriter;
	private String rememo;
	private String redate;
	private int bno;
}
