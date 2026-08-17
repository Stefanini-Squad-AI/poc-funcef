inherited frmGeraLotePgtoMT: TfrmGeraLotePgtoMT
  Left = 29
  Top = 194
  HelpContext = 30035
  Caption = 'Gera Lote de Pagamento'
  ClientHeight = 488
  ClientWidth = 787
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inherited CPForCli: TCMProcuraForCli [0]
    Left = 295
    Top = 44
    Width = 304
    Height = 48
    Visible = False
  end
  inherited pnlFundo: TPanel [1]
    Width = 787
    Height = 449
    object Splitter1: TSplitter
      Left = 5
      Top = 5
      Width = 777
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 5
      Top = 226
      Width = 777
      Height = 218
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelWidth = 2
      TabOrder = 0
      object Panel3: TPanel
        Left = 2
        Top = 30
        Width = 773
        Height = 186
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        Caption = 'Panel3'
        TabOrder = 0
        object dbgrdLotePagto: TwwDBGrid
          Left = 116
          Top = 5
          Width = 652
          Height = 157
          Selected.Strings = (
            'NOME'#9'40'#9'Nome\Razão Social'
            'NODOCUMENTO'#9'15'#9'Documento'
            'COMPLDOCUMENTO'#9'5'#9'Comp'
            'DATAPROGRAMADA'#9'10'#9'Data Prog'
            'DATAVENCTO'#9'10'#9'Data Venc'
            'VALOR'#9'19'#9'Valor Pago')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsLoteXDocum
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnCalcCellColors = dbgrdDocPendentesCalcCellColors
          IndicatorColor = icBlack
        end
        object Panel10: TPanel
          Left = 5
          Top = 5
          Width = 111
          Height = 157
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object bbtnDesfazPgto: TBitBtn
            Left = 4
            Top = 5
            Width = 105
            Height = 28
            Caption = 'Exclui'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnDesfazPgtoClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777770
              9977700000007777997777099777700000007777799770997777700000007777
              7799099777777000000077777777997777777000000070000009999777777000
              000070FFFF99F99977777000000070F88997F09997777000000070FF99FFF079
              99777000000070F88888F07799777000000070FFFFFFF07779777000000070F8
              8777F07777777000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
          end
          object bbtnCriaLote: TBitBtn
            Left = 5
            Top = 101
            Width = 105
            Height = 28
            Caption = 'Cria Lote'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = bbtnCriaLoteClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777772077777700000007777
              7777222077777000000077777772222077777000000070000022202207777000
              000070FFF222F07220777000000070F8882FF07720777000000070FFFFFFF077
              72077000000070F88888F07777207000000070FFFFFFF07777720000000070F8
              8777F07777772000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
            Spacing = 2
          end
          object bbtnFavorecido: TBitBtn
            Left = 4
            Top = 36
            Width = 105
            Height = 28
            Caption = '&Favorecido'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = bbtnFavorecidoClick
          end
          object bbtnObs: TBitBtn
            Left = 5
            Top = 68
            Width = 105
            Height = 28
            Caption = '&Observação'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = bbtnObsClick
          end
        end
        object SbLote: TStatusBar
          Left = 5
          Top = 162
          Width = 763
          Height = 19
          Panels = <
            item
              Text = 'Nº Do Lote Gerado'
              Width = 200
            end
            item
              Text = 'Valor Total do Lote'
              Width = 300
            end
            item
              Text = 'Data de Emissão'
              Width = 50
            end>
          SimplePanel = False
        end
      end
      object Pnldocpago: TPanel
        Left = 2
        Top = 2
        Width = 773
        Height = 28
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos a Serem Pagos No Lote'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 8
      Width = 777
      Height = 218
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 1
      object Panel5: TPanel
        Left = 1
        Top = 28
        Width = 775
        Height = 170
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        Caption = 'Panel5'
        TabOrder = 0
        object dbgrdDocPendentes: TwwDBGrid
          Left = 116
          Top = 5
          Width = 654
          Height = 160
          Selected.Strings = (
            'NOME'#9'39'#9'Nome\Razão Social'
            'NODOCUMENTO'#9'15'#9'Documento'
            'COMPLDOCUMENTO'#9'5'#9'Comp'
            'DATAPROGRAMADA'#9'10'#9'Data Prog'
            'DATAVENCTO'#9'10'#9'Data Venc'
            'SALDO'#9'19'#9'Saldo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          OnMultiSelectRecord = dbgrdDocPendentesMultiSelectRecord
          FixedCols = 0
          ShowHorzScrollBar = False
          Align = alClient
          DataSource = dsDocPendentes
          EditCalculated = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          UseTFields = False
          OnCalcCellColors = dbgrdDocPendentesCalcCellColors
          IndicatorColor = icBlack
        end
        object Panel9: TPanel
          Left = 5
          Top = 5
          Width = 111
          Height = 160
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object bbtnPgto: TBitBtn
            Left = 4
            Top = 38
            Width = 104
            Height = 28
            Caption = 'Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnPgtoClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777777777777700000007777
              7777777777777000000077777777777777777000000070000000007777777000
              000070FFFFF0207777777000000070F77702200000077000000070FFF0222222
              22077000000070F88702200000077000000070FFFFF0207777777000000070F8
              8777007777777000000070FFFF00007777777000000070F88707077777777000
              000070FFFF007777777770000000700000077777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
          end
          object bbtnPgtoParcial: TBitBtn
            Left = 4
            Top = 69
            Width = 104
            Height = 28
            Caption = 'Parcial'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = bbtnPgtoParcialClick
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777700000007777777777777777700000007777777777777777700000007777
              70000000007770000000777770FFFFF0207770000000777770F7770220000000
              0000777770FFF022222200000000777700F887022000000000007777090FFFF0
              207770000000000009908777007770000000099999990F000077700000000000
              099087070777700000007777090FFF0077777000000077770000000777777000
              0000777777777777777770000000777777777777777770000000777777777777
              777770000000}
            Layout = blGlyphRight
          end
          object btnSelecionarDoc: TBitBtn
            Left = 4
            Top = 5
            Width = 104
            Height = 28
            Caption = '&Procurar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btnSelecionarDocClick
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
          end
        end
      end
      object PnlDocPendentes: TPanel
        Left = 1
        Top = 1
        Width = 775
        Height = 27
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos Pendentes para pagamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
      object SbStatusSelecao: TStatusBar
        Left = 1
        Top = 198
        Width = 775
        Height = 19
        Panels = <
          item
            Text = 'Documentos pendentes:'
            Width = 200
          end
          item
            Text = 'Valor total da seleção:'
            Width = 50
          end>
        SimplePanel = False
      end
    end
  end
  inherited Dock971: TDock97 [2]
    Top = 449
    Width = 787
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30035
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 365
    Top = 372
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsDocPendentes: TwwDataSource
    DataSet = CdsDocPendentes
    Left = 232
    Top = 326
  end
  object CdsDocPendentes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CdsDocPendentesCalcFields
    Left = 232
    Top = 282
    object CdsDocPendentesNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object CdsDocPendentesDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'DOCUMENTO.DATAPROGRAMADA'
    end
    object CdsDocPendentesDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Size = 50
      Calculated = True
    end
    object CdsDocPendentesDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'DOCUMENTO.DATAVENCTO'
    end
    object CdsDocPendentesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 17
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object CdsDocPendentesIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'DOCUMENTO.IDPESSOA'
      Visible = False
    end
    object CdsDocPendentesNODOCUMENTO: TFloatField
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'DOCUMENTO.NODOCUMENTO'
      Visible = False
    end
    object CdsDocPendentesCOMPLDOCUMENTO: TStringField
      DisplayWidth = 20
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'DOCUMENTO.COMPLDOCUMENTO'
      Visible = False
      Size = 3
    end
    object CdsDocPendentesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
    end
    object CdsDocPendentesRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object CdsDocPendentesSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
      Visible = False
      Size = 1
    end
    object CdsDocPendentesIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object CdsDocPendentesOPERACAO: TStringField
      DisplayWidth = 2
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object CdsDocPendentesNUMLEITCODBARRAS: TStringField
      FieldName = 'NUMLEITCODBARRAS'
      Size = 60
    end
    object CdsDocPendentesNUMDIGCODBARRAS: TStringField
      FieldName = 'NUMDIGCODBARRAS'
      Size = 60
    end
    object CdsDocPendentesVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsLoteXDocum: TwwDataSource
    DataSet = CdsLoteXDocumento
    Left = 189
    Top = 326
  end
  object CdsLoteXDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CdsLoteXDocumentoCalcFields
    Left = 189
    Top = 282
    object CdsLoteXDocumentoNOME: TStringField
      DisplayLabel = 'Nome\Razão Social'
      DisplayWidth = 39
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object CdsLoteXDocumentoDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Prog'
      DisplayWidth = 10
      FieldName = 'DATAPROGRAMADA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLoteXDocumentoDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc'
      DisplayWidth = 10
      FieldName = 'DATAVENCTO'
      Origin = 'LOTEPAGTO.IDPESSJUR'
    end
    object CdsLoteXDocumentoNODOCUMENTO: TFloatField
      DisplayLabel = 'Documento'
      DisplayWidth = 15
      FieldName = 'NODOCUMENTO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object CdsLoteXDocumentoCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Comp'
      DisplayWidth = 3
      FieldName = 'COMPLDOCUMENTO'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
      Size = 3
    end
    object CdsLoteXDocumentoVALOR: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 20
      FieldName = 'VALOR'
      Origin = 'LOTEXDOCUM.VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsLoteXDocumentoDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 19
      FieldKind = fkCalculated
      FieldName = 'DOCUMENTO'
      Visible = False
      Size = 50
      Calculated = True
    end
    object CdsLoteXDocumentoCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'LOTEXDOCUM.CODDOCUMENTO'
      Visible = False
    end
    object CdsLoteXDocumentoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEXDOCUM.NUMLOTE'
      Visible = False
    end
    object CdsLoteXDocumentoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Origin = 'LOTEXDOCUM.CODBARRA'
      Size = 60
    end
    object CdsLoteXDocumentoCODBARRAVALOR: TStringField
      FieldName = 'CODBARRAVALOR'
      Origin = 'LOTEXDOCUM.CODBARRAVALOR'
      Size = 60
    end
    object CdsLoteXDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'DOCUMENTO.OPERACAO'
      Size = 2
    end
    object CdsLoteXDocumentoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'DOCUMENTO.IDFORCLI'
    end
    object CdsLoteXDocumentoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsLoteXDocumentoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      DisplayFormat = '#,##0.00'
    end
  end
  object CdsDescPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 275
    Top = 326
    object CdsDescPortadorFormaDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object CdsDescPortadorFormaCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
    end
    object CdsDescPortadorFormaIDTEMPLCHEQUE: TFloatField
      FieldName = 'IDTEMPLCHEQUE'
      Origin = 'PORTADORFORMA.IDTEMPLCHEQUE'
    end
    object CdsDescPortadorFormaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDescPortadorFormaCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'PORTADORFORMA.CODFORMA'
    end
    object CdsDescPortadorFormaFLGCHEQUEDIFERIDO: TStringField
      FieldName = 'FLGCHEQUEDIFERIDO'
      Size = 1
    end
    object CdsDescPortadorFormaFLGOBRIGAFAV: TStringField
      FieldName = 'FLGOBRIGAFAV'
      Origin = 'PORTADORFORMA.FLGOBRIGAFAV'
      Size = 1
    end
  end
  object dsLotePagto: TwwDataSource
    DataSet = CdsLotePagto
    Left = 147
    Top = 326
  end
  object CdsLotePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 147
    Top = 282
    object CdsLotePagtoNUMLOTE: TFloatField
      FieldName = 'NUMLOTE'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLotePagtoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
    end
    object CdsLotePagtoDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'LOTEPAGTO.DATAEMISSAO'
    end
    object CdsLotePagtoNUMCHQBORDERO: TStringField
      FieldName = 'NUMCHQBORDERO'
      Origin = 'LOTEPAGTO.NUMCHQBORDERO'
      Size = 15
    end
    object CdsLotePagtoFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Origin = 'LOTEPAGTO.FAVORECIDO'
      Size = 60
    end
    object CdsLotePagtoFLAGEMISSAO: TStringField
      FieldName = 'FLAGEMISSAO'
      Origin = 'LOTEPAGTO.FLAGEMISSAO'
      Size = 1
    end
    object CdsLotePagtoFLAGCANCEL: TStringField
      FieldName = 'FLAGCANCEL'
      Origin = 'LOTEPAGTO.FLAGCANCEL'
      Size = 1
    end
    object CdsLotePagtoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'LOTEPAGTO.OBSERVACAO'
      Size = 80
    end
    object CdsLotePagtoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object CdsLotePagtoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'LOTEPAGTO.IDPESSOA'
    end
    object CdsLotePagtoIDPROCESSO: TFloatField
      FieldName = 'IDPROCESSO'
      Origin = '"CM.LOTEPAGTO".IDPROCESSO'
    end
    object CdsLotePagtoDATADIFERIDO: TDateTimeField
      FieldName = 'DATADIFERIDO'
    end
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 318
    Top = 282
  end
  object CdsNumlancto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 318
    Top = 372
    object CdsNumlanctoNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = '"CM.LANCTODOCUM".NUMLANCTO'
    end
    object CdsNumlanctoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = '"CM.LANCTODOCUM".DEBCRE'
      Size = 1
    end
  end
  object CdsFormadePagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 275
    Top = 370
    object CdsFormaPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object CdsFormaPagCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
    object CdsFormaPagRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'FORMARECPAG.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object Cdsseladiantpendent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 275
    Top = 282
  end
  object CdsModulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 364
    Top = 326
    object CdsModulosNOMEMODULO: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEMODULO'
      Origin = 'MODULO.NOMEMODULO'
      Size = 50
    end
    object CdsModulosIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Origin = 'MODULO.IDMODULO'
      Visible = False
    end
  end
  object CdsTipoDocRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 363
    Top = 282
    object CdsTipoDocRecPagDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object CdsTipoDocRecPagCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object CdsSaldoLoteNaoEmitido: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 407
    Top = 282
    object CdsSaldoLoteNaoEmitidoVALORLOTE: TFloatField
      FieldName = 'VALORLOTE'
      Origin = 'LOTEXDOCUM.VALOR'
    end
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 414
    Top = 328
  end
  object cdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 327
  end
  object CmpDadosParaBaixa: TCmParamReport
    Caption = 'Dados Para Pesquisa de Documentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Contas Caixas X Tipos de Cobranca'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA,'
          '  CODPORTADOR,'
          '  DESCFINAN,'
          '  FLGCHEQUEDIFERIDO,'
          '  FLGCONTROLACHEQUE'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'dblkcmbDescricao'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Cliente'
        Controle = tcProcuraFC
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CPForCli'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceNome
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcCliente
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Documento'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Documento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 100
      end
      item
        Caption = 'Complemento'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = True
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Complemento'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 50
      end
      item
        Caption = 'Forma de Pagamento'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODFORMA, RECPAG, DESCRICAO'
          'FROM FORMARECPAG '
          'WHERE (1=2)')
        LookupSettings.Chave = 'CODFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Formade Pagamento'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DblCodForma'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Tipo de Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          '  SELECT CODTIPDOC,DESCRICAO  FROM TIPODOCRECPAG a'
          '  WHERE (1=2)')
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CmbTipoDocRecPag'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Sistema de Origem'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDMODULO, NOMEMODULO'
          'FROM'
          '  MODULO'
          'ORDER BY'
          '  NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Módulo'
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CmbSisOrigem'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Programada - Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DtIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Data Programada - Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DtFim'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = ' Filtro Para Seleção de Documentos '
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clBtnFace
        EditSettings.Readonly = True
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clBtnFace
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 1
      end
      item
        Caption = 'Contas Caixas X Formas de Pagamento'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbPortForma'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Formas de Pagamento'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbSelDoc'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Lista apenas documentos marcados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbAutorPag'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Lista também Documentos do tipo CPMF'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'CkbCPMF'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 450
    FormWidth = 540
    Left = 549
    Top = 305
  end
end
