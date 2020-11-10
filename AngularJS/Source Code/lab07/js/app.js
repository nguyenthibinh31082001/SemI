var app = angular.module('app', []);

app.controller('AppCtrl', function ($scope, $http) {
    $scope.message = ""; // tin nhắn thông báo lỗi rỗng
    // lấy thông tin đăng nhập đã lưu trong sessionStorage
    $scope.loginInfo = sessionStorage.getItem('login_inffo');
    //Sự kiện login khi click
    $scope.login = function () {
        console.log($scope.login_email);
        console.log($scope.login_pass);
        if ($scope.login_email == 'bkap@gmail.com' && $scope.login_pass == '123456') {
            // lưu thông tin vào sessionStorage
            sessionStorage.setItem('login_inffo', $scope.login_email);
            $scope.message = "Đăng nhập thành công";
            $scope.loginInfo = $scope.login_email;
        } else {
            $scope.message = "Tên đăng nhập hoặc mật khẩu không đúng";
        }
    }

    // phương thức thoát, khi click vào nút x
    $scope.logout = function(){
        sessionStorage.removeItem('login_inffo'); // xóa storage theo key
        $scope.message = "Thoát tài khoản thành công";
        $scope.loginInfo = null;
    }
});
