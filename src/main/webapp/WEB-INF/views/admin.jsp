<%--
  Created by IntelliJ IDEA.
  User: mohammed.abudhar
  Date: 10/02/2023
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
<div class="col-lg-12 grid-margin stretch-card">
<div class="card">
  <div class="card-body">
    <h4 class="card-title">User's Master</h4>
    <p class="card-description"> Users List </p>
      <div class="table-responsive">
        <table class="table">
          <thead>
            <tr>
				<th>Sl No.</th>
				<th>Name</th>
				<th>Email</th>
				<th>Password</th>
				<th>Status</th>
				<th style="text-align: center;">Action</th>
            </tr>
          </thead>
          <tbody>
	       <c:forEach items="${adminList}" var="admin">
	            <tr>
	                <td><c:out value="${admin.registerId}"/></td>
	                <td><c:out value="${admin.name}"/></td>
	                <td><c:out value="${admin.email}"/></td>
	                <td><c:out value="${admin.password}"/></td>
	                <td>
	                <c:choose>
				        <c:when test="${admin.status == 'A'}">
				        	<label class="badge badge-success">Active</label>
				        </c:when>
				        <c:when test="${admin.status != 'A'}">
				        	<label class="badge badge-danger">Blocked</label>
				        </c:when>
			        </c:choose>
	                </td>
	                <td style="text-align: center;">
	                	<i onclick="editUser(<c:out value="${admin.registerId}"/>)" style="font-size:40px" class="mdi mdi-account-off"></i>&nbsp;
	                	<i onclick="deleteUser(<c:out value="${admin.registerId}"/>)"  style="font-size:40px" class="mdi mdi-account-multiple-minus"></i>
	                </td>
	            </tr>
	        </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
            

<script>
$(document).ready(function () {
//     $('#AdminTable').DataTable();
});
</script>

</body>
</html>
