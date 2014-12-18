angular.module('messageList').controller('AuthCtrl', ['$scope','$location','Auth', function($scope, $location, Auth){
  $scope.login = function() {
    Auth.login($scope.user).then(function(){
      $location.path('/')
    });
  };

  $scope.register = function() {
    Auth.register($scope.user).then(function(){
      $location.path('/')
    });
  };
}]);