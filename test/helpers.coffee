fs = require 'fs'

module.exports =
  loadJSONMock: (filename) ->
    JSON.parse fs.readFileSync "test/mocks/#{filename}"
