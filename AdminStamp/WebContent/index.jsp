<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Welcome To &Stamp </title>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	var Session_No = '<%=(String)session.getAttribute("Store_No") %>';
	var Session_Id = '<%=(String)session.getAttribute("ID") %>';
	alert(Session_Id);
	if(Session_No == 'null'){
		document.location.href = "login.jsp";
	}
	else{
		alert('1');
		$('#dataTable').jqGrid({
			caption : '�����',
			url: 'jsp/memberdata.jsp',   
			mtype: 'POST',
	        dataType: 'jsonp',
	        colModel:[
	                   { index: 'Name', label: '�̸�', Name: 'Name', width: 150, align: 'center' },
	                   { index: 'Birth', label: '����', Name: 'Birth', width: 150, align: 'center' },
	                   { index: 'Gender', label: '����', Name: 'Gender', width: 150, align: 'center' },
	                   { index: 'Phone', label: '�޴�����ȣ', Name: 'Phone', width: 150, align: 'center' },
	                   { index: 'Tel', label: '��ȭ��ȣ', Name: 'Tel', width: 150, align: 'center' }
	                 ]
            , gridview: true
            , rownumbers: true
            , rowNum: 25
            , rowList: [25, 50, 100]
            , height: 347
            , width: $(this).width() * .84
            , loadonce: true
	    });
	}
	
	<!----sdfsdf12312312312312312312sdsdfsdfsdf-->

});
</script>
</head>
<body>
	<!-- div id = "header"><a href="#" class="logo">Logo</a></div>
	<div id="ip" class="ip"><p>����ּ� :kpig7.synology.me:3306</p></div>
	<div id = "container">
		<div class="loginArea">
			<p><span> ID : </span><input type="text" id="id" value="" placeholder = "Admin" ></p>
			<p><span> PassWord : </span><input type="password" id="password" placeholder = "Admin1!" ></p>
			<p><button id = "test">link</button></p>
		</div>
	</div> -->
	<table id="dataTable"></table>
</body>
</html>

