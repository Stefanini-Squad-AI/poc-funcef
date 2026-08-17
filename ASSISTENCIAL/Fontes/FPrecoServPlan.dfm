inherited frmPrecoServPlanass: TfrmPrecoServPlanass
  Left = 142
  Top = 195
  Caption = 'Valor e Regras de Serviços por Planos'
  ClientHeight = 306
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 267
    Font.Height = -11
    Font.Style = []
    ParentFont = False
    object Label1: TLabel
      Left = 14
      Top = 51
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label2: TLabel
      Left = 14
      Top = 7
      Width = 77
      Height = 13
      Caption = 'Serviço / Plano '
    end
    object edservplan: TEdit
      Left = 14
      Top = 24
      Width = 401
      Height = 21
      Color = cl3DLight
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object edpreco: TRealEdit
      Left = 15
      Top = 66
      Width = 121
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 96
      Width = 518
      Height = 166
      Align = alBottom
      Caption = 'Regras'
      TabOrder = 2
      object Label3: TLabel
        Left = 56
        Top = 19
        Width = 126
        Height = 13
        Caption = 'Pagamento ao Fornecedor'
      end
      object Label4: TLabel
        Left = 56
        Top = 66
        Width = 117
        Height = 13
        Caption = 'Comissão do Fornecedor'
      end
      object Label5: TLabel
        Left = 56
        Top = 112
        Width = 53
        Height = 13
        Caption = 'Reembolso'
      end
      object cmbregrapag: TwwDBLookupCombo
        Left = 56
        Top = 36
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPAG'#9'60'#9'NOMEPAG')
        LookupTable = qryregra
        LookupField = 'PAG'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object cmbregrareemb: TwwDBLookupCombo
        Left = 56
        Top = 128
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREEMB'#9'60'#9'NOMEREEMB')
        LookupTable = qryregra3
        LookupField = 'REEMB'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object cmbregracomiss: TwwDBLookupCombo
        Left = 56
        Top = 82
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECOMISS'#9'60'#9'NOMECOMISS')
        LookupTable = qryregra2
        LookupField = 'COMISS'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 267
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qrypreco: TwwQuery
    BeforeOpen = qryprecoBeforeOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 56
  end
  object dspreco: TwwDataSource
    DataSet = qrypreco
    Left = 200
    Top = 56
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 144
    Top = 8
  end
  object qryregra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT REGRA.IDREGRA PAG, REGRA.NOMEREGRA NOMEPAG '
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 429
    Top = 104
  end
  object qryregra2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT REGRA.IDREGRA COMISS , REGRA.NOMEREGRA NOMECOMISS '
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 429
    Top = 168
  end
  object qryregra3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT REGRA.IDREGRA REEMB , REGRA.NOMEREGRA NOMEREEMB'
      'FROM  REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 429
    Top = 216
  end
end
