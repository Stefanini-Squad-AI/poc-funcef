inherited frmMTInvProcessar: TfrmMTInvProcessar
  Left = 4
  Top = 79
  HelpContext = 70025
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Processa o Levantamento de Inventário'
  ClientHeight = 423
  ClientWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 777
    Height = 389
    object pnlMestre: TPanel
      Left = 1
      Top = 1
      Width = 775
      Height = 68
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 154
        Top = 6
        Width = 65
        Height = 13
        Caption = 'Data Início'
      end
      object Label1: TLabel
        Left = 16
        Top = 6
        Width = 99
        Height = 13
        Caption = 'Levantamento Nº'
      end
      object Label4: TLabel
        Left = 278
        Top = 6
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Panel2: TPanel
        Left = 151
        Top = 21
        Width = 121
        Height = 23
        BevelOuter = bvNone
        Caption = 'Panel2'
        Enabled = False
        TabOrder = 1
        object dbeDataInicio: TCMDateTimePicker
          Left = 2
          Top = 1
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINILEVANT'
          DataSource = ds
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
      object bbtnPesquisa: TBitBtn
        Left = 120
        Top = 22
        Width = 21
        Height = 21
        TabOrder = 0
        OnClick = bbtnPesquisaClick
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
      object dbeIdInventario: TwwDBEdit
        Left = 16
        Top = 22
        Width = 105
        Height = 21
        DataField = 'IDINVENTARIOBENS'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeResponsavel: TwwDBEdit
        Left = 278
        Top = 22
        Width = 241
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 528
        Top = 8
        Width = 224
        Height = 41
        TabOrder = 4
        object edDataFim: TCMDateTimePicker
          Left = 112
          Top = 13
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAFIMLEVANT'
          DataSource = ds
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
        object ckbEncerrado: TDBCheckBox
          Left = 8
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Encerrado em'
          DataField = 'STATUS'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object pnlDetalhe: TPanel
      Left = 1
      Top = 69
      Width = 775
      Height = 319
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object dbGrd: TwwDBGrid
        Left = 1
        Top = 1
        Width = 773
        Height = 317
        Selected.Strings = (
          'PLACA'#9'18'#9'Patrimonio Nº'#9'No'
          'DESBEM'#9'80'#9'Descrição do Bem'#9'No'#9
          'DESCFLGPLACA'#9'20'#9'Status'#9'No'#9
          'NOMELOCAATUAL'#9'40'#9'da Localização'#9'No'#9
          'NOMELOCANOVO'#9'40'#9'para a Localização'#9'No'#9
          'DESCCONJATUAL'#9'60'#9'do Conjunto'#9'No'#9
          'DESCCONJNOVO'#9'60'#9'para o Conjunto'#9'No'#9)
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsDet
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 777
    Height = 34
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 589
      inherited bbtnSair: TBitBtn
        Height = 28
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 28
        HelpContext = 70025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 291
      DockPos = 291
      inherited ToolbarSep971: TToolbarSep97
        Left = 210
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 210
        Height = 28
        Caption = '&Gerar Termo de Transferência'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 213
        Height = 28
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 602
    Top = 447
    TargetsData = (
      1
      1
      (
        '*'
        'Filter'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione o Levantamento'
    Colunas.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'PESSOA.NOME'
      'INVENTARIOBENS.DATAINILEVANT'
      'INVENTARIOBENS.DATAFIMLEVANT')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Nº do Levantamento'
      'Responsável'
      'Data de Início'
      'Data de Término')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTARIOBENS'
      'PESSOA')
    CamposChave.Strings = (
      'INVENTARIOBENS.IDINVENTARIOBENS'
      'INVENTARIOBENS.IDEMPRESA')
    Filtro.Strings = (
      'INVENTARIOBENS.IDRESPONSAVEL=PESSOA.IDPESSOA'
      'INVENTARIOBENS.STATUS >= 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 464
    Top = 8
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 551
    Top = 134
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 551
    Top = 120
  end
  object sqlDet: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDINVENTARIOBENS,'
      '       I.IDEMPRESA,'
      '       I.IIBPLACA,'
      '       I.IIBIDBEM,'
      '       I.IIBFLGPLACA,'
      '       I.IIBLOCALATUAL,'
      '       I.IIBCONJUNTOATUAL,'
      '       I.IIBLOCALNOVO,'
      '       I.IIBCONJUNTONOVO,'
      '       I.IIBFLGSITFISICA,'
      
        '       B.PLACA, B.DESBEM, B.IDBEM, B.IDPESSOA, B.IDCONJUNTO, B.I' +
        'DGRUPO, B.IDCLASSEBEM,'
      '       LN.IDLOCALIZACAO,'
      '       DECODE(I.IIBFLGPLACA, 0,'#39'...                 '#39','
      '       DECODE(I.IIBFLGPLACA, 1,'#39'Ok                  '#39','
      '       DECODE(I.IIBFLGPLACA, 2,'#39'Placa não encontrada'#39','
      '       DECODE(I.IIBFLGPLACA, 3,'#39'Placa EM outro Local'#39','
      '       DECODE(I.IIBFLGPLACA, 4,'#39'Placa DE outro Local'#39','
      
        '                               '#39'...                 '#39'))))) AS DE' +
        'SCFLGPLACA,'
      
        '       CA.DESCCONJUNTO AS DESCCONJATUAL, LA.NOME AS NOMELOCAATUA' +
        'L,'
      '       CN.DESCCONJUNTO AS DESCCONJNOVO,  LN.NOME AS NOMELOCANOVO'
      'FROM ITENSINVBENS I,'
      '     BEM B,'
      '     CONJUNTO CA,'
      '     LOCALIZACAO LA,'
      '     CONJUNTO CN,'
      '     LOCALIZACAO LN'
      'WHERE I.IDINVENTARIOBENS = :IDINVENTARIOBENS'
      '  AND I.IDEMPRESA = :IDEMPRESA'
      
        '  AND (I.IIBFLGPLACA = 02 OR I.IIBFLGPLACA = 03 OR I.IIBFLGPLACA' +
        ' = 04)'
      '  AND I.IIBIDBEM = B.IDBEM'
      '  AND I.IDEMPRESA = B.IDPESSOA'
      '  AND B.IDCONJUNTO = CA.IDCONJUNTO'
      '  AND B.IDPESSOA = CA.IDPESSOA'
      '  AND CA.IDLOCALIZACAO = LA.IDLOCALIZACAO'
      '  AND CA.IDPESSOA = LA.IDPESSOA'
      '  AND I.IIBCONJUNTONOVO = CN.IDCONJUNTO'
      '  AND I.IDEMPRESA = CN.IDPESSOA'
      '  AND I.IIBLOCALNOVO = LN.IDLOCALIZACAO'
      '  AND I.IDEMPRESA = LN.IDPESSOA'
      'ORDER BY I.IIBFLGPLACA,I.IIBPLACA'
      '')
    ClientDataSet = cdsDet
    Left = 551
    Top = 106
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 8
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 416
    Top = 8
  end
  object dsTermoTransf: TwwDataSource
    AutoEdit = False
    DataSet = cdsTermoTransf
    Left = 623
    Top = 134
  end
  object cdsTermoTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 623
    Top = 120
  end
  object sqlTermoTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT SBXTERMO, SBXDATA'
      'FROM SELBAIXA'
      'WHERE IDSELBAIXA = :IDSELBAIXA'
      '  AND IDPESSOA = :IDPESSOA')
    ClientDataSet = cdsTermoTransf
    Left = 623
    Top = 106
  end
  object sqlDetDes: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDINVENTARIOBENS,'
      '       I.IDEMPRESA,'
      '       I.IIBPLACA,'
      '       I.IIBIDBEM,'
      '       I.IIBFLGPLACA,'
      '       I.IIBLOCALATUAL,'
      '       I.IIBCONJUNTOATUAL,'
      '       I.IIBLOCALNOVO,'
      '       I.IIBCONJUNTONOVO,'
      '       I.IIBFLGSITFISICA,'
      
        '       B.PLACA, B.DESBEM, B.IDBEM, B.IDPESSOA, B.IDCONJUNTO, B.I' +
        'DGRUPO, B.IDCLASSEBEM,'
      '       LN.IDLOCALIZACAO,'
      '       DECODE(I.IIBFLGPLACA, 0,'#39'...                 '#39','
      '       DECODE(I.IIBFLGPLACA, 1,'#39'Ok                  '#39','
      '       DECODE(I.IIBFLGPLACA, 2,'#39'Placa não encontrada'#39','
      '       DECODE(I.IIBFLGPLACA, 3,'#39'Placa EM outro Local'#39','
      '       DECODE(I.IIBFLGPLACA, 4,'#39'Placa DE outro Local'#39','
      
        '                               '#39'...                 '#39'))))) AS DE' +
        'SCFLGPLACA,'
      
        '       CA.DESCCONJUNTO AS DESCCONJATUAL, LA.NOME AS NOMELOCAATUA' +
        'L,'
      '       CN.DESCCONJUNTO AS DESCCONJNOVO,  LN.NOME AS NOMELOCANOVO'
      'FROM ITENSINVBENS I,'
      '     BEM B,'
      '     CONJUNTO CA,'
      '     LOCALIZACAO LA,'
      '     CONJUNTO CN,'
      '     LOCALIZACAO LN'
      'WHERE I.IDINVENTARIOBENS = 0'
      '  AND I.IDEMPRESA = 0'
      
        '  AND (I.IIBFLGPLACA = 02 OR I.IIBFLGPLACA = 03 OR I.IIBFLGPLACA' +
        ' = 04)'
      '  AND I.IIBIDBEM = B.IDBEM'
      '  AND I.IDEMPRESA = B.IDPESSOA'
      '  AND B.IDCONJUNTO = CA.IDCONJUNTO'
      '  AND B.IDPESSOA = CA.IDPESSOA'
      '  AND CA.IDLOCALIZACAO = LA.IDLOCALIZACAO'
      '  AND CA.IDPESSOA = LA.IDPESSOA'
      '  AND I.IIBCONJUNTONOVO = CN.IDCONJUNTO'
      '  AND I.IDEMPRESA = CN.IDPESSOA'
      '  AND I.IIBLOCALNOVO = LN.IDLOCALIZACAO'
      '  AND I.IDEMPRESA = LN.IDPESSOA'
      'ORDER BY I.IIBFLGPLACA,I.IIBPLACA'
      ''
      ' ')
    ClientDataSet = cdsDet
    Left = 551
    Top = 92
  end
end
