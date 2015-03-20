game

Meteor.publish 'games', () ->
  Games.find({ current: true })

currentGame = Games.find({ current: true }).fetch()
if currentGame.length is 0
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
  updateGame: (direction) ->
    updateGame(direction)