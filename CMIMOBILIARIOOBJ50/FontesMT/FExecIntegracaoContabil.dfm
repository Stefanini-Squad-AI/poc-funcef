inherited frmExecIntegracaoContabil: TfrmExecIntegracaoContabil
  Left = 194
  Top = 177
  Caption = 'Integração Contábil'
  ClientHeight = 427
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 388
    inherited PagControle: TPageControl
      Width = 721
      Height = 386
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 713
          Caption = 'Integração Contábil [ Seleção ]'
        end
        object Label2: TLabel
          Left = 16
          Top = 40
          Width = 67
          Height = 13
          Caption = 'Nº Contrato'
        end
        object Label3: TLabel
          Left = 124
          Top = 40
          Width = 103
          Height = 13
          Caption = 'Nome do Contrato'
        end
        object rdgTipoEvento: TRadioGroup
          Left = 16
          Top = 92
          Width = 521
          Height = 105
          Caption = ' Tipo de Evento '
          Columns = 2
          ItemIndex = 4
          Items.Strings = (
            'Parcelas'
            'Antecipação de Parcelas'
            'Amortização Extra'
            'Atualização de Saldo'
            'Todos')
          TabOrder = 0
        end
        object grpDatas: TGroupBox
          Left = 16
          Top = 213
          Width = 257
          Height = 49
          Caption = ' Período de Movimentação '
          TabOrder = 1
          object Label5: TLabel
            Left = 124
            Top = 24
            Width = 8
            Height = 13
            Caption = 'a'
          end
          object edtDataIni: TCMDateTimePicker
            Left = 16
            Top = 20
            Width = 97
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
            Left = 144
            Top = 20
            Width = 97
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
        object edtNumContrato: TEdit
          Left = 16
          Top = 54
          Width = 105
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object edtNomeContrato: TEdit
          Left = 124
          Top = 54
          Width = 365
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object btnBuscaContrato: TBitBtn
          Left = 488
          Top = 54
          Width = 24
          Height = 22
          Hint = 'Busca um Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnBuscaContratoClick
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
        object btnLimpaContrato: TBitBtn
          Left = 512
          Top = 54
          Width = 23
          Height = 22
          Hint = 'Limpa a seleção de Contrato'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnLimpaContratoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 435
          Caption = 'Integração Contábil [ Dados Selecionados ]'
        end
        object Panel5: TPanel
          Left = 2
          Top = 37
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos a Integrar '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdLancamentos: TwwDBGrid
          Left = 3
          Top = 62
          Width = 704
          Height = 96
          Selected.Strings = (
            'CONNUMERO'#9'14'#9'Contrato'#9'F'
            'CONNOME'#9'60'#9'Nome'#9'F'
            'NOME'#9'60'#9'Forma de Cálculo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsContratos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object panDetalhes: TPanel
          Left = 2
          Top = 165
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Detalhe dos Lançamentos a Integrar '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object grdDetalhes: TwwDBGrid
          Left = 2
          Top = 190
          Width = 705
          Height = 180
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'81'#9'Item'#9'F'
            'HMIDATAMOV'#9'19'#9'Data Mov.'#9'F'
            'HMIVALOR'#9'31'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsHistMovAux
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
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
          Width = 330
          Height = 24
          Align = alTop
          Caption = 'Integração Contábil [ Resultado ]'
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
        object Panel2: TPanel
          Left = 2
          Top = 37
          Width = 702
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Lançamentos não Integrados '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdLancamentosNao: TwwDBGrid
          Left = 2
          Top = 61
          Width = 701
          Height = 96
          Selected.Strings = (
            'CONNUMERO'#9'14'#9'Contrato'#9'F'
            'CONNOME'#9'60'#9'Nome'#9'F'
            'NOME'#9'60'#9'Forma de Cálculo'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsContratos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object panDetalhesNao: TPanel
          Left = 2
          Top = 165
          Width = 702
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = ' Detalhe dos Lançamentos não Integrados '
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object grdDetalhesNao: TwwDBGrid
          Left = 2
          Top = 190
          Width = 702
          Height = 180
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'93'#9'Item'#9'F'
            'HMIDATAMOV'#9'14'#9'Data Mov.'#9'F'
            'HMIVALOR'#9'23'#9'Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsHistMovAux
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 388
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 308
    end
  end
  object cdsHistMovImob: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 209
    Top = 337
    Data = {
      790100009619E0BD01000000180000000E0000000000030000007901044E4F4D
      450100490000000100055749445448020002003C00104944434F4E545241544F
      494D4F56454C080004000000000009434F4E4E554D45524F0100490000000100
      05574944544802000200140007434F4E4E4F4D45010049000000010005574944
      5448020002003C000F44455343435553544F524543494D4F0100490000000100
      055749445448020002003C000D4944484953544D4F56494D4F42080004000000
      00000F4944434F4E44504147494D4F56454C0800040000000000114944544950
      4F435553544F524543494D4F08000400000000001049444954454D43454E5452
      414C495A4108000400000000000A484D49444154414D4F560800080000000000
      08484D4956414C4F5208000400000000000C484D49444F43554D454E544F0800
      0400000000000D484D495449504F4556454E544F080004000000000009504C4E
      434F4449474F08000400000000000100044C4349440400010009080000}
    object cdsHistMovImobNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsHistMovImobIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsHistMovImobCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsHistMovImobCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsHistMovImobDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsHistMovImobIDHISTMOVIMOB: TFloatField
      FieldName = 'IDHISTMOVIMOB'
    end
    object cdsHistMovImobIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object cdsHistMovImobIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object cdsHistMovImobHMIDATAMOV: TDateTimeField
      FieldName = 'HMIDATAMOV'
    end
    object cdsHistMovImobHMIVALOR: TFloatField
      FieldName = 'HMIVALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovImobHMIDOCUMENTO: TFloatField
      FieldName = 'HMIDOCUMENTO'
    end
    object cdsHistMovImobHMITIPOEVENTO: TFloatField
      FieldName = 'HMITIPOEVENTO'
    end
    object cdsHistMovImobPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object dsHistMovImob: TDataSource
    DataSet = cdsHistMovImob
    Left = 289
    Top = 337
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       FCI.NOME,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       TCR.DESCCUSTORECIMO,'
      '       HMI.IDHISTMOVIMOB,'
      '       HMI.IDCONDPAGIMOVEL,'
      '       HMI.IDTIPOCUSTORECIMO,'
      '       HMI.IDITEMCENTRALIZA,'
      '       HMI.HMIDATAMOV,'
      '       HMI.HMIVALOR,'
      '       HMI.HMIDOCUMENTO,'
      '       HMI.HMITIPOEVENTO,'
      '       HMI.PLNCODIGO'
      '   FROM'
      '       HISTMOVIMOB HMI,'
      '       CONDPAGIMOVEL CPI,'
      '       CONTRATOIMOVEL CI,'
      '       FORMACALCIMOB FCI,'
      '       TIPOCUSTORECIMOV TCR'
      '   WHERE'
      '       CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL'
      '   AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL'
      '   AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO'
      '   AND CPI.IDCONDPAGIMOVEL       =  -2'
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsHistMovImob
    Left = 257
    Top = 353
  end
  object cdsContratos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = cdsContratosAfterScroll
    Left = 57
    Top = 305
    Data = {
      AB0000009619E0BD010000001800000005000000000003000000AB00044E4F4D
      450100490000000100055749445448020002003C00104944434F4E545241544F
      494D4F56454C080004000000000009434F4E4E554D45524F0100490000000100
      05574944544802000200140007434F4E4E4F4D45010049000000010005574944
      5448020002003C000F4944434F4E44504147494D4F56454C0800040000000000
      0100044C4349440400010009080000}
    object cdsContratosIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsContratosCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsContratosCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsContratosIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object cdsContratosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsContratos: TDataSource
    DataSet = cdsContratos
    Left = 97
    Top = 305
  end
  object sqlContratos: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       FCI.NOME,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       HMI.IDCONDPAGIMOVEL'
      '   FROM'
      '       HISTMOVIMOB HMI,'
      '       CONDPAGIMOVEL CPI,'
      '       CONTRATOIMOVEL CI,'
      '       FORMACALCIMOB FCI,'
      '       TIPOCUSTORECIMOV TCR'
      '   WHERE'
      '       CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL'
      '   AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL'
      '   AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO'
      '   AND CPI.IDCONDPAGIMOVEL   =  -2'
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = cdsContratos
    Left = 65
    Top = 345
  end
  object cdsHistMovAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 329
    Top = 265
    object cdsHistMovAuxNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsHistMovAuxIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsHistMovAuxCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsHistMovAuxCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsHistMovAuxDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsHistMovAuxIDHISTMOVIMOB: TFloatField
      FieldName = 'IDHISTMOVIMOB'
    end
    object cdsHistMovAuxIDCONDPAGIMOVEL: TFloatField
      FieldName = 'IDCONDPAGIMOVEL'
    end
    object cdsHistMovAuxIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object cdsHistMovAuxIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object cdsHistMovAuxHMIDATAMOV: TDateTimeField
      FieldName = 'HMIDATAMOV'
    end
    object cdsHistMovAuxHMIVALOR: TFloatField
      FieldName = 'HMIVALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsHistMovAuxHMIDOCUMENTO: TFloatField
      FieldName = 'HMIDOCUMENTO'
    end
    object cdsHistMovAuxHMITIPOEVENTO: TFloatField
      FieldName = 'HMITIPOEVENTO'
    end
    object cdsHistMovAuxPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
  end
  object dsHistMovAux: TDataSource
    DataSet = cdsHistMovAux
    Left = 393
    Top = 305
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 265
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      '   SELECT'
      '       FCI.NOME,'
      '       CI.IDCONTRATOIMOVEL,'
      '       CI.CONNUMERO,'
      '       CI.CONNOME,'
      '       TCR.DESCCUSTORECIMO,'
      '       HMI.IDHISTMOVIMOB,'
      '       HMI.IDCONDPAGIMOVEL,'
      '       HMI.IDTIPOCUSTORECIMO,'
      '       HMI.IDITEMCENTRALIZA,'
      '       HMI.HMIDATAMOV,'
      '       HMI.HMIVALOR,'
      '       HMI.HMIDOCUMENTO,'
      '       HMI.HMITIPOEVENTO,'
      '       HMI.PLNCODIGO'
      '   FROM'
      '       HISTMOVIMOB HMI,'
      '       CONDPAGIMOVEL CPI,'
      '       CONTRATOIMOVEL CI,'
      '       FORMACALCIMOB FCI,'
      '       TIPOCUSTORECIMOV TCR'
      '   WHERE'
      '       CPI.IDCONDPAGIMOVEL   = HMI.IDCONDPAGIMOVEL'
      '   AND CI.IDCONTRATOIMOVEL   = CPI.IDCONTRATOIMOVEL'
      '   AND FCI.IDFORMACALCIMOB   = CPI.IDFORMACALCIMOB'
      '   AND TCR.IDTIPOCUSTORECIMO = HMI.IDTIPOCUSTORECIMO'
      '   AND CPI.IDCONDPAGIMOVEL       =  -2'
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsHistMovAux
    Left = 273
    Top = 241
  end
end
