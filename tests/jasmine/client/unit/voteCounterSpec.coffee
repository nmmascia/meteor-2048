describe 'VoteCounter', () ->
  voteCounter = null

  beforeEach ->
    voteCounter = new VoteCounter

  it 'should exist', () ->
    expect(voteCounter instanceof VoteCounter).toBe(true)

  it 'should have a vote tally object', () ->
    expect(voteCounter.tally instanceof Object).toBe(true)

  it 'tally should start with 0 votes for four directional keys by default', () ->
    total = 0, votes = ''
    string += "#{vote}:#{tally}|" for vote, tally of voteCounter.tally
    expect(string).toBe("up:0|down:0|left:0|right:0|")