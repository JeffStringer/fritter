Fritter.controller('MessageCtrl', function MessageController($scope, MessagesFactory, Auth) {
  $scope.MessagesFactory = MessagesFactory;
  $scope.messages = MessagesFactory.messages;
  $scope.errors = MessagesFactory.errors;

  Auth.currentUser().then(function (user){
    $scope.user = user;
  });

  $scope.getMessages = (function() {
    MessagesFactory.getMessages()
      .success(function(data) {
        $scope.messages = data;
    });
  })();

  $scope.addMessage = function(user) {
    MessagesFactory.addMessage ()
      .success(function(data) {
        var now = moment().format('LLL');
        $scope.messages.push({fweet: MessagesFactory.message, user: $scope.user, now: now});
          MessagesFactory.message = null;
      })
      .error(function(data) {
        $scope.errors = [];
        var error = data.errors.fweet.pop();
        var errorMessage = "message " + error;
        $scope.errors.push({error: errorMessage});
      }); 
    }  
});