<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c"%> 
 
<html> 

<body> 
 <!-- Font Awesome Icon Library -->

 
<br> 
 
<h3 align="center"><u>View All Sellers</u></h3> 
 
<table align=center  border=2>  
<tr bgcolor="black" style="color:white"> 
<td>ID</td> 
<td>fNAME</td> 
<td>lNAME</td>  
<td>EMAIL ID</td> 
<td>LOCATION</td> 
<td>CONTACT NO</td>  
<td>Password</td>
<td>SellerStatus</td>
</tr> 
 
<c:forEach items="${empdata}"  var="emp"> 
<tr> 
<td><c:out value="${emp.id}" /></td> 
<td><c:out value="${emp.firstname}" /></td> 
<td><c:out value="${emp.lastname}" /></td> 
<td><c:out value="${emp.email}" /></td> 
<td><c:out value="${emp.location}" /></td> 
<td><c:out value="${emp.contact}" /></td> 
<td><c:out value="${emp.password}" /></td> 
<td><c:out value="${emp.sellerstatus}" /></td>
</tr> 
</c:forEach> 
 
</table> 
 
</body> 
</html>