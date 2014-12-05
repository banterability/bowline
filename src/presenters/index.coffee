presentTime = require './time'
presentValues = require './values'

module.exports = (response) ->
  time: presentTime response
  values: presentValues response
