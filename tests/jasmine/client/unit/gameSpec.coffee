describe 'Board', () ->
  board = new Board()

  it 'should exist', () ->
    expect(board).toBeTruthy

  it 'should have a 4X4 grid', () ->
    expect(board.grid.length).toEqual(4)

  it 'should have 4 elements per row in grid', () ->
    board.grid.forEach (row) ->
      expect(row.length).toEqual(4)