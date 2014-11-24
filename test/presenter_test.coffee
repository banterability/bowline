assert = require 'assertive'
presenter = require '../lib/presenter'
{loadJSONMock} = require './helpers'

sampleJSON = loadJSONMock 'sample'

describe 'Presenter', ->
  it 'exists', ->
    assert.truthy presenter

  describe 'renames and formats values', ->
    before ->
      @actual = presenter(sampleJSON)

    it 'extracts firmware version', ->
      assert.equal '2.0.2', @actual.firmwareVersion

    it 'extracts temperature', ->
      assert.equal 70, @actual.temperature

    it 'extracts vibration', ->
      assert.equal 0, @actual.vibration

    it 'extracts orientation', ->
      assert.equal 'top', @actual.orientation

    it 'extracts vibration state', ->
      assert.equal false, @actual.isVibrating

    it 'extracts battery voltage', ->
      assert.equal 2688903, @actual.batteryVoltage

    it 'extracts update mode', ->
      assert.equal 'normal', @actual.updateMode
