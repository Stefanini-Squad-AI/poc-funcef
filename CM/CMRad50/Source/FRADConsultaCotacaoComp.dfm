inherited frmRADConsultaCotacaoComp: TfrmRADConsultaCotacaoComp
  Left = 208
  Top = 167
  Caption = 'Consulta Cotação'
  ClientHeight = 384
  ClientWidth = 671
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 671
    Height = 345
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 669
      Height = 343
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 293
        Top = 92
        Width = 7
        Height = 188
        Cursor = crHSplit
      end
      object plnTitulo: TPanel
        Left = 1
        Top = 1
        Width = 667
        Height = 91
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 8
          Width = 100
          Height = 16
          Caption = 'Processo Nº : '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbProc: TLabel
          Left = 104
          Top = 8
          Width = 50
          Height = 16
          Caption = 'LbProc'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnSelProc: TSpeedButton
          Left = 667
          Top = 36
          Width = 73
          Height = 49
          Anchors = [akRight, akBottom]
          Caption = '&Processo'
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
          Layout = blGlyphTop
          NumGlyphs = 2
        end
        object lbStatus: TLabel
          Left = 8
          Top = 32
          Width = 49
          Height = 19
          Caption = 'Status'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 420
          Top = 4
          Width = 241
          Height = 81
          Caption = 'Legenda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label3: TLabel
            Left = 32
            Top = 58
            Width = 189
            Height = 13
            Caption = 'Selecionado pelo sistema e pelo usuário'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 32
            Top = 38
            Width = 119
            Height = 13
            Caption = 'Selecionado pelo usuário'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label1: TLabel
            Left = 32
            Top = 18
            Width = 120
            Height = 13
            Caption = 'Selecionado pelo sistema'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Panel2: TPanel
            Left = 9
            Top = 17
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'S'
            Color = 8454143
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Panel3: TPanel
            Left = 9
            Top = 36
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'U'
            Color = 12042751
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object Panel4: TPanel
            Left = 9
            Top = 56
            Width = 19
            Height = 17
            BevelInner = bvRaised
            Caption = 'C'
            Color = 8454016
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object grdArt: TwwDBGrid
        Left = 1
        Top = 92
        Width = 292
        Height = 188
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Artigo'#9'F'
          'QTDEPEDIDA'#9'10'#9'Quatidade~Pedida'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alLeft
        Color = clWhite
        DataSource = dsList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 1
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
      object GrdCotacao: TwwDBGrid
        Left = 300
        Top = 92
        Width = 368
        Height = 188
        Hint = 'Duplo Click para selecionar fornecedor'
        Selected.Strings = (
          'RAZAOSOCIAL'#9'30'#9'Fornecedor'#9'F'
          'PROPOSTA'#9'10'#9'Proposta Nº'#9'F'
          'PRECOAVALORPRES'#9'10'#9'Preço a Valor~Presente'#9'F'
          'STATUS'#9'1'#9'Status'#9'F'
          'PRECO'#9'10'#9'Preço'#9'F'
          'QTDEFORNECIDA'#9'10'#9'Quantidade~Fornecida'#9'F'
          'PRECOTOTAL'#9'10'#9'Valor Total'#9'F'
          'MOESIGLA'#9'10'#9'Moeda'#9'F'
          'CODMEDIDA'#9'4'#9'Unidade'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Color = clWhite
        DataSource = dsSumario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
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
      object Panel5: TPanel
        Left = 1
        Top = 280
        Width = 667
        Height = 62
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object lblobs: TLabel
          Left = 303
          Top = 1
          Width = 138
          Height = 13
          Caption = 'Observação da Cotação'
          Visible = False
        end
        object Label5: TLabel
          Left = 3
          Top = 2
          Width = 191
          Height = 13
          Caption = 'Justificativa da Ordem de Compra'
          Visible = False
        end
        object wwDBRichEdit1: TwwDBRichEdit
          Left = 300
          Top = 15
          Width = 450
          Height = 42
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoURLDetect = False
          DataField = 'OBS'
          DataSource = dsSumario
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 0
          Visible = False
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
        object wwDBRichEdit2: TwwDBRichEdit
          Left = 1
          Top = 15
          Width = 292
          Height = 42
          AutoURLDetect = False
          DataField = 'JUSTIFICATIVA'
          DataSource = dsList
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 1
          Visible = False
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 671
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object cdsSumario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 120
  end
  object dsSumario: TwwDataSource
    AutoEdit = False
    DataSet = cdsSumario
    Left = 326
    Top = 176
  end
  object cdsOc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 120
  end
  object dsOc: TwwDataSource
    DataSet = cdsOc
    Left = 16
    Top = 171
  end
  object sqlOc: TCMSqlParams
    SQL.Strings = (
      'SELECT IT.CODARTIGO, COT.CODPROCESSO,'
      '       COT.IDITEMOC, OC.NUMOC, OC.*'
      'FROM COTACOES COT, ITEMOC IT, OC'
      'WHERE COT.CODPROCESSO = :CODPROCESSO'
      '  AND IT.CODARTIGO    = :CODARTIGO'
      '  AND COT.IDITEMOC = IT.IDITEMOC'
      '  AND IT.NUMOC = OC.NUMOC')
    ClientDataSet = cdsOc
    Left = 144
    Top = 192
  end
  object dsOC_X: TwwDataSource
    DataSet = qryOC
    Left = 199
    Top = 176
  end
  object qryOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ rule */'
      '      P.RAZAOSOCIAL,'
      '      P.NOME,'
      '      P.NUMDOCUMENTO,'
      '     (E.LOGRADOURO ||'#39' '#39'|| E.NUMERO) AS ENDERECO,'
      '      E.COMPLEMENTO,'
      '      E.BAIRRO,'
      '      E.CEP,'
      '      ES.CODESTADO,'
      '      P.EMAIL,'
      '      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,'
      '      TC.TELEFONE,'
      '      TC.DDD,'
      '      O.NUMOC,'
      '      O.IDFORCLI,'
      '      O.OCATENDIDA,'
      '      O.FLGIMPRESSA,'
      '      O.FLGCOMSEMOC,'
      '      O.FLGCOMSEMCOT,'
      '      O.OBSOC,'
      '      O.DATAOC,'
      '      DECODE(O.FLGTIPOFRETE,1,'#39'CIF'#39','#39'FOB'#39') AS FRETE,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      
        '      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS D' +
        'ESCRICAO,'
      '      I.VALORUN,'
      '      PE.QTDEENTREGA,'
      '      PE.DATAENTREGA,'
      '      PE.PRAZOENTREGA,'
      '      IMP.TOTIMP,'
      '      TOT.TOTITEM,'
      '      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTITEM,'
      
        '      (DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTO' +
        'C,'
      '      PR.DESCRCOMPL,'
      '      I.OBSITEMOC,'
      '      O.CONTATO'
      'FROM'
      '     PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES,'
      '     ('
      '      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD'
      '      FROM  TELENDPESS  TP,'
      '           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '            FROM TELENDPESS'
      '            WHERE (TIPO LIKE '#39'%C%'#39')'
      '            GROUP BY IDENDERECO) C'
      '      WHERE (TP.IDENDERECO = C.IDENDERECO) AND'
      '            (TP.IDTELEFONE = C.IDTELEFONE)'
      '      ) TC,'
      '      ITEMOC I,'
      '      OC O,'
      '      ARTIGO A,'
      '      PRODUTO PR,'
      '      PRODVARI PV,'
      '      PRAZOENTREGAOC PE,'
      '      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM'
      '       FROM ITEMOC I, PRAZOENTREGAOC PE'
      '       WHERE'
      
        '              ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO ' +
        'IS NULL))'
      '          AND  (I.IDITEMOC = PE.IDITEMOC)'
      '       GROUP BY I.NUMOC) TOT,'
      '      ((SELECT AOC.NUMOC,'
      
        '               SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AOC.VLRAGREGTOT*-1' +
        '),AOC.VLRAGREGTOT)) AS TOTIMP'
      '        FROM  AGREGTOTOC AOC,'
      '              TIPOAGRE T'
      '        WHERE'
      '               (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '        GROUP BY AOC.NUMOC)'
      '        UNION'
      '       (SELECT I.NUMOC,'
      
        '               SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AI.VLRAGREGITEM*-1' +
        '),AI.VLRAGREGITEM)) AS TOTIMP'
      '        FROM  AGREGITEMOC AI,'
      '              TIPOAGRE T,'
      '              ITEMOC I'
      '        WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      
        '          AND ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO ' +
        'IS NULL))'
      '          AND (I.IDITEMOC = AI.IDITEMOC)'
      '          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '        GROUP BY I.NUMOC)) IMP'
      'WHERE (O.IDPESSOA = 2)'
      '   AND (O.NUMOC >= 3674)'
      '   AND (O.NUMOC <= 3675)'
      '   AND (O.OCATENDIDA = '#39'F'#39')'
      '   AND (O.FLGIMPRESSA = '#39'F'#39' )'
      
        '  AND ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO IS NULL)' +
        ')'
      '  AND (O.NUMOC = I.NUMOC)'
      '  AND (P.IDPESSOA = O.IDFORCLI)'
      '  AND (I.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = PR.CODPRODUTO)'
      '  AND (I.IDPRODVARI = PV.IDPRODVARI(+))'
      '  AND (PE.IDITEMOC = I.IDITEMOC)'
      '  AND (IMP.NUMOC(+) = O.NUMOC)'
      '  AND (TOT.NUMOC = O.NUMOC)'
      '  AND (P.IDPESSOA       = O.IDFORCLI)'
      '  AND (E.IDPESSOA(+)    = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)'
      '  AND (E.IDCIDADES      = C.IDCIDADES(+))'
      '  AND (ES.IDESTADO(+)   = C.IDESTADO)'
      '  AND (TC.IDENDERECO(+) = E.IDENDERECO)'
      'ORDER BY O.NUMOC, I.IDITEMOC')
    ValidateWithMask = True
    Left = 197
    Top = 141
    object qryOCRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryOCNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryOCENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 69
    end
    object qryOCCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryOCBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryOCCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-999;1;_'
      Size = 8
    end
    object qryOCCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryOCEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qryOCCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryOCTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryOCDDD: TStringField
      FieldName = 'DDD'
      Size = 5
    end
    object qryOCNUMOC: TFloatField
      FieldName = 'NUMOC'
    end
    object qryOCIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryOCOCATENDIDA: TStringField
      FieldName = 'OCATENDIDA'
      Size = 1
    end
    object qryOCFLGIMPRESSA: TStringField
      FieldName = 'FLGIMPRESSA'
      Size = 1
    end
    object qryOCFLGCOMSEMOC: TStringField
      FieldName = 'FLGCOMSEMOC'
      Size = 1
    end
    object qryOCFLGCOMSEMCOT: TStringField
      FieldName = 'FLGCOMSEMCOT'
      Size = 1
    end
    object qryOCOBSOC: TStringField
      FieldName = 'OBSOC'
      Size = 250
    end
    object qryOCDATAOC: TDateTimeField
      FieldName = 'DATAOC'
    end
    object qryOCCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryOCVALORUN: TFloatField
      FieldName = 'VALORUN'
    end
    object qryOCQTDEENTREGA: TFloatField
      FieldName = 'QTDEENTREGA'
    end
    object qryOCDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qryOCPRAZOENTREGA: TFloatField
      FieldName = 'PRAZOENTREGA'
    end
    object qryOCTOTIMP: TFloatField
      FieldName = 'TOTIMP'
    end
    object qryOCTOTITEM: TFloatField
      FieldName = 'TOTITEM'
    end
    object qryOCVALTOTITEM: TFloatField
      FieldName = 'VALTOTITEM'
    end
    object qryOCTOTOC: TFloatField
      FieldName = 'TOTOC'
    end
    object qryOCNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryOCCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryOCDESCRCOMPL: TMemoField
      FieldName = 'DESCRCOMPL'
      BlobType = ftMemo
      Size = 500
    end
    object qryOCOBSITEMOC: TStringField
      FieldName = 'OBSITEMOC'
      Size = 200
    end
    object qryOCCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qryOCFRETE: TStringField
      FieldName = 'FRETE'
      Size = 3
    end
    object qryOCDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object cdsList: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsListAfterScroll
    Left = 72
    Top = 120
  end
  object dsList: TwwDataSource
    AutoEdit = False
    DataSet = cdsList
    Left = 70
    Top = 168
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.CODMEDIDA,'
      '     C.NUMCOT,'
      '     C.DATACOT,'
      '     C.STATUS,'
      '     C.OBS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES,'
      '     P.RAZAOSOCIAL,'
      '     M.MOESIGLA,'
      '     C.OBS AS JUSTIFICATIVA,'
      '     C.PRECO * C.QTDEFORNECIDA AS PRECOTOTAL'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    MOEDA M'
      'WHERE'
      '      (C.CODPROCESSO  = -1)'
      '  AND (C.IDPROCXART   = -1)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (C.MOECODIGO    = M.MOECODIGO(+))'
      '  AND (C.PRECOAVALORPRES IS NOT NULL)'
      'ORDER BY C.PRECOAVALORPRES')
    Left = 440
    Top = 112
  end
end
