presentMetadata = require './meta'
presentTime = require './time'
presentValues = require './values'

module.exports = (response) ->
  values = presentValues response

  {
    meta: presentMetadata response, values
    time: presentTime response
    values: values
  }
