inherited frmParamRelDepenMaioridade: TfrmParamRelDepenMaioridade
  Left = 204
  Top = 185
  Caption = 'Demonstrativo dos Dependentes que atingiram a Maioridade'
  ClientHeight = 186
  ClientWidth = 424
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 18
    Top = 133
    Width = 45
    Height = 13
    Caption = 'Produto'
  end
  inherited pnlFundo: TPanel
    Width = 424
    Height = 147
    object Patrocinadora: TLabel
      Left = 66
      Top = 15
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object label1: TLabel
      Left = 66
      Top = 57
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label3: TLabel
      Left = 66
      Top = 96
      Width = 125
      Height = 13
      Caption = 'Grau de Dependência'
    end
    object dblcpatro: TCMDBLookupCombo
      Left = 66
      Top = 32
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      LookupTable = qrypatro
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcSituacao: TCMDBLookupCombo
      Left = 66
      Top = 71
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição')
      LookupTable = qrySituacao
      LookupField = 'FLGINTERNO'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcGrauDepen: TCMDBLookupCombo
      Left = 66
      Top = 110
      Width = 292
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'15'#9'Descrição')
      LookupTable = qryGrauDepen
      LookupField = 'IDDEPENDENCIA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 147
    Width = 424
    inherited tb97Fundo: TToolbar97
      Left = 246
      DockPos = 246
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
      DockPos = 78
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 237
    Top = 21
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.IDPESSOA, P.NOME  '
      'FROM CM.PESSOA P'
      'WHERE P.FLGPATROCINADORA = 1 '
      'ORDER BY P.NOME ')
    ValidateWithMask = True
    Left = 312
    Top = 24
  end
  object qrySituacao: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT '
      ' DESCRICAO, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 312
    Top = 63
  end
  object qryGrauDepen: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' DESCRICAO, IDDEPENDENCIA'
      'FROM DEPEN'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 312
    Top = 102
  end
end
