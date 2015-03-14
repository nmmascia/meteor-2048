class @Game
  constructor: () ->
    @board = new Board

  calculateIncrements: () ->
    @board.shiftGrid()
    @board.reduceGrid()
    @board.shiftGrid()

  moveLeft: () ->
    @calculateIncrements()

  moveRight: () ->
    @board.reverseGrid()
    @calculateIncrements()
    @board.reverseGrid()

  moveUp: () ->
    @board.transposeGrid()
    @calculateIncrements()
    @board.transposeGrid()
