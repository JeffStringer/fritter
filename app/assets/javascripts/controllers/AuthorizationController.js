angular.module('messageList').controller('AuthCtrl', ['$scope','$location','Auth', function($scope, $location, Auth){
  $scope.errors = [];

  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $location.path('/')
    }, function(error) {
      var errorMessage = error.data.error;
      $scope.errors.push({error: errorMessage});
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $location.path('/')
    }, function(error) {
      var errorEmail = "Email " + error.data.errors["email"];
      var errorUsername = "Username " + error.data.errors["username"];
      var errorHandle = "Handle " + error.data.errors["handle"];
      $scope.errors.push({error: errorEmail},{error: errorUsername},{error: errorHandle});
    });
  };
}]);