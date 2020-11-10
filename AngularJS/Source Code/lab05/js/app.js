var app = angular.module('app',[]);

app.controller('AppCtrl',function($scope,$http){
    /** Khai báo mảng đối tượng thông tin sinh viên* */
    var stds =  [
        {
            "code":"B1234",
            "name":"Trần Quang Đại",
            "email":"daitq@gmail.com",
            "phone":"0986421128",
            "password":123456
        },
        {
            "code":"B2489",
            "name":"Nguyễn Huy Hoàng",
            "email":"hoangnh@gmail.com",
            "phone":"0984621181",
            "password":123456
        },
        {
            "code":"B3598",
            "name":"Lê Văn Huy",
            "email":"huylv@gmail.com",
            "phone":"0986473318",
            "password":123456
        },
        {
            "code":"B4864",
            "name":"Hỏa Thị Hà Thu",
            "email":"thuhth@gmail.com",
            "phone":"0875421258",
            "password":123456
        }
    ];

    $scope.students = stds; // gán dữ liệu đã khai báo cho $scope để truyên dữ liệu qua view

    
});

// TẠO DIREXTIVE HIỂN THỊ DỮ LIỆU DANH SÁCH SINH VIÊN

app.directive('studdentList',function(){
    return {
        restrict:'E',// quy định sử dụng như tên thẻ html mở rộng
        template:'<li class="list-group-item" ng-repeat="s in students"><b>{{s.code}}</b> {{s.name}}</li>'
    };
});

// TẠO DIREXTIVE HIỂN THỊ DỮ LIỆU DANH SÁCH SINH VIÊN

app.directive('studdentList1',function(){
    return {
        restrict:'E',// quy định sử dụng như tên thẻ html mở rộng
        templateUrl:'page/student.html'
    };
});