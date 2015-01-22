VALUE_MAP =
  "00": 'firmwareVersion'
  "01": 'temperature'
  "02": 'vibration'
  "03": 'orientation'
  "04": 'isVibrating'
  "05": 'batteryVoltage'
  # "06": not currently used
  "07": 'updateMode'

presentValues = (response) ->
  output = {}

  for tuple in response.values
    [key, value] = tuple
    identifier = key.substr(-2, 2)
    if friendlyName = VALUE_MAP[identifier]
      output[friendlyName] = value

  makeValuesUseful(output)

makeValuesUseful = (values) ->
  # hundreths of degrees F -> degrees F
  values.temperature = values.temperature / 100

  # binary -> bool
  values.isVibrating = if values.isVibrating == 0 then false else true

  # binary -> descriptive
  values.updateMode = if values.updateMode == 0 then 'normal' else 'fast'

  values

module.exports = presentValues
