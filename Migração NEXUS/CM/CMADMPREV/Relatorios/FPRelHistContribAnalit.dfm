inherited frmPRelHistContribAnalit: TfrmPRelHistContribAnalit
  Left = 569
  Top = 197
  Caption = 'Histórico Mensal de Contribuições - Analítico'
  ClientHeight = 302
  ClientWidth = 358
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 358
    Height = 263
    object grpMesAnoRef: TGroupBox
      Left = 44
      Top = 14
      Width = 273
      Height = 64
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
    object grpSelPatro: TGroupBox
      Left = 45
      Top = 88
      Width = 273
      Height = 114
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dblkpcmbPatro: TwwDBLookupCombo
        Left = 8
        Top = 32
        Width = 249
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
        Top = 80
        Width = 249
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Plano Previdenciário')
        LookupTable = qryPlanPREV
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object chkDivergentes: TCheckBox
      Left = 48
      Top = 216
      Width = 201
      Height = 17
      Caption = 'Exibir apenas divergentes'
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 263
    Width = 358
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 51
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 496
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPREV: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT PL.IDPLANOPREV, PL.NOME'
      'FROM PLANPREV PL, PLANPREVPATRO PP'
      'WHERE PP.IDPESSJUR = :IDPESSJUR'
      'AND PP.IDPLANOPREV = PL.IDPLANOPREV')
    ValidateWithMask = True
    Left = 496
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
