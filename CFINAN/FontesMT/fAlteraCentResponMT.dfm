inherited FrmAlteraCentResponMT: TFrmAlteraCentResponMT
  Left = 218
  Top = 177
  HelpContext = 30007
  Caption = 'Altera Centro de Responsabilidade'
  ClientHeight = 392
  ClientWidth = 759
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 353
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 272
      Height = 343
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblCentroRespon: TLabel
        Left = 12
        Top = 131
        Width = 203
        Height = 13
        Caption = 'Centro de Responsabilidade Origem'
      end
      object Label1: TLabel
        Left = 12
        Top = 184
        Width = 207
        Height = 13
        Caption = 'Centro de Responsabilidade Destino'
      end
      object Label2: TLabel
        Left = 12
        Top = 78
        Width = 116
        Height = 13
        Caption = 'Tipo de Desembolso'
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 13
        Width = 249
        Height = 50
        Caption = ' &Documento \ Complemento '
        TabOrder = 0
        object SbtPesquisa: TSpeedButton
          Left = 211
          Top = 17
          Width = 25
          Height = 25
          Hint = 'Pesquisa Documentos'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SbtPesquisaClick
        end
        object EdtDoc: TRealEdit
          Left = 17
          Top = 19
          Width = 145
          Height = 21
          Alignment = taRightJustify
          Color = 12582911
          Lines.Strings = (
            '0')
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          IntDigits = 21
          DecDigits = 0
          NumberFormat = fFixed
          Signal = False
        end
        object EdtCompl: TEdit
          Left = 166
          Top = 19
          Width = 44
          Height = 21
          Color = 12582911
          MaxLength = 3
          ReadOnly = True
          TabOrder = 1
        end
      end
      object dblcOrigem: TwwDBLookupCombo
        Left = 12
        Top = 148
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'ANALITICOSINTET'#9'1'#9'T'
          'CODCENTRORESPON'#9'10'#9'Código')
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcOrigemCloseUp
      end
      object dblcDestino: TwwDBLookupCombo
        Left = 12
        Top = 201
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'ANALITICOSINTET'#9'1'#9'T'
          'CODCENTRORESPON'#9'10'#9'Código')
        LookupTable = cdsCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object CmbTipoDesemb: TwwDBLookupCombo
        Left = 12
        Top = 95
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        LookupTable = cdsTipoDesemb
        LookupField = 'CODTIPRECDES'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcOrigemCloseUp
      end
    end
    object Panel2: TPanel
      Left = 277
      Top = 5
      Width = 477
      Height = 343
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Pnldocpendentes: TPanel
        Left = 0
        Top = 0
        Width = 477
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Rateios do documento selecionado'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 30
        Width = 477
        Height = 313
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsRateios
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 353
    Width = 759
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30007
      end
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
    Left = 323
    Top = 239
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object DsRateios: TwwDataSource
    AutoEdit = False
    DataSet = cdsRateios
    Left = 78
    Top = 260
  end
  object MsDoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'DOCUMENTO.DATAVENCTO'
      'LANCTODOCUM.VALOR'
      'PESSOA.RAZAOSOCIAL'
      'LANCTODOCUM.HISTORICOCOMPL')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número do Documento'
      'Complemento'
      'Data Programada'
      'Data Vencimento'
      'Valor'
      'Razão Social'
      'Histórico')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCTODOCUM'
      'PESSOA')
    CamposChave.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.CODDOCUMENTO')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO=LANCTODOCUM.OPERACAO'
      'DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '3'
      '10'
      '10'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 325
    Top = 167
  end
  object sqlRateios: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  SUM(R.VALOR) AS VALOR,'
      '  C.NOME,'
      '  D.CODDOCUMENTO,'
      '  R.CODCENTRORESPON,'
      '  R.CODCENTROCUSTO,'
      '  R.CODTIPRECDES,'
      '  TRD.DESCRICAO'
      'FROM'
      '  CENTRESPON C,'
      '  DOCUMENTO D,'
      '  RATEIODOCUM R,'
      '  TIPORECEBDESEMB TRD'
      'WHERE'
      '  (D.IDPESSOA = :IDPESSOA)                 AND'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO)         AND'
      '  (D.RECPAG = :RECPAG)                     AND'
      '  (TRD.CODTIPRECDES = R.CODTIPRECDES)      AND'
      '  (D.CODDOCUMENTO = R.CODDOCUMENTO)        AND'
      '  (C.CODCENTRORESPON =  R.CODCENTRORESPON) AND'
      '  (TRD.RECPAG = D.RECPAG)                  AND'
      '  (TRD.IDPESSOA = D.IDPESSOA)              AND'
      '  (C.IDPESSOA = R.IDPESSOA)'
      'GROUP BY'
      '   D.CODDOCUMENTO,'
      '   R.CODCENTRORESPON,'
      '   C.NOME,'
      '   R.CODTIPRECDES,'
      '   TRD.DESCRICAO,'
      '   R.CODCENTROCUSTO'
      'UNION'
      'SELECT'
      '  SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALOR,'
      '  Q2.NOMECR AS NOME,'
      '  Q1.CODDOCUMENTO,'
      '  Q2.CODCENTRORESPON,'
      '  Q2.CODCENTROCUSTO,'
      '  Q2.CODTIPRECDES,'
      '  Q2.DESCTDR AS DESCRICAO'
      'FROM'
      '  (SELECT  DOC.CODDOCUMENTO,'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR'
      '   FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN'
      '   WHERE'
      '     ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '     (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '     DOC.STATUS = '#39'2'#39' AND'
      
        '     DOC.NUMFATURA IN (SELECT NUMFATURA FROM DOCUMENTO WHERE COD' +
        'DOCUMENTO = :CODDOCUMENTO ) ) Q1,'
      '  (SELECT'
      '     D.NUMFATURA,'
      '     RD.VALOR,'
      '     TDR.DESCRICAO AS DESCTDR,'
      '     CR.NOME AS NOMECR,'
      '     TDR.CODTIPRECDES,'
      '     CR.CODCENTRORESPON,'
      '     RD.CODCENTROCUSTO'
      '   FROM'
      '     RATEIODOCUM RD,'
      '     CENTRESPON CR,'
      '     TIPORECEBDESEMB TDR,'
      '     DOCUMENTO D'
      '   WHERE'
      '   (D.NUMFATURA IS NOT NULL)                 AND'
      '   (D.CODDOCUMENTO     = RD.CODDOCUMENTO)    AND'
      '   (TDR.CODTIPRECDES   = RD.CODTIPRECDES)    AND'
      '   (TDR.RECPAG         = RD.RECPAG)          AND'
      '   (TDR.IDPESSOA       = RD.IDPESSOA)        AND'
      '   (CR.CODCENTRORESPON = RD.CODCENTRORESPON) AND'
      '   (CR.IDPESSOA        = RD.IDPESSOA) ) Q2,'
      '  (SELECT'
      '     D.NUMFATURA,'
      '     SUM(L.VALOR) AS VALOR'
      '   FROM'
      '     LANCTODOCUM L,'
      '     DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO    = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO     = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      'WHERE'
      '  (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '  (Q3.NUMFATURA = Q2.NUMFATURA)'
      'GROUP BY'
      '  Q2.NOMECR,'
      '  Q1.CODDOCUMENTO,'
      '  Q2.CODCENTRORESPON,'
      '  Q2.CODTIPRECDES,'
      '  Q2.DESCTDR,'
      '  Q2.CODCENTROCUSTO'
      'ORDER BY'
      '   CODDOCUMENTO,'
      '   NOME,'
      '   CODCENTRORESPON,'
      '   DESCRICAO'
      '')
    ClientDataSet = cdsRateios
    Left = 17
    Top = 260
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 122
    Top = 165
  end
  object cdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 132
    Top = 95
  end
  object sqlTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  R.CODTIPRECDES,'
      '  TRD.DESCRICAO'
      'FROM'
      '  RATEIODOCUM R,'
      '  TIPORECEBDESEMB TRD'
      'WHERE'
      '  (TRD.CODTIPRECDES = R.CODTIPRECDES) AND'
      '  (R.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (TRD.RECPAG = R.RECPAG)'
      'GROUP BY'
      '  R.CODTIPRECDES,'
      '  TRD.DESCRICAO'
      'UNION'
      'SELECT'
      '  R.CODTIPRECDES,'
      '  TRD.DESCRICAO'
      'FROM'
      '  RATEIODOCUM R,'
      '  TIPORECEBDESEMB TRD,'
      '  DOCUMENTO D,'
      '  DOCUMENTO DOC'
      'WHERE'
      '  (TRD.CODTIPRECDES = R.CODTIPRECDES) AND'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (D.NUMFATURA = DOC.NUMFATURA) AND'
      '   DOC.OPERACAO ='#39'1'#39' AND'
      '   R.CODDOCUMENTO = DOC.CODDOCUMENTO AND'
      '  (TRD.RECPAG = R.RECPAG)'
      'GROUP BY'
      '  R.CODTIPRECDES,'
      '  TRD.DESCRICAO'
      'ORDER BY'
      '  DESCRICAO'
      '')
    ClientDataSet = cdsTipoDesemb
    Left = 102
    Top = 95
  end
  object cdsRateios: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 47
    Top = 260
  end
  object sqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CODCENTRORESPON,NOME,ANALITICOSINTET'
      'FROM '
      '  CENTRESPON'
      'WHERE '
      '   IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '   CODCENTRORESPON,NOME'
      '')
    ClientDataSet = cdsCentroRespon
    Left = 95
    Top = 165
  end
end
