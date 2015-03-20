describe 'VoteCounter', () ->
  voteCounter = null

  beforeEach ->
    voteCounter = new VoteCounter

  it 'should exist', () ->
    expect(voteCounter instanceof VoteCounter).toBe(true)

  it 'should have a vote tally object', () ->
    expect(voteCounter.tally instanceof Object).toBe(true)

  it 'tally should start with 0 votes for all keys by default', () ->
    total = 0
    votes = ''
    total += tally for vote, tally of voteCounter.tally
    votes += "#{vote}" for vote, tally of voteCounter.tally
    expect(total).toBe(0)
    expect(votes).toBe('updownleftright')