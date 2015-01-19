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

  factory.deleteUser = function(user) {
    var index = factory.users.indexOf(user)
    factory.users.splice(index, 1);
    $http.delete("/users/" + user.id + ".json")
  };

  factory.updateUser = function(user) {
    $http.put(("/users/" + user.id + ".json"), user);
  };

  return factory;

});