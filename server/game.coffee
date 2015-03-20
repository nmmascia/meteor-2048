Meteor.publish 'games', () ->
  Games.find({ current: true })