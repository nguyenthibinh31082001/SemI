var app = angular.module('demoapp',[]);

app.controller('AppController',function($scope){
    $scope.my_var = "AngularJS App basic";
    $scope.name = "BKAP";
    $scope.age = 23;
    $scope.phone = "0986421127";
    $scope.email = "bkap@bachkhoa-aptech.edu.vn";
});