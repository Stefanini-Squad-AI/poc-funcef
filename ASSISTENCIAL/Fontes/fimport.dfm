inherited frmImport: TfrmImport
  Left = 208
  Top = 127
  BorderStyle = bsSingle
  Caption = 'Seleção da procedência do arquivo'
  ClientHeight = 264
  ClientWidth = 361
  FormStyle = fsNormal
  Visible = False
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 361
    Height = 225
    TabOrder = 2
  end
  inherited Dock971: TDock97
    Top = 225
    Width = 361
    inherited tb97Fundo: TToolbar97
      Left = 191
      DockPos = 191
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        Kind = bkCustom
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 225
    Width = 361
    Height = 41
    TabOrder = 3
  end
  object GroupBox1: TGroupBox [3]
    Left = 0
    Top = 0
    Width = 361
    Height = 225
    Align = alClient
    Caption = 'Origem do Arquivo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Bookman Old Style'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 113
      Width = 85
      Height = 13
      Caption = 'Plano Assistencial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 20
      Width = 66
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 68
      Width = 97
      Height = 13
      Caption = 'Plano Previdenciário'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 32
      Top = 35
      Width = 297
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qrypatro
      LookupField = 'IDPESSOA'
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = wwDBLookupCombo1Change
    end
    object wwDBLookupCombo3: TwwDBLookupCombo
      Left = 32
      Top = 81
      Width = 297
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      LookupTable = qryplanoprev
      LookupField = 'IDPLANOPREV'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = wwDBLookupCombo3Change
      OnClick = wwDBLookupCombo3Click
      OnEnter = wwDBLookupCombo3Click
      OnMouseDown = wwDBLookupCombo3MouseDown
    end
    object wwDBLookupCombo2: TwwDBLookupCombo
      Left = 32
      Top = 126
      Width = 297
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      LookupTable = qryplanass
      LookupField = 'IDPLANASS'
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnEnter = wwDBLookupCombo2Enter
      OnMouseDown = wwDBLookupCombo2MouseDown
    end
    object posicao: TProgressBar
      Left = 5
      Top = 204
      Width = 350
      Height = 13
      Min = 0
      Max = 1000
      TabOrder = 3
    end
    object Panel2: TPanel
      Left = 5
      Top = 155
      Width = 350
      Height = 47
      TabOrder = 4
      object Label4: TLabel
        Left = 24
        Top = 4
        Width = 86
        Height = 13
        Caption = 'Layout do Arquivo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object wwDBLookupCombo4: TwwDBLookupCombo
        Left = 24
        Top = 18
        Width = 297
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEARQ'#9'60'#9'NOMEARQ')
        LookupTable = qryArq
        LookupField = 'IDARQ'
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object Memo1: TMemo
      Left = 24
      Top = 16
      Width = 185
      Height = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 288
    Top = 104
  end
  object dspatro: TwwDataSource
    Left = 48
    Top = 152
  end
  object qryplanoprev: TwwQuery
    BeforeOpen = qryplanoprevBeforeOpen
    DatabaseName = 'BaseDados'
    DataSource = dspatro
    SQL.Strings = (
      
        'SELECT PLANPREV.IDPLANOPREV , PLANPREV.NOME , PLANPREVPATRO.IDPE' +
        'SSJUR '
      'FROM PLANPREV , PLANPREVPATRO'
      'WHERE '
      'PLANPREV.IDPLANOPREV  = PLANPREVPATRO.IDPLANOPREV AND'
      'PLANPREVPATRO.IDPESSJUR =  :IDPESSOA'
      ''
      'ORDER BY PLANPREV.NOME')
    Params.Data = {01000100084944504553534F410006080000000000000000000000}
    ValidateWithMask = True
    Left = 56
    Top = 29
  end
  object dsplanoprev: TwwDataSource
    DataSet = qryplanoprev
    Left = 80
    Top = 56
  end
  object qryplanass: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsplanoprev
    SQL.Strings = (
      'SELECT PLANASS.IDPLANASS , PLANASS.NOME'
      'FROM PLANASS , PLANPREVASS'
      'WHERE PLANASS.IDPLANASS = PLANPREVASS.IDPLANASS AND'
      'PLANPREVASS.IDPLANOPREV =  :IDPLANOPREV  AND'
      'PLANPREVASS.IDPESSJUR =  :IDPESSJUR'
      'ORDER BY PLANASS.NOME')
    Params.Data = {
      010002000B4944504C414E4F5052455600060800000000000000F03F00000949
      44504553534A55520006080000000000000000400000}
    ValidateWithMask = True
    Left = 16
    Top = 93
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 8
    Top = 144
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT IDPESSOA , NOME  FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 8
    Top = 53
  end
  object qrybenefass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM EVENTASS')
    ValidateWithMask = True
    Left = 176
    Top = 24
  end
  object qryArq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from arquivo'
      'ORDER BY NOMEARQ')
    ValidateWithMask = True
    Left = 123
    Top = 152
  end
  object OpenArq: TOpenArqText
    Filter = '*.txt'
    InitialDir = 'c:\'
    IdArq = 7
    Left = 208
    Top = 104
  end
end
