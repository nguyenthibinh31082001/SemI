var app = angular.module('app',[]);

app.controller('AppCtrl',function($scope,$http){
    $http.get('data/student.json').then(function(res){
        $scope.students = res.data;

        // sự kiện lick trên nút tìm kiếm
        $scope.find_code = function(){
            var sv = check_code($scope.svcode);
           if(sv){
               $scope.std_info = sv;
           }else{
               $scope.msg = "Mã Sinh viên không hợp lệ",
               $scope.std_info = null;
           }
        }
        // Hàm tìm kiếm sinh veein thoe mã 
        function check_code(code){
            for(var i = 0; i < $scope.students.length; i++){
                // trả về thông tin đối tuongj sinh viên nếu mã nhập trên form trung khớp
                if($scope.students[i].code == code){
                    return $scope.students[i]; 
                }
            }
            // mạc định trả về false
            return false;
        }

    });


   
});
