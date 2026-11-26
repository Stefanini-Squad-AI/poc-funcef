inherited frmParamRelPdvGeral: TfrmParamRelPdvGeral
  Left = 181
  Top = 178
  Caption = 'Relação de Cadastramento de Manutenção de Salários'
  ClientHeight = 179
  ClientWidth = 524
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 524
    Height = 140
    object Label1: TLabel
      Left = 56
      Top = 70
      Width = 185
      Height = 13
      Caption = 'Mês do Registro da Manutenção'
    end
    object Label2: TLabel
      Left = 56
      Top = 23
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object bdlckcmbPatro: TwwDBLookupCombo
      Left = 56
      Top = 37
      Width = 369
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object edMesRef: TMaskEdit
      Left = 56
      Top = 83
      Width = 85
      Height = 21
      EditMask = '99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Text = '  /    '
    end
  end
  inherited Dock971: TDock97
    Top = 140
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 354
      DockPos = 354
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 186
      DockPos = 186
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 419
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 472
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
