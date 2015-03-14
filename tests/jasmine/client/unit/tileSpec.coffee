describe 'Tile', () ->
  tile = null
  valuedTile = null

  beforeEach ->
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

  it 'can activate itself', () ->
    active = tile
    active.activate()
    expect(active.isActive()).toBe(true)
    expect(active.value).toEqual(2)