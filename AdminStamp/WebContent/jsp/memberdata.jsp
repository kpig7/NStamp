<%@page import="java.io.ObjectOutput"%>
<%@page import="sun.net.www.ParseUtil"%>
<%@page import="java.lang.Object"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="org.json.simple.*" %>

<%@ page language="java" contentType="javascript/jsonp; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Integer Store_No =  1;//Integer.parseInt((String)session.getAttribute("Store_No"));
	String sDataArray ="";
	
	String driverName = "org.mariadb.jdbc.Driver";
	String DB_url = "jdbc:mariadb://27.102.197.30:3306/Stamp";
	String DB_id = "admin";
	String DB_password="admin!";
	/* JSONArray cell = new JSONArray();
	JSONObject jsonObject = new JSONObject();
	jSONString js = null; */
	
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(DB_url,DB_id,DB_password);
		Statement stat = con.createStatement();
		
		ResultSet rs = stat.executeQuery("SELECT Name, Birth, Gender, Phone, Tel FROM Member WHERE Store_No = " + Store_No + ";");
		rs.last();
		
		int iRow_Count = rs.getRow();
		
		rs.beforeFirst();
		JSONObject responcedata = new JSONObject();
        JSONArray cellarray = new JSONArray();
		
        Object o1 = new Integer(iRow_Count);
        /* Object o2 = new String("total"); */
        
        responcedata.put("total", o1);
       	responcedata.put("page", 1);
        responcedata.put("records", 25);

        JSONArray cell = new JSONArray();
        JSONObject cellobj = new JSONObject();
        
        
		while(rs.next()){
			responcedata.put("Name", rs.getObject("Name"));
			responcedata.put("BirthDay", rs.getObject("Birth"));
			responcedata.put("Gender", rs.getObject("Gender"));
			responcedata.put("Phone", rs.getObject("Phone"));
			responcedata.put("Tel", rs.getObject("Tel"));
			cell.add(responcedata);
		}
		
		responcedata.put("rows", cellarray);
		
		
			/* jsonObject.put("rows",cell);
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonObject);
			out.println("### jsonObject : " + jsonObject); */
			
		
		con.close();
	}catch(Exception e){
		out.print("DB접속 실패");
		e.printStackTrace();
	}

%>
<%-- <%

	Integer Store_No =  1;//Integer.parseInt((String)session.getAttribute("Store_No"));
	String sDataArray ="";
	
	String driverName = "org.mariadb.jdbc.Driver";
	String DB_url = "jdbc:mariadb://27.102.197.30:3306/Stamp";
	String DB_id = "admin";
	String DB_password="admin!";
	try{
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(DB_url,DB_id,DB_password);
		Statement stat = con.createStatement();
		
		ResultSet rs = stat.executeQuery("SELECT Name, Birth, Gender, Phone, Tel FROM Member WHERE Store_No = " + Store_No + ";");
		rs.last();
		
		int iRow_Count = rs.getRow();
		sDataArray +="{ total : '" + iRow_Count + "'},{ page : '1'},{ records : '25'},";
		
		rs.beforeFirst();
		
		while(rs.next()){
			sDataArray += "{";
			sDataArray += "Name : '" + rs.getString("Name") + "', ";
			sDataArray += "Birth : '" +rs.getString("Birth")+ "', ";
			sDataArray += "Gender : '" +rs.getString("Gender")+ "', ";
			sDataArray += "Phone : '" +rs.getString("Phone")+ "', ";
			sDataArray += "Tel : '" +rs.getString("Tel")+"'";
			sDataArray += "},";
		}
		sDataArray = sDataArray.substring(0,sDataArray.length()-2);
		sDataArray += "}";
		
		con.close();
	}catch(Exception e){
		out.print("DB접속 실패");
		e.printStackTrace();
	}
	out.println("(" + sDataArray+")");
	
%> --%>