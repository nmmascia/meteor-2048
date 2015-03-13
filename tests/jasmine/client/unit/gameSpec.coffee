describe 'Game', () ->
  game = new Game()

  it 'should exist', () ->
    expect(game).toBeTruthy

  it 'should have a board', () ->
    expect(game.board).toBeTruthy
    expect(game.board instanceof Board).toBe(true)