presentValues = require './presenter'
request = require 'request'

class Bowline
  constructor: (options = {}) ->
    @authorized = false
    @deviceId = options.deviceId
    @email = options.email
    @password = options.password

    unless @email && @password && @deviceId
      throw new Error 'missing required parameter'

  authorize: (callback) ->
    cookieJar = request.jar()
    options =
      form: {@email, @password}
      jar: cookieJar
      url: 'https://twine.cc/login'

    request.post options, (err, res, body) =>
      @cookies = cookieJar
      @authorized = true
      callback err, null

  fetch: (callback) ->
    return @fetchData callback if @authorized
    @authorize => @fetchData callback

  fetchData: (callback) ->
    options =
      jar: @cookies
      json: true
      url: "https://twine.cc/#{@deviceId}/rt?cached=1"

    request.get options, (err, res, body) ->
      callback err, presentValues(body)

module.exports = Bowline
