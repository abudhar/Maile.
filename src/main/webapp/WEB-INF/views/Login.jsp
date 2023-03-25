<%--
  Created by IntelliJ IDEA.
  User: mohammed.abudhar
  Date: 10/02/2023
  Time: 3:24 PM
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
    <title>login</title>

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
            <input type="text" name="search_box" required placeholder="search courses..." maxlength="100">
            <button type="submit" class="fas fa-search"></button>
        </form>

        <div class="icons">
            <div id="search-btn" class="fas fa-search"></div>
            <div id="user-btn" class="fas" style="width: 88px;font-family: 'Nunito', sans-serif;font-size: 18px;"><a href="${pageContext.request.contextPath}/login" ><span class="fas fa-user"></span>  Login</a></div>
            <div id="toggle-btn" class="fas fa-sun"></div>
        </div>

    </section>

</header>


<section class="form-container">

    <form action="${pageContext.request.contextPath}/login" method="post" enctype="multipart/form-data">
        <c:if test="${not empty response}">
            <div class="success" style="font-size: 16px;color: green; text-align: center;">${response}</div>
        </c:if>

        <h3>Login Here</h3>
        <p>Email <span>*</span></p>
        <input type="email" name="email" id="email" placeholder="Enter Your Email" required maxlength="50" class="box">
        <p>Password <span>*</span></p>
        <input type="password" name="password" id="password" placeholder="Enter Your Password" required maxlength="20" class="box">
        <input type="submit" value="login new" name="submit" class="btn">

        <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a></p>
    </form>

</section>

<footer class="footer">

    &copy; copyright @ 2022 by <span>Mohammed Abudhar Ghifari</span> | all rights reserved!

</footer>

<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
    function validateLoginForm() {
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;

        let emailRegex = /^([a-zA-Z0-9\.-]+)@([a-zA-Z0-9-]+).([a-z]{2,20})(.[a-z]{2,8})?$/;
        let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

        if (email == "") {
            alert("Email is required");
            return false;
        } else if (!emailRegex.test(email)) {
            alert("Invalid Email");
            return false;
        } else if (password == "") {
            alert("Password is required");
            return false;
        } else if (!passwordRegex.test(password)) {
            alert("Invalid Password");
            return false;
        } else {
            return true;
        }

    }
</script>
</body>
</html>
