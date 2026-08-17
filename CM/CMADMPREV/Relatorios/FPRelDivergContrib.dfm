inherited frmPRelDivergContrib: TfrmPRelDivergContrib
  Left = 236
  Top = 104
  Caption = 'Parâmetros para o Relatório Mensal de Divergências'
  ClientHeight = 358
  ClientWidth = 444
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 444
    Height = 319
    object grpMesAnoRef: TGroupBox
      Left = 23
      Top = 12
      Width = 402
      Height = 53
      Caption = 'Mês e Ano de Cobrança'
      TabOrder = 0
      object cmbMesRef: TComboBox
        Left = 6
        Top = 21
        Width = 187
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = 'cmbMesRef'
        Items.Strings = (
          'janeiro'
          'fevereiro'
          'março'
          'abril'
          'maio'
          'junho'
          'julho'
          'agosto'
          'setembro '
          'outubro'
          'novembro'
          'dezembro'
          'Contribuição sobre 13º')
      end
      object spedAnoRef: TSpinEdit
        Left = 198
        Top = 21
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1998
      end
    end
    object GroupBox1: TGroupBox
      Left = 23
      Top = 66
      Width = 402
      Height = 103
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 15
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label2: TLabel
        Left = 8
        Top = 57
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dblkpcmbPatro: TwwDBLookupCombo
        Left = 8
        Top = 31
        Width = 331
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
        AllowClearKey = True
        OnCloseUp = dblkpcmbPatroCloseUp
      end
      object dblkpcmbPlano: TwwDBLookupCombo
        Left = 8
        Top = 73
        Width = 331
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Plano Previdenciário')
        LookupTable = qryPlanPatro
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object rgrpTipoDiverg: TRadioGroup
      Left = 23
      Top = 172
      Width = 210
      Height = 89
      Caption = 'Tipo de Divergência'
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Apenas as Não Recebidas'
        'Apenas as Recebidas a Menor'
        'Apenas as Recebidas a Maior')
      TabOrder = 2
    end
    object rgrpFormaCobranca: TRadioGroup
      Left = 239
      Top = 172
      Width = 186
      Height = 89
      Caption = ' Forma de Cobrança '
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Via Folha da Patrocinadora'
        'Via Folha de Benefício'
        'Via Banco')
      TabOrder = 3
    end
    object chkTratadas: TCheckBox
      Left = 22
      Top = 269
      Width = 331
      Height = 17
      Caption = 'Mostrar apenas as Divergências Tratadas'
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 319
    Width = 444
    inherited tb97Fundo: TToolbar97
      Left = 229
      DockPos = 229
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
      DockPos = 61
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 39
    Top = 330
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
      'FROM    PESSOA P, PATRO PT'
      'WHERE  P.IDPESSOA = PT.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 10
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM    PLANPREV PL, PLANPREVPATRO PLP'
      'WHERE PLP.IDPESSJUR = :IDPESSJUR'
      'AND       PLP.IDPLANOPREV = PL.IDPLANOPREV'
      'ORDER BY PL.NOME')
    ValidateWithMask = True
    Left = 82
    Top = 269
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
