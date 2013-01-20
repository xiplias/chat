Template.chat.events = {
  "click #submit_message": ()->
    message = $("#input_message").val()
}

Template.new_room.events = {
  "click #submit_new_room": ()->
    room_name = $("#input_room_name").val()
    console.log(room_name)
    Rooms.insert({name: room_name});

    Session.set("modal", "")
}

Template.sidebar.rendered = ()->
  console.log("rendered")

Template.sidebar.users = ()->
  return Meteor.users.find({})

Template.sidebar.rooms = ()->
  return Rooms.find({})

Template.modal.need_modal = (type)->
  return type == Session.get("modal")