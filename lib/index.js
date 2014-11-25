// Generated by CoffeeScript 1.8.0
var Bowline, presentValues, request;

request = require('request');

presentValues = require('./presenter');

Bowline = (function() {
  function Bowline(options) {
    if (options == null) {
      options = {};
    }
    console.log('init with options', options);
    this.email = options.email;
    this.password = options.password;
    this.deviceId = options.deviceId;
    if (!(this.email && this.password && this.deviceId)) {
      throw new Error('missing required parameter');
    }
  }

  Bowline.prototype.authorize = function(callback) {
    var cookieJar, options;
    cookieJar = request.jar();
    options = {
      form: {
        email: this.email,
        password: this.password
      },
      url: 'https://twine.cc/login',
      jar: cookieJar
    };
    return request.post(options, function(err, res, body) {
      return callback(err, {
        cookies: cookieJar
      });
    });
  };

  Bowline.prototype.fetch = function(callback) {
    var deviceId;
    deviceId = this.deviceId;
    return this.authorize(function(err, data) {
      var options;
      options = {
        url: "https://twine.cc/" + deviceId + "/rt?cached=1",
        json: true,
        jar: data.cookies
      };
      return request.get(options, function(err, res, body) {
        return callback(err, presentValues(body));
      });
    });
  };

  return Bowline;

})();

module.exports = Bowline;