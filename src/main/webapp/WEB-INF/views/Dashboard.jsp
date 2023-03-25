<%--
  Created by IntelliJ IDEA.
  User: mohammed.abudhar
  Date: 10/02/2023
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>


<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.css" />
    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>

<body>
<c:if test="${not empty userType}">
    <c:choose>
        <c:when test="${userType == 'ADMIN'}">
            <c:set var="userType" value="ADMIN"/>
            <%--            For ADMIN--%>
            <header class="header">

                <section class="flex">

                    <a href="${pageContext.request.contextPath}/home" class="logo">Maile.</a>

                    <form action="search.html" method="post" class="search-form">
                        <input type="text" name="search_box" required placeholder="Search Courses..." maxlength="100">
                        <button type="submit" class="fas fa-search"></button>
                    </form>

                    <div class="icons">
                        <div id="menu-btn" class="fas fa-bars"></div>
                        <div id="search-btn" class="fas fa-search"></div>
                        <div id="user-btn" class="fas fa-user"></div>
                        <div id="toggle-btn" class="fas fa-sun"></div>
                    </div>

                    <div class="profile">
                        <img src="data:image/jpeg;base64,${data.profileImageUploadPath}" class="image" alt="">
                        <h3 class="name">${data.name}</h3>
                        <p class="role">${data.userType}</p>
                        <a href="javascript:void(0)" onclick="viewProfile()" class="btn">View Profile</a>
                        <div class="flex-btn">
                            <a href="/" class="option-btn">Logout</a>
                        </div>
                    </div>

                </section>

            </header>

            <div class="side-bar">

                <div id="close-btn">
                    <i class="fas fa-times"></i>
                </div>

                <div class="profile">
                    <img src="data:image/jpeg;base64,${data.profileImageUploadPath}" class="image" alt="profileImage">
                    <h3 class="name">${data.name}</h3>
                    <p class="role">${data.userType}</p>
                    <a onclick="viewProfile()" class="btn">View Profile</a>
                </div>

                <nav class="navbar">
                    <a href="javascript:void(0)" onclick="dashboard(${data.registerId})"><i class="fas fa-home"></i><span>Dashboard</span></a>
                    <a onclick="showScreen('admin')"><i class="fas fa-user-cog"></i><span>Admin</span></a>
                    <a onclick="showScreen('mail')"><i class="fas fa-envelope"></i><span>Send Mail</span></a>
                    <a onclick="showScreen('multiMail')"><i class="	fa fa-envelope-open"></i><span>Send Mail (Multiple)</span></a>
                    <a onclick="showScreen('mailLogger')"><i class="fa fa-history"></i><span>Mail Logger</span></a>
                    <a href="contact.html"><i class="fas fa-headset"></i><span>Contact us</span></a>
                    <a href="about.html"><i class="fas fa-question"></i><span>About</span></a>
                </nav>

            </div>

            <div id="dashboard">
                <section class="home-grid">

                    <h1 class="heading">quick options</h1>

                    <div class="box-container">

                        <div class="box">
                            <h3 class="title">likes and comments</h3>
                            <p class="likes">total likes : <span>25</span></p>
                            <a href="#" class="inline-btn">view likes</a>
                            <p class="likes">total comments : <span>12</span></p>
                            <a href="#" class="inline-btn">view comments</a>
                            <p class="likes">saved playlists : <span>4</span></p>
                            <a href="#" class="inline-btn">view playlists</a>
                        </div>

                        <div class="box">
                            <h3 class="title">top categories</h3>
                            <div class="flex">
                                <a href="#"><i class="fas fa-code"></i><span>development</span></a>
                                <a href="#"><i class="fas fa-chart-simple"></i><span>business</span></a>
                                <a href="#"><i class="fas fa-pen"></i><span>design</span></a>
                                <a href="#"><i class="fas fa-chart-line"></i><span>marketing</span></a>
                                <a href="#"><i class="fas fa-music"></i><span>music</span></a>
                                <a href="#"><i class="fas fa-camera"></i><span>photography</span></a>
                                <a href="#"><i class="fas fa-cog"></i><span>software</span></a>
                                <a href="#"><i class="fas fa-vial"></i><span>science</span></a>
                            </div>
                        </div>

                        <div class="box">
                            <h3 class="title">popular topics</h3>
                            <div class="flex">
                                <a href="#"><i class="fab fa-html5"></i><span>HTML</span></a>
                                <a href="#"><i class="fab fa-css3"></i><span>CSS</span></a>
                                <a href="#"><i class="fab fa-js"></i><span>javascript</span></a>
                                <a href="#"><i class="fab fa-react"></i><span>react</span></a>
                                <a href="#"><i class="fab fa-php"></i><span>PHP</span></a>
                                <a href="#"><i class="fab fa-bootstrap"></i><span>bootstrap</span></a>
                            </div>
                        </div>

                        <div class="box">
                            <h3 class="title">become a tutor</h3>
                            <p class="tutor">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Perspiciatis, nam?</p>
                            <a href="teachers.html" class="inline-btn">get started</a>
                        </div>

                    </div>

                </section>

                <section class="courses">

                    <h1 class="heading">our courses</h1>

                    <div class="box-container">

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-2.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-1.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete HTML tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-3.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-2.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete CSS tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-4.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-3.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete JS tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-5.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-4.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete Boostrap tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-6.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-5.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete JQuery tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                        <div class="box">
                            <div class="tutor">
                                <img src="images/pic-7.jpg" alt="">
                                <div class="info">
                                    <h3>john deo</h3>
                                    <span>21-10-2022</span>
                                </div>
                            </div>
                            <div class="thumb">
                                <img src="images/thumb-6.png" alt="">
                                <span>10 videos</span>
                            </div>
                            <h3 class="title">complete SASS tutorial</h3>
                            <a href="playlist.html" class="inline-btn">view playlist</a>
                        </div>

                    </div>

                    <div class="more-btn">
                        <a href="courses.html" class="inline-option-btn">view all courses</a>
                    </div>

                </section>
            </div>

            <div id="userProfile">
                <section class="user-profile">

                    <h1 class="heading">your profile</h1>

                    <div class="info">

                        <div class="user">
                            <img src="data:image/jpeg;base64,${data.profileImageUploadPath}" alt="">
                            <h3>${data.name}</h3>
                            <p>${data.userType}</p>
                            <a href="javascript:void(0)" onclick="updateProfile()" class="inline-btn">update profile</a>
                        </div>

                        <div class="box-container">

                            <div class="box">
                                <div class="flex">
                                    <i class="fas fa-bookmark"></i>
                                    <div>
                                        <span>4</span>
                                        <p>saved playlist</p>
                                    </div>
                                </div>
                                <a href="#" class="inline-btn">view playlists</a>
                            </div>

                            <div class="box">
                                <div class="flex">
                                    <i class="fas fa-heart"></i>
                                    <div>
                                        <span>33</span>
                                        <p>videos liked</p>
                                    </div>
                                </div>
                                <a href="#" class="inline-btn">view liked</a>
                            </div>

                            <div class="box">
                                <div class="flex">
                                    <i class="fas fa-comment"></i>
                                    <div>
                                        <span>12</span>
                                        <p>videos comments</p>
                                    </div>
                                </div>
                                <a href="#" class="inline-btn">view comments</a>
                            </div>

                        </div>
                    </div>

                </section>
            </div>

            <div id="updateProfile">
                <section class="form-container">

                    <form action="${pageContext.request.contextPath}/updateProfile" method="post" enctype="multipart/form-data">
                        <h3>Update Profile</h3>
                        <p>Update Name</p>
                        <input type="text" name="name" value="${data.name}" maxlength="50" class="box">
                        <p>Update Email</p>
                        <input type="email" name="email" value="${data.email}" maxlength="50" class="box">
                        <p>Current Password</p>
                        <input type="password" name="old_pass" placeholder="Enter Old Password" maxlength="20" class="box">
                        <p>New Password</p>
                        <input type="password" name="new_pass" placeholder="Enter New Password" maxlength="20" class="box">
                        <p>Confirm Password</p>
                        <input type="password" name="c_pass" placeholder="Confirm New Password" maxlength="20" class="box">
                        <p>Update Profile Image</p>
                        <input type="file" accept="image/*" class="box">
                        <input type="hidden" value="${data.registerId}" name="registerId">
                        <input type="submit" value="update profile" name="submit" class="btn">
                    </form>

                </section>
            </div>



            <footer class="footer">

                &copy; copyright @ 2022 by <span>Mohammed Abudhar Ghifari</span> | all rights reserved!

            </footer>

        </c:when>

    </c:choose>
</c:if>

<form action="${pageContext.request.contextPath}/dashboard" method="post" id="dashboardForm">
    <input type="hidden" name="registerId" id="registerId">
</form>
<!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function () {
        $('#userProfile').hide();
        $('#updateProfile').hide();
    });
    function dashboard(registerId){
        $('#registerId').val(registerId);
        $('#dashboardForm').submit();
    }

    function admin(){
        $('#dashboard').hide();
    }

    function viewProfile(){
        $('#dashboard').hide();
        $('#userProfile').show();
    }

    function updateProfile(){
        $('#dashboard').hide();
        $('#userProfile').hide();
        $('#updateProfile').show();
    }
    function showScreen(name){
    	 $.ajax({
    		 method: "GET",
    		 url: ${pageContext.request.contextPath}"/"+name, 
             success: function(result) {
            	$("#dashboard").html("");
         		$("#dashboard").html(result);
     		}
    	 });
    }
</script>
</body>

</html>