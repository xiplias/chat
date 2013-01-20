Rooms = new Meteor.Collection("rooms")

Rooms.allow
  insert: (userId, doc)->
    return true
  update: (userId, docs, fields, modifier)->
    return true;
  remove: (userId, docs)->
    return false;

Messages = new Meteor.Collection("messages")
Messages.allow
  insert: (userId, doc)->
    return true
  update: (userId, docs, fields, modifier)->
    return true;
  remove: (userId, docs)->
    return false;