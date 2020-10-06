package com.dashboardweb.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet(urlPatterns = { "/chartjs/load-data" })
public class ChartServletOne extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String type = req.getParameter("type");
		
		Gson gson = new Gson();
		String json = null;
		
		if (type.equals("area")) {
			
			AreaChartData areaChartData = loadAreaChartData();
			json = gson.toJson(areaChartData);
			
		}
		
		PrintWriter out = resp.getWriter();
		out.println(json);
		
	}	
	
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
	
	private AreaChartData loadAreaChartData() {
		
		AreaChartData areaChartData = new AreaChartData();
		areaChartData.setLabels(new String[] {"January", "February", "March", "April", "May", "June", "July"});
		areaChartData.append( new Integer[] {28, 48, 40, 19, 86, 27, 90} );
		areaChartData.append( new Integer[] {65, 59, 80, 81, 56, 55, 40} );
		
		return areaChartData;
		
	}

}
