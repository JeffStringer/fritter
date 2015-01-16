angular.module('messageList').controller('AuthCtrl', ['$scope','$location','Auth', function($scope, $location, Auth){
  $scope.errors = [];

  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $location.path('/')
    }, function(error) {
      var errorMessage = "Login failed: incorrect email and/or password";
      $scope.errors.push({error: errorMessage});
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $location.path('/')
    });
  };
}]);