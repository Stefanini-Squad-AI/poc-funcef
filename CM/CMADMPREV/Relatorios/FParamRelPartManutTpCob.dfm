inherited frmParamRelPartManutTpCob: TfrmParamRelPartManutTpCob
  Left = 130
  Top = 162
  Caption = 'Participantes em Manutenção Pdv - Tipo Cobrança'
  ClientHeight = 255
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 216
    object Label1: TLabel
      Left = 56
      Top = 38
      Width = 112
      Height = 13
      Caption = 'Mês de Referência:'
    end
    object Label2: TLabel
      Left = 56
      Top = 80
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object edMesRef: TMaskEdit
      Left = 176
      Top = 34
      Width = 66
      Height = 21
      EditMask = '9999/99;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = '    /  '
    end
    object bdlckcmbPatro: TwwDBLookupCombo
      Left = 56
      Top = 94
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
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object rgTpCobra: TRadioGroup
      Left = 56
      Top = 144
      Width = 377
      Height = 47
      Caption = 'Tipo de Cobrança'
      Columns = 3
      Items.Strings = (
        'Atraso'
        'Normal'
        'Estorno')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 216
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 440
    Top = 32
  end
end
