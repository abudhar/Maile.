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
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>

  <!-- font awesome cdn link  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

  <!-- custom css file link  -->
  <link rel="stylesheet" href="css/style.css">


</head>
<body>

<header class="header">

  <section class="flex">

    <a href="${pageContext.request.contextPath}/home" class="logo">Maile.</a>

    <form action="search.html" method="post" class="search-form">
      <input type="text" name="search_box"  placeholder="Search Course..." maxlength="100">
      <button type="submit" class="fas fa-search"></button>
    </form>

    <div class="icons">
      <div id="menu-btn" class="fas fa-bars"></div>
      <div id="search-btn" class="fas fa-search"></div>
      <div id="user-btn" class="fas" style="width: 88px;font-family: 'Nunito', sans-serif;font-size: 18px;"><a href="${pageContext.request.contextPath}/login" ><span class="fas fa-user"></span>  Login</a></div>
      <div id="toggle-btn" class="fas fa-sun"></div>
    </div>

  </section>

</header>

<section class="form-container">



  <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data" onsubmit="return validateFormData()">

    <c:if test="${not empty response}">
      <div class="alert" role="alert" style="font-size: 16px;color: red; text-align: center;">
        <strong>Oh snap!</strong> ${response}
      </div>
    </c:if>


    <h3>Register Now</h3>
    <p>Your Name <span>*</span></p>
    <input type="text" name="name" id="name" placeholder="Enter Your Name"  maxlength="50" class="box">
    <p>Your Email <span>*</span></p>
    <input type="email" name="email" id="email" placeholder="Enter Your Email"  maxlength="50" class="box">
    <p>Your Password <span>*</span></p>
    <input type="password" name="password" id="password" placeholder="Enter Your Password"  maxlength="20" class="box">
    <p>Confirm Password <span>*</span></p>
    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password"  maxlength="20" class="box">
    <p>Select Profile <span>*</span></p>
    <input type="file" accept="image/*" id="profileImage" name="profileImage"  class="box">
    <input type="submit" value="register new" name="submit" class="btn">
  </form>

</section>

<footer class="footer">

  &copy; copyright @ 2022 by <span>Mohammed Abudhar Ghifari</span> | all rights reserved!

</footer>

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
  function validateFormData(){
    let name = $('#name').val();
    let email = $('#email').val();
    let password = $('#password').val();
    let confirmPassword = $('#confirmPassword').val();
    let profileImage = $('#profileImage').val();

    let nameRegex = /^[a-zA-Z ]{2,30}$/;
    let emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
    let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    let profileImageRegex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;

    if (name == null || name == "") {
      alert("Name can't be blank");
      return false;
    } else if (!nameRegex.test(name)) {
      alert("Name must be between 2 to 30 characters long and can only contain alphabets and spaces");
      return false;
    } else if (email == null || email == "") {
      alert("Email can't be blank");
      return false;
    } else if (!emailRegex.test(email)) {
      alert("Invalid email address");
      return false;
    } else if (password == null || password == "") {
      alert("Password can't be blank");
      return false;
    } 
//     else if (!passwordRegex.test(password)) {
//       alert("Password must be at least 8 characters long, must contain at least one uppercase letter, one lowercase letter and one number");
//       return false;
//     } 
    else if (confirmPassword == null || confirmPassword == "") {
      alert("Confirm password can't be blank");
      return false;
    } else if (password != confirmPassword) {
      alert("Password and confirm password must be same");
      return false;
    } else if (profileImage == null || profileImage == "") {
      alert("Profile image can't be blank");
      return false;
    } else if (!profileImageRegex.test(profileImage)) {
      alert("Invalid profile image");
      return false;
    } else {
      return true;
    }

  }
</script>

</body>
</html>
