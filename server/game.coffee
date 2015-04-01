Meteor.publish 'games', () ->
  Games.find({ current: true })

Meteor.startup ->
  currentGame = Games.findOne({ current: true })
  if currentGame is undefined
    game = new Game
    Games.insert({ grid: game.board.grid, current: true, votes: { up : 0, down : 0, left : 0, right: 0 } })
  else
    board = new Board(currentGame.grid)
    voteCounter = new VoteCounter
    game = new Game(board, voteCounter)

  updateGame = (direction) ->
    game.move(direction)
    oldGrid = Games.findOne({ current: true })
    Games.update({ _id: oldGrid._id }, { $set: { grid: game.board.grid } })

  Meteor.setInterval ->
    mostVoted = game.voteCounter.mostVotes()
    updateGame(mostVoted)
    game.voteCounter.reset()
    currentGame = Games.findOne({ current: true })
    Games.update({ _id: currentGame._id }, { $set: { votes: game.voteCounter.tally } })
  , 30000

  Meteor.methods
    tallyVote: (vote) ->
      game.voteCounter.increment(vote)
      currentGame = Games.findOne({ current: true })
      Games.update({ _id: currentGame._id }, { $set: { votes: game.voteCounter.tally } })
