inherited frmParamRelGrauDependencia: TfrmParamRelGrauDependencia
  Left = 204
  Top = 185
  Caption = 'Demonstrativo de Grau de Dependências'
  ClientHeight = 142
  ClientWidth = 364
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
    Width = 364
    Height = 103
    object Patrocinadora: TLabel
      Left = 36
      Top = 32
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object dblcpatro: TCMDBLookupCombo
      Left = 36
      Top = 49
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
  end
  inherited Dock971: TDock97
    Top = 103
    Width = 364
    inherited tb97Fundo: TToolbar97
      Left = 194
      DockPos = 194
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 26
      DockPos = 26
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
    Left = 285
    Top = 33
  end
end
n = True
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
      Op
