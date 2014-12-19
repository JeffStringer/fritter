messageList.factory('UsersFactory', function UsersFactory($http) {
  var factory = {};
  factory.users = [];

  factory.getUsers = function() {
    return $http.get('/users.json')
  };

  factory.getUser = function(user) {
    var index = factory.users.indexOf(user)
    return $http.get("/users/" + user.id + ".json")
  };

  return factory;

});