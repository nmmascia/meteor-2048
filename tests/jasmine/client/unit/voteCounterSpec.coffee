describe 'VoteCounter', () ->
  voteCounter = null

  beforeEach ->
    voteCounter = new VoteCounter

  it 'should exist', () ->
    expect(voteCounter instanceof VoteCounter).toBe(true)

  it 'should have a vote tally object', () ->
    expect(voteCounter.tally instanceof Object).toBe(true)