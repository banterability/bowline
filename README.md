Bowline
-------

An involuntary API for Supermechanical's [Twine][0].

## Configuration

Key        | Value
---        | -----
`email`    | Your email address for [twine.cc][1].
`password` | Your password for [twine.cc][1].
`deviceId` | Your Twine's unique ID. You can find this in the URL of your Twine's "Rules" page – see [this (hopefully) helpful diagram][2].

[0]: http://supermechanical.com/twine/
[1]: https://twine.cc/login
[2]: http://cl.ly/TeNO/Screen_Shot_2014-01-30_at_12.40.48_PM.jpg

## Usage

```coffeescript
Bowline = require 'bowline'

client = new Bowline {
  email: 'twine@example.net'
  password: 'sekret'
  deviceId: '00ff00ff00ff00ff'
}

client.fetch (err, values) ->
  # do something
```

## Response Structure

Key               | Sample Value | Notes
---               | ------------ | -----
`firmwareVersion` | `'2.0.2'`    |
`temperature`     | `70`         | in degress Fahrenheit
`vibration`       | `0`          | in milli-Gs
`orientation`     | `'top'`      | `top`, `bottom`, `left`, `right`, `front`, `back`
`isVibrating`     | `false`      | `true` or `false`
`batteryVoltage`  | `2688903`    | in microvolts
`updateMode`      | `'normal'`   | `normal` or `fast`
