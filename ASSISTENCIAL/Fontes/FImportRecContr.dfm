inherited frmImportRecContr: TfrmImportRecContr
  Left = 217
  Top = 170
  Caption = 'Seleção da Procedência do Arquivo'
  ClientWidth = 360
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 360
    TabOrder = 2
  end
  inherited Dock971: TDock97
    Width = 360
    inherited tb97Fundo: TToolbar97
      Left = 190
      DockPos = 190
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        Kind = bkCustom
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 41
    TabOrder = 3
    object pnBotoes: TPanel
      Left = 113
      Top = 0
      Width = 185
      Height = 41
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 360
    Height = 234
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
    object cmbpatro: TwwDBLookupCombo
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
      OnChange = cmbpatroChange
    end
    object posicao: TProgressBar
      Left = 5
      Top = 204
      Width = 350
      Height = 13
      Min = 0
      Max = 1000
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 5
      Top = 155
      Width = 350
      Height = 47
      TabOrder = 2
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
      object cmbarq: TwwDBLookupCombo
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
      Left = 224
      Top = -48
      Width = 185
      Height = 89
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        'Memo1')
      ParentFont = False
      TabOrder = 3
      Visible = False
    end
    object cmbplanprev: TwwDBLookupCombo
      Left = 32
      Top = 84
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
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cmbplanass: TwwDBLookupCombo
      Left = 32
      Top = 128
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
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  object OpenArq: TOpenArqText
    Filter = '*.txt'
    InitialDir = 'c:\'
    IdArq = 7
    Left = 216
    Top = 202
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA , NOME  FROM PESSOA '
      'WHERE FLGPATROCINADORA = 1'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 8
    Top = 65535
    object qrypatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qrypatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object dsplanass: TwwDataSource
    AutoEdit = False
    DataSet = qryplanass
    Left = 168
    Top = 154
  end
  object qryplanass: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    DataSource = dsplanoprev
    SQL.Strings = (
      'SELECT PLANASS.IDPLANASS , PLANASS.NOME'
      'FROM PLANASS , PLANPREVASS'
      'WHERE PLANASS.IDPLANASS = PLANPREVASS.IDPLANASS AND'
      'PLANPREVASS.IDPLANOPREV =  :IDPLANOPREV  AND'
      'PLANPREVASS.IDPESSJUR =  :IDPESSJUR'
      'ORDER BY NOME')
    Params.Data = {
      010002000B4944504C414E4F5052455600060800000000000000000001000949
      44504553534A55520006080000000000000000000100}
    ValidateWithMask = True
    Left = 200
    Top = 135
  end
  object dspatro: TwwDataSource
    Left = 24
    Top = 10
  end
  object qryArq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from arquivo'
      'ORDER BY NOMEARQ')
    ValidateWithMask = True
    Left = 171
    Top = 202
  end
  object qryplanoprev: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    Constraints = <
      item
        FromDictionary = False
      end>
    DataSource = dspatro
    SQL.Strings = (
      'SELECT PL.NOME ,PL.IDPLANOPREV ,P.IDPESSJUR'
      'FROM PLANPREV PL , PLANPREVPATRO P '
      'WHERE  PL.IDPLANOPREV = P.IDPLANOPREV AND'
      'P.IDPESSJUR = :IDPESSOA'
      'ORDER BY NOME')
    Params.Data = {01000100084944504553534F410006080000000000000000000000}
    ValidateWithMask = True
    Left = 224
    Top = 63
  end
  object dsplanoprev: TwwDataSource
    AutoEdit = False
    DataSet = qryplanoprev
    Left = 248
    Top = 66
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 114
  end
  object qrycontribass: TwwQuery
    ValidateWithMask = True
    Left = 160
  end
end
 
