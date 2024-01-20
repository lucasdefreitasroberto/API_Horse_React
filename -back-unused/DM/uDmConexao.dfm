object DMConexao: TDMConexao
  OldCreateOrder = False
  Height = 173
  Width = 299
  object con: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      
        'Database=C:\Users\HAHA\Desktop\api-with-horse-and-react\back\DAD' +
        'OS\PRODUTO.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 96
    Top = 64
  end
  object FQuery: TFDQuery
    Connection = con
    Left = 160
    Top = 64
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_2_5\bin\fbclient.dll'
    Left = 216
    Top = 64
  end
end
