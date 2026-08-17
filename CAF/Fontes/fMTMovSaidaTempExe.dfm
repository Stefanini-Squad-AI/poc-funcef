inherited frmMTMovSaidaTempExe: TfrmMTMovSaidaTempExe
  Left = 128
  Top = 86
  HelpContext = 70035
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Executa Termo de Saída Temporária'
  ClientHeight = 398
  ClientWidth = 587
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 587
    Height = 359
    object pnlMestre: TPanel
      Left = 5
      Top = 5
      Width = 577
      Height = 60
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Termo: TLabel
        Left = 17
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Termo'
      end
      object Label3: TLabel
        Left = 296
        Top = 8
        Width = 84
        Height = 13
        Caption = 'Data da Saída'
      end
      object dbeTermo: TwwDBEdit
        Left = 16
        Top = 24
        Width = 145
        Height = 21
        DataField = 'STPTERMO'
        DataSource = dsTermo
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object bbtnSelTermo: TBitBtn
        Left = 161
        Top = 24
        Width = 21
        Height = 21
        TabOrder = 0
        OnClick = bbtnSelTermoClick
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
      object pnlData: TPanel
        Left = 295
        Top = 22
        Width = 131
        Height = 23
        BevelOuter = bvNone
        TabOrder = 2
        object edData: TCMDateTimePicker
          Left = 1
          Top = 1
          Width = 129
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
    object PnlDetalhe: TPanel
      Left = 5
      Top = 65
      Width = 577
      Height = 289
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object Label4: TLabel
        Left = 296
        Top = 8
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object Label34: TLabel
        Left = 16
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Destino'
      end
      object Label6: TLabel
        Left = 296
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 39
        Height = 13
        Caption = 'Motivo'
      end
      object Label5: TLabel
        Left = 16
        Top = 128
        Width = 29
        Height = 13
        Caption = 'Bens'
      end
      object Bevel3: TBevel
        Left = 0
        Top = 123
        Width = 575
        Height = 2
        Shape = bsBottomLine
        Style = bsRaised
      end
      object dbgBensConj: TwwDBGrid
        Left = 16
        Top = 145
        Width = 545
        Height = 132
        Selected.Strings = (
          'PLACA'#9'12'#9'Placa'
          'DESBEM'#9'61'#9'Descrição'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsTermoBens
        Enabled = False
        KeyOptions = [dgEnterToTab]
        Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
      object dbeResponsavel: TwwDBEdit
        Left = 296
        Top = 24
        Width = 265
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = dsTermo
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeLocalizacao: TwwDBEdit
        Left = 16
        Top = 24
        Width = 273
        Height = 21
        DataField = 'NOMELOCALIZACAO'
        DataSource = dsTermo
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeObs: TDBMemo
        Left = 296
        Top = 72
        Width = 265
        Height = 41
        DataField = 'STPOBSERVACOES'
        DataSource = dsTermo
        TabOrder = 3
      end
      object dbeMotivo: TwwDBEdit
        Left = 16
        Top = 72
        Width = 273
        Height = 21
        DataField = 'DESCTIPSAITEMP'
        DataSource = dsTermo
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 359
    Width = 587
    inherited tb97Fundo: TToolbar97
      Left = 401
      DockPos = 401
      inherited sep1: TToolbarSep97
        Left = 179
      end
      inherited sep3: TToolbarSep97
        Left = 88
      end
      inherited bbtnSair: TBitBtn
        Width = 88
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 91
        Width = 88
        HelpContext = 70035
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 218
      DockPos = 218
      inherited ToolbarSep971: TToolbarSep97
        Left = 88
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 88
        Caption = '&Executar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 91
        Width = 88
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 674
    Top = 503
  end
  object dsTermo: TwwDataSource
    AutoEdit = False
    DataSet = cdsTermo
    Left = 221
    Top = 36
  end
  object dsTermoBens: TwwDataSource
    AutoEdit = False
    DataSet = cdsTermoBens
    Left = 433
    Top = 295
  end
  object cdsTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
    Top = 22
  end
  object cdsTermoBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 433
    Top = 281
  end
  object sqlTermoBens: TCMSqlParams
    SQL.Strings = (
      'SELECT STB.IDSAIDATEMPORARIA, STB.IDPESSOA, STB.IDBEM, '
      '       STB.STBCUSTO, STB.STBDATARETORNO, '
      '       B.PLACA, B.DESBEM'
      'FROM SAIDATEMPBENS STB,'
      '     BEM B '
      'WHERE (STB.IDSAIDATEMPORARIA = :IDSAIDATEMPORARIA)'
      '  AND (STB.IDPESSOA = :IDPESSOA)'
      '  AND (STB.IDBEM = B.IDBEM)'
      '  AND (STB.IDPESSOA = B.IDPESSOA)'
      'ORDER BY STB.IDSAIDATEMPORARIA, STB.IDBEM')
    Left = 433
    Top = 268
  end
  object MSTermo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Termo'
    Colunas.Strings = (
      'SAIDATEMPORARIA.STPTERMO'
      'SAIDATEMPORARIA.STPDATA'
      'LOCALIZACAO.NOME'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Termo de Saída'
      'Data da Saída'
      'Destino'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SAIDATEMPORARIA'
      'LOCALIZACAO'
      'PESSOA')
    CamposChave.Strings = (
      'SAIDATEMPORARIA.IDSAIDATEMPORARIA'
      'SAIDATEMPORARIA.IDPESSOA')
    Filtro.Strings = (
      'SAIDATEMPORARIA.IDLOCALIZACAO=LOCALIZACAO.IDLOCALIZACAO(+)'
      'SAIDATEMPORARIA.IDPESSOA=LOCALIZACAO.IDPESSOA(+)'
      'SAIDATEMPORARIA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 221
    Top = 8
  end
end
