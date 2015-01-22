angular.module('Fritter').controller('AuthCtrl', ['$scope','$location','Auth', function($scope, $location, Auth){

  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $location.path('/')
    }, function(error) {
      $scope.errors = [];
      $scope.errors.push({error: error.data.error});
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $location.path('/')
    }, function(error) {
      $scope.errors = [];
      if (error.data.errors["email"] != undefined) {
        $scope.errors.push({error: "Email " + error.data.errors["email"]});
      }
      if (error.data.errors["username"] != undefined) {
        $scope.errors.push({error: "Username " + error.data.errors["username"]});
      }
      if (error.data.errors["handle"] != undefined) {
        $scope.errors.push({error: "Handle " + error.data.errors["handle"]});
      }
    });
  };
}]);