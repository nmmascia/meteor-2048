Meteor.publish 'games', () ->
  Games.find({ current: true })

currentGame = Games.findOne({ current: true })
if currentGame.length is 0
  game = new Game
  Games.insert({ grid: game.board.grid, current: true })
else
  board = new Board(currentGame.grid)
  game = new Game(board)