Fritter.controller('MainCtrl', function MainController(Auth, $scope, FollowsFactory, MessagesFactory, UsersFactory) {
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
        $scope.user = data.user;
        $scope.followings = data.following;
        $scope.followers = data.followers;
        $scope.users = data.users
        $scope.notFollowings = [];
        if ($scope.followings.length === 0 ) {
          $scope.users.forEach(function(u) {
            if ((u.id != $scope.user.id)) {
              $scope.notFollowings.push(u);
            }
          });
        } else {
          var followingsIds = {}
          $scope.followings.forEach(function(obj){
              followingsIds[obj.id] = obj;
          });
          $scope.notFollowings =  $scope.users.filter(function(obj){
                                      return !(obj.id in followingsIds);
                                  });
          $scope.notFollowings =  $scope.notFollowings.filter( function(f) {
                                    return !(f.id === $scope.user.id);
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
        $scope.messages = data.messages;
        $scope.myMessages = data.myMessages;
        now = moment().format();
        $scope.messages.forEach(function(m) {
          m.created_at = moment(m.created_at).format("MMM D");
        });
    });
  })();

  $scope.addMessage = function(user){
    MessagesFactory.addMessage ()
      .success(function(data) {
        $scope.messages.push({fweet: MessagesFactory.message, user: $scope.user, created_at: moment(data.created_at).startOf('minute').fromNow()});
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