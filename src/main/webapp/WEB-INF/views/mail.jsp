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
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Maile.</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="vendors/select2/select2.min.css">
  <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/vertical-layout-light/style.css">
  <!-- endinject -->
  <!-- plugins:js -->
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="vendors/select2/select2.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/file-upload.js"></script>
  <script src="js/typeahead.js"></script>
  <script src="js/select2.js"></script>
  <script src="vendors/sweetalert/sweetalert.min.js"></script>
  <!-- End custom js for this page-->
  <link rel="shortcut icon" href="images/favicon.png" />
	<style>
	.mandat{
		color: red;
	}
	</style>
</head>
<body>
 <div class="col-12 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Single Email Sender</h4>
        <p class="card-description">
          Send it quickly !
        </p>
        <form class="forms-sample" method="post" enctype="multipart/form-data" onsubmit="return validateFormData()" >
          <div class="form-group">
            <label for="fromMail">From <span class="mandat">*</span></label>
            <input type="text" class="form-control" name="fromMail" id="fromMail" maxlength="50"  value="admin@gmail.com" disabled="disabled">
          </div>
          <div class="form-group">
            <label for="toMail">To <span class="mandat">*</span></label>
            <input type="email" class="form-control" name="toMail" id="toMail" placeholder="To whom the mail to be sent"  maxlength="60" >
          </div>
          <div class="form-group">
            <label for="subject">Subject <span class="mandat">*</span></label>
            <input type="password" class="form-control" name="subject" id="subject" placeholder="subject ..."  maxlength="50" >
          </div>
          <div class="form-group">
            <label for="content">Content <span class="mandat">*</span></label>
            <textarea class="form-control" id="content" rows="4"></textarea>
          </div>
          <div class="form-group">
            <label>Attachment</label>
            <input type="file" name="attachments" class="file-upload-default">
            <div class="input-group col-xs-12">
              <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
              <span class="input-group-append">
                <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
              </span>
            </div>
          </div>
          <div class="text-center">          
	          <input type="button" class="btn btn-primary mr-2" value="Send !" onclick="validateFormData()"/>
	          <input type="button" class="btn btn-light" value="Cancel"/>
	      </div>
        </form>
      </div>
    </div>
  </div>
          

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

  
  function validateFormData(){
	  swal({
		    text: 'Any fool can use a computer',
		    button: {
		      text: "OK",
		      value: true,
		      visible: true,
		      className: "btn btn-primary"
		    }
		  }) 
  }
</script>

</body>
</html>
