Meteor.subscribe('games')

Template.currentGame.helpers
  score: () ->
    game = Games.findOne({ current: true })
    game.score