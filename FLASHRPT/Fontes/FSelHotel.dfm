inherited FrmSelHotel: TFrmSelHotel
  Left = 235
  Top = 257
  Caption = 'Hotel'
  ClientHeight = 131
  ClientWidth = 440
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 440
    Height = 92
    object Label1: TLabel
      Left = 33
      Top = 21
      Width = 106
      Height = 13
      Caption = 'Selecionar o Hotel'
    end
    object dblcSelHotel: TwwDBLookupCombo
      Left = 33
      Top = 35
      Width = 373
      Height = 21
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryHotel
      LookupField = 'IDHOTEL'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 92
    Width = 440
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryHotel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  HOTEL.IDHOTEL,'
      '        HOTEL.IDEMPCONDOMINIO,'
      '        PESSOA.IDPESSOA,'
      '        PESSOA.NOME '
      'FROM HOTEL,PESSOA'
      'WHERE ( HOTEL.IDPESSOA = :PESSOA) AND'
      '--      ( HOTEL.FLGUSANOSISTEMA = '#39'S'#39') AND'
      '--      ( HOTEL.FLGOUTROSHOTEIS = '#39'N'#39') AND'
      '      ( PESSOA.IDPESSOA  = HOTEL.IDHOTEL )'
      ''
      'ORDER BY PESSOA.NOME')
    Params.Data = {0100010006504553534F410006080000000000000000000000}
    ValidateWithMask = True
    Left = 30
    Top = 78
  end
end
