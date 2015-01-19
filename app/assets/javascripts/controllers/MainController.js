messageList.controller('MainCtrl', function MainController($scope, FollowsFactory, MessagesFactory, UsersFactory, Auth) {
  $scope.MessagesFactory = MessagesFactory;
  $scope.messages = MessagesFactory.messages;
  $scope.errors = MessagesFactory.errors;
  $scope.UsersFactory = UsersFactory;
  $scope.users = UsersFactory.users;

  Auth.currentUser().then(function (user){
    $scope.user = user;
  });

  $scope.getUsers = (function() {
    UsersFactory.getUsers()
      .success(function(data) {
        $scope.users = data;
    });
  })();

  $scope.addFollows = function(user) {
    FollowsFactory.addFollows(user)
  }

  $scope.getMessages = (function() {
    MessagesFactory.getMessages()
      .success(function(data) {
        $scope.messages = data;
    });
  })();

  $scope.addMessage = function(user) {
    MessagesFactory.addMessage ()
      .success(function(data) {
        // var now = moment().format('LLL');
        $scope.messages.push({fweet: MessagesFactory.message, user: $scope.user, created_at: data.created_at});
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