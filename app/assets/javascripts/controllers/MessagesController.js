messageList.controller('MessageCtrl', function MessageController($scope, MessagesFactory, UsersFactory, Auth) {
  $scope.MessagesFactory = MessagesFactory;
  $scope.messages = MessagesFactory.messages;

  $scope.UsersFactory = UsersFactory;

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
        $scope.messages.push({fweet: MessagesFactory.message}, {user: $scope.user});
          MessagesFactory.message = null;
        });
  }
});