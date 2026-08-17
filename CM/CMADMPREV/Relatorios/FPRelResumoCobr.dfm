inherited frmPRelResumoCobr: TfrmPRelResumoCobr
  Left = 82
  Top = 100
  Caption = 'Resumo de Cobrança de Contribuição'
  ClientHeight = 300
  ClientWidth = 514
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 514
    Height = 261
    object rgrpPatro: TRadioGroup
      Left = 14
      Top = 92
      Width = 484
      Height = 46
      Caption = 'Patrocinadora'
      Columns = 2
      Items.Strings = (
        'Todas'
        'Selecionar')
      TabOrder = 0
      OnClick = rgrpPatroClick
    end
    object grpSelPatro: TGroupBox
      Left = 14
      Top = 140
      Width = 484
      Height = 112
      Caption = 'Filtrar por'
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
        Width = 469
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
        Width = 469
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
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 504
      Height = 88
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object grpMesAnoRef: TGroupBox
        Left = 9
        Top = 7
        Width = 273
        Height = 80
        TabOrder = 0
        object Label3: TLabel
          Left = 13
          Top = 21
          Width = 137
          Height = 13
          Caption = 'Mês e Ano de Cobrança'
        end
        object cmbMesRef: TComboBox
          Left = 13
          Top = 36
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
          Left = 205
          Top = 36
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
      object rggrpFolha: TRadioGroup
        Left = 286
        Top = 7
        Width = 207
        Height = 80
        ItemIndex = 0
        Items.Strings = (
          'Folha da Patrocinadora'
          'Folha de Benefício'
          'Cobranças em Banco'
          'Todas')
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 261
    Width = 514
    inherited tb97Fundo: TToolbar97
      Left = 344
      DockPos = 377
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 177
      DockPos = 209
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 202
    Top = 133
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
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 133
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
    Left = 171
    Top = 133
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
