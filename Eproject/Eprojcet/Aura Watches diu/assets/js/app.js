var app = angular.module("myApp",['ngRoute']);
app.config(function($routeProvider) {
  $routeProvider
  .when("/", {
    templateUrl : "page/home.html"
  })
  .when("/home", {
    templateUrl : "page/home.html"
  })
  .when("/shop", {
    templateUrl : "page/shop.html"
  })
  .when("/blog", {
    templateUrl : "page/blog.html"
  })
  .when("/about", {
    templateUrl : "page/about.html"
  })
  .when("/contact", {
    templateUrl : "page/contact.html"
  })
  .when("/cart", {
    templateUrl : "page/cart.html"
  })
  .when("/check-out", {
    templateUrl : "page/checkout.html"
  })
  .when("/with-list", {
    templateUrl : "page/withlist.html"
  })
  .when("/login", {
    templateUrl : "page/login.html"
  })
  .when("/register", {
    templateUrl : "page/register.html"
  })
  .when("/product-details", {
    templateUrl : "page/product-details.html"
  });
});
app.controller('myController', function ($scope, $http, $location) {     
  $scope.shop = function () {
    location.replace('#!shop');
    location.reload();
  }
  $scope.contact = function () {
    location.replace('#!contact');
    location.reload();
  }
  $scope.about = function () {
    location.replace('#!about');
    location.reload();
  }
  $scope.Log = function () {
    location.replace('#!login');
    location.reload();
  }
  $scope.Reg = function () {
    location.replace('#!register');
    location.reload();
  }
  $scope.getUsername = function () {
    var userRegistered = JSON.parse(localStorage.getItem('currentUser'));
    if (userRegistered) {
      $scope.loginInfo = userRegistered.username;
      return userRegistered.username;
    } else {
      $scope.loginInfo = "";
      return 'My Account';
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
      alert("Register success");
    } else {
      alert("Register fail");
    }
    localStorage.setItem('userData', JSON.stringify(userRegistered));
    $location.path('/login');
  };
})

app.controller('loginCtrl', function($scope, $location, $http){
    localStorage.removeItem('currentUser');
  $scope.login = function () {
    var userRegistered = JSON.parse(localStorage.getItem('userData'));
    if ($scope.login_email == userRegistered.email && $scope.login_password == userRegistered.password) {
      alert("Login success");
      $location.path('/home');
      localStorage.setItem('currentUser', JSON.stringify(userRegistered));
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