messageList.controller('MessageCtrl', function MessageController($scope, MessagesFactory, Auth) {
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
        console.log(now);
        $scope.messages.push({fweet: MessagesFactory.message, user: $scope.user, now: now});
          MessagesFactory.message = null;
      })
      .error(function(data) {
        var error = "message " + data.errors.fweet.pop();
        $scope.errors.push({error: error});
      }); 
    }  
});