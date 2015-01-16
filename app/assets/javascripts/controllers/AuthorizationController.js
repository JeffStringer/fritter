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
      var errorEmail = error.data.errors["email"];
      var errorUsername = error.data.errors["username"];
      var errorHandle = error.data.errors["handle"];
      if (errorEmail != undefined) {
        $scope.errors.push({error: "Email " + errorEmail});
      }
      if (errorUsername != undefined) {
        $scope.errors.push({error: "Username " + errorUsername});
      }
      if (errorHandle != undefined) {
        $scope.errors.push({error: "Handle " + errorHandle});
      }
    });
  };
}]);