inherited frmCadTarifa: TfrmCadTarifa
  Left = 143
  HelpContext = 4170007
  Caption = 'Cadastro de Tarifas para Destacamento'
  ClientWidth = 604
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 596
      Height = 93
      object Label1: TLabel
        Left = 10
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 84
        Top = 4
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 287
        Top = 45
        Width = 124
        Height = 13
        Caption = 'Valores Expressos em'
      end
      object dbedCodigo: TwwDBEdit
        Left = 10
        Top = 19
        Width = 68
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'IDDSTTARIFA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 85
        Top = 19
        Width = 500
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrgTipo: TDBRadioGroup
        Left = 10
        Top = 45
        Width = 260
        Height = 40
        Caption = 'Tipo de Tarifa'
        Columns = 3
        DataField = 'INDTIPO'
        DataSource = ds
        Items.Strings = (
          'Diária'
          'Embarque'
          'Hotel')
        TabOrder = 2
        Values.Strings = (
          '1'
          '2'
          '3')
      end
      object dblcMoeda: TwwDBLookupCombo
        Left = 287
        Top = 59
        Width = 300
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Nome'#9'F'
          'MOESIGLA'#9'10'#9'Sigla'#9'F')
        DataField = 'MOECODIGO'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        Options = [loColLines, loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 97
      Width = 596
      Height = 237
      Tabs.Strings = (
        'Valores da Tarifa'
        'Cargos Associados à Tarifa')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 498
        Height = 178
        inherited tbsDet: TTabSheet
          Caption = 'Valores da Tarifa'
          inherited pnlControlesDet: TPanel [0]
            Width = 490
            Height = 150
            object Label4: TLabel
              Left = 130
              Top = 26
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object Label5: TLabel
              Left = 130
              Top = 80
              Width = 85
              Height = 13
              Caption = 'Valor da Tarifa'
            end
            object CMDateTimePicker1: TCMDateTimePicker
              Left = 130
              Top = 40
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATADSTVALORES'
              DataSource = dsDet
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
            object dbredValor: TDBRealEdit
              Left = 130
              Top = 96
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRDST'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 490
            Height = 150
            Selected.Strings = (
              'DATADSTVALORES'#9'18'#9'Data de Efetivação'
              'VLRDST'#9'14'#9'Valor da Tarifa')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
          end
        end
        object tbsCargos: TTabSheet
          Caption = 'Cargos Associados à Tarifa'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 490
            Height = 150
            Align = alClient
            BevelInner = bvLowered
            BorderWidth = 2
            TabOrder = 0
            object sbtnAdicionar: TSpeedButton
              Left = 273
              Top = 57
              Width = 39
              Height = 34
              Hint = 'Associar Cargo Selecionado'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88880666666666088888788888F88878F880E6666F6666
                608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
                66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
                66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
                660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
                6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                8888888778FFFF77888888888000008888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAdicionarClick
            end
            object sbtnRemover: TSpeedButton
              Left = 273
              Top = 100
              Width = 39
              Height = 34
              Hint = 'Desassociar Cargo Selecionado'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88880666666666088888788888F88878F880E6666F6666
                608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
                66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
                66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
                660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
                6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
                8888888778FFFF77888888888000008888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnRemoverClick
            end
            object sbtnAdicionarTudo: TSpeedButton
              Left = 273
              Top = 14
              Width = 39
              Height = 34
              Hint = 'Associar Todos'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
                66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
                66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
                660878F877887788887887E6F666F666608887F87888788887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAdicionarTudoClick
            end
            object sbtnRemoverTudo: TSpeedButton
              Left = 273
              Top = 142
              Width = 39
              Height = 34
              Hint = 'Desassociar Todos'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
                66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
                66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
                660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnRemoverTudoClick
            end
            object grdTranf: TwwDBGrid
              Left = 316
              Top = 36
              Width = 261
              Height = 145
              Selected.Strings = (
                'TITULO'#9'40'#9'Título do Cargo'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clGray
              FixedCols = 0
              ShowHorzScrollBar = True
              Color = clWhite
              DataSource = dsCagosSim
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object grgEstab: TwwDBGrid
              Left = 6
              Top = 36
              Width = 262
              Height = 145
              Selected.Strings = (
                'TITULO'#9'40'#9'Título do Cargo'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clGray
              FixedCols = 0
              ShowHorzScrollBar = True
              Color = clWhite
              DataSource = dsCagosNao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              IndicatorColor = icBlack
            end
            object Panel2: TPanel
              Left = 6
              Top = 6
              Width = 263
              Height = 28
              BevelInner = bvLowered
              Caption = 'Cargos Não Associados'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object Panel3: TPanel
              Left = 315
              Top = 7
              Width = 262
              Height = 27
              BevelInner = bvLowered
              Caption = 'Cargos Associados'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 588
      end
      inherited Dock974: TDock97
        Left = 502
        Height = 178
      end
    end
  end
  inherited Dock972: TDock97
    Width = 604
  end
  inherited Dock971: TDock97
    Width = 604
    inherited tb97Fundo: TToolbar97
      Left = 335
      DockPos = 335
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 168
      DockPos = 168
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDDSTTARIFA, MOECODIGO, DESCRICAO, INDTIPO'
      'FROM'
      '  DSTTARIFA'
      'WHERE'
      '  (IDDSTTARIFA = :IDDSTTARIFA)')
    UpdateMode = upWhereChanged
    Left = 270
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDSTTARIFA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 467
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 400
    Top = 290
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DSTTARIFA'
      'set'
      '  MOECODIGO = :MOECODIGO,'
      '  DESCRICAO = :DESCRICAO,'
      '  INDTIPO = :INDTIPO'
      'where'
      '  IDDSTTARIFA = :OLD_IDDSTTARIFA')
    InsertSQL.Strings = (
      'insert into DSTTARIFA'
      '  (IDDSTTARIFA, MOECODIGO, DESCRICAO, INDTIPO)'
      'values'
      '  (:IDDSTTARIFA, :MOECODIGO, :DESCRICAO, :INDTIPO)')
    DeleteSQL.Strings = (
      'delete from DSTTARIFA'
      'where'
      '  IDDSTTARIFA = :OLD_IDDSTTARIFA')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tarifa'
    Colunas.Strings = (
      'DESCRICAO'
      'IDDSTTARIFA'
      'INDTIPO')
    TipodeDado.Strings = (
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Código'
      'Tipo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DSTTARIFA')
    CamposChave.Strings = (
      'IDDSTTARIFA')
    Larguras.Strings = (
      '60'
      '15'
      '15')
    Left = 339
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 441
    Top = 290
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 396
    Top = 338
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 452
    Top = 338
  end
  object qryDet: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDDSTTARIFA, DATADSTVALORES, VLRDST'
      'FROM'
      '  DSTVALORES'
      'WHERE'
      '  (IDDSTTARIFA = :IDDSTTARIFA)')
    UpdateMode = upWhereChanged
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 431
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDSTTARIFA'
        ParamType = ptUnknown
      end>
    object qryDetDATADSTVALORES: TDateTimeField
      DisplayLabel = 'Data de Efetivação'
      DisplayWidth = 18
      FieldName = 'DATADSTVALORES'
      Origin = 'BASEDADOS.DSTVALORES.DATADSTVALORES'
    end
    object qryDetVLRDST: TFloatField
      DisplayLabel = 'Valor da Tarifa'
      DisplayWidth = 14
      FieldName = 'VLRDST'
      Origin = 'BASEDADOS.DSTVALORES.VLRDST'
      DisplayFormat = '###,###,##0.00'
    end
    object qryDetIDDSTTARIFA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDSTTARIFA'
      Origin = 'BASEDADOS.DSTVALORES.IDDSTTARIFA'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DSTVALORES'
      'set'
      '  DATADSTVALORES = :DATADSTVALORES,'
      '  VLRDST = :VLRDST'
      'where'
      '  IDDSTTARIFA = :OLD_IDDSTTARIFA and'
      '  DATADSTVALORES = :OLD_DATADSTVALORES')
    InsertSQL.Strings = (
      'insert into DSTVALORES'
      '  (IDDSTTARIFA, DATADSTVALORES, VLRDST)'
      'values'
      '  (:IDDSTTARIFA, :DATADSTVALORES, :VLRDST)')
    DeleteSQL.Strings = (
      'delete from DSTVALORES'
      'where'
      '  IDDSTTARIFA = :OLD_IDDSTTARIFA and'
      '  DATADSTVALORES = :OLD_DATADSTVALORES')
    Left = 394
    Top = 1
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC, MOESIGLA'
      'FROM MOEDA'
      'ORDER BY UPPER(MOEDESC)')
    ValidateWithMask = True
    Left = 445
    Top = 44
  end
  object qryCagosSim: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGO, TITULO'
      'FROM CARGO'
      'WHERE CODNIVEL = :IDTARIFA'
      'ORDER BY UPPER(TITULO)')
    ValidateWithMask = True
    Left = 229
    Top = 332
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTARIFA'
        ParamType = ptUnknown
      end>
  end
  object qryCagosNao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARGO, TITULO'
      'FROM CARGO'
      'WHERE CODNIVEL IS NULL '
      'ORDER BY UPPER(TITULO)')
    ValidateWithMask = True
    Left = 133
    Top = 332
  end
  object dsCagosSim: TwwDataSource
    AutoEdit = False
    DataSet = qryCagosSim
    Left = 227
    Top = 281
  end
  object dsCagosNao: TwwDataSource
    AutoEdit = False
    DataSet = qryCagosNao
    Left = 131
    Top = 281
  end
end
