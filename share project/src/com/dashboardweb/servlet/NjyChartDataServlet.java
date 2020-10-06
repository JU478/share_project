package com.dashboardweb.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dashboardweb.vo.IrisVO;
import com.dashboardweb.vo.NjySalaryVO;
import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;

@WebServlet(urlPatterns = { "/njy-chart-data" })
public class NjyChartDataServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		Gson gson = new Gson();
		String json = null;
		String player = req.getParameter("player");			
		// AreaChartData areaChartData = loadAreaChartData();
		String path = 
				"http://127.0.0.1:5000/njy/salary_by_player?player=" + player;
			
			// 자바 프로그램에서 다른 서버에 요청을 보내고 응답을 수신하는 도구
			URL url = new URL(path);		
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			
			String result = "";
			
			int status = conn.getResponseCode();
			if (status == 200) {
				// 네트워크를 통해 수신된 데이터를 읽는 도구 ( IO 객체 )
				InputStream is = conn.getInputStream();
				InputStreamReader isr = new InputStreamReader(is);
				
				JsonReader reader = new JsonReader(isr);
				
				NjySalaryVO[] salaryList = gson.fromJson(reader, NjySalaryVO[].class);
				
				double thisYearSalary = 0, nextYearSalary = 0;
				for (int i = 0; i < salaryList.length; i++) {
					NjySalaryVO salary = salaryList[i];
					thisYearSalary += salary.getSALARY();
					nextYearSalary += salary.getNEXT_YEAR_SALARY();
				}
				
				AreaChartData areaChartData = new AreaChartData();
				areaChartData.setLabels(new String[] {"THIS_YEAR_SALARY", "NEXT_YEAR_SALARY"});
				areaChartData.append( new Double[] { thisYearSalary, nextYearSalary } );
				
				json = gson.toJson(areaChartData);
				
				PrintWriter out = resp.getWriter();
				out.println(json);
				// out.println(thisYearSalary);
				// out.println(nextYearSalary);
				
			} else {
				result = String.format("%d 오류가 발생했습니다.", status);
			}
			
			conn.disconnect();
		
	}	
	
	// 데이터 보내는 클래스
	class AreaChartData {
		String[] labels;
		ArrayList<Object[]> datasets = new ArrayList<>();
		
		public AreaChartData() {}
		
		public AreaChartData(String[] labels, ArrayList<Object[]> datasets) {
			this.labels = labels;
			this.datasets = datasets;
		}
		
		public String[] getLabels() {
			return labels;
		}
		public void setLabels(String[] labels) {
			this.labels = labels;
		}
		public List<Object[]> getDatasets() {
			return datasets;
		}
		public void setDatasets(ArrayList<Object[]> datasets) {
			this.datasets = datasets;
		}
		public void append(Object[] data) {
			datasets.add(data);
		}
	}
	
	
	
//	private AreaChartData loadAreaChartData() {
//		
//		AreaChartData areaChartData = new AreaChartData();
//		areaChartData.setLabels(new String[] {"January", "February", "March", "April", "May", "June", "July"});
//		areaChartData.append( new Integer[] {28, 48, 40, 19, 86, 27, 90} );
//		areaChartData.append( new Integer[] {65, 59, 80, 81, 56, 55, 40} );
//		
//		return areaChartData;
		
	}

