Fritter.factory('FollowsFactory', function FollowsFactory($http, UsersFactory) {
  var factory = {};
  factory.follows = [];

  factory.getFollows = function(user) {
    return $http.get("/users/" + 0 + "/follows.json")
  };

  factory.addFollows = function(user) {
    return $http.post("/users/" + user.id + "/follows.json")
  };

  factory.deleteFollows = function(user, follow) {
    var index = factory.follows.indexOf(user)
    factory.follows.splice(index, 1);
    $http.delete("/users/" + user.id + "/follows/" + follow.id + ".json")
  };

  return factory;

});