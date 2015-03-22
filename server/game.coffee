voteCounter = new VoteCounter

Meteor.publish 'games', () ->
  Games.find({ current: true })

currentGame = Games.findOne({ current: true })
if currentGame is undefined
  game = new Game
  Games.insert({ grid: game.board.grid, current: true })
else
  board = new Board(currentGame.grid)
  game = new Game(board)

updateGame = (direction) ->
  game.move(direction)
  oldGrid = Games.findOne({ current: true })
  Games.update({ _id: oldGrid._id }, { $set: { grid: game.board.grid } })

Meteor.methods
  tallyVote: (vote) ->
    voteCounter.increment(vote)
