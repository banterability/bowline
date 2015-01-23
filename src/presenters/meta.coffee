presentMetadata = (response, {batteryVoltage}) ->
  {
    battery: presentBatteryStrength batteryVoltage
    wifiSignal: presentWiFiStrength response
  }

presentBatteryStrength = (voltage) ->
  # thresholds from twine.cc web front-end
  if voltage
    return 'plugged in' if voltage < 1.3
    switch
      when voltage > 2.75 then 'full'
      when voltage > 2.6 then '2/3'
      when voltage > 2.45 then '1/3'
      else 'weak'
  else
    'unknown'

presentWiFiStrength = (response) ->
  # thresholds from twine.cc web front-end
  if strength = response.rssi
    switch
      when strength > 203 then 'full'
      when strength > 195 then '2/3'
      when strength > 185 then '1/3'
      else 'weak'
  else
    'unknown'

module.exports = presentMetadata
