 <div class="col-12 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">AI Based Multi Email Sender</h4>
        <p class="card-description">
          Send it quickly !
        </p>
        <form class="forms-sample" method="post" enctype="multipart/form-data" onsubmit="return validateFormData()" >
          <div class="form-group">
            <label for="fromMail">From <span class="mandat">*</span></label>
            <input type="text" class="form-control" name="fromMail" id="fromMail" maxlength="50"  value="admin@gmail.com" disabled="disabled">
          </div>
          <div class="form-group" id="fromEmailDiv">
            <label>To<span class="mandat">*</span></label>
            <input type="file" name="toAttachment" id="toAttachment" class="file-upload-default" onchange="readExcel()">
            <div class="input-group col-xs-11">
              <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Excel to Extract Email-Ids">
              <span class="input-group-append">
                <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
              </span>
            </div>
          </div>
          <label for="toMail" id="toMailLabel">To <span class="mandat">*</span></label>
          <div class="form-group" id="email-input">
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
          <input type="button" class="btn btn-primary mr-2" value="Send !" onclick="validateFormData()"/>
          <input type="button" class="btn btn-light" value="Cancel"/>
        </form>
      </div>
    </div>
  </div>
  <script src="js/file-upload.js"></script>
  <script src="js/typeahead.js"></script>
  <script src="js/select2.js"></script>
  <script src="vendors/email/emails-input.js"></script>
  <script src="vendors/email/utils.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script> 
<script>
	debugger;
	const emailsInput = window.lib.EmailsInput(document.querySelector('#email-input'),{
	    placeholder: 'To whom ?...',
	    triggerKeyCodes: [44,13,32],
	    pasteSplitPattern: ','
	})
	$("#toMailLabel").hide();
	$("#email-input").hide();
	function readExcel() {
	   var data = new FormData();
	   var files = document.querySelector('input[type=file]').files;
	   for (var i = 0; i < files.length; i++) {
		  data.append("file", files[i]);
	   }
 		$.ajax({
 		    url: ${pageContext.request.contextPath}"/get-emails",
 		    type: 'POST',
 		    data: data,
 		    processData: false,
 		    contentType: false,
 		    success: function(data) {
 		    	_alert('Fetched Emails Succesfully');
 		    	$("#fromEmailDiv").hide();
 				const emailArray = data;
 				emailArray.forEach(addMail);
	 		   	$("#toMailLabel").show();
	 			$("#email-input").show();
 		    },
 		    error: function(xhr, status, error) {
 		    	_error('Error uploading file');
 		    }
 		});
	 }
	
	function addMail(item){
		emailsInput.add(item);
	}
</script>
