let HTMLHeader = `<div class="navbar navbar-expand navbar-dark navbar-dark-pickled-bluewood navbar-shadow" id="default-navbar" data-primary>

<!-- Navbar toggler -->
<button class="navbar-toggler w-auto mr-16pt d-block d-lg-none rounded-0"
        type="button"
        data-toggle="sidebar">
    <span class="material-icons">short_text</span>
</button>

<!-- Navbar Brand -->
<a href="index.html"
    class="navbar-brand mr-16pt d-lg-none">
    <!-- <img class="navbar-brand-icon" src="../../public/images/logo/white-100@2x.png" width="30" alt="Luma"> -->

    <span class="avatar avatar-sm navbar-brand-icon mr-0 mr-lg-8pt">

        <span class="avatar-title rounded bg-primary"><img src="../../public/images/illustration/student/128/white.svg"
                    alt="logo"
                    class="img-fluid" /></span>

    </span>

    <span class="d-none d-lg-block">Luma</span>
</a>

<ul class="nav navbar-nav d-none d-sm-flex flex justify-content-start ml-8pt">
    <li class="nav-item active">
        <a href="index.html"
            class="nav-link">Home</a>
    </li>
    <li class="nav-item active">
        <a href="courses.html"
            class="nav-link">Browse Courses</a>
    </li>
</ul>

<form class="search-form navbar-search d-none d-lg-flex mr-16pt"
        action="index.html"
        style="max-width: 230px">
    <button class="btn"
            type="submit"><i class="material-icons">search</i></button>
    <input type="text"
            class="form-control"
            placeholder="Search ...">
</form>

<ul class="nav navbar-nav ml-auto mr-0" id="LoginLogout">

</ul>
</div>`;

document.getElementById("HeaderDiv").innerHTML = HTMLHeader;

let SelectOne = "SelectOne";
let apiURL = "../../api/";

//Using Cookie
// // Function to check if the UserID cookie exists
// function checkUserIDCookie() {
//     let userIDCookie = getCookie('UserID');
//     //console.log(userIDCookie);
//     let UlLoginLogout = document.getElementById(`LoginLogout`);

//     if (userIDCookie) {
//         UlLoginLogout.innerHTML = `<li class="nav-item">
//                                         <a href="index.html" id="LogoutBotton" class="btn btn-outline-white">LogOut</a>
//                                     </li>

//                                     <li class="nav-item">
//                                         <a href="" class="nav-link">
//                                             <img src="" id="UserProfilePic"
//                                                 alt="User Image" class="avatar-img rounded-circle" style="width:50px; height: 50px;">
//                                         </a>
//                                         <small class="nav-link" id="UserName"><small>
//                                     </li>`;
//         let userID = parseInt(userIDCookie.split(':')[1]); // Extracts the ID part and converts it to an integer
//         //console.log(userID);
        
//         $.ajax({
//             url: "../../api/TrainersCrudOperation.php",
//             data: {
//                 operation: SelectOne,
//                 UserID: userID
//             },
//             type: "post",
//             dataType: "json",
//             success: function (response) {
//                 //console.log(response);

//                 let user = response[0];

//                 let userfirstname = user.UserFirstName;
//                 //let usermiddlename = user.UserMiddleName;
//                 let userlastname = user.UserLastName;
//                 let username = userfirstname + " " + userlastname;
//                 document.getElementById(`UserName`).innerHTML = username;

//                 let userpic = user.UserProfilePic;
//                 userpic = apiURL + userpic;
//                 //console.log(userpic);
//                 document.getElementById(`UserProfilePic`).setAttribute('src', userpic);
            
//             },
//             error: function (E) {
//                 alert(E.status + E.statusText)
//             }
//         });

//         document.getElementById(`LogoutBotton`).addEventListener('click', function() {
//             // Remove the cookie
//             document.cookie = 'UserID=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';
//             // Redirect the user to the login page
//             //window.location.href = "index.html";

//             // remove the jwt in the localStorage
//             //localStorage.removeItem('jwt');
//         });

//     } else {
//         UlLoginLogout.innerHTML = `<li class="nav-item">
//                                         <a href="LoginPage.html" class="btn btn-outline-white">LogIn</a>
//                                     </li>`;
//     }
// }

// // Function to get the value of a cookie by its name
// function getCookie(cookieName) {
//     let name = cookieName + '=';
//     let decodedCookie = decodeURIComponent(document.cookie);
//     let cookieArray = decodedCookie.split(';');
//     for(let i = 0; i <cookieArray.length; i++) {
//         let cookie = cookieArray[i];
//         while (cookie.charAt(0) == ' ') {
//             cookie = cookie.substring(1);
//         }
//         if (cookie.indexOf(name) == 0) {
//             return cookie.substring(name.length, cookie.length);
//         }
//     }
//     return null;
// }

// checkUserIDCookie()

// Using JWT
let jwt = localStorage.getItem("jwt");

