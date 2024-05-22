package com.mm.linkflow.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mm.linkflow.dao.AttachDao;
import com.mm.linkflow.dao.BoardDao;
import com.mm.linkflow.dto.AttachDto;
import com.mm.linkflow.dto.BoardCategoryDto;
import com.mm.linkflow.dto.BoardDto;
import com.mm.linkflow.dto.MemberDto;
import com.mm.linkflow.dto.PageInfoDto;
import com.mm.linkflow.service.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardDao boardDao;
	private final AttachDao attachDao;
	
	// 권한별 카테고리 조회
	@Override
	public List<BoardCategoryDto> selectBoardType(MemberDto loginUser) {
		return boardDao.selectBoardType(loginUser);
	}
	
	// 게시판 리스트갯수 조회
	@Override
	public int selectBoardListCount(String boardType) {
		return boardDao.selectBoardListCount(boardType);
	}
	
	@Override
	public int selectTrashListCount(String userId) {
		return boardDao.selectTrashListCount(userId);
	}

	@Override
	public List<BoardDto> selectNoticeBoardList(String boardType) {
		return boardDao.selectNoticeBoardList(boardType);
	}
	
	// 페이징별 게시판 조회
	@Override
	public List<BoardDto> selectBoardList(PageInfoDto pi, String boardType) {
		return boardDao.selectBoardList(pi, boardType);
	}

	// 공지사항 조회용 - 황민우
	@Override
	public List<BoardDto> selectNewNoticeList() {
		return boardDao.selectNewNoticeList();
	}

	// 게시글작성
	@Override
	public int insertBoard(BoardDto board) {
		
		int result1 = boardDao.insertBoard(board);
		
		int result2 = 1;
		List<AttachDto> attachList = board.getAttachList();
		log.debug("attachList : {}", attachList);
		if(!attachList.isEmpty()) {
			result2 = 0;
			for(AttachDto at : attachList) {
				result2 += attachDao.insertAttach(at);
			}
		}
		log.debug("result1 : {}", result1);
		log.debug("result2 : {}", result2);
		return result1 * result2;
	}

	@Override
	public int updateIncreaseCount(int no) {
		return boardDao.updateIncreaseCount(no);
	}

	@Override
	public BoardDto selectBoard(int no) {
		return boardDao.selectBoard(no);
	}

	@Override
	public int updateBoard(BoardDto board, String[] delFileNo) {
		
		// 게시글 정보 update
				int result1 = boardDao.updateBoard(board);
				
				// 삭제할 첨부파일 정보 delete
				int result2 = delFileNo == null ? 1
												: attachDao.deleteAttach(delFileNo);
				
				// 새로운 첨부파일 정보 insert
				List<AttachDto> list = board.getAttachList();
				int result3 = 0;
				if(list != null) {
					for(AttachDto at : list) {
						result3 += attachDao.insertAttach(at);
					}
				}else {
					list = new ArrayList<>();
				}
				
				return result1 == 1
						&& result2 > 0
							&& result3 == list.size() 
								? 1 : -1 ;
	}

	@Override
	public int selectSearchListCount(Map<String, String> search) {
		return boardDao.selectSearchListCount(search);
	}

	@Override
	public List<BoardDto> selectSearchList(Map<String, String> search, PageInfoDto pi) {
		return boardDao.selectSearchList(search, pi);
	}

	@Override
	public List<BoardDto> selectTempSaveList(PageInfoDto pi, String userId) {
		return boardDao.selectTempSaveList(pi, userId);
	}

	@Override
	public int deleteBoard(List<Integer> no) {
		return boardDao.deleteBoard(no);
	}

	@Override
	public int selectCurrnetTempSave() {
		return boardDao.selectCurrnetTempSave();
	}

	@Override
	public int selectTempSaveListCount(String userId) {
		return boardDao.selectTempSaveListCount(userId);
	}

	@Override
	public int removeBoard(List<Integer> no) {
		int result1 = boardDao.removeBoard(no);
		int result2 = 0;
		for(int index : no) {
			List<String> delFileNo = attachDao.selectDelFileNo(index);
			if(delFileNo != null) {
				String[] delFileNoArray = new String[delFileNo.size()];
				delFileNo.toArray(delFileNoArray);
				List<AttachDto> delFileList = attachDao.selectDelFileList(delFileNoArray);
				result2 += attachDao.deleteAttach(delFileNoArray);	
				for(AttachDto at : delFileList) {
					new File(at.getFilePath() + "/" + at.getFilesystemName()).delete();
				}
			}
		}
		return result1 * result2;
	}

	@Override
	public List<BoardDto> selectTrashList(PageInfoDto pi, String userId) {
		return boardDao.selectTrashList(pi, userId);
	}

	@Override
	public int restoreBoard(List<Integer> no) {
		return boardDao.restoreBoard(no);
	}

	
}
