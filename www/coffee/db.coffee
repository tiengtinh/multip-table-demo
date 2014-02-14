
db =
  multipTableData : [  
    {a: 2, color: 'blue'}
    {a: 3, color: 'purple'}
    {a: 4, color: 'yellow'}
    {a: 5, color: 'red'}
    {a: 6, color: 'mint'}
    {a: 7, color: 'dark-blue'}
    {a: 8, color: 'tint'}
    {a: 9, color: 'pink'}
    ##{a: 10, color: 'dark-gray'}
  ]

  findColor : (a) ->
    for data in db.multipTableData
      return data.color if data.a == a
    return 'blue'
  allColor : () ->
    db.multipTableData.map((data) -> data.color)

