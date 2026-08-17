inherited FrmCadCompensaIRRF: TFrmCadCompensaIRRF
  Left = 37
  Top = 138
  HelpContext = 180063
  Caption = 'Compensação de IRRF'
  ClientHeight = 372
  ClientWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 713
    Height = 286
    object Bevel1: TBevel
      Left = 0
      Top = 54
      Width = 708
      Height = 2
    end
    object pnlCompensacao: TPanel
      Left = 1
      Top = 1
      Width = 711
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object lbNome: TLabel
        Left = 8
        Top = 4
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object lbMatricula: TLabel
        Left = 318
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object lbCpf: TLabel
        Left = 443
        Top = 4
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object lbSitNaFund: TLabel
        Left = 568
        Top = 4
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
      end
      object dbedNome: TDBEdit
        Left = 8
        Top = 17
        Width = 305
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedMatricula: TDBEdit
        Left = 318
        Top = 17
        Width = 121
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedCPF: TDBEdit
        Left = 443
        Top = 17
        Width = 121
        Height = 21
        Color = clGray
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edSitNaFund: TEdit
        Left = 568
        Top = 17
        Width = 135
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlCompensaIR: TPanel
      Left = 1
      Top = 50
      Width = 711
      Height = 235
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object grbValores: TGroupBox
        Left = 376
        Top = 10
        Width = 326
        Height = 74
        Caption = 'Valores'
        TabOrder = 2
        object Label1: TLabel
          Left = 10
          Top = 14
          Width = 63
          Height = 26
          Caption = 'Total a Compensar'
          WordWrap = True
        end
        object Label3: TLabel
          Left = 115
          Top = 14
          Width = 73
          Height = 26
          Caption = 'Total já Compensado'
          WordWrap = True
        end
        object Label5: TLabel
          Left = 218
          Top = 14
          Width = 63
          Height = 26
          Caption = 'Saldo a Compensar'
          WordWrap = True
        end
        object redCompTotal: TRealEdit
          Left = 10
          Top = 41
          Width = 88
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redsaldo: TRealEdit
          Left = 115
          Top = 41
          Width = 88
          Height = 21
          Alignment = taRightJustify
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            '0,00')
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object pnlsaldo: TPanel
          Left = 218
          Top = 41
          Width = 95
          Height = 21
          Alignment = taRightJustify
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 2
        end
      end
      object GroupBox1: TGroupBox
        Left = 1
        Top = 88
        Width = 372
        Height = 56
        TabOrder = 3
        object Label2: TLabel
          Left = 5
          Top = 10
          Width = 57
          Height = 13
          Caption = 'Cód. Vara'
        end
        object Label4: TLabel
          Left = 80
          Top = 10
          Width = 81
          Height = 13
          Caption = 'Nome da Vara'
        end
        object edtcodvaracomp: TEdit
          Left = 5
          Top = 23
          Width = 67
          Height = 21
          MaxLength = 2
          TabOrder = 0
        end
        object edtNomeVaracomp: TEdit
          Left = 80
          Top = 23
          Width = 284
          Height = 21
          MaxLength = 20
          TabOrder = 1
        end
      end
      object GroupBox5: TGroupBox
        Left = 376
        Top = 88
        Width = 136
        Height = 56
        Caption = 'Nº do Processo'
        TabOrder = 4
        object edtNumproccomp: TEdit
          Left = 6
          Top = 23
          Width = 118
          Height = 21
          MaxLength = 20
          TabOrder = 0
        end
      end
      object gbAnoMesFinal: TGroupBox
        Left = 187
        Top = 10
        Width = 186
        Height = 74
        Caption = 'Final da Compensação'
        TabOrder = 1
        object lbAnoFim: TLabel
          Left = 112
          Top = 28
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object lbMesFim: TLabel
          Left = 9
          Top = 28
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object cbMesFim: TComboBox
          Left = 9
          Top = 41
          Width = 99
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro '
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
        object speAnoFinal: TSpinEdit
          Left = 112
          Top = 41
          Width = 67
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object gbAnoMesInicio: TGroupBox
        Left = 1
        Top = 10
        Width = 184
        Height = 74
        Caption = 'Início da Compensação'
        TabOrder = 0
        object lbAnoInicio: TLabel
          Left = 110
          Top = 28
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object lbMesInicio: TLabel
          Left = 7
          Top = 28
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object cbMesInicio: TComboBox
          Left = 7
          Top = 41
          Width = 99
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro '
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
        object speAnoInicio: TSpinEdit
          Left = 110
          Top = 41
          Width = 67
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object GroupBox2: TGroupBox
        Left = 1
        Top = 148
        Width = 511
        Height = 77
        Caption = ' Atualização do saldo a compensar '
        TabOrder = 5
        object lblIndice: TLabel
          Left = 12
          Top = 24
          Width = 161
          Height = 13
          Caption = 'Índice (deve ser percentual)'
        end
        object lblUltMesAtualiza: TLabel
          Left = 367
          Top = 24
          Width = 133
          Height = 13
          Caption = 'Último Mês Atualização'
        end
        object dblkcmbIndiceAtualiza: TwwDBLookupCombo
          Left = 12
          Top = 43
          Width = 338
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOEDESC'#9'20'#9'Descrição'#9'F'
            'MOESIGLA'#9'10'#9'Sigla'#9'F'
            'MOECODIGO'#9'10'#9'Código'#9'F')
          DataField = 'INDICE'
          DataSource = dsCompensaIR
          LookupTable = qryMoeda
          LookupField = 'MOECODIGO'
          Options = [loColLines, loRowLines, loTitles]
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblkcmbIndiceAtualizaCloseUp
        end
        object dbtUltMesAtualiza: TDBEdit
          Left = 367
          Top = 43
          Width = 89
          Height = 21
          Color = clGray
          DataField = 'ULTMESATUALIZA'
          DataSource = dsCompensaIR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 713
  end
  inherited Dock971: TDock97
    Top = 333
    Width = 713
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 14
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 387
    Top = 14
  end
  inherited upd: TUpdateSQL
    Left = 427
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.NUMDOCUMENTO'
      'V.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN V'
      'COMPENSAIRRF C')
    CamposChave.Strings = (
      'C.IDPESSOA')
    Filtro.Strings = (
      'V.IDPESSOA  = C.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 509
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 468
    Top = 14
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA,'
      '  DT.IDTITULAR,'
      '  P.NUMDOCUMENTO,'
      '  P.NOME,'
      '  DT.MATRICULA'
      ''
      'FROM'
      '  PESSOA P,'
      '  DEPENTIT DT'
      ''
      'WHERE'
      '  DT.IDPESSOA = :IDPESSOA  AND'
      '  DT.IDPESSOA = P.IDPESSOA')
    Left = 346
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object MS1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.NUMDOCUMENTO'
      'V.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN V')
    CamposChave.Strings = (
      'V.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 544
    Top = 14
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 592
    Top = 17
  end
  object qryCompensaIR: TwwQuery
    AfterOpen = qryCompensaIRAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  COMPENSAIRRF'
      ''
      'WHERE'
      '  IDPESSOA = :IDPESSOA    ')
    ValidateWithMask = True
    Left = 632
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUpd: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 672
    Top = 9
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOESIGLA, MOEDESC '
      'FROM MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 607
    Top = 216
  end
  object dsCompensaIR: TwwDataSource
    DataSet = qryCompensaIR
    Left = 633
    Top = 81
  end
end
