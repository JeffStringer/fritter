Fritter.factory('MessagesFactory', function MessagesFactory($http) {
  var factory = {};
  factory.messages = [];
  factory.errors = [];

  factory.getMessages = function() {
    return $http.get('/messages.json')
  };

  factory.addMessage = function() {
    return $http.post('/messages.json', factory)
  };

  factory.deleteMessage = function(message) {
    var index = factory.messages.indexOf(message)
    factory.messages.splice(index, 1);
    $http.delete("/messages/" + message.id + ".json")
  };

  factory.updateMessage = function(message) {
    $http.put(("/messages/" + message.id + ".json"), message);
  };

  return factory;

});
