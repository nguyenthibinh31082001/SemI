var app = angular.module('app', []);

app.controller('AppCtrl', function ($scope, $http) {
    $http.get('data/products.json').then(function (res) {
        $scope.products = res.data;
    });
    $scope.carts = []; // Khaibaos mảng ban đầu là rỗng

    // lấy thông tin trong storage
    var CartInStorage = sessionStorage.getItem('cart');
    if (CartInStorage) {
        // nếu có thông tin thì gán lại mảng ban đầu = thông tin dã có trong storage
        // fromJson(CartInStorage) => chuyển chuỗi json lưu tại hàm add_to_cart => đối tượng json
        $scope.carts = angular.fromJson(CartInStorage);
    }

    $scope.add_to_cart = function (sp) {
        var itemExists = checkCartExists(sp.id);

        // nếu itemExists != -1 => đã có trong giỏ hàng, chỉ cần tăng số lượng lên
        if (itemExists != -1) {
            $scope.carts[itemExists].quantity += 1;
        } else {
            sp.quantity = 1; // thêm thuộc tính quantity cho giỏ hàng
            $scope.carts.push(sp);
        }

        // lưu thông tin mảng giỏ hàng dưới dạng chuỗi json
        sessionStorage.setItem('cart', angular.toJson($scope.carts));
        $scope.cart = sp;
    }

    // hàm kiểm tra sản phẩm đã có trong giỏ hàng chưa
    function checkCartExists(id) {
        for (var i in $scope.carts) {
            if ($scope.carts[i].id == id) {
                return i; // nếu có trả về index của mảng
            }
        }
        return -1; // nếu không có trả về -1
    }

    // sự kiện xóa sản phẩm koir giỏ hàng
    $scope.remove_cart = function(id) {
        var itemExists = checkCartExists(id); // lấy về index của mảng giỏ hàng
        // nếu itemExists != -1 thự hiện xóa khổi mảng
        if (itemExists != -1) {
            $scope.carts.splice(itemExists,1);
            sessionStorage.setItem('cart', angular.toJson($scope.carts));
        }
    }
});
