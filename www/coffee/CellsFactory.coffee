CellsFactory =  

  create: (arrayData) ->
    cellModels = []
    for cellData in arrayData    
      cellModels.push(new CellModel(cellData))      
    cellModels

