inherited frmExecCalculoDivergencia: TfrmExecCalculoDivergencia
  Left = 184
  Top = 170
  Caption = 'Calcula Divergências'
  ClientHeight = 407
  ClientWidth = 648
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 648
    Height = 368
    inherited PagControle: TPageControl
      Width = 646
      Height = 366
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 638
          Caption = 'Cálculo de Divergências [ Seleção ]'
        end
        object Label2: TLabel
          Left = 136
          Top = 256
          Width = 116
          Height = 13
          Caption = 'Data de Vencimento'
        end
        inline molContrato: TmolContrato
          Left = 125
          Top = 60
          Width = 385
          Height = 42
          TabOrder = 0
        end
        object GroupBox1: TGroupBox
          Left = 133
          Top = 176
          Width = 370
          Height = 65
          Caption = ' Documentos vencidos entre '
          TabOrder = 1
          object Label1: TLabel
            Left = 175
            Top = 36
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 40
            Top = 33
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 0
          end
          object edtDataFim: TCMDateTimePicker
            Left = 196
            Top = 32
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 1
          end
        end
        inline molImovelouMestre: TmolImovelouMestre
          Left = 125
          Top = 112
          Width = 388
          Height = 44
          TabOrder = 2
        end
        object edtDataCalculo: TCMDateTimePicker
          Left = 136
          Top = 273
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 3
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 405
          Caption = 'Cálculo de Divergências [ Documentos ]'
        end
        object Splitter1: TSplitter
          Left = 0
          Top = 177
          Width = 638
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 638
          Height = 21
          Align = alTop
          Caption = 'Contratos Selecionados'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object Panel2: TPanel
          Left = 0
          Top = 45
          Width = 638
          Height = 132
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object dbgrdContrato: TwwDBGrid
            Left = 0
            Top = 0
            Width = 638
            Height = 132
            Selected.Strings = (
              'CONNUMERO'#9'14'#9'Número'#9'F'
              'CONNOME'#9'25'#9'Nome do Contrato'#9'F'
              'LOCATARIO'#9'25'#9'Nome do Locatário'#9'F'
              'CONDATAINICIO'#9'11'#9'Ini. Vigência'#9'F'
              'CONDATAFIM'#9'11'#9'Fim Vigência'#9'F'
              'DSCTIPOCONTRATO'#9'14'#9'Tipo do Contrato'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            OnRowChanged = dbgrdContratoRowChanged
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtsContratos
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            RowHeightPercent = 120
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            OnTitleButtonClick = dbgrdContratoTitleButtonClick
            OnKeyDown = dbgrdContratoKeyDown
            IndicatorColor = icBlack
            OnCalcTitleImage = dbgrdContratoCalcTitleImage
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 180
          Width = 638
          Height = 21
          Align = alTop
          Caption = 'Documentos Inadimplentes'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object Panel4: TPanel
          Left = 0
          Top = 201
          Width = 638
          Height = 155
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 3
          object dbgrdDocumento: TwwDBGrid
            Left = 0
            Top = 0
            Width = 638
            Height = 155
            Selected.Strings = (
              'NODOCUMENTO'#9'14'#9'No. Documento'#9'F'
              'DESCCUSTORECIMO'#9'21'#9'Tipo de Receita'#9'F'
              'COMPETENCIA'#9'12'#9'Competência'#9'F'
              'DATAVENCTO'#9'12'#9'Vencimento'#9'F'
              'DATALIMITE'#9'12'#9'Data limite'#9'F'
              'VALOR_ORIGINAL'#9'14'#9'Valor Original'#9'F'
              'DIAS_ATRASO'#9'14'#9'Dias de Atraso'#9'F'
              'CORRECMONET'#9'15'#9'Correção Monetária'#9'F'
              'MULTA'#9'10'#9'Multa'#9'F'
              'JUROS'#9'10'#9'Juros'#9'F'
              'VALORATUAL'#9'14'#9'Valor Atualizado'#9'F'
              'DATAPAGTO'#9'12'#9'Ult. Pagto'#9'F'
              'VALOR_RECEBIDO'#9'14'#9'Valor Recebido'#9'F'
              'PROPORCAO'#9'10'#9'Proporção'#9'F'
              'VALORDIVERG'#9'14'#9'Valor Divergente'#9'F'
              'CORRECMONETDIF'#9'15'#9'Correc. Monet. Dif.'#9'F'
              'JUROSDIF'#9'10'#9'Juros Dif.'#9'F'
              'MULTADIF'#9'10'#9'Multa Dif.'#9'F'
              'VALORDIVERGATUAL'#9'14'#9'Valor Div. Atual.'#9'F'
              'DATACALCULO'#9'13'#9'Data de Cálculo'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtsDocumentos
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            RowHeightPercent = 120
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnKeyDown = dbgrdContratoKeyDown
            IndicatorColor = icBlack
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 648
    inherited tb97Fundo: TToolbar97
      Left = 208
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONNUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONNOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'LOCATARIO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CONDATAINICIO'
        DataType = ftDateTime
      end
      item
        Name = 'CONDATAFIM'
        DataType = ftDateTime
      end
      item
        Name = 'DSCTIPOCONTRATO'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOCONTRATO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONVLRMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONPERCENTMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONMOEDAMULTA'
        DataType = ftFloat
      end
      item
        Name = 'CONVLRMORA'
        DataType = ftFloat
      end
      item
        Name = 'CONPERCENTMORA'
        DataType = ftFloat
      end
      item
        Name = 'CONMOEDAMORA'
        DataType = ftFloat
      end
      item
        Name = 'CONDIASTOLERANCIA'
        DataType = ftFloat
      end
      item
        Name = 'CONDIASREPASSE'
        DataType = ftFloat
      end
      item
        Name = 'IDINDCORRECAO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMORAPROPORC'
        DataType = ftFloat
      end
      item
        Name = 'IDCIDADES'
        DataType = ftFloat
      end
      item
        Name = 'IDPAIS'
        DataType = ftFloat
      end
      item
        Name = 'CONPERMORA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODESTADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CONMESREFREAJUSTE'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGTIPODIATOLERA'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 64
    object cdsContratosCONNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 14
      FieldName = 'CONNUMERO'
    end
    object cdsContratosCONNOME: TStringField
      DisplayLabel = 'Nome do Contrato'
      DisplayWidth = 25
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsContratosLOCATARIO: TStringField
      DisplayLabel = 'Nome do Locatário'
      DisplayWidth = 25
      FieldName = 'LOCATARIO'
      Size = 60
    end
    object cdsContratosCONDATAINICIO: TDateTimeField
      DisplayLabel = 'Ini. Vigência'
      DisplayWidth = 11
      FieldName = 'CONDATAINICIO'
    end
    object cdsContratosCONDATAFIM: TDateTimeField
      DisplayLabel = 'Fim Vigência'
      DisplayWidth = 11
      FieldName = 'CONDATAFIM'
    end
    object cdsContratosDSCTIPOCONTRATO: TStringField
      DisplayLabel = 'Tipo do Contrato'
      DisplayWidth = 14
      FieldName = 'DSCTIPOCONTRATO'
      Size = 9
    end
    object cdsContratosIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsContratosIDLOCATARIO: TFloatField
      FieldName = 'IDLOCATARIO'
    end
    object cdsContratosFLGTIPOCONTRATO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContratosCONVLRMULTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONVLRMULTA'
      Visible = False
    end
    object cdsContratosCONPERCENTMULTA: TFloatField
      FieldName = 'CONPERCENTMULTA'
      Visible = False
    end
    object cdsContratosCONMOEDAMULTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONMOEDAMULTA'
      Visible = False
    end
    object cdsContratosCONVLRMORA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONVLRMORA'
      Visible = False
    end
    object cdsContratosCONPERCENTMORA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONPERCENTMORA'
      Visible = False
    end
    object cdsContratosCONMOEDAMORA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONMOEDAMORA'
      Visible = False
    end
    object cdsContratosCONDIASTOLERANCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'CONDIASTOLERANCIA'
      Visible = False
    end
    object cdsContratosCONDIASREPASSE: TFloatField
      DisplayWidth = 10
      FieldName = 'CONDIASREPASSE'
      Visible = False
    end
    object cdsContratosIDINDCORRECAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDCORRECAO'
      Visible = False
    end
    object cdsContratosFLGMORAPROPORC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGMORAPROPORC'
      Visible = False
    end
    object cdsContratosIDCIDADES: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object cdsContratosIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Visible = False
    end
    object cdsContratosCONPERMORA: TStringField
      DisplayLabel = 'Perc. Mora'
      DisplayWidth = 1
      FieldName = 'CONPERMORA'
      Visible = False
      Size = 1
    end
    object cdsContratosCODESTADO: TStringField
      DisplayLabel = 'Cod. Estado'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      Visible = False
      Size = 3
    end
    object cdsContratosCONMESREFREAJUSTE: TStringField
      DisplayLabel = 'Mês Reajuste'
      DisplayWidth = 1
      FieldName = 'CONMESREFREAJUSTE'
      Visible = False
      Size = 1
    end
    object cdsContratosFLGTIPODIATOLERA: TStringField
      FieldName = 'FLGTIPODIATOLERA'
      Visible = False
      Size = 1
    end
  end
  object dtsContratos: TDataSource
    DataSet = cdsContratos
    Left = 544
    Top = 64
  end
  object cdsDocumentos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDPARCFINANCIMOV'
        DataType = ftFloat
      end
      item
        Name = 'NODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPOLANC'
        DataType = ftFloat
      end
      item
        Name = 'DESCCUSTORECIMO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATAVENCTO'
        DataType = ftDateTime
      end
      item
        Name = 'DATALIMITE'
        DataType = ftDateTime
      end
      item
        Name = 'COMPETENCIA'
        DataType = ftString
        Size = 44
      end
      item
        Name = 'DIAS_ATRASO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_ORIGINAL'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_RECEBIDO'
        DataType = ftFloat
      end
      item
        Name = 'DATAPAGTO'
        DataType = ftDateTime
      end
      item
        Name = 'MULTA'
        DataType = ftFloat
      end
      item
        Name = 'JUROS'
        DataType = ftFloat
      end
      item
        Name = 'CORRECMONET'
        DataType = ftFloat
      end
      item
        Name = 'MULTADIF'
        DataType = ftFloat
      end
      item
        Name = 'JUROSDIF'
        DataType = ftFloat
      end
      item
        Name = 'CORRECMONETDIF'
        DataType = ftFloat
      end
      item
        Name = 'PROPORCAO'
        DataType = ftFloat
      end
      item
        Name = 'VALORATUAL'
        DataType = ftFloat
      end
      item
        Name = 'VALORDIVERG'
        DataType = ftFloat
      end
      item
        Name = 'VALORDIVERGATUAL'
        DataType = ftFloat
      end
      item
        Name = 'DATACALCULO'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 478
    Top = 136
    object cdsDocumentosNODOCUMENTO: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = 'No. Documento'
      DisplayWidth = 14
      FieldName = 'NODOCUMENTO'
    end
    object cdsDocumentosDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 21
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsDocumentosCOMPETENCIA: TStringField
      DisplayLabel = 'Competência'
      DisplayWidth = 12
      FieldName = 'COMPETENCIA'
      Size = 44
    end
    object cdsDocumentosDATAVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 12
      FieldName = 'DATAVENCTO'
    end
    object cdsDocumentosDATALIMITE: TDateTimeField
      DisplayLabel = 'Data limite'
      DisplayWidth = 12
      FieldName = 'DATALIMITE'
    end
    object cdsDocumentosVALOR_ORIGINAL: TFloatField
      DisplayLabel = 'Valor Original'
      DisplayWidth = 14
      FieldName = 'VALOR_ORIGINAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosDIAS_ATRASO: TFloatField
      DisplayLabel = 'Dias de Atraso'
      DisplayWidth = 14
      FieldName = 'DIAS_ATRASO'
    end
    object cdsDocumentosCORRECMONET: TFloatField
      DisplayLabel = 'Correção Monetária'
      DisplayWidth = 15
      FieldName = 'CORRECMONET'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosMULTA: TFloatField
      DisplayLabel = 'Multa'
      DisplayWidth = 10
      FieldName = 'MULTA'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosJUROS: TFloatField
      DisplayLabel = 'Juros'
      DisplayWidth = 10
      FieldName = 'JUROS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosVALORATUAL: TFloatField
      DisplayLabel = 'Valor Atualizado'
      DisplayWidth = 14
      FieldName = 'VALORATUAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosDATAPAGTO: TDateTimeField
      DisplayLabel = 'Ult. Pagto'
      DisplayWidth = 12
      FieldName = 'DATAPAGTO'
    end
    object cdsDocumentosVALOR_RECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 14
      FieldName = 'VALOR_RECEBIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosPROPORCAO: TFloatField
      DisplayLabel = 'Proporção'
      DisplayWidth = 10
      FieldName = 'PROPORCAO'
      DisplayFormat = '#,##0.0%'
      EditFormat = '#,##0.0%'
    end
    object cdsDocumentosVALORDIVERG: TFloatField
      DisplayLabel = 'Valor Divergente'
      DisplayWidth = 14
      FieldName = 'VALORDIVERG'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosCORRECMONETDIF: TFloatField
      DisplayLabel = 'Correc. Monet. Dif.'
      DisplayWidth = 15
      FieldName = 'CORRECMONETDIF'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosJUROSDIF: TFloatField
      DisplayLabel = 'Juros Dif.'
      DisplayWidth = 10
      FieldName = 'JUROSDIF'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosMULTADIF: TFloatField
      DisplayLabel = 'Multa Dif.'
      DisplayWidth = 10
      FieldName = 'MULTADIF'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosVALORDIVERGATUAL: TFloatField
      DisplayLabel = 'Valor Div. Atual.'
      DisplayWidth = 14
      FieldName = 'VALORDIVERGATUAL'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsDocumentosDATACALCULO: TDateTimeField
      Alignment = taRightJustify
      DisplayLabel = 'Data de Cálculo'
      DisplayWidth = 13
      FieldName = 'DATACALCULO'
    end
    object cdsDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object cdsDocumentosIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
      Visible = False
    end
    object cdsDocumentosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object cdsDocumentosFLGTIPOLANC: TFloatField
      FieldName = 'FLGTIPOLANC'
      Visible = False
    end
  end
  object dtsDocumentos: TDataSource
    DataSet = cdsDocumentos
    Left = 550
    Top = 135
  end
  object cdsAltGerado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 525
    Top = 263
  end
  object cdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 525
    Top = 319
  end
end
