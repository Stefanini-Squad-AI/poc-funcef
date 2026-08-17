inherited frmTransfFundosMT: TfrmTransfFundosMT
  Left = 179
  Top = 151
  HelpContext = 90006
  Caption = 'Transferência entre Contas'
  ClientHeight = 440
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 401
    BevelInner = bvRaised
    BevelOuter = bvNone
    object lblContaDe: TLabel
      Left = 10
      Top = 222
      Width = 110
      Height = 13
      Caption = 'Transferir da Conta'
    end
    object lblHistPad: TLabel
      Left = 10
      Top = 267
      Width = 95
      Height = 13
      Caption = 'Histórico Padrão'
    end
    object lblUnidNegoc: TLabel
      Left = 11
      Top = 311
      Width = 170
      Height = 13
      Caption = 'Atividade da Conta de Origem'
    end
    object Label4: TLabel
      Left = 11
      Top = 357
      Width = 73
      Height = 13
      Caption = 'Patrocinador'
    end
    object lblContaPara: TLabel
      Left = 255
      Top = 222
      Width = 121
      Height = 13
      Caption = 'Transferir para Conta'
    end
    object lblData: TLabel
      Left = 500
      Top = 222
      Width = 119
      Height = 13
      Caption = 'Data do Lançamento'
    end
    object lblValor: TLabel
      Left = 625
      Top = 222
      Width = 124
      Height = 13
      Caption = 'Valor Moeda Corrente'
    end
    object lblHistorico: TLabel
      Left = 168
      Top = 267
      Width = 142
      Height = 13
      Caption = 'Histórico do Lançamento'
    end
    object lblDocumento: TLabel
      Left = 625
      Top = 267
      Width = 130
      Height = 13
      Caption = 'Número do Documento'
    end
    object Label6: TLabel
      Left = 491
      Top = 311
      Width = 229
      Height = 13
      Caption = 'Tipo de Recebimento para transferência'
    end
    object Label3: TLabel
      Left = 251
      Top = 311
      Width = 174
      Height = 13
      Caption = 'Atividade da Conta de Destino'
    end
    object Label5: TLabel
      Left = 251
      Top = 357
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object pnlGrids: TPanel
      Left = 4
      Top = 4
      Width = 757
      Height = 205
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label7: TLabel
        Left = 8
        Top = 180
        Width = 153
        Height = 13
        Caption = 'Saldo da Conta de Origem:'
      end
      object Label8: TLabel
        Left = 384
        Top = 180
        Width = 157
        Height = 13
        Caption = 'Saldo da Conta de Destino:'
      end
      object pnlContaDe: TPanel
        Left = 4
        Top = 5
        Width = 372
        Height = 27
        Anchors = [akLeft, akTop, akBottom]
        BevelInner = bvLowered
        Caption = 'Transferir da Conta'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlContaPara: TPanel
        Left = 380
        Top = 5
        Width = 373
        Height = 27
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvLowered
        Caption = 'Transferir para Conta'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object dbgContaDe: TwwDBGrid
        Left = 4
        Top = 40
        Width = 372
        Height = 129
        Selected.Strings = (
          'DESCRICAO'#9'29'#9'Descrição da Conta'
          'NOCONTACORR'#9'12'#9'Número da Conta')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akBottom]
        DataSource = dsContaOrigem
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 2
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
      object dbgContaPara: TwwDBGrid
        Left = 379
        Top = 40
        Width = 374
        Height = 129
        Selected.Strings = (
          'DESCRICAO'#9'29'#9'Descrição da Conta'
          'NOCONTACORR'#9'12'#9'Número da Conta')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsContaDestino
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 3
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
      object edSaldoOrigem: TRealEdit
        Left = 168
        Top = 176
        Width = 126
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 4
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
      object edSaldoDestino: TRealEdit
        Left = 547
        Top = 176
        Width = 126
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clInfoBk
        Lines.Strings = (
          '      0,00')
        ReadOnly = True
        TabOrder = 5
        WordWrap = False
        IntDigits = 17
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object dblcHistPad: TwwDBLookupCombo
      Left = 10
      Top = 281
      Width = 151
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO')
      LookupTable = cdsHistorico
      LookupField = 'HISTPADFINAN'
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcUnidNegocOri: TwwDBLookupCombo
      Left = 11
      Top = 326
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'NOME')
      LookupTable = cdsUnidNegocio
      LookupField = 'UNIDNEGOC'
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcPatrocinador: TwwDBLookupCombo
      Left = 11
      Top = 371
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'RAZAOSOCIAL'#9'60'#9'Razão Social'#9'F')
      DataField = 'IDPATRO'
      LookupTable = cdsPatrocinador
      LookupField = 'IDPESSOA'
      Enabled = False
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object edDataLanc: TCMDateTimePicker
      Left = 500
      Top = 237
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
    object ednValorCorrente: TRealEdit
      Left = 627
      Top = 237
      Width = 126
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edHistorico: TEdit
      Left = 170
      Top = 281
      Width = 446
      Height = 21
      MaxLength = 60
      TabOrder = 6
    end
    object edNumDoc: TEdit
      Left = 625
      Top = 281
      Width = 131
      Height = 21
      TabOrder = 7
    end
    object dblcTipoRecDes: TwwDBLookupCombo
      Left = 491
      Top = 326
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
      LookupTable = cdsTipoRecDes
      LookupField = 'CODTIPRECDES'
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcUnidNegocDest: TwwDBLookupCombo
      Left = 251
      Top = 326
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'NOME')
      LookupTable = cdsUnidNegocio
      LookupField = 'UNIDNEGOC'
      TabOrder = 9
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 251
      Top = 371
      Width = 230
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME')
      DataField = 'IDPLANOPREV'
      LookupTable = cdsPlanoPrev
      LookupField = 'IDPLANOPREV'
      Enabled = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cbImprimecheque: TCheckBox
      Left = 496
      Top = 373
      Width = 113
      Height = 17
      Caption = 'Imprime Cheque'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 13
    end
    object dbeContaOrigem: TwwDBEdit
      Left = 10
      Top = 237
      Width = 239
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsContaOrigem
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeContaDestino: TwwDBEdit
      Left = 255
      Top = 237
      Width = 239
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsContaDestino
      Enabled = False
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 90006
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 347
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object dsContaOrigem: TwwDataSource
    DataSet = cdsContaOrigem
    Left = 120
    Top = 64
  end
  object dsContaDestino: TwwDataSource
    DataSet = cdsContaDestino
    Left = 496
    Top = 64
  end
  object cdsContaOrigem: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsContaOrigemAfterScroll
    Left = 120
    Top = 48
  end
  object cdsContaDestino: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsContaOrigemAfterScroll
    Left = 496
    Top = 48
  end
  object cdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 192
    Top = 304
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 304
  end
  object cdsPatrocinador: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 160
    Top = 352
  end
  object cdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 400
    Top = 352
  end
  object cdsHistorico: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODLANCFINANC'
        DataType = ftFloat
      end
      item
        Name = 'UNIDNEGOC'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPRECDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CODCENTRORESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALOROUTRAMOEDA'
        DataType = ftFloat
      end
      item
        Name = 'LOTETRANSMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDRATEIOFINANC'
        DataType = ftFloat
      end
      item
        Name = 'IDPROGRAMA'
        DataType = ftFloat
      end
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'IDPATRO'
        DataType = ftFloat
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'DESCUNIDNEG'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'DESCCRESPON'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'MOESIGLA'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'cdsDetIndex1'
      end>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 256
  end
end
