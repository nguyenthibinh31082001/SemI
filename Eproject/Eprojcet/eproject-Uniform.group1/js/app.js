var app = angular.module('app', []);

app.controller('AppCtrl', function($scope, $http, $window) {
    // Empty error message
    $scope.message = "";
    // get login information saved in sessionStorage
    var u = sessionStorage.getItem('login_inffo');
    if (u) {
        //converts json string to object type in javascript
        $scope.loginInfo = angular.fromJson(u);
    }


    // Need to get user information in data / users.jdon file
    $http.get('../data/users.json').then(function(res) {
        // This function will have 2 parameters: email and password
        function check_login(email, password) {

            for (var i = 0; i < res.data.length; i++) {
                // If the information is correct as in data / users.json then returns the user object
                if (res.data[i].email == email && res.data[i].password == password) {
                    return res.data[i];
                    break;
                }
            }
            // return false; // returns false if no information is true
        }
        //Sự kiện login khi click
        $scope.login = function() {
            //Call the check_login function back to the email and password
            var user = check_login($scope.login_email, $scope.login_pass);
            if (user != null) {

                $window.location.href = 'http://www.google.com';

            } else {
                alert("Email or password is incorrect");
            }
        }

    });
    // exit method, when clicking the x button 

});