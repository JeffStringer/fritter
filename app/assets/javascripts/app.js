var messageList = angular.module('messageList', ['ngRoute', 'templates', 'Devise']);

messageList.config(function ($routeProvider) {
   $routeProvider
      .when('/',
        {
          controller: 'MessageCtrl',
          templateUrl: 'Messages.html'
        })

      .when('/login',
        {
          controller: 'AuthCtrl',
          templateUrl: 'Login.html'
        })

      .when('/signup',
        { 
          controller: 'AuthCtrl',
          templateUrl: 'Register.html'
        })
 });