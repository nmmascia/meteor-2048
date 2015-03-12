describe 'Board', () ->
  board = new Board()

  it 'should exist', () ->
    expect(board).toBeTruthy

  it 'should have a 4X4 grid', () ->
    expect(board.grid.length).toEqual(4)

  it 'should have 4 elements per row in grid', () ->
    board.grid.forEach (row) ->
      expect(row.length).toEqual(4)

describe 'Tile', () ->
  tile = new Tile()
  valuedTile = new Tile(2)

  it 'should exist', () ->
    expect(tile).toBeTruthy

  it 'should have a value', () ->
    expect(typeof tile.value).toBe('number')

  it 'can be passed a value', () ->
    expect(tile.value).toEqual(0)
    expect(valuedTile.value).toEqual(2)

  it 'active if greater than 0', () ->
    expect(tile.isActive()).toBe(false)
    expect(valuedTile.isActive()).toBe(true)

  it 'can increment its value', () ->
    valuedTile.increment()
    expect(valuedTile.value).toEqual(4)

  it 'can reset its value', () ->
    valuedTile.decrement()
    expect(valuedTile.isActive()).toBe(false)
    expect(valuedTile.value).toEqual(0)