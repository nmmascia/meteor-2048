class @Game
  constructor: () ->
    @board = new Board

  calculateIncrements: () ->
    @board.shiftGrid()
    @board.reduceGrid()
    @board.shiftGrid()