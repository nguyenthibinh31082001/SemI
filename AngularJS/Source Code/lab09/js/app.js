var app = angular.module('app', []);

app.controller('AppCtrl', function ($scope, $http) {
    $scope.message = ""; // tin nhắn thông báo lỗi rỗng // Giữ nguyên lab08
    // lấy thông tin đăng nhập đã lưu trong sessionStorage
    var u = sessionStorage.getItem('login_inffo');
    if(u){
        // chuyển chỗi json sang kiểu đối tượng trong javascript
        $scope.loginInfo = angular.fromJson(u); 
    }
    

    // cần lấy thông tin người dung trong file data/users.jdon
    $http.get('data/users.json').then(function (res) {
        // hàm này sẽ có 2 tham số là email và mật khâu 
        function check_login(email, password) {
            for (var i = 0; i < res.data.length; i++) {
                // nếu đúng thông tin như trong data/users.json thì trả về đối tượng người dùng
                if (res.data[i].email == email && res.data[i].password == password) {
                    return res.data[i];
                }
            }

            return false; // trả về false nếu không có thông tin nào đúng
        }
        //Sự kiện login khi click
        $scope.login = function () {
            // gọi lại hàm check_login truyền vào email, password
            var user = check_login($scope.login_email,$scope.login_pass);
            if (user) {
                // lưu thông tin vào sessionStorage
                // vì storage chỉ lưu dữ liệu chuỗi nên cần chuyển đối tượng => chuỗi jsson
                sessionStorage.setItem('login_inffo', angular.toJson(user));
                $scope.message = "Đăng nhập thành công"; // Giữ nguyên lab08
                $scope.loginInfo = user; // gán thông tin với đối tượng user mới
            } else {
                $scope.message = "Tên đăng nhập hoặc mật khẩu không đúng"; // Giữ nguyên lab08
            }
        }

    });
    // phương thức thoát, khi click vào nút x  
    // Giữ nguyên lab08
    $scope.logout = function () {
        sessionStorage.removeItem('login_inffo'); // xóa storage theo key
        $scope.message = "Thoát tài khoản thành công";
        $scope.loginInfo = null;
    }
});
