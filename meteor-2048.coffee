class @Board
  constructor: () ->
    @grid = @_createGrid()

  _createGrid: () ->
    grid = [ [0,0,0,0],
             [0,0,0,0],
             [0,0,0,0],
             [0,0,0,0]
           ]

class @Tile
  constructor: (@value) ->
    @value ?= 0

  isActive: () ->
    @value > 0

  increment: () ->
    @value = @value * 2

  decrement: () ->
    @value = 0