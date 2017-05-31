<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Ajax</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		window.onload=function(){
			var aNodes=document.getElementsByTagName("a")[0];
			aNodes.onclick=function(){
				var request=new XMLHttpRequest();
				var url=this.href;
				var method="GET";
				request.open(method,url);
				request.send(null);
				request.onreadystatechange=function(){
					if(request.readyState==4)
						if(request.status==200||request.status==304){
							var result=request.responseText;
							//重点eval("("+ json对象 +")");
							var json=eval("("+result+")");
							var name=json.person.name;
							var website=json.person.website;
							var email=json.person.email;
							
							var divNode=document.getElementById("details");
							
							var aNode=document.createElement("a");
							aNode.appendChild(document.createTextNode(name));
							aNode.href=website;
							
							var h2Node=document.createElement("h2");
							h2Node.appendChild(aNode);
							
							var aNode2=document.createElement("a");	  				
							aNode2.appendChild(document.createTextNode(email));
							
							divNode.innerHTML="";
							divNode.appendChild(h2Node);
							divNode.appendChild(aNode2);
						}
				}
				return false;
			}
		}
	</script>
  </head>

  <body>
    <h1>People</h1>
    <ul>
    	<li><a href="ajax/ajaxJson/json.js">Andy</a></li>
    </ul>
    <div id="details"></div>
  </body>
</html>