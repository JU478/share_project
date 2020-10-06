package com.dashboardweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashboardweb.service.NjyNameSearchService;
import com.google.gson.Gson;


@WebServlet(urlPatterns = {"/select-name"})
public class NjySelectNameServlet extends HomeServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String playerName = req.getParameter("playerName");
		
		//데이터베이스로 부터 데이터 조회 ( 서비스 객체에 요청 )
		NjyNameSearchService service = new NjyNameSearchService();
		ArrayList<String> playerNames = service.findIdsById(playerName);
		
		resp.setContentType("application/json;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		//out.println( "mess1:mess2:mess3" );
		
		Gson gson = new Gson();
		out.println( gson.toJson(playerNames) );
		
	}
	
	
}
