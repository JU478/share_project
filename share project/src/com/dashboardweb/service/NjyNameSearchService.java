package com.dashboardweb.service;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import com.dashboardweb.dao.NjyMemberDao;
import com.dashboardweb.vo.NjyMemberVo;

public class NjyNameSearchService {

	private NjyMemberDao memberDao = new NjyMemberDao();
	
	public ArrayList<String> findIdsById(String playerName) {
		ArrayList<String> playerNames = memberDao.selectnamesByname(playerName);
		return playerNames;
	}

	public NjyMemberVo getInfo(String playerId) {

		NjyMemberVo memberInfo = memberDao.selectById(playerId);
		
		return memberInfo;
	}
	
	
}
