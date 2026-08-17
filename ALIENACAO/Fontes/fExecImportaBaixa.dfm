inherited frmExecImportaBaixa: TfrmExecImportaBaixa
  Left = 75
  Top = 164
  HelpContext = 1350041
  Caption = 'Importação de Baixas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited PagControle: TPageControl
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Caption = 'Importação de Baixas [ Seleção ]'
        end
        object Label8: TLabel
          Left = 8
          Top = 51
          Width = 140
          Height = 13
          Caption = 'Arquivo para Importação'
        end
        object Label15: TLabel
          Left = 8
          Top = 111
          Width = 136
          Height = 13
          Caption = 'Data do Processamento'
        end
        object edtArqImporta: TEdit
          Left = 8
          Top = 65
          Width = 368
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object btnBuscaArq: TBitBtn
          Left = 376
          Top = 64
          Width = 24
          Height = 22
          Hint = 'Busca um Arquivo para Importação'
          TabOrder = 1
          OnClick = btnBuscaArqClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object btnLimpaArq: TBitBtn
          Left = 400
          Top = 64
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Arquivo para Importação'
          TabOrder = 2
          OnClick = btnLimpaArqClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object edtDataImporta: TCMDateTimePicker
          Left = 8
          Top = 126
          Width = 137
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
        object cbSubstitui: TCheckBox
          Left = 8
          Top = 168
          Width = 233
          Height = 17
          Caption = 'Substitui valores já existentes'
          TabOrder = 4
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 382
          Caption = 'Importação de Baixas [ Log de Erros ]'
        end
        object memLog: TMemo
          Left = 0
          Top = 24
          Width = 570
          Height = 190
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'TabSheet2'
        ImageIndex = 2
        TabVisible = False
        object fcLabel2: TfcLabel
          Left = 0
          Top = 0
          Width = 534
          Height = 24
          Align = alTop
          Caption = 'Importação de Baixas [ Valores a serem importados ]'
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
        object dbgImovel: TwwDBGrid
          Left = 0
          Top = 24
          Width = 570
          Height = 190
          Selected.Strings = (
            'CONNUMERO'#9'8'#9'Contrato'#9'F'
            'IMOCODIGO'#9'11'#9'Cod. Imovel'#9'F'
            'IMONOME'#9'52'#9'Imóvel'#9'F'
            'NUMPARCELAS'#9'8'#9'Parcelas'#9'F'
            'NUMPARCELA'#9'7'#9'Parcela'#9'F'
            'DATAVENCIMENTO'#9'12'#9'Vencimento'#9'F'
            'DATAPAGAMENTO'#9'12'#9'Pagamento'#9'F'
            'VLRPAGO'#9'15'#9'Valor Pago'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoSearchOwnerForm, ecoDisableDateTimePicker]
          Align = alClient
          DataSource = dsParc
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          OnCalcCellColors = dbgImovelCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = dbgImovelTopRowChanged
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object dlgImporta: TOpenDialog
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Left = 41
    Top = 224
  end
  object dlgLogErro: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto ( *.txt )|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 97
    Top = 224
  end
  object cdsParc: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCONTRATOIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDCONDPAGIMOVEL'
        DataType = ftFloat
      end
      item
        Name = 'IDPARCFINANCIMOV'
        DataType = ftFloat
      end
      item
        Name = 'IMOCODIGO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IMONOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CONNUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMPARCELAS'
        DataType = ftFloat
      end
      item
        Name = 'NUMPARCELA'
        DataType = ftFloat
      end
      item
        Name = 'DATAVENCIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAPAGAMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'VLRPAGO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IND1'
        Fields = 'IDPARCFINANCIMOV'
      end
      item
        Name = 'IND2'
        Expression = 'IMOCODIGO;DATAVENCIMENTO'
        Options = [ixExpression]
      end>
    Params = <>
    StoreDefs = True
    Left = 465
    Top = 11
    object cdsParcIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsParcIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object cdsParcIDPARCFINANCIMOV: TFloatField
      FieldName = 'IDPARCFINANCIMOV'
    end
    object cdsParcIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsParcNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object cdsParcNUMPARCELA: TFloatField
      FieldName = 'NUMPARCELA'
    end
    object cdsParcDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object cdsParcDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object cdsParcVLRPAGO: TFloatField
      FieldName = 'VLRPAGO'
      DisplayFormat = '###,###,##0.00'
    end
    object cdsParcIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object cdsParcCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
  end
  object dsParc: TDataSource
    DataSet = cdsParc
    Left = 464
    Top = 24
  end
  object sqlParc: TCMSqlParams
    SQL.Strings = (
      'SELECT CP.IDCONTRATOIMOVEL,'
      '       CP.IDCONDPAGIMOVEL,'
      '       P.IDPARCFINANCIMOV,'
      '       I.IMOCODIGO,'
      '       I.IMONOME,'
      '       C.CONNUMERO,'
      '       CP.NUMPARCELAS,'
      '       P.NUMPARCELA,'
      '       P.DATAVENCIMENTO,'
      '       P.DATAPAGAMENTO,'
      '       P.VLRPAGO'
      ''
      '  FROM CONTRATOIMOVEL C,'
      '       CONTRATOXIMOVEL CXI,'
      '       IMOVEL I,'
      '       CONDPAGIMOVEL CP,'
      '       PARCFINANCIMOV P'
      ''
      ' WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL'
      '   AND CXI.IDIMOVEL = I.IDIMOVEL'
      '   AND C.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'
      '   AND CP.IDCONDINICIAL = P.IDCONDPAGIMOVEL'
      '   AND C.IDCONTRATOIMOVEL = -1')
    ClientDataSet = cdsParc
    Left = 513
    Top = 11
  end
end
