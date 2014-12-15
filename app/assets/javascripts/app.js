var messageList = angular.module('messageList', ['ngRoute', 'templates']);

messageList.config(function ($routeProvider) {
   $routeProvider
      .when('/',
        {
          controller: 'MessageCtrl',
          templateUrl: 'Messages.html'
        })
 });