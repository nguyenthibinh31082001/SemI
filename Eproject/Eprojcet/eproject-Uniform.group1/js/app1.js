var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
        .when("/", {
            templateUrl: "./page/home.html"
        })
        .when("/blog", {
            templateUrl: "./page/blog.html"
        })
        .when("/checkout", {
            templateUrl: "./page/checkout.html"
        })
        .when("/shop", {
            templateUrl: "./page/shop.html"
        })
        // các trang danh mục
            .when("/shirts", {
                templateUrl: "./page/shirts.html"
            })
            .when("/skirts&shirts", {
                templateUrl: "./page/skirts&shirts.html"
            })
            .when("/t-shirts", {
                templateUrl: "./page/t-shirts.html"
            })
            .when("/shorts", {
                templateUrl: "./page/shorts.html"
            })
            .when("/belts", {
                templateUrl: "./page/belts.html"
            })
            .when("/ties", {
                templateUrl: "./page/ties.html"
            })
            .when("/socks", {
                templateUrl: "./page/socks.html"
            })

        .when("/single-blog", {
            templateUrl: "./page/single-blog.html"
        })
        .when("/contact", {
            templateUrl: "./page/contact.html"
        })
        .when("/regular-page", {
            templateUrl: "./page/regular-page.html"
        })
        .when("/product_detail", {
            templateUrl: "./page/product-detail.html"
        })
        .when("/register", {
            templateUrl: "./page/register.html"
        })
        .when("/login", {
            templateUrl: "./page/login.html"
        })
        .when("/cart", {
            templateUrl: "./page/cart.html"
        })

});
app.controller('registerController', function($scope, $location, $http) {
    $scope.register = function() {
        if ($scope.password == $scope.confirm_password) {
            var userRegistered = {
                'username': $scope.user_name,
                'email': $scope.email,
                'password': $scope.password
            }
            console.log('ok');
        } else {
            console.log("false");
        }
        localStorage.setItem('userData', JSON.stringify(userRegistered));
        $location.path('login');
    }
});
app.controller('loginController', function($scope, $location, $http) {
    localStorage.removeItem('currentUser');
    $scope.login = function() {
        var userRegistered = JSON.parse(localStorage.getItem('userData'));
        if ($scope.email == userRegistered.email && $scope.password == userRegistered.password) {
            localStorage.setItem('currentUser', JSON.stringify(userRegistered));
            $location.path('/');
            console.log("Login OK");
        } else {
            alert("email or password is incorrect");
            console.log('login false');
        }
    };
});
app.controller('menuController', function($scope, $location, $http) {
    $scope.cc = "cc";

    var userRegistered = JSON.parse(localStorage.getItem('userData'));
    if (userRegistered) {
        $scope.user = userRegistered.username;
        return userRegistered.username;
        // console.log("ok");   
    } else {
        return "ACCOUNT"
    }

});
app.controller('logoutController', function($scope, $location, $http, $route, $window) {
    $scope.logout = function() {
        var userRegistered = JSON.parse(localStorage.getItem('userData'));
        if (userRegistered) {
            localStorage.clear();
            $window.location.reload();
        }
    }
});