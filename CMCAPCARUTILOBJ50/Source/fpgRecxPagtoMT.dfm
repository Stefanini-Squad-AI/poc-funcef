inherited frmpgRecxPagtoMT: TfrmpgRecxPagtoMT
  Left = 90
  Top = 131
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Baixa de Documentos - Contas a Receber X Contas a Pagar'
  ClientHeight = 546
  ClientWidth = 915
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel [0]
    Left = 173
    Top = 209
    Width = 198
    Height = 13
    Caption = 'Contas/Caixas x Forma Pagamento'
  end
  inherited pnlFundo: TPanel
    Width = 915
    Height = 507
    object SplDocCar: TSplitter
      Left = 5
      Top = 153
      Width = 905
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object SplDocCap: TSplitter
      Left = 5
      Top = 324
      Width = 905
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object PnlFinancTot: TPanel
      Left = 5
      Top = 327
      Width = 905
      Height = 175
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label20: TLabel
        Left = 0
        Top = 0
        Width = 905
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Lançamentos no Financeiros Pendentes de Regularização'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object GrdLancFinanc: TwwDBGrid
        Left = 0
        Top = 18
        Width = 905
        Height = 157
        ControlType.Strings = (
          'SELECIONA;CheckBox;S;N')
        Selected.Strings = (
          'SELECIONA'#9'3'#9'OK'#9'F'
          'DATALANCFINAN'#9'12'#9'Data Lancto'#9'T'
          'HISTORICO'#9'44'#9'Historico'#9'T'
          'NUMCHQBORDERO'#9'16'#9'Num. Lote Receb.'#9'T'
          'ENTRADASAIDA'#9'7'#9'E/S'#9'T'
          'VALORLANCFINAN'#9'18'#9'Valor'#9'T'
          'VALOROUTRAMOEDA'#9'18'#9'Valor O. M.'#9'T')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = DsLancFinanc
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        IndicatorColor = icBlack
        OnFieldChanged = GrdLancFinancFieldChanged
      end
    end
    object PnlDocCap: TPanel
      Left = 5
      Top = 156
      Width = 905
      Height = 168
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PnlDocCap'
      TabOrder = 1
      object Label19: TLabel
        Left = 0
        Top = 0
        Width = 905
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documentos Pendentes do Contas a Pagar'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object GrdDocCap: TwwDBGrid
        Left = 0
        Top = 18
        Width = 905
        Height = 150
        ControlType.Strings = (
          'SELECIONA;CheckBox;S;N')
        Selected.Strings = (
          'SELECIONA'#9'2'#9'OK'#9'F'
          'NODOCUMENTO'#9'22'#9'Documento'#9'T'
          'COMPLDOCUMENTO'#9'8'#9'Compl.'#9'T'
          'DATAVENCTO'#9'11'#9'Data Venc'#9'T'
          'SALDO'#9'11'#9'Saldo'#9'T'
          'DATAPROGRAMADA'#9'11'#9'Data Programada'#9'T'
          'NOME'#9'63'#9'Nome\Razão Social'#9'T')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsDocPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        IndicatorColor = icBlack
        OnFieldChanged = GrdDocCapFieldChanged
      end
    end
    object PnlDocCar: TPanel
      Left = 5
      Top = 5
      Width = 905
      Height = 148
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PnlDocCar'
      TabOrder = 2
      object Label18: TLabel
        Left = 0
        Top = 0
        Width = 905
        Height = 18
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documentos Pendentes do Contas a Receber'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object GrdDocCar: TwwDBGrid
        Left = 0
        Top = 18
        Width = 905
        Height = 130
        ControlType.Strings = (
          'SELECIONA;CheckBox;S;N')
        Selected.Strings = (
          'SELECIONA'#9'2'#9'Ok'#9'F'
          'NODOCUMENTO'#9'22'#9'Documento'#9'T'
          'COMPLDOCUMENTO'#9'8'#9'Compl.'#9'T'
          'DATAVENCTO'#9'11'#9'Data Venc'#9'T'
          'SALDO'#9'11'#9'Saldo'#9'T'
          'DATAPROGRAMADA'#9'11'#9'Data Programada'#9'T'
          'NOME'#9'63'#9'Nome \ Razão Social'#9'T')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsDocRec
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
        IndicatorColor = icBlack
        OnFieldChanged = GrdDocCarFieldChanged
      end
    end
  end
  inherited Dock971: TDock97
    Top = 507
    Width = 915
    inherited tb97Fundo: TToolbar97
      Left = 745
      DockPos = 855
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 188
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 108
      end
      inherited bbtnCancelar: TBitBtn
        Left = 191
      end
      object bbtnSelecionaDoc: TBitBtn
        Left = 0
        Top = 0
        Width = 108
        Height = 33
        Caption = '&Selecionar'
        TabOrder = 2
        OnClick = bbtnSelecionaDocClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555FFFFFFFFFF55555000000000055555577777777775FFFF00B8B8B8B8B0
          0000775F5555555777770B0B8B8B8B8B0FF07F75F555555575F70FB0B8B8B8B8
          B0F07F575FFFFFFFF7F70BFB0000000000F07F557777777777570FBFBF0FFFFF
          FFF07F55557F5FFFFFF70BFBFB0F000000F07F55557F777777570FBFBF0FFFFF
          FFF075F5557F5FFFFFF750FBFB0F000000F0575FFF7F777777575700000FFFFF
          FFF05577777F5FF55FF75555550F00FF00005555557F775577775555550FFFFF
          0F055555557F55557F755555550FFFFF00555555557FFFFF7755555555000000
          0555555555777777755555555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  object TwinTotais: TToolWindow97 [3]
    Left = 640
    Top = 32
    Caption = 'Totais Selecionados para Baixa'
    Color = clGray
    CloseButton = False
    ClientAreaHeight = 119
    ClientAreaWidth = 241
    TabOrder = 2
    object LblSistema: TLabel
      Left = 9
      Top = 7
      Width = 103
      Height = 13
      Caption = 'Contas a Receber'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblOutroSistema: TLabel
      Left = 9
      Top = 33
      Width = 88
      Height = 13
      Caption = 'Contas a Pagar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblDiferenca: TLabel
      Left = 9
      Top = 94
      Width = 119
      Height = 13
      Caption = 'Diferença a Receber'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblTotDepositos: TLabel
      Left = 9
      Top = 63
      Width = 108
      Height = 13
      Caption = 'Total de Depósitos'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblValSistema: TLabel
      Left = 156
      Top = 7
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblValOutroSistema: TLabel
      Left = 156
      Top = 33
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblValTotDepositos: TLabel
      Left = 156
      Top = 63
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object LblValDiferenca: TLabel
      Left = 156
      Top = 94
      Width = 75
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0,00'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Shape1: TShape
      Left = 131
      Top = 24
      Width = 20
      Height = 5
      Pen.Style = psClear
    end
    object Shape3: TShape
      Left = 131
      Top = 53
      Width = 20
      Height = 5
      Pen.Style = psClear
    end
    object Shape2: TShape
      Left = 138
      Top = 45
      Width = 5
      Height = 20
      Pen.Style = psClear
    end
    object Shape6: TShape
      Left = 131
      Top = 82
      Width = 101
      Height = 5
      Pen.Style = psClear
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 535
    Top = 273
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
  object dsDocPag: TwwDataSource
    DataSet = cdsDocPag
    Left = 237
    Top = 153
  end
  object dsrecpagto: TwwDataSource
    Left = 1368
    Top = 537
  end
  object dsDocRec: TwwDataSource
    DataSet = cdsDocRec
    Left = 237
    Top = 57
  end
  object MsDocrec: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Documentos'
    Colunas.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'DOCUMENTO.DATAVENCTO'
      'LANCTODOCUM.VALOR'
      'PESSOA.RAZAOSOCIAL'
      'LANCTODOCUM.HISTORICOCOMPL'
      'DOCUMENTO.CODDOCUMENTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'D'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Número do Documento'
      'Complemento'
      'Data Programada'
      'Data Vencimento'
      'Valor'
      'Razão Social'
      'Histórico'
      'Código do Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DOCUMENTO'
      'LANCTODOCUM'
      'PESSOA')
    CamposChave.Strings = (
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO=LANCTODOCUM.OPERACAO'
      'DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA'
      
        '((DOCUMENTO.STATUS='#39'0'#39') OR  (DOCUMENTO.STATUS='#39'1'#39' ) OR (DOCUMENT' +
        'O.STATUS is  NULL))'
      '((DOCUMENTO.OPERACAO='#39'2'#39') OR (DOCUMENTO.OPERACAO='#39'3'#39') )'
      '(LANCTODOCUM.ESTORNO IS NULL)  ')
    Mascaras.Strings = (
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
      '3'
      '10'
      '10'
      '10'
      '60'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 1337
    Top = 63909
  end
  object DsLancFinanc: TwwDataSource
    DataSet = cdsLancFinanc
    Left = 237
    Top = 205
  end
  object CMParamRec: TCmParamReport
    Caption = 'Parâmetros para seleção de Documentos - Contas a Receber'
    DataBaseName = 'BaseDados'
    Params = <
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Grupo CNAB'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Contas Caixas X Tipo de Cobrança'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA, '
          '  CODPORTADOR, '
          '  DESCFINAN'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1 = 2'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Contas Caixas X Tipo de Recebimento'
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
          'SELECT'
          '  CODTIPDOC,'
          '  DESCRICAO,'
          '  DEBCRE,'
          '  FLGENGLOBAPARCELA,'
          '  FLGGERANUMDOC,'
          '  FLGDOCFISCAL'
          'FROM'
          '  TIPODOCRECPAG TD'
          'WHERE'
          '1=2'
          '')
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Tipo de Documento'
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
        Caption = 'Forma de Recebimento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  CODFORMA,'
          '  DESCRICAO'
          'FROM'
          '  FORMARECPAG'
          'WHERE'
          '1=2'
          'ORDER BY'
          '  DESCRICAO'
          '')
        LookupSettings.Chave = 'CODFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Forme de Recebimento'
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
          'SELECT '
          '   IDMODULO, NOMEMODULO '
          'FROM '
          '  MODULO '
          'ORDER BY '
          '  NOMEMODULO'
          '')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Sistema de Origem'
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
        Caption = 'Data Programada'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Data de Lançamento'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 350
    FormWidth = 525
    Left = 284
    Top = 57
  end
  object CMParamPag: TCmParamReport
    Caption = 'Parâmetros para seleção de Documentos - Contas a Pagar'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Fornecedor'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Grupo CNAB'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Contas Caixas X Tipo de Pagamento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA, '
          '  CODPORTADOR, '
          '  DESCFINAN'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1 = 2'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Contas Caixas X Tipo de Pagamento'
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
          'SELECT'
          '  CODTIPDOC,'
          '  DESCRICAO,'
          '  DEBCRE,'
          '  FLGENGLOBAPARCELA,'
          '  FLGGERANUMDOC,'
          '  FLGDOCFISCAL'
          'FROM'
          '  TIPODOCRECPAG TD'
          'WHERE'
          '1=2'
          '')
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Tipo de Documento'
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
        Caption = 'Forma de Pagamento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  CODFORMA,'
          '  DESCRICAO'
          'FROM'
          '  FORMARECPAG'
          'WHERE'
          '1=2'
          'ORDER BY'
          '  DESCRICAO'
          '')
        LookupSettings.Chave = 'CODFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Forme de Pagamento'
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
          'SELECT '
          '   IDMODULO, NOMEMODULO '
          'FROM '
          '  MODULO '
          'ORDER BY '
          '  NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Sistema de Origem'
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
        Caption = 'Data Programada'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end
      item
        Caption = 'Data de Lançamento'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
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
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 350
    FormWidth = 550
    Left = 284
    Top = 153
  end
  object CMParamFinanceiro: TCmParamReport
    Caption = 'Parâmetros para seleção de Lançamentos não Identificados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Conta Bancária\Caixa '
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  CODPORTADOR,'
          '  DESCRICAO '
          'FROM'
          '  PORTADORCONTA'
          'WHERE'
          '  1=2 '
          ' '
          ''
          '')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Conta Bancária\Caixa'
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
          'SELECT '
          '   IDMODULO, NOMEMODULO '
          'FROM '
          '  MODULO '
          'ORDER BY '
          '  NOMEMODULO'
          ''
          '')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Sistema de Origem'
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
    Formheight = 130
    FormWidth = 525
    Left = 284
    Top = 205
  end
  object cdsDocRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 57
  end
  object cdsDocPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 153
  end
  object sqlLancFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  CODLANCFINANC,  '
      '  STATUSCONCILIA,'
      '  VALORLANCFINAN, '
      '  VALOROUTRAMOEDA, '
      '  NUMCHQBORDERO, '
      '  DATALANCFINAN,'
      '  ENTRADASAIDA, '
      '  HISTORICO'
      'FROM'
      '  MOVIMFINANC'
      'WHERE'
      ''
      '1=2'
      'ORDER BY'
      '  DATALANCFINAN, '
      '  NUMCHQBORDERO'
      ''
      '')
    ClientDataSet = cdsLancFinanc
    Left = 143
    Top = 205
  end
  object cdsLancFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 205
  end
  object SQLDocPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  '#39'N'#39' AS BAIXAPARCIAL,'
      '  0 AS VALORPAGO,'
      '  0 as VALORPAGOOOTRMOE,'
      '  (0)AS SALDO,'
      '  (0) AS SALDO1,'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODSUBCONTA,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.DEBCRE,'
      '  L.VALOROUTRAMOEDA,'
      '  0 AS IMPRET,'
      '  0 AS IMP,'
      '  0 AS DIF'
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L'
      'WHERE'
      '  1 = 2'
      ''
      '')
    ClientDataSet = cdsDocPag
    Left = 143
    Top = 153
  end
  object SQLDocRec: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  '#39'N'#39' AS BAIXAPARCIAL,'
      '  0 AS VALORPAGO,'
      '  0 as VALORPAGOOOTRMOE,'
      '  (0)AS SALDO,'
      '  (0) AS SALDO1,'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODSUBCONTA,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.DEBCRE,'
      '  L.VALOROUTRAMOEDA,'
      '  0 AS IMPRET,'
      '  0 AS IMP,'
      '  0 AS DIF'
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L'
      'WHERE'
      '  1 = 2'
      ''
      '')
    ClientDataSet = cdsDocRec
    Left = 143
    Top = 57
  end
  object SQLSelecionaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'N'#39' AS SELECIONA,'
      '  '#39'N'#39' AS BAIXAPARCIAL,'
      '  0 AS VALORPAGO,'
      '  0 as VALORPAGOOOTRMOE,'
      '  (0)AS SALDO,'
      '  (0) AS SALDO1,'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODSUBCONTA,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.DEBCRE,'
      '  L.VALOROUTRAMOEDA,'
      '  0 AS IMPRET,'
      '  0 AS IMP,'
      '  0 AS DIF'
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L'
      'WHERE'
      '  1 = 2'
      ''
      '')
    ClientDataSet = CdsSelecionaDoc
    Left = 143
    Top = 105
  end
  object CdsSelecionaDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 189
    Top = 105
  end
end
