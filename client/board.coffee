class @Board
  constructor: () ->
    @grid = @_createGrid()

  _createGrid: () ->
    tiles = (new Tile for [1..16])
    grid = (tiles.splice(0,4) while tiles.length)

  activateTile: () ->
    row = _.random(0, 3)
    cell = _.random(0, 3)
    tile = @grid[row][cell]
    if tile.isActive() then @activateTile() else tile.activate()

  toString: () ->
    string = ""
    @grid.forEach (row) ->
      string += "\n"
      row.forEach (tile) ->
        string += "#{tile.toString()}"
    string