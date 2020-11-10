var app = angular.module('app',['ngRoute']);
// khai báo các route
app.config(function($routeProvider){
    $routeProvider
    .when('/',{
        templateUrl:'page/home.html'
    })
    .when('/about',{
        templateUrl:'page/about.html'
    });
});

app.controller('AppController',function($scope,$http){
    
});