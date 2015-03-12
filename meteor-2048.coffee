class @Board
  constructor: () ->
    @grid = @_createGrid()

  _createGrid: () ->
    grid = [ [0,0,0,0],
             [0,0,0,0],
             [0,0,0,0],
             [0,0,0,0]
           ]