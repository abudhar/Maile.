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
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/tinymce.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.6/jquery.tinymce.min.js"></script>

<style>
.div.dataTables_wrapper div.dataTables_length > select {
	height: 30px;
}
</style>

<div class="col-lg-12 grid-margin stretch-card">
<div class="card"> 
  <div class="card-body">
    <h4 class="card-title">Email Log</h4>
    <p class="card-description"> Sent Mail List </p>
    <div class="col-md-12 grid-margin transparent">
              <div class="row">
                <div class="col-md-6 mb-4 stretch-card transparent">
                  <div class="card card-tale">
                    <div class="card-body">
                      <p class="mb-4">Today’s Mail</p>
                      <p class="fs-30 mb-2">4006</p>
                      <p>10.00% (30 days)</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 mb-4 stretch-card transparent">
                  <div class="card card-dark-blue">
                    <div class="card-body">
                      <p class="mb-4">Total Mail</p>
                      <p class="fs-30 mb-2">61344</p>
                      <p>22.00% (30 days)</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-4 mb-lg-0 stretch-card transparent">
                  <div class="card card-light-blue">
                    <div class="card-body">
                      <p class="mb-4">Number of Recipients</p>
                      <p class="fs-30 mb-2">34040</p>
                      <p>2.00% (All Time)</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 stretch-card transparent">
                  <div class="card card-light-danger">
                    <div class="card-body">
                      <p class="mb-4">Mail Responded</p>
                      <p class="fs-30 mb-2">47033</p>
                      <p>0.22% (All Time)</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
      <div class="table-responsive">
        <table class="table" id="mailTable">
          <thead>
            <tr>
				<th>Email Sr No.</th>
				<th>From</th>
				<th>To</th>
				<th>subject</th>
				<th>Status</th>
				<th style="text-align: center;">view</th>
            </tr>
          </thead>
          <tbody>
	       <c:forEach items="${emailList}" var="email">
	            <tr>
	                <td><c:out value="${email.srNo}"/></td>
	                <td><c:out value="${email.emailFrom}"/></td>
	                <td><c:out value="${email.emailTo}"/></td>
	                <td><c:out value="${email.subject}"/></td>
	                <td>
	                <c:choose>
				        <c:when test="${email.status == 'SENT'}">
				        	<label class="badge badge-success">Sent</label>
				        </c:when>
				        <c:when test="${email.status != 'SENT'}">
				        	<label class="badge badge-danger">Error Occured</label>
				        	<i class="mdi mdi-alert" ></i>
				        </c:when>
			        </c:choose>
	                </td>
	                <td style="text-align: center;">
	                	<i onclick="viewMail(<c:out value="${email.srNo}"/>)" style="font-size:25px" class="mdi mdi-eye"></i>&nbsp;
	                </td>
	            </tr>
	        </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<div class="col-12 grid-margin stretch-card">
  <div class="card">
    <div class="card-body">
      <h4 class="card-title">View Html</h4>
      <textarea id="editor" name="htmlContent"><c:out value="${emailList[0].message}" escapeXml="false" /></textarea>
    </div>
  </div>
</div>
            

<script>
$(document).ready(function () {
    $('#mailTable').DataTable();
    tinymce.init({
        selector: '#myTextarea'
    });
});
</script>

</body>
</html>
