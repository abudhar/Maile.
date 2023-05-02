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
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
<link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
<style>
.div.dataTables_wrapper div.dataTables_length > select {
	height: 30px;
}
</style>
<div class="col-lg-12 grid-margin stretch-card">
<div class="card">
  <div class="card-body">
    <h4 class="card-title">Email Templates</h4>
    <div class="row">
    	<div class="col-md-11"><p class="card-description">Stored Email Templates </p></div>
    	<div class="col-md-1"><i onclick="addTemplate()" style="font-size:35px; padding: 70px;" class="mdi mdi-bookmark-plus-outline" 
    	 		data-controls-modal="templateModal" data-backdrop="static" data-keyboard="false"
    			data-toggle="modal" data-target="#templateModal"></i></div>
    </div>  
      <div class="table-responsive">
        <table class="table" id="templateTable">
          <thead>
            <tr>
				<th>Template Sr No.</th>
				<th>Template Name</th>
				<th>To</th>
				<th>subject</th>
				<th>Status</th>
				<th style="text-align: center;">edit</th>
            </tr>
          </thead>
          <tbody>
	       <c:forEach items="${templateList}" var="template">
	            <tr>
	                <td><c:out value="${template.id}"/></td>
	                <td><c:out value="${template.name}"/></td>
	                <td><c:out value="${template.toList}"/></td>
	                <td><c:out value="${template.subject}"/></td>
	                <td>
	                <c:choose>
				        <c:when test="${email.status == 'A'}">
				        	<label class="badge badge-success">Active</label>
				        </c:when>
				        <c:when test="${email.status != 'A'}">
				        	<label class="badge badge-danger">InActive</label>
				        </c:when>
			        </c:choose>
	                </td>
	                <td style="text-align: center;">
	                	<i onclick="viewTemplate(<c:out value="${email.id}"/>)" style="font-size:25px" class="mdi mdi-eye"></i>&nbsp;
	                </td>
	            </tr>
	        </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="templateModal" aria-hidden="true" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
        <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Horizontal Form</h4>
                  <p class="card-description">
                    Horizontal form layout
                  </p>
                  <form class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputUsername2" class="col-sm-3 col-form-label">Email</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputUsername2" placeholder="Username">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Email</label>
                      <div class="col-sm-9">
                        <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mobile</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="exampleInputMobile" placeholder="Mobile number">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Password</label>
                      <div class="col-sm-9">
                        <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Re Password</label>
                      <div class="col-sm-9">
                        <input type="password" class="form-control" id="exampleInputConfirmPassword2" placeholder="Password">
                      </div>
                    </div>
                    <div class="form-check form-check-flat form-check-primary">
                      <label class="form-check-label">
                        <input type="checkbox" class="form-check-input">
                        Remember me
                      </label>
                    </div>
                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                    <button class="btn btn-light">Cancel</button>
                  </form>
                </div>
              </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
            

<script>
$(document).ready(function () {
    $('#templateTable').DataTable();
});
</script>

</body>
</html>
