package net.javaguides.login.database;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("------>1");
		try {
			List<Barchart> list = loginDao.getBarcharts();
			System.out.println("list : "+list);
			/*
			Map <String, List<Barchart>> map = new HashMap();
			
			for(Barchart barchart :list) {
				if(map.containsKey(barchart.getParent())) {
					List<Barchart> bList = map.get(barchart.getParent());
					bList.add(barchart);
					map.put(barchart.getParent(), bList);
				} else {
					List<Barchart> bList = new ArrayList<Barchart>();
					bList.add(barchart);
					map.put(barchart.getParent(), bList);
				}	
			}
			System.out.println("map : "+map);
			
			//System.out.println("keySet : "+map.keySet());
			
			for(Barchart barchart :list) {
				System.out.println("key : "+barchart.toString());
				mObj = new JSONObject();
				sObj = new JSONObject();
				//points: [{ name: 'Grading', y: ['06/15/2022', '09/13/2022'], id: 'grading', parent: 'excavation' }]
				sObj.put("name", barchart.getName()); 
				sObj.put("y", barchart.getY());
				sObj.put("id", barchart.getId());
				sObj.put("parent", barchart.getParent());
				JSONArray arr = new JSONArray("points");
				arr.put(sObj);
				mObj.put("points", arr);
				mList.put(mObj);
			}
			
			/*
			 for(String key : map.keySet()) {
				System.out.println("key : "+key+" = "+map.get(key).size());
				mObj = new JSONObject();
				mObj.put("points", map.get(key));
				mList.put(mObj);
			}
			
			System.out.println("mList : "+ mList);
			/*
			[
			
				{
	              points: [
	                { name: 'Suppyorder3', y: ['05/10/2016', '11/30/2018'], id: 'water', parent: 'site_prep' },
	                { name: 'Suppyorder4', y: ['05/01/2013', '05/30/2020'], id: 'power', parent: 'site_prep' },
	                
	              ]
	            }
			]
			*/
			JSONArray mList = new JSONArray();
			JSONObject mObj = null;
			JSONObject sObj = null;
			JSONArray sList = new JSONArray();
			
			for(Barchart barchart :list) {
				//points: [{ name: 'Grading', y: ['06/15/2022', '09/13/2022'], id: 'grading', parent: 'excavation' }]
				sObj = new JSONObject();
				sObj.put("name", barchart.getName()); 
				JSONArray arr = new JSONArray();
				arr.put(barchart.getY1());
				arr.put(barchart.getY2());
				sObj.put("y", arr);
				sObj.put("id", barchart.getId());
				sObj.put("parent", barchart.getParent());
				
				sList = new JSONArray();
				sList.put(sObj);
				mObj = new JSONObject();
				mObj.put("points", sList);
				mList.put(mObj);
			}			
			
			response.setContentType("application/json");
			response.getWriter().write(mList.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}