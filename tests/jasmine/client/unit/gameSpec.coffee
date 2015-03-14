getValues = (row) ->
  tile.value for tile in row

emptyTiles = (grid) ->
  grid.map (row) ->
    tile.decrement() for tile in row

describe 'Game', () ->
  game = null

  beforeEach ->
    game = new Game

  it 'should exist', () ->
    expect(game).toBeTruthy

  it 'should have a board', () ->
    expect(game.board).toBeTruthy
    expect(game.board instanceof Board).toBe(true)

  it 'should calculate any needed increments', () ->
    game.board.grid[0][i].value = 2 for i in [0..3]
    game.calculateIncrements()
    values = getValues(game.board.grid[0])
    expect(values).toEqual([4,4,0,0])

  it 'should be able to move all Tiles to the left', () ->
    game.board.grid[0][i].value = 2 for i in [0..3]
    game.moveLeft()
    values = getValues(game.board.grid[0])
    expect(values).toEqual([4,4,0,0])

  it 'should be able to move all Tiles to the right', () ->
    game.board.grid[i][0].value = 2 for i in [0..3]
    game.moveRight()
    game.board.grid.forEach (row) ->
      expect(row[3].value).toBeGreaterThan(0)

  it 'should be able to move all Tiles upward', () ->
    game.board.grid[3] = [new Tile(2), new Tile(2), new Tile(2), new Tile(2)]
    game.moveUp()
    game.board.grid[0].forEach (tile) ->
      expect(tile.isActive()).toBe(true)

  it 'should be able to move all Tiles downward', () ->
    game.board.grid[0] = [new Tile(2), new Tile(2), new Tile(2), new Tile(2)]
    game.moveDown()
    game.board.grid[3].forEach (tile) ->
      expect(tile.isActive()).toBe(true)

  it 'should return false in a no move situation', () ->
    emptyTiles(game.board.grid)
    game.board.grid[0] = [new Tile(4), new Tile(4), new Tile(4), new Tile(4)]
    expect(game.move('up')).toBe(false)
