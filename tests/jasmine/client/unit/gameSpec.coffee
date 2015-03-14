getValues = (row) ->
  tile.value for tile in row

describe 'Game', () ->
  game = new Game()

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