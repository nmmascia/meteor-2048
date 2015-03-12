class @Board
  constructor: () ->
    @grid = @_createGrid()

  _createGrid: () ->
    tiles = (new Tile for [1..16])
    grid = (tiles.splice(0,4) while tiles.length)

  toString: () ->
    string = ""
    @grid.forEach (row) ->
      string += "\n"
      row.forEach (tile) ->
        string += "#{tile.toString()}"
    string