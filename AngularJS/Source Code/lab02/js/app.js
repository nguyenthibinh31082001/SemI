var app = angular.module('demoapp',[]);

app.controller('AppController',function($scope){
    $scope.students = [
        'Hoàng Văn Thụ',
        'Nguyễn Hoàng Anh',
        'Trần Văn Ngọc',
        'TIết Đinh San',
        'Phàn Lê Huê',
        'Trần Kim Định'
    ];
});