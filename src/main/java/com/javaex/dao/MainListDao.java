package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MainListVo;
import com.javaex.vo.MainSearchVo;

@Repository
public class MainListDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//기본 펜션정보 리스트 가져오기
	
	public List<MainSearchVo> main(MainSearchVo searchVo){
		System.out.println("Dao>select");
		
		List<MainSearchVo> pList = sqlSession.selectList("MainList.penList", searchVo);
		System.out.println("MainDao"+pList);
		System.out.println("MainDao"+searchVo);
		
		return pList;
		
	}
	
	
	
	//낮은 가격 순 리스트
	public List<MainSearchVo> selectLowprice(MainSearchVo searchVo){
		System.out.println("Dao>lowprice");
		
		List<MainSearchVo> pList = sqlSession.selectList("MainList.lowpriceList",searchVo);
		System.out.println("DaolowList --->"+pList);
		
		return pList;
		
	}
	
	//높은 가격 순 리스트
	public List<MainSearchVo> selectHighprice(MainSearchVo searchVo){
		System.out.println("Dao>highprice");
		
		List<MainSearchVo> pList = sqlSession.selectList("MainList.highpriceList",searchVo);
		System.out.println("DaohighList --->"+pList);
		return pList;
		
	}
	
	//추천별 리스트
	public List<MainSearchVo> selectHit(MainSearchVo searchVo){
		System.out.println("Dao>selectHit");
		
		List<MainSearchVo> pList = sqlSession.selectList("MainList.hitList",searchVo);
		
		return pList;
		
	}
	
	//체크박스로 리스트 가져오기
	public List<MainListVo> selectSearch(MainSearchVo searchVo){
		System.out.println("searchDao>search");
		
		List<MainListVo> pList = sqlSession.selectList("MainList.searchList", searchVo);
		
		System.out.println("SearchDaoPLIST"+pList);
		
		return pList;
		
	}
	
	//양도 체크박스 리스트
	public List<MainListVo> selectySearch(MainSearchVo searchVo){
		System.out.println("searchDao>search");
		
		List<MainListVo> pList = sqlSession.selectList("MainList.ySearchList", searchVo);
		
		System.out.println("SearchDaoPLIST"+pList);
		
		return pList;
		
	}
	
	
}
