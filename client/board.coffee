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
    @grid = (@reduceRow(row) for row in @grid)

  reduceRow: (row) ->
    for tile, cell in row[0..2] when tile.value is row[cell + 1].value
      if tile.isActive() and row[cell + 1].isActive()
        tile.increment()
        row[cell + 1].decrement()

  shiftGrid: () ->
    @grid = (@shiftTiles(row) for row in @grid)

  shiftTiles: (row) ->
    activeTiles = []
    inactiveTiles = []
    (if tile.isActive() then activeTiles else inactiveTiles).push tile for tile in row
    row = activeTiles.concat(inactiveTiles)

  reverseGrid: () ->
    @grid = (@reverseRow(row) for row in @grid)

  reverseRow: (row) ->
    row.reverse()

  transposeGrid: () ->
    @grid = _.zip.apply(_, @grid)

  toString: () ->
    string = ""
    @grid.forEach (row) ->
      string += "\n"
      row.forEach (tile) ->
        string += tile.toString()
    string