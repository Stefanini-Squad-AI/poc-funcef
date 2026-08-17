inherited FrmRegAdiantoMT: TFrmRegAdiantoMT
  Left = 191
  Top = 150
  Caption = 'Regulariza Adiantamento'
  ClientHeight = 348
  ClientWidth = 775
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 775
    Height = 309
    object Panel1: TPanel
      Left = 1
      Top = 83
      Width = 773
      Height = 225
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      Caption = 'Panel1'
      TabOrder = 0
      object LblDocPagos: TPanel
        Left = 5
        Top = 5
        Width = 763
        Height = 30
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Adiantamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object dbgrAdtoPendente: TwwDBGrid
        Left = 140
        Top = 35
        Width = 628
        Height = 185
        ControlType.Strings = (
          'STATUS;CheckBox;2;0')
        Selected.Strings = (
          'STATUS'#9'4'#9'Baixa'#9'F'
          'RAZAOSOCIAL'#9'33'#9'Razão Social'#9'F'
          'VALRES'#9'10'#9'Valor'#9'F'
          'VLRBAIXA'#9'14'#9'Valor a Regularizar'#9'F'
          'DATALANCTO'#9'10'#9'Data Lancto'#9'F'
          'DATAVENCTO'#9'10'#9'Data Vencto'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsAdtoPendente
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = True
        UseTFields = False
        OnTitleButtonClick = dbgrAdtoPendenteTitleButtonClick
        OnDblClick = dbgrAdtoPendenteDblClick
        IndicatorColor = icBlack
      end
      object Panel2: TPanel
        Left = 5
        Top = 35
        Width = 135
        Height = 185
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object SbAdInverte: TSpeedButton
          Left = 12
          Top = 45
          Width = 115
          Height = 32
          Caption = '&Inverter'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888FFFFF8888888888800000888888888FF877777F8888888776666600
            888888F877888887788888766666666608888F878F888888878887666F666666
            60888F78F87888888F788766FF8888666088F87F877FFF8888787E6FFFFFFF66
            6608F7887777777888F77E66FF6666666608F7888778F88888F77E666F66F666
            6608F7888878F78888F77E666666FF666608F788FFFFF77888F77E66FFFFFFF6
            66088788877777778F8787E68888FF6660888F788888F7788F7887E66666F666
            6088887888888788F878887EE666666608888887F88888FF878888877EEEEE00
            8888888877FFFF87788888888777778888888888887777788888}
          Margin = 13
          NumGlyphs = 2
          ParentFont = False
          Spacing = 13
          OnClick = SbAdInverteClick
        end
        object SbAdTodos: TSpeedButton
          Left = 12
          Top = 7
          Width = 115
          Height = 32
          Caption = '&Todos'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E668866666
            608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
            66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
            66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
            660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          Margin = 13
          NumGlyphs = 2
          ParentFont = False
          Spacing = 13
          OnClick = SbAdTodosClick
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 83
          Width = 125
          Height = 46
          Caption = 'Valor a Regularizar'
          TabOrder = 0
          object DbreValRegAdt: TDBRealEdit
            Left = 11
            Top = 17
            Width = 100
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 0
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRBAIXA'
            DataSource = dsAdtoPendente
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 132
          Width = 125
          Height = 46
          Caption = 'Data Regularização'
          TabOrder = 1
          object DtReg: TCMDateTimePicker
            Left = 10
            Top = 17
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
            TabOrder = 0
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 773
      Height = 82
      Align = alTop
      TabOrder = 1
      object GpDocumento: TGroupBox
        Left = 7
        Top = 3
        Width = 758
        Height = 67
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Dados Do Documento '
        TabOrder = 0
        object LblSisOrigem: TLabel
          Left = 145
          Top = 11
          Width = 110
          Height = 13
          Caption = 'Sistema de Origem:'
        end
        object LblFornCli: TLabel
          Left = 145
          Top = 29
          Width = 69
          Height = 13
          Caption = 'Fornecedor:'
        end
        object LblDataProg: TLabel
          Left = 337
          Top = 47
          Width = 62
          Height = 13
          Caption = 'Data Prog:'
        end
        object LblDocCompl: TLabel
          Left = 145
          Top = 47
          Width = 68
          Height = 13
          Caption = 'Doc\Compl:'
        end
        object LblSaldo: TLabel
          Left = 513
          Top = 46
          Width = 37
          Height = 13
          Caption = 'Saldo:'
        end
        object BtnSeleciona: TBitBtn
          Left = 11
          Top = 21
          Width = 127
          Height = 36
          Caption = 'Seleciona'
          TabOrder = 0
          OnClick = BtnSelecionaClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
            8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
            0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
            07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 227
    Top = 203
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object dsAdtoPendente: TwwDataSource
    DataSet = CdsAdtoPendente
    Left = 521
    Top = 231
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'round(LANCTODOCUM.VALOR,2)'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Complemento'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Número do Cheque/Borderô'
      'Nome'
      'Sistema de Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'LANCTODOCUM'
      'DOCUMENTO'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'MODULO'
      'RECBTOPAGTO')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.IDFORCLI'
      'LANCTODOCUM.DATALANCTO'
      'MODULO.NOMEMODULO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA =DOCUMENTO.IDFORCLI'
      'TIPODOCRECPAG.CODTIPDOC=DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO=DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO=DOCUMENTO.OPERACAO'
      'DOCUMENTO.IDMODULO=MODULO.IDMODULO(+)'
      'DOCUMENTO.MOECODIGO=MOEDA.MOECODIGO(+)'
      'DOCUMENTO.CODPORTFORMA=PORTADORFORMA.CODPORTFORMA(+)'
      'LANCTODOCUM.CODDOCUMENTO=RECBTOPAGTO.CODDOCUMENTO(+)'
      'LANCTODOCUM.NUMLANCTO=RECBTOPAGTO.NUMLANCTO(+)'
      'DOCUMENTO.STATUS <> '#39'2'#39' OR DOCUMENTO.STATUS IS NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '60'
      '1'
      '60'
      '10'
      '10'
      '30'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 662
    Top = 27
  end
  object SQLAdtoPendente: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.QTDECOTAS, '
      '  D.DATAPROGRAMADA,'
      '  D.DATADISPONIB,'
      '  D.STATUS,'
      '  P.RAZAOSOCIAL,'
      '  D.NODOCUMENTO,'
      '  D.CODDOCUMENTO,'
      '  (0) AS VALRES,'
      '  (0) VLRBAIXA,'
      '  L.DATALANCTO,'
      '  D.DATAVENCTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.RECPAG,'
      '  D.NODOCUMENTO ||'#39' '#39'|| D.COMPLDOCUMENTO as DOCUM'
      'FROM'
      '  DOCUMENTO D,'
      '  LANCTODOCUM L,'
      '  PESSOA P'
      'WHERE'
      '  1 = 2'
      ''
      ' ')
    ClientDataSet = CdsAdtoPendente
    Left = 521
    Top = 133
  end
  object CdsAdtoPendente: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATALANCFINAN'
        DataType = ftDateTime
      end
      item
        Name = 'STATUSCONCILIA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PORTADORFORMA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NUMCHQBORDERO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'HISTORICO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALORLANCFINAN'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'DATALANCFINAN;HISTORICO'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    AfterOpen = CdsAdtoPendenteAfterOpen
    Left = 521
    Top = 182
  end
  object CdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 182
  end
  object SQLDocumento: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   D.QTDECOTAS, '
      '   D.DATAPROGRAMADA,'
      '   D.DATADISPONIB,'
      '   D.CODDOCUMENTO,'
      '   D.IDPESSOA,'
      '   D.IDMODULO,'
      '   D.PLANO,'
      '   L.DATALANCTO,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   P.NOME,'
      '   D.RECPAG,'
      '   L.VALOR'
      'FROM'
      '   PESSOA P,'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L'
      'WHERE'
      '   D.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   D.IDFORCLI = P.IDPESSOA AND'
      '   D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '   D.OPERACAO = L.OPERACAO'
      '')
    ClientDataSet = CdsDocumento
    Left = 625
    Top = 133
  end
end
