inherited frmRubricasNEncontradas: TfrmRubricasNEncontradas
  Left = 251
  Top = 155
  Caption = 'Rubricas não Esperadas'
  ClientHeight = 308
  ClientWidth = 339
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 269
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
      Height = 81
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
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
      end
    end
    object GroupBox1: TGroupBox
      Left = 45
      Top = 182
      Width = 274
      Height = 70
      Caption = 'Faixa de Matrículas '
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 32
        Width = 15
        Height = 13
        Caption = 'de'
      end
      object Label4: TLabel
        Left = 136
        Top = 33
        Width = 19
        Height = 13
        Caption = 'até'
      end
      object edmatini: TEdit
        Left = 31
        Top = 30
        Width = 97
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edmatfim: TEdit
        Left = 163
        Top = 29
        Width = 97
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 269
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
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
    Left = 19
    Top = 3
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
    Left = 18
    Top = 79
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
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
