messageList.controller('MessageCtrl', function MessageController($scope, MessagesFactory, Auth) {
  $scope.MessagesFactory = MessagesFactory;
  $scope.messages = MessagesFactory.messages;
  $scope.newMessage = {};

  $scope.getMessages = (function() {
    MessagesFactory.getMessages()
      .success(function(data) {
        $scope.messages = data;
    });
  })();

  $scope.addMessage = function() {
    MessagesFactory.addMessage (MessagesFactory.message)
      .success(function(data) {
        var now = moment();
        $scope.messages.push({fweet: MessagesFactory.message}, {date: now}, {user: MessagesFactory.user});
          MessagesFactory.message = null;
        });
  }
});