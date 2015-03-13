class @Board
  constructor: () ->
    @grid = @_createGrid()
    @activateTile() for [1..2]

  _createGrid: () ->
    tiles = (new Tile for [1..16])
    grid = (tiles.splice(0,4) while tiles.length)

  activateTile: () ->
    row = _.random(0, 3)
    cell = _.random(0, 3)
    tile = @grid[row][cell]
    if tile.isActive() then @activateTile() else tile.activate()

  reduceGrid: () ->
    @grid.forEach (row) ->
      @reduceRow(row)

  reduceRow: (row) ->
    for tile, cell in row[0..2] when tile.value is row[cell + 1].value
      if tile.isActive() and row[cell + 1].isActive()
        tile.increment()
        row[cell + 1].decrement()

  toString: () ->
    string = ""
    @grid.forEach (row) ->
      string += "\n"
      row.forEach (tile) ->
        string += "#{tile.toString()}"
    string