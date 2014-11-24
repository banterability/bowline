VALUE_MAP =
  "00": 'firmwareVersion'
  "01": 'temperature'
  "02": 'vibration'
  "03": 'orientation'
  "04": 'isVibrating'
  "05": 'batteryVoltage'
  # "06": not currently used
  "07": 'updateMode'

module.exports = (response) ->
  response
