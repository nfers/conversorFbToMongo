object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 236
  Width = 388
  object ConFb: TFDConnection
    Left = 104
    Top = 32
  end
  object ConMongo: TFDConnection
    Left = 208
    Top = 34
  end
  object BatchMoveSqlReader: TFDBatchMoveSQLReader
    Connection = ConFb
    Left = 48
    Top = 104
  end
  object BatchMove: TFDBatchMove
    Writer = BatchMoveDataSetWriter
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 161
    Top = 104
  end
  object BatchMoveDataSetWriter: TFDBatchMoveDataSetWriter
    Left = 282
    Top = 104
  end
  object qryMongo: TFDMongoQuery
    Connection = ConMongo
    Left = 160
    Top = 168
  end
end
