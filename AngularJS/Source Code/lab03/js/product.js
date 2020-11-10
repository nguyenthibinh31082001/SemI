var app = angular.module('movieapp',[]);

app.controller('AppController',function($scope){
    $scope.products = [
        {Name:"Lorem ipsum dolor sit amet",Price:720000,Date: new Date()},
        {Name:"Consectetur adipisicing elit",Price:150000,Date: new Date()},
        {Name:"landitiis autem alias soluta",Price:350000,Date: new Date()},
        {Name:"Accusantium omnis non",Price:200000,Date: new Date()}
    ];
});