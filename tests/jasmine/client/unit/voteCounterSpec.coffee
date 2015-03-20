describe 'VoteCounter', () ->
  voteCounter = null

  beforeEach ->
    voteCounter = new VoteCounter

  it 'should exist', () ->
    expect(voteCounter).toBeTruthy