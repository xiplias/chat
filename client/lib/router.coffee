Meteor.Router.add({
  '/': 'list'

  '/rooms/new': (project_id)->
    Session.set("modal", "new_room")

  '/rooms/:room_id': (room_id)->
    Session.set("room_id", room_id)
    Session.set("modal", "")

  '/users/:user_id': (user_id)->
    Session.set("user_id", user_id)
});

Meteor.Router.filters({
  'checkLoggedIn': (page)->
    if Meteor.loggingIn()
      return 'loading';
    else if Meteor.user()
      return page;
    else
      return 'login';
});

Meteor.Router.filter('checkLoggedIn');