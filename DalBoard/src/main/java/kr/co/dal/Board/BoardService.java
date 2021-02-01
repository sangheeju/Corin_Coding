package kr.co.dal.Board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	//전체 보기
	public List<BoardDTO> boardList();	
	public List<BoardDTO> fBoard(); // 자유게시판
	public List<BoardDTO> nBoard(); // 공지게시판
	public List<BoardDTO> qnaBoard(); // QnA게시판
	
	//조회수 증가
	public int readCnt(int bno);
	//상세보기
	public BoardDTO detail(int bno);
//	public BoardDTO detail(Map<String,Object> map);
		
	//글쓰기
	public int register(BoardDTO boardDTO);
	
	//글 수정
	public int update(BoardDTO boardDTO);
	
	//글 삭제
	public int delete(int bno);
	
	// 댓글 쓰기 addreply
	public int addreply(ReplyDTO replyDTO);
	// 댓글 리스트 listreply
	public List<ReplyDTO> listreply(int bno);
	// 댓글 수정 editreply
	public int editreply(ReplyDTO replyDTO);
	// 댓글 삭제 delreply
	public int delreply(int reno);
	
}
