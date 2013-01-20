Meteor.Router.add({
  '/': 'list'

  '/rooms/new': (project_id)->
    Session.set("modal", "new_room")

  '/rooms/:room_name': (room_name)->
    Session.set("room_name", room_name)
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