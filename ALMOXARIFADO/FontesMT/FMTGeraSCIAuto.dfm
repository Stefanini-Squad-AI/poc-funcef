inherited FrmMTGeraSCIAuto: TFrmMTGeraSCIAuto
  Left = 25
  Top = 47
  HelpContext = 50030
  Caption = 'Gerar S.C.I. Automaticamente'
  ClientHeight = 420
  ClientWidth = 734
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 381
    object pln: TPanel
      Left = 1
      Top = 1
      Width = 732
      Height = 100
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label6: TLabel
        Left = 16
        Top = 8
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object dblcCentRespon: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome'#9'F'
          'CODEXTERNO'#9'10'#9'Código'#9'F')
        LookupTable = CdsCRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 313
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        LookupTable = CdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object GpDotOrc: TGroupBox
        Left = 344
        Top = 16
        Width = 205
        Height = 71
        Caption = ' Reserva  Orçamentário '
        TabOrder = 2
        object btnOrcamento: TSpeedButton
          Left = 168
          Top = 32
          Width = 23
          Height = 22
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            77777000000000000007707778FF7FF7FF077077788F78F78F07708888877877
            87077077780078F78F077077780E0FF78F0770888870E0777707700000FF0E07
            FF077077770F70E0FF07077777707F0E0F070F7555707FF0E0070F7577704444
            0E070F757770000000E070FFF707777777007700007777777777}
          OnClick = btnOrcamentoClick
        end
        object ReResOrc: TRealEdit
          Left = 16
          Top = 32
          Width = 152
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
      end
      object btnGerar: TBitBtn
        Left = 584
        Top = 48
        Width = 121
        Height = 41
        Caption = '&Gerar S.C.I.'
        TabOrder = 3
        OnClick = btnGerarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
    object plnSCI: TPanel
      Left = 1
      Top = 101
      Width = 732
      Height = 279
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 97
        Width = 732
        Height = 8
        Cursor = crVSplit
        Align = alTop
      end
      object plnReq: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 97
        Align = alTop
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'plnReq'
        TabOrder = 0
        object plnlbReq: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 93
          Align = alLeft
          BevelInner = bvLowered
          Caption = 'plnlbReq'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object fcLabel1: TfcLabel
            Left = 2
            Top = 2
            Width = 29
            Height = 89
            Align = alClient
            Caption = 'S.C.I.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Rotation = 90
            TextOptions.VAlignment = vaTop
          end
        end
        object GrdReq: TwwDBGrid
          Left = 33
          Top = 0
          Width = 695
          Height = 93
          Selected.Strings = (
            'NUMREQUISICAO'#9'10'#9'Nº Requisição'#9'No'
            'NUMSOLCOMPRA'#9'10'#9'Nº da S.C.I. ~(prévio)'#9'No'
            'DATAEMISSAO'#9'10'#9'Data~Emissão'#9'No'
            'DATAENTREGA'#9'10'#9'Data~Necessidade'#9'No'
            'DESCALMOX'#9'40'#9'Almoxarifado'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsSCI
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      end
      object plnItem: TPanel
        Left = 0
        Top = 105
        Width = 732
        Height = 174
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'plnItem'
        TabOrder = 1
        object plnLbItem: TPanel
          Left = 0
          Top = 0
          Width = 33
          Height = 170
          Align = alLeft
          BevelInner = bvLowered
          Caption = 'plnLbItem'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object fcLabel2: TfcLabel
            Left = 2
            Top = 2
            Width = 29
            Height = 166
            Align = alClient
            Caption = 'Itens'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextOptions.Alignment = taLeftJustify
            TextOptions.Rotation = 90
            TextOptions.VAlignment = vaTop
          end
        end
        object GrdItem: TwwDBGrid
          Left = 33
          Top = 0
          Width = 695
          Height = 170
          Hint = 'Duplo clique para Visualizar os Atendimentos'
          Selected.Strings = (
            'CODARTIGO'#9'14'#9'Código'#9'No'
            'DESCRICAO'#9'50'#9'Descrição'#9'No'
            'CODMEDIDA'#9'4'#9'Unidade'#9'No'
            'QTDEPEDIDA'#9'10'#9'Qtde. Pedida'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItem
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentShowHint = False
          ShowHint = True
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 734
    object LbPreview: TLabel [0]
      Left = 8
      Top = 2
      Width = 98
      Height = 13
      Caption = 'Gerando Preview'
      Visible = False
    end
    inherited tb97Fundo: TToolbar97
      Left = 484
      DockPos = 486
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        HelpContext = 50030
      end
      object BtnPreview: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Preview'
        TabOrder = 2
        OnClick = BtnPreviewClick
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
    object pgBar: TProgressBar
      Left = 8
      Top = 16
      Width = 449
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 1
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object dsSCI: TwwDataSource
    AutoEdit = False
    DataSet = CdsSCI
    Left = 543
    Top = 126
  end
  object dsItem: TwwDataSource
    AutoEdit = False
    DataSet = CdsItem
    Left = 495
    Top = 126
  end
  object MsResORc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'RESERVAORCAMEN.NUMRESERVA'
      'RESERVAORCAMEN.VLRRESERVA'
      'RESERVAORCAMEN.DATAREFERENCIA'
      'RESERVAORCAMEN.EXERCICIO'
      'RESERVAORCAMEN.PERIODO')
    TipodeDado.Strings = (
      'N'
      'N'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Número Da Reserva'
      'Valor'
      'Data Ref.'
      'Exercício'
      'Período')
    Tabelas.Strings = (
      'RESERVAORCAMEN'
      'RADINSTPROCESSO')
    CamposChave.Strings = (
      'RESERVAORCAMEN.IDRESERVAORCAMEN'
      'RESERVAORCAMEN.NUMRESERVA')
    Filtro.Strings = (
      'RESERVAORCAMEN.FLGRESERVA = '#39'A'#39
      'RESERVAORCAMEN.FLGRESCOMP = '#39'R'#39
      'RADINSTPROCESSO.IDPROCESSO(+) = RESERVAORCAMEN.IDPROCESSO'
      
        '((RADINSTPROCESSO.FLGOK = '#39'S'#39')  OR (RADINSTPROCESSO.FLGOK IS NUL' +
        'L))')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 541
    Top = 12
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 661
    Top = 29
  end
  object CdsCRespon: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 669
    Top = 85
    Data = {
      B80200009619E0BD010000001800000011000000000003000000B8020D494450
      4C414E43524553504F4E08000400000000000F434F4443454E54524F52455350
      4F4E01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002000A000A434F4445585445524E4F01004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000A00094944454D505245534108000400000000000E434F4443454E5452
      4F435553544F01004900000002000753554254595045020049000A0046697865
      644368617200055749445448020002000A00084944504553534F410800040000
      0000000B524553504F4E534156454C0100490000000100055749445448020002
      003C00044E4F4D4501004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002001E001149445553554152494F494E
      434C5553414F08000400000000000949445553554152494F0800040000000000
      05415449564F01004900000002000753554254595045020049000A0046697865
      6443686172000557494454480200020001000F414E414C495449434F53494E54
      455401004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020001000F44455343504C414E43524553504F4E0100
      490000000100055749445448020002003C000A4E4F4D45504553534F41010049
      0000000100055749445448020002003C000B4E4F4D455553554152494F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020014000B4E4F4D45454D50524553410100490000000100055749
      445448020002003C000F4E4F4D4543454E54524F435553544F01004900000001
      00055749445448020002001E000100044C4349440400010009080000}
  end
  object CdsSCI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsSCIAfterScroll
    Left = 607
    Top = 139
  end
  object CdsItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 147
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.IDPLANCRESPON,'
      '   C.CODCENTRORESPON,'
      '   C.CODEXTERNO,'
      '   C.IDEMPRESA,'
      '   C.CODCENTROCUSTO,'
      '   C.IDPESSOA,'
      '   C.RESPONSAVEL,'
      '   C.NOME,'
      '   C.IDUSUARIOINCLUSAO,'
      '   C.IDUSUARIO,'
      '   C.ATIVO,'
      '   C.ANALITICOSINTET,'
      ''
      '   PCR.DESCPLANCRESPON,'
      '   P.NOME AS NOMEPESSOA,'
      '   U.NOMEUSUARIO,'
      '   E.NOMEEMPRESA,'
      '   T.NOME AS NOMECENTROCUSTO'
      ''
      'FROM'
      '   PESSOA         P,'
      '   PESSOA         Q,'
      '   CENTRESPON     C,'
      '   CENTCUST       T,'
      '   USUARIOSISTEMA U,'
      '   PLANCENTRESPON PCR,'
      '   EMPRESAPROP    E'
      'WHERE 1 = 2')
    ClientDataSet = CdsCRespon
    Left = 535
    Top = 244
  end
end
