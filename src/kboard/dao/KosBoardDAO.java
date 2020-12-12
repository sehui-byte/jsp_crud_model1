package kboard.dao;

import java.util.ArrayList;

import kboard.vo.KosBoardVO;

public interface KosBoardDAO {
	ArrayList<KosBoardVO> boardSelectAll();
	ArrayList<KosBoardVO> boardSelect(KosBoardVO _kbvo);
	boolean boardInesert(KosBoardVO _kbvo);
	boolean boardUpdate(KosBoardVO _kbvo);
	boolean boardDelete(KosBoardVO _kbvo);
	ArrayList<KosBoardVO> PageListSelect(int startRow, int endRow);
	int boardTotalCount();
}
