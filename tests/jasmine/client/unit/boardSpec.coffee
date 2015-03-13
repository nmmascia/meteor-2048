describe 'Board', () ->
  board = new Board()

  it 'should exist', () ->
    expect(board).toBeTruthy

  it 'should have a 4X4 grid', () ->
    expect(board.grid.length).toEqual(4)

  it 'should have 4 elements per row in grid', () ->
    board.grid.forEach (row) ->
      expect(row.length).toEqual(4)

  it 'should have 4 Tile elements per row in grid', () ->
    flattened = [].concat.apply([], board.grid)
    flattened.forEach (cell) ->
      expect(cell instanceof Tile).toBe(true)

  it 'should be able to activate a tile', () ->
    board.activateTile()
    flattened = [].concat.apply([], board.grid)
    totalValue = (tile.value for tile in flattened when tile.value is 2)
    expect(totalValue.pop()).toEqual(2)
