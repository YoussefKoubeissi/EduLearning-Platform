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
            class="nav-link">Potral</a>
    </li>
    <li class="nav-item active">
        <a href="Trainers.html"
            class="nav-link">Trainers</a>
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

</div>`;

document.getElementById("HeaderDiv").innerHTML = HTMLHeader;

let SelectOne = "SelectOne";
let apiURL = "../../api/";

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
    
    //
    window.location.href = "LoginPage.html";
}