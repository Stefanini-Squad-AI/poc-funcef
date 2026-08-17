inherited frmMigraDotacaoInicial: TfrmMigraDotacaoInicial
  Left = 119
  Top = 106
  HelpContext = 160132
  Caption = 'Implantar Dotação Inicial para Planos já "Iniciados" no sistema'
  ClientHeight = 385
  ClientWidth = 640
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 346
    object Label1: TLabel
      Left = 17
      Top = 20
      Width = 127
      Height = 13
      Caption = 'Patrocinadora e Plano'
    end
    object Label2: TLabel
      Left = 17
      Top = 64
      Width = 180
      Height = 13
      Caption = 'Contribuição de Dotação Inicial'
    end
    object Label3: TLabel
      Left = 24
      Top = 256
      Width = 140
      Height = 13
      Caption = 'Processando Matrícula :'
    end
    object Label4: TLabel
      Left = 24
      Top = 288
      Width = 108
      Height = 13
      Caption = 'Total Processado :'
    end
    object lblMatricula: TLabel
      Left = 176
      Top = 256
      Width = 66
      Height = 13
      Caption = 'lblMatricula'
    end
    object lblTotal: TLabel
      Left = 176
      Top = 288
      Width = 43
      Height = 13
      Caption = 'lblTotal'
    end
    object dblkpcmbPlanPatro: TwwDBLookupCombo
      Left = 17
      Top = 35
      Width = 432
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora'
        'NOME_1'#9'50'#9'Plano')
      LookupTable = qryPatroPlano
      LookupField = 'IDPESSJUR'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblkpcmbContrib: TwwDBLookupCombo
      Left = 17
      Top = 78
      Width = 432
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Contribuição')
      LookupTable = qryContrib
      LookupField = 'IDCONTRIBUICAO'
      Options = [loColLines]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object bbtnGerar: TBitBtn
      Left = 480
      Top = 32
      Width = 147
      Height = 65
      Caption = '&Gerar Dotação Inicial'
      TabOrder = 2
      OnClick = bbtnGerarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 120
      Width = 433
      Height = 105
      Caption = 'Cálculo da Dotação'
      TabOrder = 3
      object Bevel1: TBevel
        Left = 4
        Top = 57
        Width = 425
        Height = 2
      end
      object Label5: TLabel
        Left = 166
        Top = 16
        Width = 119
        Height = 13
        Caption = 'Informe o Percentual'
      end
      object Label6: TLabel
        Left = 257
        Top = 37
        Width = 10
        Height = 13
        Caption = '%'
      end
      object Label7: TLabel
        Left = 166
        Top = 64
        Width = 92
        Height = 13
        Caption = 'Informe a Regra'
      end
      object rdPercentual: TRadioButton
        Tag = 1
        Left = 8
        Top = 24
        Width = 145
        Height = 17
        Caption = 'Percentual do Salário'
        TabOrder = 0
      end
      object rdRegra: TRadioButton
        Tag = 1
        Left = 8
        Top = 64
        Width = 137
        Height = 17
        Caption = 'Regra de Cálculo'
        TabOrder = 1
      end
      object edPercentual: TEditNum
        Left = 166
        Top = 32
        Width = 89
        Height = 21
        TabOrder = 2
        IntDigits = 3
        Signal = False
        DecDigits = 5
        Numeric = True
        Alignment = taRightJustify
      end
      object dblkpcmbRegra: TwwDBLookupCombo
        Left = 166
        Top = 78
        Width = 258
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra de Negócio')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loColLines]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object rgrpOrigem: TRadioGroup
      Left = 456
      Top = 120
      Width = 172
      Height = 57
      Caption = 'Origem dos Dados'
      ItemIndex = 0
      Items.Strings = (
        'Arq. Texto'
        'Salário Existente')
      TabOrder = 4
    end
    object memResult: TMemo
      Left = 275
      Top = 232
      Width = 353
      Height = 105
      Color = clSilver
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object chkApenasParticip: TCheckBox
      Left = 456
      Top = 184
      Width = 169
      Height = 17
      Caption = 'Gerar apenas histórico'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 640
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 323
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatroPlano: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV, P.NOME, PL.NOME'
      'FROM PLANPREVPATRO PLP, PESSOA P, PLANPREV PL'
      'WHERE PLP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND   PLP.IDPESSJUR = P.IDPESSOA'
      
        'AND   PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDA' +
        'CAO = :IDFUNDACAO) '
      'ORDER BY P.NOME, PL.NOME'
      ' ')
    ValidateWithMask = True
    Left = 72
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME, C.IDTPPERIODICIDADE'
      'FROM   CONTRIBUICAO C'
      'ORDER BY C.NOME')
    ValidateWithMask = True
    Left = 144
    Top = 339
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 216
    Top = 339
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.txt'
    InitialDir = '\'
    Title = 'Aqruivo de Origem para Gerar Dotação Inicial'
    Left = 288
    Top = 339
  end
  object qryElegPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MATRICULA, SALTOTAL, IDPESSOA'
      'FROM    ELEGPATRO'
      'WHERE IDPESSJUR = :IDPESSJUR')
    ValidateWithMask = True
    Left = 360
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 432
    Top = 339
  end
  object qryJaInscritos: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT PP.IDPESSJUR,PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,'
      
        '       DI.IDCONTRIBUICAO, DI.VALOR, PP.INSCRICAONUMERO, EL.MATRI' +
        'CULA'
      
        'FROM   PARTPREVPLAN PP, DOTACAOINICIAL DI, ELEGPATRO EL, SITPART' +
        ' SP'
      'WHERE  (PP.IDPESSJUR   = :IDPESSJUR)'
      'AND    (PP.IDPLANOPREV = :IDPLANOPREV)'
      'AND    (DI.IDPESSJUR   = PP.IDPESSJUR)'
      'AND    (DI.IDPLANOPREV = PP.IDPLANOPREV)'
      'AND    (DI.IDPESSOA    = PP.IDPESSOA)'
      'AND    (PP.IDPESSJUR = EL.IDPESSJUR)'
      'AND    (PP.IDPESSOA = EL.IDPESSOA)'
      'AND    (PP.IDSITPART = SP.IDSITPART)'
      'AND    (SP.FLGINTERNO = '#39'AT'#39')'
      'AND    NOT EXISTS'
      '       (SELECT HST.IDCONTRIBUICAO'
      '        FROM   HSTCONTRIBPREV HST'
      '        WHERE  HST.IDPESSJUR = PP.IDPESSJUR'
      '        AND    HST.IDPLANOPREV = PP.IDPLANOPREV'
      '        AND    HST.IDPESSOA = PP.IDPESSOA'
      '        AND    HST.SEQPROPOSTA = PP.SEQPROPOSTA'
      '        AND    HST.IDCONTRIBUICAO = DI.IDCONTRIBUICAO)'
      'ORDER BY PP.IDPESSOA, DI.IDCONTRIBUICAO')
    ValidateWithMask = True
    Left = 504
    Top = 339
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
end
