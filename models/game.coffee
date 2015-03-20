class @Game
  'use strict'

  constructor: () ->
    @board = new Board

  calculateIncrements: () ->
    @board.shiftGrid()
    @board.reduceGrid()
    @board.shiftGrid()

  move: (direction) ->
    duplicate = @getValues(@board.grid)
    switch direction
      when 'left'   then @moveLeft()
      when 'right'  then @moveRight()
      when 'up'     then @moveUp()
      when 'down'   then @moveDown()
    solution = @getValues(@board.grid)
    if duplicate.toString() isnt solution.toString()
      @board.activateTile()
      @board.toString()
    else
      false

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

  moveDown: () ->
    @board.transposeGrid()
    @board.reverseGrid()
    @calculateIncrements()
    @board.reverseGrid()
    @board.transposeGrid()

  getValues: (grid) ->
    flattened = [].concat.apply([], grid)
    values = (tile.value for tile in flattened)
