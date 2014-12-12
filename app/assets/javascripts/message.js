var Messages = angular.module('Messages', []);

Messages.controller('MessageCtrl', function MessageCtrl($scope) {
  $scope.messages = [
    {text: "Merry Christmas!"},
    {text: "Happy Christmas!"},
    {text: "Joyeaux Noel!"},
    {text: "Feliz Navidad!"}
  ]
});
