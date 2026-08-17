inherited frmExecCalcIndicadores: TfrmExecCalcIndicadores
  Left = 91
  Top = 156
  HelpContext = 4390004
  Caption = 'Calcula Indicadores'
  ClientHeight = 329
  ClientWidth = 618
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 618
    Height = 290
    inherited PagControle: TPageControl
      Width = 616
      Height = 288
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 608
          Caption = 'Calcula Indicadores [ Seleção ]'
        end
        object Panel2: TPanel
          Left = 24
          Top = 159
          Width = 377
          Height = 92
          TabOrder = 0
          object Label15: TLabel
            Left = 16
            Top = 26
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label5: TLabel
            Left = 256
            Top = 26
            Width = 101
            Height = 13
            Caption = 'Data Lançamento'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 178
            Top = 44
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
            OnExit = DBspnAnoExit
          end
          object edtDataLancamento: TCMDateTimePicker
            Left = 256
            Top = 44
            Width = 105
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
            TabOrder = 2
          end
          object cboMes: TComboBox
            Left = 16
            Top = 44
            Width = 161
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnExit = cboMesExit
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
        end
        inline molContratoLoja1: TmolContratoLoja
          Left = 16
          Top = 96
          Width = 561
          TabOrder = 2
          inherited Label1: TLabel
            Font.Height = -9
          end
          inherited edtContrato: TEdit
            Width = 497
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 504
            OnClick = molContratoLoja1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 528
          end
        end
        object GroupBox1: TGroupBox
          Left = 416
          Top = 153
          Width = 153
          Height = 98
          TabOrder = 3
          object chkABL: TCheckBox
            Left = 8
            Top = 21
            Width = 97
            Height = 17
            Caption = 'ABL'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkAluguel: TCheckBox
            Left = 8
            Top = 45
            Width = 113
            Height = 17
            Caption = 'Aluguel Mínimo'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbRegras: TCheckBox
            Left = 8
            Top = 69
            Width = 113
            Height = 17
            Caption = 'Regras'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        inline molImovel1: TmolImovel
          Left = 16
          Top = 40
          Width = 577
          TabOrder = 1
          inherited edtImovel: TEdit
            Width = 497
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 504
            OnClick = molImovel1btnBuscaImovelClick
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 528
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 608
          Caption = 'Calcula Indicadores [ Contratos a Prorrogar ]'
        end
        object dbgProrrogar: TwwDBGrid
          Left = 0
          Top = 24
          Width = 608
          Height = 254
          ControlType.Strings = (
            'CAL_ENCERRAR;CheckBox;1;0'
            'CHKBOX;CheckBox;1;0')
          Selected.Strings = (
            'CHKBOX'#9'7'#9'Encerra'#9'F'
            'NOME_EXTENSO'#9'35'#9'Imóvel'#9'T'
            'CONTRATO_EXTENSO'#9'37'#9'Contrato'#9'T'
            'DATTERMINO'#9'12'#9'Data Término'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContratosProrrogar
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnDblClick = dbgProrrogarDblClick
          IndicatorColor = icBlack
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 453
          Height = 24
          Align = alTop
          Caption = 'Calcula Indicadores [ Reajustes Contratuais ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object wwDBGrid2: TwwDBGrid
          Left = 0
          Top = 24
          Width = 600
          Height = 246
          Selected.Strings = (
            'NOME_EXTENSO'#9'32'#9'Imóvel'
            'CONTRATO_EXTENSO'#9'35'#9'Contrato'
            'DATPROXREAJUSTE'#9'12'#9'Próx. Reajuste'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContratosReajustar
          ReadOnly = True
          TabOrder = 0
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
      object TabSheet3: TTabSheet
        Caption = 'TabSheet3'
        ImageIndex = 3
        TabVisible = False
        object fcLabel3: TfcLabel
          Left = 0
          Top = 0
          Width = 608
          Height = 24
          Align = alTop
          Caption = 'Calcula Indicadores [ Lançamentos ]'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
        end
        object PageControl1: TPageControl
          Left = 0
          Top = 24
          Width = 608
          Height = 254
          ActivePage = TabSheet4
          Align = alClient
          TabOrder = 0
          TabPosition = tpBottom
          object TabSheet4: TTabSheet
            Caption = 'Shopping'
            object wwDBGrid3: TwwDBGrid
              Left = 0
              Top = 0
              Width = 592
              Height = 218
              Selected.Strings = (
                'NOME_EXTENSO'#9'32'#9'Imóvel'#9'T'
                'CONTRATO_EXTENSO'#9'35'#9'Contrato'#9'T'
                'VLRALUGMIN'#9'12'#9'   Aluguel Mín.'#9'T'
                'QTDEABL'#9'12'#9'               ABL'#9'T')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContratosCalcular
              ReadOnly = True
              TabOrder = 0
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
          object TabSheet5: TTabSheet
            Caption = 'Hotel'
            ImageIndex = 1
            object wwDBGrid1: TwwDBGrid
              Left = 0
              Top = 0
              Width = 592
              Height = 218
              Selected.Strings = (
                'NUMCONTRATO'#9'12'#9'Nr. Contrato'
                'NOMCONTRATO'#9'66'#9'Descrição')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContratosHotel
              ReadOnly = True
              TabOrder = 0
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 290
    Width = 618
    inherited tb97Fundo: TToolbar97
      Left = 201
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  object cdsContratosCalcular: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 134
    object cdsContratosCalcularNOME_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 32
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object cdsContratosCalcularCONTRATO_EXTENSO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 35
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object cdsContratosCalcularVLRALUGMIN: TFloatField
      DisplayLabel = '   Aluguel Mín.'
      DisplayWidth = 12
      FieldName = 'VLRALUGMIN'
      DisplayFormat = '#,##0.00'
    end
    object cdsContratosCalcularQTDEABL: TFloatField
      DisplayLabel = '               ABL'
      DisplayWidth = 12
      FieldName = 'QTDEABL'
      DisplayFormat = '#,##0.00'
    end
    object cdsContratosCalcularDATPROXREAJUSTE: TDateTimeField
      DisplayLabel = 'Próximo Reajuste'
      DisplayWidth = 18
      FieldName = 'DATPROXREAJUSTE'
      Visible = False
    end
    object cdsContratosCalcularDATTERMINO: TDateTimeField
      DisplayLabel = 'Data Término'
      DisplayWidth = 12
      FieldName = 'DATTERMINO'
      Visible = False
    end
    object cdsContratosCalcularDATREAJUSTE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATREAJUSTE'
      Visible = False
    end
    object cdsContratosCalcularNUMCONTRATO: TStringField
      DisplayLabel = 'Núm. Contrato'
      DisplayWidth = 12
      FieldName = 'NUMCONTRATO'
      Visible = False
    end
    object cdsContratosCalcularNOMCONTRATO: TStringField
      DisplayLabel = 'Nome Contrato'
      DisplayWidth = 60
      FieldName = 'NOMCONTRATO'
      Visible = False
      Size = 60
    end
    object cdsContratosCalcularIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsContratosCalcularIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsContratosCalcularTIPOCONTRATO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContratosCalcularLOJAS: TStringField
      DisplayWidth = 20
      FieldName = 'LOJAS'
      Visible = False
    end
    object cdsContratosCalcularDATINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATINICIO'
      Visible = False
    end
    object cdsContratosCalcularPERALUGVARIAVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'PERALUGVARIAVEL'
      Visible = False
    end
    object cdsContratosCalcularINDICEREAJUSTE: TFloatField
      DisplayWidth = 10
      FieldName = 'INDICEREAJUSTE'
      Visible = False
    end
    object cdsContratosCalcularDATULTAUDITORIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATULTAUDITORIA'
      Visible = False
    end
    object cdsContratosCalcularIDATIVIDADE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
    object cdsContratosCalcularIDMARCA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Visible = False
    end
    object cdsContratosCalcularPERREAJUSTE: TFloatField
      DisplayWidth = 10
      FieldName = 'PERREAJUSTE'
      Visible = False
    end
    object cdsContratosCalcularDESCRICAO: TMemoField
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object cdsContratosCalcularFLGINDETERMINADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINDETERMINADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsContratosCalcular: TwwDataSource
    DataSet = cdsContratosCalcular
    Left = 464
    Top = 120
  end
  object cdsContratosReajustar: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 69
    object StringField1: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 32
      FieldName = 'NOME_EXTENSO'
      Size = 123
    end
    object StringField2: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 35
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Próx. Reajuste'
      DisplayWidth = 12
      FieldName = 'DATPROXREAJUSTE'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Término'
      DisplayWidth = 12
      FieldName = 'DATTERMINO'
      Visible = False
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Aluguel Mínimo'
      DisplayWidth = 10
      FieldName = 'VLRALUGMIN'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField3: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATREAJUSTE'
      Visible = False
    end
    object StringField3: TStringField
      DisplayLabel = 'Núm. Contrato'
      DisplayWidth = 12
      FieldName = 'NUMCONTRATO'
      Visible = False
    end
    object StringField4: TStringField
      DisplayLabel = 'Nome Contrato'
      DisplayWidth = 60
      FieldName = 'NOMCONTRATO'
      Visible = False
      Size = 60
    end
    object FloatField2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object FloatField3: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object StringField5: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField6: TStringField
      DisplayWidth = 20
      FieldName = 'LOJAS'
      Visible = False
    end
    object DateTimeField4: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATINICIO'
      Visible = False
    end
    object FloatField4: TFloatField
      DisplayWidth = 10
      FieldName = 'PERALUGVARIAVEL'
      Visible = False
    end
    object FloatField5: TFloatField
      DisplayWidth = 10
      FieldName = 'INDICEREAJUSTE'
      Visible = False
    end
    object DateTimeField5: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATULTAUDITORIA'
      Visible = False
    end
    object FloatField6: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
    object FloatField7: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Visible = False
    end
    object FloatField8: TFloatField
      DisplayWidth = 10
      FieldName = 'PERREAJUSTE'
      Visible = False
    end
    object MemoField1: TMemoField
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object FloatField9: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEABL'
      Visible = False
    end
    object StringField7: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINDETERMINADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object cdsContratosProrrogar: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 361
    Top = 133
    Data = {
      A50A00009619E0BD010000001800000017000B00000003000000B0020A494443
      4F4E545241544F0800040000000000084944494D4F56454C0800040000000000
      0B4E554D434F4E545241544F0100490000000100055749445448020002001400
      0B4E4F4D434F4E545241544F0100490000000100055749445448020002003C00
      0C5449504F434F4E545241544F01004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000100054C4F4A415301
      004900000001000557494454480200020014000A564C52414C55474D494E0800
      04000000000009444154494E4943494F08000800000000000A4441545445524D
      494E4F08000800000000000F504552414C5547564152494156454C0800040000
      0000000E494E444943455245414A5553544508000400000000000F444154554C
      5441554449544F52494108000800000000000B49444154495649444144450800
      0400000000000749444D4152434108000400000000000B4441545245414A5553
      544508000800000000000F44415450524F585245414A55535445080008000000
      00000B5045525245414A5553544508000400000000000944455343524943414F
      04004B0000000200075355425459504502004900050054657874000557494454
      4802000200D007075154444541424C080004000000000010464C47494E444554
      45524D494E41444F01004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000C4E4F4D455F455854454E53
      4F0100490000000100055749445448020002007B0010434F4E545241544F5F45
      5854454E534F01004900000001000557494454480200020053000643484B424F
      58080004000000000002000D44454641554C545F4F5244455202008200030000
      00020003000400044C4349440400010009080000000000400004000000000000
      0022400000000000809240033030310A4C6F6A61205465737465015103513235
      000000000070974000005065EDB8CC420000740A8DB9CC420000000000002440
      0000000000004440000000000000F03F0000000000002C4000005065EDB8CC42
      0000E63D99BCCC4200000000000028400000000000004440014E1F53686F7070
      696E67204261727261202D2053686F7070696E6720426172726110303031202D
      204C6F6A61205465737465000000000000000000000040000400000000000000
      2440000000000080924003303032077465737465203201510351313000000000
      007097400000347D6FB3CC4200005065EDB8CC42000000000000244000000000
      0000444000000000000008400000000000002E400000BA8C41B5CC4200005065
      EDB8CC4200000000000028400000000000804140014E1F53686F7070696E6720
      4261727261202D2053686F7070696E672042617272610D303032202D20746573
      7465203200000000000000000000005155050000000000000026400000000000
      8092400330303307746573746520330151035130330000000000709740000068
      8232B7CC420000000000002440000000000080414001531F53686F7070696E67
      204261727261202D2053686F7070696E672042617272610D303033202D207465
      7374652033000000000000000000000041040400000000000000F03F00000000
      002C93400730303130312D35104C4F4A415320414D45524943414E4153014103
      313031000000000088A3400000347D6FB3CC4200000000000024400000000000
      00444000000000000010400000347D6FB3CC420000602EC7BACC420000000000
      002840AE47E17AD4ABB24001532753686F7070696E67204E6F72746553686F70
      70696E67202D204E6F7274652053686F7070696E671A30303130312D35202D20
      4C4F4A415320414D45524943414E415300000000000000000000004154050000
      0000000000004000000000002C93400730313130322D39174341495841204543
      4F4E4F4D494341204645444552414C0141073130322F332F343E0AD7A3B0BFC9
      400000347D6FB3CC4200000000000024400000000000004440000000000000F0
      3F000000000000594001532753686F7070696E67204E6F72746553686F707069
      6E67202D204E6F7274652053686F7070696E672130313130322D39202D204341
      4958412045434F4E4F4D494341204645444552414C0000000000000000000000
      41040400000000000000204000000000002C93400730313234352D380C504C41
      4E4554204D55534943015303313131295C8FC275B5A7400000347D6FB3CC4200
      000000000014400000000000004440000000000000144000005065EDB8CC4200
      00E63D99BCCC420000000000002840000000000000594001532753686F707069
      6E67204E6F72746553686F7070696E67202D204E6F7274652053686F7070696E
      671630313234352D38202D20504C414E4554204D555349430000000000000000
      00000041540500000000000000084000000000002C93400730313235342D3506
      454E4C4143450153033130363333333333DCA9400000347D6FB3CC4200000000
      000024400000000000004440000000000000F03F000000000000494001532753
      686F7070696E67204E6F72746553686F7070696E67202D204E6F727465205368
      6F7070696E671030313235342D35202D20454E4C414345000000000000000000
      000041040400000000000000144000000000002C93400730323334352D310B44
      B450524553454E5445530153053130382F397B14AE47A192B4400000347D6FB3
      CC4200000000000024400000000000004440000000000000F03F0000D47111B9
      CC4200006A4ABDBCCC420000000000002840000000000000494001532753686F
      7070696E67204E6F72746553686F7070696E67202D204E6F7274652053686F70
      70696E671530323334352D31202D2044B450524553454E544553000000000000
      000000000041540500000000000000104000000000002C93400730343738352D
      380E4341534120444F204D555349434F0153033130379A9999999976A8400000
      347D6FB3CC420000000000002440000000000000444000000000000014400000
      00000000494001532753686F7070696E67204E6F72746553686F7070696E6720
      2D204E6F7274652053686F7070696E671830343738352D38202D204341534120
      444F204D555349434F0000000000000000000004410404000000000000001840
      00000000002C93400730373438352D36104C4956524152494120414E4F204C55
      5A0151295C8FC2B5BDB0400000347D6FB3CC4200000000000024400000000000
      004440000000000000F03F0000EE9104B9CC420000846AB0BCCC420000000000
      002840000000000080414001532753686F7070696E67204E6F72746553686F70
      70696E67202D204E6F7274652053686F7070696E671A30373438352D36202D20
      4C4956524152494120414E4F204C555A00000000000000000000004104040000
      00000000001C4000000000002C93400730373835342D39124C49565241524941
      20534943494C49414E4F0141053132322F33C3F5285C8FB6B7400000347D6FB3
      CC4200000000000024400000000000004440000000000000F03F00005065EDB8
      CC420000E63D99BCCC420000000000002840000000000040524001532753686F
      7070696E67204E6F72746553686F7070696E67202D204E6F7274652053686F70
      70696E671C30373835342D39202D204C4956524152494120534943494C49414E
      4F0000000000000000}
    object StringField8: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 35
      FieldName = 'NOME_EXTENSO'
      ReadOnly = True
      Size = 123
    end
    object StringField9: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 37
      FieldName = 'CONTRATO_EXTENSO'
      ReadOnly = True
      Size = 83
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = 'Data Término'
      DisplayWidth = 12
      FieldName = 'DATTERMINO'
      ReadOnly = True
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Próximo Reajuste'
      DisplayWidth = 18
      FieldName = 'DATPROXREAJUSTE'
      Visible = False
    end
    object FloatField10: TFloatField
      DisplayLabel = 'Aluguel Mínimo'
      DisplayWidth = 10
      FieldName = 'VLRALUGMIN'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField8: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATREAJUSTE'
      Visible = False
    end
    object StringField10: TStringField
      DisplayLabel = 'Núm. Contrato'
      DisplayWidth = 12
      FieldName = 'NUMCONTRATO'
      Visible = False
    end
    object StringField11: TStringField
      DisplayLabel = 'Nome Contrato'
      DisplayWidth = 60
      FieldName = 'NOMCONTRATO'
      Visible = False
      Size = 60
    end
    object FloatField11: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object FloatField12: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object StringField12: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object StringField13: TStringField
      DisplayWidth = 20
      FieldName = 'LOJAS'
      Visible = False
    end
    object DateTimeField9: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATINICIO'
      Visible = False
    end
    object FloatField13: TFloatField
      DisplayWidth = 10
      FieldName = 'PERALUGVARIAVEL'
      Visible = False
    end
    object FloatField14: TFloatField
      DisplayWidth = 10
      FieldName = 'INDICEREAJUSTE'
      Visible = False
    end
    object DateTimeField10: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATULTAUDITORIA'
      Visible = False
    end
    object FloatField15: TFloatField
      DisplayWidth = 10
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
    object FloatField16: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMARCA'
      Visible = False
    end
    object FloatField17: TFloatField
      DisplayWidth = 10
      FieldName = 'PERREAJUSTE'
      Visible = False
    end
    object MemoField2: TMemoField
      DisplayWidth = 10
      FieldName = 'DESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
    object FloatField18: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEABL'
      Visible = False
    end
    object StringField14: TStringField
      DisplayWidth = 1
      FieldName = 'FLGINDETERMINADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsContratosProrrogarCHKBOX: TFloatField
      FieldName = 'CHKBOX'
      MaxValue = 1
    end
  end
  object dsContratosReajustar: TwwDataSource
    DataSet = cdsContratosReajustar
    Left = 464
    Top = 56
  end
  object dsContratosProrrogar: TwwDataSource
    AutoEdit = False
    DataSet = cdsContratosProrrogar
    Left = 360
    Top = 120
  end
  object dsContratosHotel: TwwDataSource
    DataSet = cdsContratosHotel
    Left = 464
    Top = 184
  end
  object cdsContratosHotel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 465
    Top = 198
    object cdsContratosHotelNUMCONTRATO: TStringField
      DisplayLabel = 'Nr. Contrato'
      DisplayWidth = 12
      FieldName = 'NUMCONTRATO'
    end
    object cdsContratosHotelNOMCONTRATO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 66
      FieldName = 'NOMCONTRATO'
      Size = 60
    end
  end
end
