messageList.controller('MainCtrl', function MainController(Auth, $scope, FollowsFactory, MessagesFactory, UsersFactory) {
  $scope.FollowsFactory = FollowsFactory;
  $scope.follows = FollowsFactory.follows;

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

  $scope.getFollows = (function(user, users) {
    FollowsFactory.getFollows(user, users)
      .success(function(data) {
        $scope.follows = data;
        $scope.followed_users = [];
        $scope.unfollowed_users = [];
        if ($scope.follows.length === 0) {
          $scope.unfollowed_users = $scope.users;
        } else { 
          $scope.follows.forEach(function(follow) {
          $scope.users.forEach(function(u) {
              if (follow.user_id === u.id) {
                $scope.followed_users.push(u);
              }
            });
          });
          $scope.followed_users.forEach(function(follow) {
            $scope.users.forEach(function(u) {
              if (follow.id != u.id) {
                $scope.unfollowed_users.push(u);
              }
            });
          });
        }
    });
  })();

  $scope.addFollows = function(user){
    FollowsFactory.addFollows(user)
  }

  $scope.deleteFollows = function(user, follow){
    FollowsFactory.deleteFollows(user)
  }

  $scope.getMessages = (function() {
    MessagesFactory.getMessages()
      .success(function(data) {
        $scope.messages = data;
    });
  })();

  $scope.addMessage = function(user){
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