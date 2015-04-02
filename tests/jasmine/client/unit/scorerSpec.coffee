describe 'Scorer', () ->
  scorer = null
  savedScorer = null
  randomPoints = null

  beforeEach ->
    scorer = new Scorer
    randomPoints = Math.random()
    savedScorer = new Scorer(randomPoints)

  it 'should exist and start at 0 if no previous score', () ->
    expect(scorer).toEqual(jasmine.any(Scorer))
    expect(scorer.currentScore).not.toBe(undefined)
    expect(scorer.currentScore).toEqual(0)

  it 'should be able to start with an existing score', () ->
    expect(savedScorer.currentScore).toBeGreaterThan(0)

  it 'should increment the currentScore by given points', () ->
    previousScore = scorer.currentScore
    scorer.increment(randomPoints)
    expect(scorer.currentScore).toBeGreaterThan(previousScore)
    expect(scorer.currentScore).toEqual(randomPoints)