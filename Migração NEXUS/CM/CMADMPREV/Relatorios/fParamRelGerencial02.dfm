inherited frmParamRelGerencial02: TfrmParamRelGerencial02
  Left = 265
  Top = 155
  Caption = 'Relatório Gerencial de Administração Previdenciária 02'
  ClientHeight = 238
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 199
    object GroupBox1: TGroupBox
      Left = 8
      Top = 6
      Width = 508
      Height = 40
      Caption = ' Patrocinadora '
      TabOrder = 0
      object cmbPatrocinadora: TwwDBLookupCombo
        Left = 11
        Top = 13
        Width = 483
        Height = 21
        Hint = 'Escolha a Patrocinadora a ser processada.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 46
      Width = 508
      Height = 40
      Caption = ' Plano Previdenciário '
      TabOrder = 1
      object cmbPlano: TwwDBLookupCombo
        Left = 11
        Top = 13
        Width = 483
        Height = 21
        Hint = 'Escolha o Plano a ser processado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = cmbPlanoChange
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 87
      Width = 350
      Height = 40
      Caption = ' Meses de Referência '
      TabOrder = 2
      object cmbMes01: TComboBox
        Left = 12
        Top = 13
        Width = 106
        Height = 21
        Hint = 'Mês a se Processado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Janeiro'
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spnAno01: TSpinEdit
        Left = 123
        Top = 13
        Width = 70
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2000
      end
      object chkbcTempo: TCheckBox
        Left = 201
        Top = 16
        Width = 147
        Height = 17
        Hint = 
          'Mostra, ao final do relatório, quanto tempo este demorou para se' +
          'r processado.'
        Caption = 'Tempo de Processamento.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object GroupBox4: TGroupBox
      Left = 362
      Top = 87
      Width = 154
      Height = 40
      Caption = ' VRS '
      TabOrder = 3
      object dtVrs: TRealEdit
        Left = 23
        Top = 14
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 126
      Width = 507
      Height = 66
      Caption = ' Relatórios '
      TabOrder = 4
      object Memo1: TMemo
        Left = 14
        Top = 14
        Width = 483
        Height = 46
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            '04 - Distribuição dos Participantes e Não-Participantes por Faix' +
            'a Etária, segundo Sexo;'
          
            '05 - Distribuição por Faixa Salarial, por Patrocinadora (em VRS)' +
            ';'
          
            '06 - Distribuição dos Percentuais de Contribuição Suplementar Fa' +
            'cultativa por Patrocinadora.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 199
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsPatrocinadora: TwwDataSource
    DataSet = qryPatrocinadora
    Left = 176
    Top = 22
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P,PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 120
    Top = 56
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS CONSIDERA, IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV'
      '                      FROM PLANPREVPATRO PLP, PATRO PT'
      '                      WHERE PT.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ' '
      '')
    ValidateWithMask = True
    Left = 120
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryContribuicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CO.NOME AS CONTRIB,'
      '       CO.IDCONTRIBUICAO'
      'FROM CONTPREV CP, CONTRIBUICAO CO'
      'WHERE (CO.FLGOBRIGATORIA = '#39'P'#39')'
      'AND   (CP.IDPLANOPREV    = :IDPLANO)'
      'AND   (CP.FLGINTERNO     = '#39'AT'#39')'
      'AND   (CP.IDCONTRIBUICAO = CO.IDCONTRIBUICAO)'
      
        '' +
        '')
    ValidateWithMask = True
    Left = 448
    Top = 42
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end>
  end
  object qryTmp04: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       '#39'SERPRO'#39'         AS PATRO            ,'
      '       99               AS IDPESSOA         ,'
      '       '#39'PARTICIPANTE'#39'   AS TIPO             ,'
      '       64384            AS IDPF             ,'
      '       '#39'DE 0 A 1/2 VLR'#39' AS FAIXA            ,'
      '       2553             AS IDRUBSALPARTICIP ,'
      '       166              AS IDRUBSALMANUT    ,'
      '       0                AS INTERVALO1       ,'
      '       600              AS INTERVALO2       ,'
      '       '#39'2000/02'#39'        AS MES'
      
        '' +
        ''
      'FROM DUAL')
    ValidateWithMask = True
    Left = 424
    Top = 130
  end
  object qryTipo04: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT QRY.LABEL, QRY.SEXO, QRY.LINHA'
      'FROM'
      '(SELECT '#39'MAIS DE 70'#39' AS LABEL, '#39'FEMININO'#39' AS SEXO, 9 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'MAIS DE 70'#39' AS LABEL, '#39'MASCULINO'#39' AS SEXO, 9 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'60 A 70'#39'   AS LABEL, '#39'FEMININO'#39' AS SEXO, 8 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'60 A 70'#39'   AS LABEL, '#39'MASCULINO'#39' AS SEXO, 8 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'50 A 60'#39' AS LABEL, '#39'FEMININO'#39' AS SEXO, 7 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'50 A 60'#39' AS LABEL, '#39'MASCULINO'#39' AS SEXO, 7 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'40 A 50'#39' AS LABEL, '#39'FEMININO'#39' AS SEXO, 6 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'40 A 50'#39' AS LABEL, '#39'MASCULINO'#39' AS SEXO, 6 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'30 A 40'#39' AS LABEL, '#39'FEMININO'#39' AS SEXO, 5 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'30 A 40'#39' AS LABEL, '#39'MASCULINO'#39' AS SEXO, 5 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'20 A 30'#39' AS LABEL, '#39'FEMININO'#39' AS SEXO, 4 AS LINHA'
      '  FROM DUAL'
      'UNION'
      'SELECT '#39'20 A 30'#39' AS LABEL, '#39'MASCULINO'#39' AS SEXO, 4 AS LINHA'
      '  FROM DUAL) QRY'
      'ORDER BY QRY.LINHA DESC, QRY.SEXO DESC')
    ValidateWithMask = True
    Left = 472
    Top = 130
  end
  object qryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsTmp04
    SQL.Strings = (
      'SELECT SUM(VALORPROVENTO) AS VALOR'
      'FROM HISTRUBSAL'
      'WHERE ((IDRUBRICA     = :IDRUBSALPARTICIP)'
      'OR     (IDRUBRICA     = :IDRUBSALMANUT))'
      'AND   (VALORPROVENTO >= :INTERVALO1)'
      'AND   (VALORPROVENTO  < :INTERVALO2)'
      'AND   (IDPESSJUR      = :IDPESSOA)'
      'AND   (MES            = :MES)'
      'AND   (IDPESSOA       = :IDPF)')
    ValidateWithMask = True
    Left = 368
    Top = 130
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRUBSALPARTICIP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBSALMANUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'INTERVALO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'INTERVALO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPF'
        ParamType = ptUnknown
      end>
  end
  object dsTmp04: TwwDataSource
    DataSet = qryTmp04
    Left = 424
    Top = 117
  end
  object dsDetalhe: TwwDataSource
    DataSet = qryDetalhe
    Left = 368
    Top = 117
  end
end
