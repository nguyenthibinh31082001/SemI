var app = angular.module("myApp", []);
app.controller('myController', function ($scope, $http, $location) {
  $scope.getUsername = function () {
    var userRegistered = JSON.parse(localStorage.getItem('currentUser'));
    if (userRegistered) {
      $scope.loginInfo = userRegistered.username;
      return userRegistered.username;
    } else {
      $scope.loginInfo = "";
      return 'Account';
    }
  };
})

app.controller('registerCtrl', function($scope, $location, $http){
  $scope.register = function () {
    if ($scope.register_password === $scope.confirm_password) {
      var userRegistered = {
        'username': $scope.register_username,
        'email': $scope.register_email,
        'password': $scope.register_password
      }
      window.location.replace("login.html");
    } else {
      alert("Register fail");
    }
    localStorage.setItem('userData', JSON.stringify(userRegistered));
  };
})

app.controller('loginCtrl', function($scope, $location, $http){
    localStorage.removeItem('currentUser');
  $scope.login = function () {
    var userRegistered = JSON.parse(localStorage.getItem('userData'));
    if ($scope.email == userRegistered.email && $scope.password == userRegistered.password ) {
      localStorage.setItem('currentUser', JSON.stringify(userRegistered));
      window.location.replace("index.html");
    } else {
      alert("Email address or Password incorrect");
    }
  };
})

app.controller('logoutCtrl', function($scope, $location, $http){
  $scope.logout = function () {
    var userRegistered = JSON.parse(localStorage.getItem('currentUser'));
    if (userRegistered) {
    alert("Logout success");
    localStorage.removeItem('currentUser');
    $location.path('/login');
  }
  };
})