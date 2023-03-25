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
<section class="form-container">



  <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" onsubmit="return validateFormData()" style="width: -webkit-fill-available;">

    <c:if test="${not empty response}">
      <div class="alert" role="alert" style="font-size: 16px;color: red; text-align: center;">
        <strong>Oh snap!</strong> ${response}
      </div>
    </c:if>


    <h3>Send a Mail</h3>
    <p>From <span>*</span></p>
    <input type="text" name="from" id="from" maxlength="50" class="box" value="admin@gmail.com" disabled="disabled">
    <p>To <span>*</span></p>
    <input type="email" name="emailTo" id="emailTo" placeholder="To whom the mail to be sent"  maxlength="60" class="box">
    <p>Subject <span>*</span></p>
    <input type="text" name="subject" id="subject" placeholder="subject ..."  maxlength="50" class="box">
    <p>Heading</p>
    <input type="text" name="heading" id="heading" placeholder="Mail Header"  maxlength="100" class="box">
    <p>Content <span>*</span></p>
    <textarea name="content" id="content" placeholder="write some content here ...."  maxlength="5000" class="box"></textarea>
    <p>Attachment</p>
    <input type="file" id="attachment" name="attachment"  class="box">
    <input type="button" value="Send !" name="submit" class="btn">
  </form>

</section>


<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  function validateFormData(){
    
  }
</script>

</body>
</html>
