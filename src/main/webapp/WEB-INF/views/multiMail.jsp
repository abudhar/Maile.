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
          <div class="form-group">
            <label>To<span class="mandat">*</span></label>
            <input type="file" name="toAttachment" id="toAttachment" class="file-upload-default" onchange="readExcel()">
            <div class="input-group col-xs-11">
              <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image">
              <span class="input-group-append">
                <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
              </span>
            </div>
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
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script> 
<script>

	function readExcel(){
		debugger;
		var formdata = new FormData();
		var fileInput = document.querySelector('input[type=file]').files;
		formdata.append("file", fileInput[0], fileInput[0].name);
	}
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
