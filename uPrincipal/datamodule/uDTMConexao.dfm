object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 326
  Width = 658
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16'
      'AutoEncodeStrings=True')
    Connected = True
    HostName = '.\SHOPCONTROL9'
    Port = 0
    Database = 'Vendas'
    User = 'sa'
    Password = 'Senha123'
    Protocol = 'mssql'
    LibraryLocation = 
      'F:\Projetos\Delphi\delphi_e_sql-server_na_pratica\ProjetoDelphi\' +
      'dll\ntwdblib.dll'
    Left = 41
    Top = 32
  end
end
