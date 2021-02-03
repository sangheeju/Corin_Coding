package kr.co.dal.Board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class PagingDTO {
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
		private int cntPage = 5;	// 5페이지씩 출력
		public PagingDTO() {
		}
		public PagingDTO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);	// 페이지당 글 갯수
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
		}
		// 제일 마지막 페이지 계산 : (전체 글 수/페이지당 글 갯수)올림한 수
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			// 끝페이지 : (현재 페이지 /화면당 출력할 페이지수(5)를 올림한 수를) 화면당 출력페이지 수로 곱하면
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage); 
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			// 시작 페이지 : 끝페이지수 - 화면당 출력 페이지수(5)에 1을 더한수 
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) {
			//끝글 : 현제페이지 * 페이지당 글 수
			setEnd(nowPage * cntPerPage);
			//시작글 : 끝에서 페이지당 글 수를 뺀것에 +1
			setStart(getEnd() - cntPerPage + 1);
		}
}
