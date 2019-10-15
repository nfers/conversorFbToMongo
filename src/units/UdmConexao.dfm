object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 466
  Width = 659
  object ConFb: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\Desenvolvedor\Desktop\Tarefas\Tron x Tron\9654' +
        '08\948405.IDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 32
  end
  object BatchMoveSqlReader: TFDBatchMoveSQLReader
    Connection = ConFb
    Left = 48
    Top = 104
  end
  object BatchMove: TFDBatchMove
    Reader = BatchMoveSqlReader
    Writer = BatchMoveDataSetWriter
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 161
    Top = 104
  end
  object BatchMoveDataSetWriter: TFDBatchMoveDataSetWriter
    Direct = True
    DataSet = qryMongo
    Left = 322
    Top = 120
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Tron\Folha\fbclient.dll'
    Left = 48
    Top = 160
  end
  object ConMongo: TFDConnection
    ConnectionName = 'Mongo'
    LoginPrompt = False
    Left = 236
    Top = 27
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 440
    Top = 264
  end
  object FDPhysMongoDriverLink1: TFDPhysMongoDriverLink
    DriverID = 'Mongo'
    Left = 360
    Top = 24
  end
  object MongoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Mongo')
    Connected = True
    LoginPrompt = False
    Left = 272
    Top = 254
  end
  object qryMongo: TFDMongoQuery
    IndexesActive = False
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connection = MongoConnection
    Left = 120
    Top = 328
  end
end
