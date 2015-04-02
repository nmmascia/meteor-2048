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
    expect(game instanceof Game).toBe(true)

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

  it 'should be able make an identical copy of the board', () ->
    game.board.activateTile() for [1..4]
    copy = game.copyBoard()
    [0..3].forEach (num) ->
      expect(copy.grid[num]).toEqual(game.board.grid[num])

  it 'should return false if game is not over', () ->
    expect(game.isGameOver()).toBe(false)

  it 'should return true if game is over', () ->
    tiles = ({value: num} for num in [1..16])
    grid = (tiles.splice(0,4) while tiles.length)
    brokenBoard = new Board(grid)
    lostGame = new Game(brokenBoard, 1)
    expect(lostGame.isGameOver()).toBe(true)