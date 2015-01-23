assert = require 'assertive'
presenter = require '../lib/presenters'
{loadJSONMock} = require './helpers'

sampleJSON = loadJSONMock 'sample'

describe 'Presenter', ->
  it 'exists', ->
    assert.truthy presenter

  before ->
    @actual = presenter(sampleJSON)

  describe 'meta', ->
    it 'describes battery strength', ->
      assert.equal '2/3', @actual.meta.battery

    it 'describes wi-fi strength', ->
      assert.equal 'full', @actual.meta.wifiSignal

  describe 'time', ->
    it 'extracts age', ->
      assert.equal 1117.5732421875, @actual.time.age

    it 'extracts timestamp', ->
      assert.equal 1416871040, @actual.time.timestamp

  describe 'values', ->
    it 'extracts firmware version', ->
      assert.equal '2.0.2', @actual.values.firmwareVersion

    it 'extracts temperature', ->
      assert.equal 70, @actual.values.temperature

    it 'extracts vibration', ->
      assert.equal 0, @actual.values.vibration

    it 'extracts orientation', ->
      assert.equal 'top', @actual.values.orientation

    it 'extracts vibration state', ->
      assert.equal false, @actual.values.isVibrating

    it 'extracts battery voltage', ->
      assert.equal 2.69, @actual.values.batteryVoltage

    it 'extracts update mode', ->
      assert.equal 'normal', @actual.values.updateMode
