getValues = (row) ->
  tile.value for tile in row

describe 'Board', () ->
  board = null
  flattened = null

  beforeEach ->
    board = new Board()
    flattened = [].concat.apply([], board.grid)

  it 'should exist', () ->
    expect(board instanceof Board).toBe(true)

  it 'should have a 4X4 grid', () ->
    expect(board.grid.length).toEqual(4)

  it 'should have 4 elements per row in grid', () ->
    board.grid.forEach (row) ->
      expect(row.length).toEqual(4)

  it 'should have 4 Tile elements per row in grid', () ->
    flattened.forEach (cell) ->
      expect(cell instanceof Tile).toBe(true)

  it 'should start with 2 active Tiles', () ->
    totalValue = (tile.value for tile in flattened when tile.value is 2)
    expect(totalValue).toEqual([2,2])

  it 'should be able to activate a tile', () ->
    board.activateTile()
    totalValue = (tile.value for tile in flattened when tile.value is 2)
    expect(totalValue.pop()).toEqual(2)

  it 'should reduce adjacent Tiles if they share a value', () ->
    board.grid[0][i].activate() for i in [0..1]
    board.reduceGrid()
    expect(board.grid[0][0].value).toEqual(4)
    expect(board.grid[0][1].value).toEqual(0)
    expect(board.grid[0].length).toEqual(4)

  it 'should be able to move inactive Tiles to end of row', () ->
    board.grid[0][i].decrement() for i in [0..1]
    board.grid[0][i].activate() for i in [2..3]
    board.shiftGrid()
    values = getValues(board.grid[0])
    expect(values).toEqual([2,2,0,0])

  it 'should be able to reverse Tiles in a row', () ->
    original = getValues(board.grid[0])
    board.reverseGrid()
    reversed = getValues(board.grid[0])
    expect(reversed).toEqual(original.reverse())

  it 'should be able to transpose its Tiles', () ->
    board.transposeGrid()
    gridOne = (getValues(row) for row in board.grid)
    board.transposeGrid() for i in [0..1]
    gridTwo = (getValues(row) for row in board.grid)
    expect(gridOne).toEqual(gridTwo)

  it 'should have a total score', () ->
    expect(board.scorer.currentScore).toBe(0)

  it 'should increment its score when tiles are combined', () ->
    board.grid[0][i].activate() for i in [0..1]
    board.reduceGrid()
    expect(board.scorer.currentScore).not.toBeLessThan(4)
