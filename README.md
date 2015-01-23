Bowline
-------

An involuntary API for Supermechanical's [Twine][0].


## Installation

```bash
npm install bowline
```


## Usage

Key        | Value
---        | -----
`email`    | Your email address for [twine.cc][1].
`password` | Your password for [twine.cc][1].
`deviceId` | Your Twine's unique ID. You can find this in the URL of your Twine's "Rules" page – see [this (hopefully) helpful diagram][2].

[0]: http://supermechanical.com/twine/
[1]: https://twine.cc/login
[2]: http://cl.ly/TeNO/Screen_Shot_2014-01-30_at_12.40.48_PM.jpg

```javascript
var Bowline = require('bowline');

var client = new Bowline({
  email: 'twine@example.net',
  password: 'sekret',
  deviceId: '00ff00ff00ff00ff'
});

client.fetch(function(err, response){
  // do something
});
```


## Response Structure

```javascript
{
  meta: {
    battery: 'weak',
    wifiSignal: 'full'
  },
  time: {
    age: 32.436,
    timestamp: 1418069760
  },
  values: {
    batteryVoltage: 2942324,
    firmwareVersion: '2.0.2'
    isVibrating: false,
    orientation: 'top'
    temperature: 68,
    updateMode: 'normal',
    vibration: 0
  }
}
```

### Meta

Key          | Sample Value | Notes
---          | ------------ | -----
`battery`    | `'1/3'`      | Possible values: `plugged in`, `full`, `2/3`, `1/3`, `weak`, `unknown`
`wifiSignal` | `'full'`     | Possible values: `full`, `2/3`, `1/3`, `weak`, `unknown`

### Time

Key         | Sample Value | Notes
---         | ------------ | -----
`age`       | `32.436`     | Seconds since data updated
`timestamp` | `1418069760` | Unix timestamp of data update time

### Values

Key               | Sample Value | Notes
---               | ------------ | -----
`firmwareVersion` | `'2.0.2'`    |
`temperature`     | `70`         | in degress Fahrenheit
`vibration`       | `0`          | in milli-Gs
`orientation`     | `'top'`      | Possible values: `top`, `bottom`, `left`, `right`, `front`, `back`
`isVibrating`     | `false`      | Possible values: `true`, `false`
`batteryVoltage`  | `2.68`       | in volts
`updateMode`      | `'normal'`   | Possible values: `normal`, `fast`


## Development

Command      | Description
-------      | ------------
`make build` | Compile from Coffeescript
`make test`  | Compile and run tests
