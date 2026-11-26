inherited frmConsHstCompIR: TfrmConsHstCompIR
  Left = 31
  Top = 104
  HelpContext = 180055
  Caption = 'Consulta do Histórico de Compensação IRRF'
  ClientHeight = 428
  ClientWidth = 718
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 718
    Height = 389
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 716
      Height = 58
      Align = alTop
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 1
        Top = 1
        Width = 584
        Height = 56
        Align = alLeft
        TabOrder = 0
        object Label1: TLabel
          Left = 296
          Top = 12
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label3: TLabel
          Left = 12
          Top = 13
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 382
          Top = 11
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object Label8: TLabel
          Left = 481
          Top = 11
          Width = 51
          Height = 13
          Caption = 'Situação'
        end
        object edtNome: TEdit
          Left = 11
          Top = 27
          Width = 278
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtMatricula: TEdit
          Left = 294
          Top = 27
          Width = 80
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edtCPF: TEdit
          Left = 380
          Top = 27
          Width = 95
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtSituacao: TEdit
          Left = 480
          Top = 27
          Width = 98
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
      object GroupBox2: TGroupBox
        Left = 585
        Top = 1
        Width = 120
        Height = 56
        Align = alLeft
        TabOrder = 1
        object btnProcurar: TBitBtn
          Left = 14
          Top = 19
          Width = 90
          Height = 27
          Caption = '&Consultar'
          TabOrder = 0
          OnClick = btnProcurarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 121
      Width = 716
      Height = 267
      Align = alClient
      TabOrder = 1
      object dbgDetalhe: TwwDBGrid
        Left = 1
        Top = 1
        Width = 714
        Height = 265
        Selected.Strings = (
          'MESREFERENCIA'#9'10'#9'Mês Ref.'#9'F'
          'HISTORICO'#9'33'#9'Histórico da Folha de Benefícios'#9'F'
          'VLRCOMPMES'#9'17'#9'Valor do~Movimento'#9'F'
          'ENTSAI'#9'6'#9'Entrada~Saída'#9'F'
          'DESCRICAO'#9'27'#9'Descrição'#9'F')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsCompensacao
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 59
      Width = 716
      Height = 62
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 13
        Caption = 'Ano/Mês Início'
      end
      object Label5: TLabel
        Left = 102
        Top = 8
        Width = 75
        Height = 13
        Caption = 'Ano/Mês Fim'
      end
      object Label6: TLabel
        Left = 335
        Top = 8
        Width = 107
        Height = 13
        Caption = 'Total a Compensar'
      end
      object Label7: TLabel
        Left = 460
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Total já Compensado'
      end
      object Label9: TLabel
        Left = 588
        Top = 8
        Width = 110
        Height = 13
        Caption = 'Saldo a Compensar'
      end
      object Label10: TLabel
        Left = 193
        Top = 8
        Width = 133
        Height = 13
        Caption = 'Último Mês Atualização'
      end
      object dbedMesInicio: TDBEdit
        Left = 8
        Top = 24
        Width = 86
        Height = 21
        BiDiMode = bdLeftToRight
        Color = clScrollBar
        ParentBiDiMode = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbEdCompTotal: TDBRealEdit
        Left = 335
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clScrollBar
        Lines.Strings = (
          '0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object dbEdSaldo: TDBRealEdit
        Left = 460
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Color = clScrollBar
        Lines.Strings = (
          '0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object DBGrid1: TDBGrid
        Left = 16
        Top = 64
        Width = 320
        Height = 120
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
      object dbedMesFim: TDBEdit
        Left = 102
        Top = 24
        Width = 83
        Height = 21
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 4
      end
      object pnlSaldo: TPanel
        Left = 586
        Top = 24
        Width = 121
        Height = 21
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 5
      end
      object dbeUltMesAtualiza: TDBEdit
        Left = 193
        Top = 24
        Width = 83
        Height = 21
        Color = clScrollBar
        DataField = 'ULTMESATUALIZA'
        DataSource = dsCompensacao
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 718
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 315
    TargetsData = (
      1
      3
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryCompensacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUBSTR(CP.ANOMESINICIO,6,2)||'#39'/'#39'||SUBSTR(CP.ANOMESINICIO,' +
        '1,4) AS MESINICIO,'
      
        '       SUBSTR(CP.ANOMESFIM,6,2)||'#39'/'#39'||SUBSTR(CP.ANOMESFIM,1,4) A' +
        'S MESFIM,'
      '       CP.COMPTOTAL,'
      '       CP.SALDOCOMP,'
      '       CP.ULTMESATUALIZA,'
      '       HF.HISTORICO,'
      
        '       SUBSTR(HC.MESREF,6,2)||'#39'/'#39'||SUBSTR(HC.MESREF,1,4) AS MESR' +
        'EFERENCIA,'
      '       ABS(HC.VLRCOMPMES) AS VLRCOMPMES,'
      '       CASE WHEN (HC.VLRCOMPMES > 0) THEN '#39'(S)'#39
      '       ELSE '#39'(E)'#39' END AS ENTSAI,'
      '       HC.DESCRICAO'
      'FROM COMPENSAIRRF CP, HSTCOMPENSAIRRF HC, HSTFOLHABENEF HF'
      'WHERE CP.IDPESSOA = :IDPESSOA'
      'AND CP.IDPESSOA = HC.IDPESSOA'
      'AND HC.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF'
      'ORDER BY HC.MESREF'
      ' '
      ' '
      ' '
      ' ')
    PictureMasks.Strings = (
      'VLRDEVIDOMES'#9'#.###.##'#9'T'#9'T')
    ValidateWithMask = True
    Left = 269
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCompensacaoMESINICIO: TStringField
      FieldName = 'MESINICIO'
      Size = 7
    end
    object qryCompensacaoMESFIM: TStringField
      FieldName = 'MESFIM'
      Size = 7
    end
    object qryCompensacaoCOMPTOTAL: TFloatField
      FieldName = 'COMPTOTAL'
    end
    object qryCompensacaoSALDOCOMP: TFloatField
      FieldName = 'SALDOCOMP'
    end
    object qryCompensacaoHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 50
    end
    object qryCompensacaoMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryCompensacaoVLRCOMPMES: TFloatField
      FieldName = 'VLRCOMPMES'
      currency = True
    end
    object qryCompensacaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryCompensacaoULTMESATUALIZA: TStringField
      FieldName = 'ULTMESATUALIZA'
      FixedChar = True
      Size = 7
    end
    object qryCompensacaoENTSAI: TStringField
      Alignment = taCenter
      FieldName = 'ENTSAI'
      FixedChar = True
      Size = 3
    end
  end
  object dsCompensacao: TwwDataSource
    DataSet = qryCompensacao
    Left = 413
    Top = 312
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 211
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'COMPENSAIRRF.ANOMESINICIO'
      'COMPENSAIRRF.ANOMESFIM')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Mat. do Titular'
      'Mat. do Dependente'
      'Nome'
      'CPF'
      'Ano/Mês Início '
      'Ano/Mês Fim ')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'COMPENSAIRRF'
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'COMPENSAIRRF.IDCOMPIRRF'
      'COMPENSAIRRF.ANOMESINICIO'
      'COMPENSAIRRF.ANOMESFIM'
      'COMPENSAIRRF.SALDOCOMP'
      'COMPENSAIRRF.COMPTOTAL'
      'VWPARTICIPDEPEN.MATRICSHOW')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA = COMPENSAIRRF.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '12'
      '35'
      '15'
      '7'
      '7')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 485
    Top = 240
  end
end
