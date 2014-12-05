presentTime = (response) ->
  {
    age: response.age
    timestamp: response.ts
  }

module.exports = presentTime
