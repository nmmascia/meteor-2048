Template.panel.helpers
  votes: () ->
    game = Games.findOne({ current: true })
    votes = []
    for key, value of game.votes
      votes.push direction: key, count: value
    votes

  score: () ->
    game = Games.findOne({ current: true })
    score = game.score

Template.panel.events
  'click button': (event) ->
    vote = event.target.id
    Meteor.call('tallyVote', vote)