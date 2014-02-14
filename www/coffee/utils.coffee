
_ =
  exist: (array, toChecked) ->
    for item in array then return true if toChecked == item
    false

  countDigit: (num) -> (num + '').length
