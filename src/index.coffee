request = require 'request'
presentValues = require './presenter'

class Bowline
  constructor: (options = {}) ->
    @email = options.email
    @password = options.password
    @deviceId = options.deviceId

    unless @email && @password && @deviceId
      throw new Error 'missing required parameter'

  authorize: (callback) ->
    cookieJar = request.jar()
    options =
      form: {@email, @password}
      url: 'https://twine.cc/login'
      jar: cookieJar

    request.post options, (err, res, body) ->
      callback err, {cookies: cookieJar}

  fetch: (callback) ->
    deviceId = @deviceId

    @authorize (err, data) ->
      options =
        url: "https://twine.cc/#{deviceId}/rt?cached=1"
        json: true
        jar: data.cookies

      request.get options, (err, res, body) ->
        callback err, presentValues(body)

module.exports = Bowline
