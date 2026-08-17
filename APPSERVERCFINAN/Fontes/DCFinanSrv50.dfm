object DmCFinanSrv50: TDmCFinanSrv50
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  OnDestroy = RemoteDataModuleDestroy
  Left = 139
  Top = 164
  Height = 480
  Width = 696
  object DbCFinan: TDatabase
    DriverName = 'ORACLE'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 24
    Top = 24
  end
  object ssnCFinan: TSession
    Left = 88
    Top = 24
  end
end
