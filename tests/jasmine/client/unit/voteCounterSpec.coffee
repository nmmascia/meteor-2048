describe 'VoteCounter', () ->
  voteCounter = null
  voteCounterIncremented = null
  vote = null

  beforeEach ->
    voteCounter = new VoteCounter
    voteCounterIncremented = new VoteCounter
    vote = ['up', 'down', 'left', 'right']
    vote.forEach (direction) ->
      voteCounterIncremented.increment(direction)

  it 'should exist', () ->
    expect(voteCounter instanceof VoteCounter).toBe(true)

  it 'should have a vote tally object', () ->
    expect(voteCounter.tally instanceof Object).toBe(true)

  it 'tally should start with 0 votes for four directional keys by default', () ->
    string = ''
    string = ("#{vote}:#{count}|" for vote, count of voteCounter.tally)
    expect(string.join('')).toEqual("up:0|down:0|left:0|right:0|")

  it 'should be able to increment tallies', () ->
    vote.forEach (direction) ->
      expect(voteCounterIncremented.tally[direction]).toBe(1)

  it 'should be able to reset all tallies', () ->
    voteCounterIncremented.reset()
    vote.forEach (direction) ->
      expect(voteCounterIncremented.tally[direction]).toBe(0)

  it 'should return the most voted direction', () ->
    voteCounter.increment('up')
    expect(voteCounter.mostVotes()).toBe('up')