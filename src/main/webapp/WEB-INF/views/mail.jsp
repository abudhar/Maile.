	<style>
	.mandat{
		color: red;
	}
	.disabled {
        pointer-events: none;
    }
	</style>

 <div class="col-12 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Single Email Sender</h4>
        <p class="card-description">
          Send it quickly !
        </p>
        <form class="forms-sample" method="post" enctype="multipart/form-data" id="sendMail">
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
            <input type="text" class="form-control" name="subject" id="subject" placeholder="subject ..."  maxlength="50" >
          </div>
          <div class="form-group">
            <label for="message">Content <span class="mandat">*</span></label>
            <textarea class="form-control" id="message" rows="4"></textarea>
          </div>
          <div class="form-group">
            <label>Attachment</label>
            <input type="file" id="attachment" name="attachments" class="file-upload-default" multiple="multiple">
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
  <script src="js/file-upload.js"></script>
  <script src="js/typeahead.js"></script>
  <script src="js/select2.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>          
<script> 
  function validateFormData(){
	  debugger;	  
	  var data = new FormData();
	  data.append('emailFrom', $('#fromMail').val());
	  data.append('emailTo', $('#toMail').val());
	  data.append('subject', $('#subject').val());
	  data.append('message', $('#message').val());
	  var files = document.querySelector('input[type=file]').files;
	  for (var i = 0; i < files.length; i++) {
		  data.append("attachFile", files[i]);
	  }
 		$.ajax({
 		    url: ${pageContext.request.contextPath}"/sendMail",
 		    type: 'POST',
 		    data: data,
 		    processData: false,
 		    contentType: false,
 		    success: function(data) {
 		        console.log('File uploaded successfully');
 		    },
 		    error: function(xhr, status, error) {
 		        console.log('Error uploading file');
 		    }
 		});
	 	
	 	
	 	
	 	
  }
</script>