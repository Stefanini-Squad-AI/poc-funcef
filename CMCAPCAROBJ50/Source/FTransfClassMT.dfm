inherited frmTransfClassMT: TfrmTransfClassMT
  Left = 291
  Top = 73
  Caption = 'Transferência de Classificação de Documentos em Atraso'
  ClientHeight = 444
  ClientWidth = 468
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 405
    object Label1: TLabel
      Left = 34
      Top = 95
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object gbContas: TGroupBox
      Left = 19
      Top = 214
      Width = 431
      Height = 141
      Caption = ' Transferência de Contas Contábeis '
      TabOrder = 5
      object dblcCCOrigem: TCMProcuraMaskContabil
        Left = 9
        Top = 23
        Width = 204
        Height = 113
        Caption = ' Conta de Origem '
        TabOrder = 0
        OnExit = dblcCCOrigemExit
        MostraMensagens = True
        MostraDescricao = True
        DataField = 'PLACONTAO'
        Mensagens.EmBranco = 'Conta de Origem deve ser preenchida'
        Mensagens.NaoExiste = 'Conta de Origem não existe'
        Mensagens.Sintetica = 'Conta de Origem não pode ser sintética'
        Mensagens.Analitica = 'Conta de Origem não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
        OnApertouBotao = dblcCCOrigemApertouBotao
      end
      object dblcCCDestino: TCMProcuraMaskContabil
        Left = 219
        Top = 23
        Width = 204
        Height = 113
        Caption = ' Conta de Destino '
        TabOrder = 1
        OnExit = dblcCCDestinoExit
        MostraMensagens = True
        MostraDescricao = True
        DataField = 'PLACONTAD'
        Mensagens.EmBranco = 'Conta de Destino não deve ser preenchida'
        Mensagens.NaoExiste = 'Conta de Destino não existe'
        Mensagens.Sintetica = 'Conta de Destino não pode ser sintética'
        Mensagens.Analitica = 'Conta de Destino não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
        OnApertouBotao = dblcCCDestinoApertouBotao
      end
    end
    object GpTipoDesemb: TGroupBox
      Left = 19
      Top = 143
      Width = 432
      Height = 69
      Caption = ' Transferência de Tipos de Recebimentos '
      TabOrder = 4
      object Label3: TLabel
        Left = 15
        Top = 19
        Width = 69
        Height = 13
        Caption = 'Tipo Origem'
      end
      object Label4: TLabel
        Left = 222
        Top = 19
        Width = 73
        Height = 13
        Caption = 'Tipo Destino'
      end
      object dblcTipoRDOrigem: TCMDBLookupCombo
        Left = 15
        Top = 34
        Width = 202
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        LookupTable = cdsTipoRD
        LookupField = 'CODTIPRECDES'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 370
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcTipoRDOrigemCloseUp
      end
      object dblcTipoRDDestino: TCMDBLookupCombo
        Left = 222
        Top = 34
        Width = 199
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'
          'CODTIPRECDES'#9'15'#9'Código')
        LookupTable = cdsTipoRD
        LookupField = 'CODTIPRECDES'
        Options = [loTitles]
        Style = csDropDownList
        DropDownWidth = 370
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcTipoRDDestinoCloseUp
      end
    end
    object gbDataRef: TGroupBox
      Left = 249
      Top = 7
      Width = 202
      Height = 56
      Caption = ' Data do Lançamento '
      TabOrder = 0
      object deDataRef: TCMDateTimePicker
        Left = 36
        Top = 20
        Width = 130
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
    object RgData: TRadioGroup
      Left = 19
      Top = 356
      Width = 432
      Height = 48
      Caption = ' Data a ser considerada para a reclassificação '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Data Programada'
        'Data de Vencimento')
      TabOrder = 6
    end
    object CkbSinc: TCheckBox
      Left = 35
      Top = 69
      Width = 414
      Height = 17
      Caption = 'Sincroniza tipos de desembolso e conta contábil de origem '
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CkbTransf: TCheckBox
      Left = 308
      Top = 72
      Width = 213
      Height = 17
      Caption = 'Realiza Transferência Contábil '
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
      Visible = False
      OnClick = CkbTransfClick
    end
    object dbLkTipOper: TCMDBLookupCombo
      Left = 34
      Top = 110
      Width = 403
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'Descrição'#9'F')
      LookupTable = CdsTipOper
      LookupField = 'TIPCODIGO'
      Options = [loTitles]
      Style = csDropDownList
      DropDownWidth = 370
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object gbDataAte: TGroupBox
      Left = 20
      Top = 8
      Width = 197
      Height = 55
      Caption = ' Documentos Vencidos Até '
      TabOrder = 7
      object deDataAte: TCMDateTimePicker
        Left = 30
        Top = 20
        Width = 132
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
  inherited Dock971: TDock97
    Top = 405
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 126
      DockPos = 126
      inherited sep1: TToolbarSep97
        Left = 242
      end
      inherited bbtnSair: TBitBtn
        Left = 161
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 244
      end
      object bbtnConfirmaCla: TBitBtn
        Left = 0
        Top = 0
        Width = 161
        Height = 33
        Cancel = True
        Caption = '&Reclassifica'
        TabOrder = 2
        OnClick = bbtnConfirmaClaClick
        Glyph.Data = {
          76020000424D7602000000000000760000002800000040000000100000000100
          0400000000000002000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00331111133333
          333333FFFFF33333333333222223332222233333333333444443333199933333
          333333388883333333333332AAA333AAA2333333333333CCC433333199933333
          1133333888833333FF333332AAA333AAA2333334433333CCC433339919933333
          99133388F883333388F333AA2AA333AA2A2333CC433333CC4C43339133933333
          3913338F33833333388F33A233A333A33A2333C4333333C33CC4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4339133333333
          3991338F33333333388F33A2333333333AA233C4333333333CC4339913333333
          99133388F333333388F333AA23333333AA2333CC43333333CC43333991333339
          913333388F3333388F33333AA233333AA233333CC433333CC433333399111119
          1333333388FFFFF8F3333333AA22222A23333333CC44444C4333333333999993
          33333333338888833333333333AAAAA33333333333CCCCC33333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 4
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 331
    Top = 235
  end
  object sqlTipoRD: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES,'
      '  DESCRICAO,'
      '  PLACONTACREDITO,'
      '  PLACONTACREDITO AS PLACONTAO,'
      '  PLACONTACREDITO AS PLACONTAD'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '    ANASINT  = '#39'A'#39
      'AND RECPAG   = :PRECPAG'
      'AND IDPESSOA = :pIDPESSOA'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' ')
    ClientDataSet = cdsTipoRD
    Left = 335
    Top = 128
  end
  object cdsTipoRD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 128
  end
  object dsTipoO: TDataSource
    DataSet = cdsTipoRD
    Left = 150
    Top = 295
  end
  object dsTipoD: TDataSource
    DataSet = cdsTipoRD
    Left = 344
    Top = 295
  end
  object sqlTipOper: TCMSqlParams
    SQL.Strings = (
      'select * from tipoper')
    ClientDataSet = CdsTipOper
    Left = 191
    Top = 80
  end
  object CdsTipOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 80
  end
end
