Meteor.subscribe('games')

Template.currentGame.helpers
  game: () ->
    Games.find({ current: true })

  votes: () ->
    game = Games.findOne({ current: true })
    votes = []
    for key, value of game.votes
      votes.push direction: key, count: value
    votes

  score: () ->
    game = Games.findOne({ current: true })
    score = game.score

Template.currentGame.events
  'click button': (event) ->
    vote = event.target.id
    Meteor.call('tallyVote', vote)