console.log("firebase.js init");
var wrong_count = 0;

function initApp() {
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyAL5AXSh9gHkrmHFcqO1BEiZh6QSsXTfYg",
    authDomain: "gsm-test-1310f.firebaseapp.com",
    databaseURL: "https://gsm-test-1310f.firebaseio.com",
    projectId: "gsm-test-1310f",
    storageBucket: "gsm-test-1310f.appspot.com",
    messagingSenderId: "498990781428"
  };
  firebase.initializeApp(config);

  listenFirebase();
}

function redirect_homepage() {
  window.location = "/";
}

function isUserExpired(access_date_start, access_date_end) {
  var todayMillisecond = new Date().getTime();


  return !(todayMillisecond > access_date_start && todayMillisecond < access_date_end);
}

function listenFirebase() {
  firebase.auth().onAuthStateChanged(function (user) {
    if (user) {
      if (window.location.pathname == '/') {
        $('#gotomap_button').css('display', 'block');
        $('#login_form').css('display', 'none');
      } else if (window.location.pathname == '/dashboard.html') {
        var userEmail = '';
        var userName = '';
        var userCountry = '';
        var userOperatorMcc = '';
        var userOperatorMnc = '';
        var userOperatorName = '';
        var userAccessDateStart = '';
        var userAccessDateEnd = '';

        var firebaseUser = firebase.auth().currentUser;
        var user_uid = user.uid
        var userPath = firebase.database().ref('users/' + user_uid);

        userPath.once('value').then(function (snapshot) {
          if (snapshot) {
            var user = snapshot.val();

            userEmail = user.private.email;
            userCountry = user.private.info.country;
            userName = user.private.info.name;
            userAccessDateStart = user.private.info.access_date_start;
            userAccessDateEnd = user.private.info.access_date_end;
            userOperatorMcc = user.private.info.operator_mcc;
            userOperatorMnc = user.private.info.operator_mnc;
            userOperatorName = user.private.info.operator_name;
            userRole = user.role;

            if (userRole == 'admin' || userRole == 'manager') {
              $('#Admin_Panel').css('display', 'block');
              if (userRole == 'manager') {
                $('#admin_panel_title').text("Manager Panel");
              }
            }

            user_CountryIso = userCountry
            user_country = getCountryName(userCountry);
            user_mcc = userOperatorMcc;
            user_mnc = userOperatorMnc;
            user_operator_name = userOperatorName;

            list_of_oprator = getAllOperatorsDetail(user_mcc)
            list_of_oprator_name = getAllOperatorsName(user_mcc)

            $('#main_header_email').text(userName + ' - ' + user_operator_name);
            $('#user_inside_name').text(userName);
            $('#email_user_inside').text(userEmail);
            $('#usr_country_operator_show').text(user_operator_name + ' - ' + user_country);

            var is_user_expired = isUserExpired(userAccessDateStart, userAccessDateEnd);
            if (!is_user_expired) {
              firebaseUser.getIdToken().then(function (token) {
                console.log(token)

                /////// by this method we are adding token as header to all request because we are checking token in request if its valid request will be start proccess
                $.ajaxSetup({
                  headers: {
                    'gsminformation-token': token
                  }
                });
                //leftMenuClicks('Dashboard');
              });
            } else {
              //////when  when user date is expired it will show them this message
              $('#inf_mdl_title_Expire').html('Expire Date Warning');
              $('#inf_mdl_text_Expire').html('You passed expiration date please contact us for more info');
              $('#m_modal_Expire').modal('show');
            }

          } else {
            ////if we cant read user date of register and end date it will be show this to them
            $('#inf_mdl_title_Expire').html('access denied');
            $('#inf_mdl_text_Expire').html('Getting Your access information was faild please contact us for more info');
            $('#m_modal_Expire').modal('show');
          }

        });
      }

    } else {
      if (window.location.pathname != '/') {
        if (window.location.pathname != '/reset_password.html') {
          window.location = "/";
        }
      } else {
        $('#gotomap_button').css('display', 'none');
        $('#login_form').css('display', 'block');
      }
    }

  });
}


window.addEventListener('load', function () {
  initApp()
});

function signIn() {
  var email = document.getElementById("login_email").value;
  var password = document.getElementById("login_password").value;
  var login_message_bx = document.getElementById("login_message_bx");


  if (email == "" || password == "" || !document.getElementById("login_password").hasAttribute("required") || checkCookie("RecaptchaWrongTry")) {
    console.log("email, password invalid or Recaptcha");
    return false;
  } else {
    firebase
      .auth()
      .signInWithEmailAndPassword(email, password)
      .catch(function (error) {
        var errorCode = error.code;
        var errorMessage = error.message;
        console.log(wrong_count + " _ errorCode: " + errorCode);
        login_message_bx.style.display = "block";
        wrong_count++;
        if (wrong_count >= 3) {//create

          if (document.getElementById("wrong_recaptcha").style.display!="block") {
            $('#login_button').css({ display: "none" });
            document.getElementById("wrong_recaptcha").style.display = "block";
            setCookie("RecaptchaWrongTry", "true", 30);
          }
          wrong_count = 0;

        }
      });

  }
  return false;
}


//sign out redirect to first page
function signOut() {
  firebase
    .auth()
    .signOut()
    .then(function () {
      console.log('Signed Out');
      window.location = "/";
    }, function (error) {
      console.error('Sign Out Error', error);
    });
}

function resetPassword() {

  $("#login_password").prop('required', false);

  var email = document.getElementById("reset_password_email").value;

  if (email == null || email == "" || RecaptchaResetPassword)
    return;

  firebase.auth().sendPasswordResetEmail(
    email)
    .then(function () {
      // Password reset email sent.
      Swal({
        title: 'Password reset email sent',
        type: 'success',
        confirmButtonText: 'OK'
      }).then((result) => {
        if (result.value) {
          //ok button
        }
        window.location = "/";
      })
    })
    .catch(function (error) {
      // Error occurred. Inspect error.code.
      console.log("reset error : " + error);
      Swal("Error!", error, "error")
    });
}

function snapshotToArray(snapshot) {
  var returnArr = [];

  snapshot.forEach(function (childSnapshot) {
    var item = childSnapshot.val();
    item.key = childSnapshot.key;

    returnArr.push(item);
  });

  return returnArr;
};
