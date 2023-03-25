let toggleBtn = document.getElementById('toggle-btn');
let body = document.body;
let darkMode = localStorage.getItem('dark-mode');

const enableDarkMode = () =>{
   toggleBtn.classList.replace('fa-sun', 'fa-moon');
   body.classList.add('dark');
   localStorage.setItem('dark-mode', 'enabled');
}

const disableDarkMode = () =>{
   toggleBtn.classList.replace('fa-moon', 'fa-sun');
   body.classList.remove('dark');
   localStorage.setItem('dark-mode', 'disabled');
}

if(darkMode === 'enabled'){
   enableDarkMode();
}

toggleBtn.onclick = (e) =>{
   darkMode = localStorage.getItem('dark-mode');
   if(darkMode === 'disabled'){
      enableDarkMode();
   }else{
      disableDarkMode();
   }
}

let profile = document.querySelector('.header .flex .profile');

document.querySelector('#user-btn').onclick = () =>{
   profile.classList.toggle('active');
   search.classList.remove('active');
}

let search = document.querySelector('.header .flex .search-form');

document.querySelector('#search-btn').onclick = () =>{
   search.classList.toggle('active');
   profile.classList.remove('active');
}

let sideBar = document.querySelector('.side-bar');

document.querySelector('#menu-btn').onclick = () =>{
   sideBar.classList.toggle('active');
   body.classList.toggle('active');
}

document.querySelector('#close-btn').onclick = () =>{
   sideBar.classList.remove('active');
   body.classList.remove('active');
}

window.onscroll = () =>{
   profile.classList.remove('active');
   search.classList.remove('active');

   if(window.innerWidth < 1200){
      sideBar.classList.remove('active');
      body.classList.remove('active');
   }

   function validateFormData(){
      let name = $('#name').val();
      let email = $('#email').val();
      let password = $('#password').val();
      let confirmPassword = $('#confirmPassword').val();
      let profileImage = $('#profileImage').val();

      let nameRegex = /^[a-zA-Z ]{2,30}$/;
      let emailRegex = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
      let passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
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
//      else if (!passwordRegex.test(password)) {
//         alert("Password must be at least 8 characters long, must contain at least one uppercase letter, one lowercase letter and one number");
//         return false;
//      } 
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
}