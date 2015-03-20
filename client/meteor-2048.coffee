Meteor.subscribe('games')

Template.currentGame.helpers
  game: () ->
    Games.find({ current: true })

Template.currentGame.events
  'click .up': () ->
    Meteor.call('updateGame', 'up')

  'click .down': () ->
    Meteor.call('updateGame', 'down')

  'click .right': () ->
    Meteor.call('updateGame', 'right')

  'click .left': () ->
    Meteor.call('updateGame', 'left')