let UlLoginLogout = document.getElementById(`LoginLogout`);

if (jwt != null) {
    UlLoginLogout.innerHTML = `<li class="nav-item">
                                    <a href="index.html" id="LogoutBotton" class="btn btn-outline-white">LogOut</a>
                                </li>

                                <li class="nav-item">
                                    <a href="" class="nav-link">
                                        <img src="" id="UserProfilePic"
                                            alt="User Image" class="avatar-img rounded-circle" style="width:50px; height: 50px;">
                                    </a>
                                    <small class="nav-link" id="UserName"><small>
                                </li>`;
    
    $.ajax({
        url: "../../api/AuthorizationJWT.php",
        headers: {
            Authorization: 'Bearer' + jwt
        },
        type: "post",
        dataType: "json",
        success: function (response) {
            //console.log(response);

            let userID = response.UserID;
            //console.log(userID);

            $.ajax({
                url: "../../api/TrainersCrudOperation.php",
                data: {
                    operation: SelectOne,
                    UserID: userID
                },
                type: "post",
                dataType: "json",
                success: function (response) {
                    //console.log(response);
        
                    let user = response[0];
        
                    let userfirstname = user.UserFirstName;
                    //let usermiddlename = user.UserMiddleName;
                    let userlastname = user.UserLastName;
                    let username = userfirstname + " " + userlastname;
                    document.getElementById(`UserName`).innerHTML = username;
        
                    let userpic = user.UserProfilePic;
                    userpic = apiURL + userpic;
                    //console.log(userpic);
                    document.getElementById(`UserProfilePic`).setAttribute('src', userpic);
                
                },
                error: function (E) {
                    alert(E.status + E.statusText)
                }
            });

        },
        error: function (E) {
            alert(E.status + E.statusText)
        }
    });
    //console.log(userID);

    document.getElementById(`LogoutBotton`).addEventListener('click', function() {
        // remove the jwt in the localStorage
        localStorage.removeItem('jwt');
    });

} else {
    UlLoginLogout.innerHTML = `<li class="nav-item">
                                    <a href="LoginPage.html" class="btn btn-outline-white">LogIn</a>
                                </li>`;
}

// search bar
// // submit when enter is pressed
// // Get the search form
// let searchForm = document.querySelector('.search-form');

// // Add an event listener to the form for submission
// searchForm.addEventListener('submit', function(event) {
//     // Prevent the default form submission behavior
//     event.preventDefault();

//     // Get the search input value
//     let searchInput = searchForm.querySelector('input[type="text"]').value;

//     // Perform the search operation
//     // You can use AJAX or other methods to send the search query to the server and retrieve results
//     // For demonstration purposes, let's just log the search query to the console
//     console.log('Search query:', searchInput);

//     // You can redirect the user to a search results page or display the results dynamically on the current page
//     // For example, you can use window.location.href to navigate to a search results page:
//     // window.location.href = 'search_results.html?query=' + encodeURIComponent(searchInput);
// });

// // submit without enter
// // Get the search form
// let searchForm = document.querySelector('.search-form');

// // Get the search input field
// let searchInput = searchForm.querySelector('input[type="text"]');

// // Add an event listener to the search input for input events
// searchInput.addEventListener('input', function(event) {
//     // Get the search input value
//     let searchValue = event.target.value;

//     // Perform the search operation
//     // You can use AJAX or other methods to send the search query to the server and retrieve results
//     // For demonstration purposes, let's just log the search query to the console
//     console.log('Search query:', searchValue);

//     // You can redirect the user to a search results page or display the results dynamically on the current page
//     // For example, you can use window.location.href to navigate to a search results page:
//     // window.location.href = 'search_results.html?query=' + encodeURIComponent(searchQuery);
// });

// in jquery
// Add an event listener to the search input for input events
$('input[type="text"]').on('input', function(event) {
    // Get the search input value
    let searchValue = $(this).val();

    // Perform the search operation
    // You can use AJAX or other methods to send the search query to the server and retrieve results
    // For demonstration purposes, let's just log the search query to the console
    $.ajax({
        url: "../../api/SearchBar.php",
        data: {
            SearchValue: searchValue
        },
        type: "post",
        dataType: "json",
        success: function (response) {
            console.log(response);

            let portal = response[0];

            if (response == null || response.length == 0){
                //console.log(null);
                //console.log("if");
            }
            else{
                console.log(portal);
                //console.log("else");
            }
        
        },
        error: function (E) {
            alert(E.status + E.statusText)
        }
    });
    //console.log('Search query:', searchValue);

    // You can redirect the user to a search results page or display the results dynamically on the current page
    // For example, you can use window.location.href to navigate to a search results page:
    // window.location.href = 'search_results.html?query=' + encodeURIComponent(searchQuery);
});

// Prevent the default form submission behavior
$('.search-form').on('submit', function(event) {
    event.preventDefault();
});
