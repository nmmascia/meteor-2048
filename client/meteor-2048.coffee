Meteor.subscribe('games')

Template.currentGame.helpers
  game: () ->
    Games.find({ current: true })

  votes: () ->
    game = Games.findOne({ current: true })
    game.votes

Template.currentGame.events
  'click button': (event) ->
    vote = event.target.id
    Meteor.call('tallyVote', vote)