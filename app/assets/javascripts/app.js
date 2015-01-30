var Fritter = angular.module('Fritter', ['ngRoute', 'templates', 'Devise']);

Fritter.config(function ($routeProvider) {
  $routeProvider
    .when('/',
      {
        controller: 'MainCtrl',
        templateUrl: 'Main.html'
      })

    .when('/about',
      {
        controller: 'MainCtrl',
        templateUrl: 'About.html'
      })

    .when('/following',
      {
        controller: 'MainCtrl',
        templateUrl: 'Following.html'
      })

    .when('/followers',
      {
        controller: 'MainCtrl',
        templateUrl: 'Followers.html'
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