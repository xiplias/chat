Template.chat.events = {
  "click #submit_message": ()->
    message = $("#input_message").val()

    Messages.insert({
      message: message, 
      author_id: Meteor.user()._id, 
      created_at: new Date(), 
      room_id: Session.get("room_id")
    })

    $("#input_message").val("")
}

Template.new_room.events = {
  "click #submit_new_room": ()->
    room_name = $("#input_room_name").val()
    console.log(room_name)
    room = Rooms.insert({name: room_name});

    Session.set("modal", "")
    Meteor.Router.to("/rooms/"+room)

  "click .close_modal": ()->
    Session.set("modal", "")
}

Template.sidebar.events = {
  "click li": (e)->
    console.log(["click!", this, e])
    $("#sidebar li").removeClass("selected")
    $(e.currentTarget).addClass("selected")
}

Template.sidebar.rendered = ()->
  console.log("rendered")

Template.sidebar.users = ()->
  return Meteor.users.find({})

Template.sidebar.rooms = ()->
  return Rooms.find({})

Template.modal.need_modal = (type)->
  return type == Session.get("modal")

Template.chat.messages = ()->
  Messages.find({room_id: Session.get("room_id")})

Template.chat.room = ()->
  Rooms.findOne(Session.get("room_id"))

Template.chat.author = ()->
  console.log([Meteor.users.findOne(this.author_id), this])
  Meteor.users.findOne(this.author_id)