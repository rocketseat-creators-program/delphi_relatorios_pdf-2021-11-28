object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 460
  Width = 526
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\_Documentos\Sistemas\delphi_relatorios_pdf-2021-11-2' +
        '8\banco_de_dados\banco_relatorios.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    TxOptions.AutoStop = False
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 48
    Top = 40
  end
  object FDTransaction1: TFDTransaction
    Options.AutoStop = False
    Connection = FDConnection1
    Left = 120
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 96
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 296
    Top = 152
  end
end
