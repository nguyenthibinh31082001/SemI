var app = angular.module('movieapp',[]);

app.controller('AppController',function($scope){
    $scope.movies = [
        {Name:"Lorem ipsum dolor sit amet",Poster:"images/1.jpg"},
        {Name:"Consectetur adipisicing elit",Poster:"images/2.jpg"},
        {Name:"landitiis autem alias soluta",Poster:"images/3.jpg"},
        {Name:"Accusantium omnis non",Poster:"images/4.jpg"}
    ];

    $scope.show_movie = function(movie){
        $('#modal-id').modal('show'); // hiển thị modal của bootstrap 3

        $scope.movieInfo = movie; // gửi biến movieInfo với giá trị nhận về từ hàm
    }
});