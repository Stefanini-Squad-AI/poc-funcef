inherited frmApuracaoManual: TfrmApuracaoManual
  Left = 199
  Top = 206
  Caption = 'Apuração Manual'
  ClientHeight = 425
  ClientWidth = 604
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 604
    Height = 339
    inherited pnlMestre: TPanel
      Width = 602
      Height = 149
      object lblRoteiro: TLabel
        Left = 156
        Top = 3
        Width = 46
        Height = 13
        Caption = 'Roteiro:'
      end
      object lblData: TLabel
        Left = 7
        Top = 48
        Width = 108
        Height = 13
        Caption = 'Data de Apuração:'
      end
      object lblSituacao: TLabel
        Left = 307
        Top = 48
        Width = 55
        Height = 13
        Caption = 'Situação:'
      end
      object lblUsuario: TLabel
        Left = 156
        Top = 48
        Width = 102
        Height = 13
        Caption = 'Usuário apurador:'
      end
      object lblObservacao: TLabel
        Left = 7
        Top = 92
        Width = 73
        Height = 13
        Caption = 'Observação:'
      end
      object Label1: TLabel
        Left = 458
        Top = 50
        Width = 110
        Height = 13
        Caption = 'Data de Execução:'
      end
      object Label2: TLabel
        Left = 7
        Top = 4
        Width = 89
        Height = 13
        Caption = 'Cod. Apuração:'
      end
      object dblkpRoteiro: TCMDBLookupCombo
        Left = 156
        Top = 19
        Width = 438
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'65'#9'NOME'#9'F')
        DataField = 'IDCPROTEIRO'
        DataSource = ds
        LookupTable = cdsRoteiro
        LookupField = 'IDCPROTEIRO'
        Options = [loTitles]
        Style = csDropDownList
        ReadOnly = True
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dtApuracao: TCMDateTimePicker
        Left = 7
        Top = 64
        Width = 136
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTAPURACAO'
        DateFormat = dfLong
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
        TabOrder = 2
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbmemObservacao: TDBMemo
        Left = 8
        Top = 108
        Width = 587
        Height = 33
        DataField = 'OBSERVACAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 6
      end
      object dtExecucao: TCMDateTimePicker
        Left = 458
        Top = 66
        Width = 136
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DTEXECUCAO'
        DateFormat = dfLong
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
        ParentColor = True
        ReadOnly = True
        ShowButton = True
        TabOrder = 5
        DisplayFormat = 'dd/mm/yyyy hh:nn'
      end
      object dbedtUsuario: TDBEdit
        Left = 156
        Top = 64
        Width = 136
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NOMEUSUARIO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
      object dbedtSituacao: TDBEdit
        Left = 308
        Top = 64
        Width = 136
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'SITUACAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 4
      end
      object dbedtIdApuracao: TDBEdit
        Left = 7
        Top = 20
        Width = 136
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDCPROTAPURADO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 150
      Width = 602
      Height = 188
      inherited pgctrlDetalhe: TPageControl
        Width = 504
        Height = 129
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 496
            Height = 101
            object Label3: TLabel
              Left = 16
              Top = 69
              Width = 109
              Height = 13
              Caption = 'Valor / Quantidade'
              FocusControl = dbedtValor
            end
            object Label4: TLabel
              Left = 16
              Top = 10
              Width = 45
              Height = 13
              Caption = 'Entrada'
              FocusControl = dbedtEntrada
            end
            object dbedtValor: TDBEdit
              Left = 16
              Top = 85
              Width = 172
              Height = 21
              DataField = 'VALOR'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedtEntrada: TDBEdit
              Left = 16
              Top = 26
              Width = 460
              Height = 21
              TabStop = False
              DataField = 'NOME'
              DataSource = dsDet
              ParentColor = True
              ReadOnly = True
              TabOrder = 0
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 496
            Height = 101
            Selected.Strings = (
              'NOME'#9'52'#9'Entrada'
              'VALOR'#9'24'#9'Valor / Quantidade')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 594
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Left = 25
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Left = 0
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 508
        Height = 129
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Default = True
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 604
    inherited Toolbar971: TToolbar97
      object sbtnSimular: TToolbarButton97
        Left = 245
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        Caption = '&Simular'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 6
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        OnClick = sbtnSimularClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 240
        Top = 0
        SizeHorz = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 604
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Default = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 442
    Top = 335
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 406
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 384
    Top = 335
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 328
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    AfterOpen = CdsAfterOpen
    Left = 372
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona apuração manual...'
    Colunas.Strings = (
      'CPROTAPURADO.IDCPROTAPURADO'
      'CPROTEIRO.NOME'
      'CPROTAPURADO.DTAPURACAO'
      'USUARIOSISTEMA.NOMEUSUARIO'
      
        'decode( CPROTAPURADO.FLGSTATUS, '#39'A'#39', '#39'Apurado'#39', '#39'Executado'#39' ) as' +
        ' FLGSTATUS'
      'CPEXECROT.DTEXECUCAO'
      'CPROTAPURADO.OBSERVACAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Cod. Apur.'
      'Roteiro'
      'Dt. Apuração'
      'Usuário'
      'Situação'
      'Dt. Execução'
      'Observação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CPROTAPURADO'
      'CPROTEIRO'
      'USUARIOSISTEMA'
      'CPEXECROT')
    CamposChave.Strings = (
      'CPROTAPURADO.IDCPROTAPURADO')
    Filtro.Strings = (
      'CPROTAPURADO.IDCPROTEIRO = CPROTEIRO.IDCPROTEIRO'
      'CPROTAPURADO.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO'
      'CPROTAPURADO.IDCPEXECROT = CPEXECROT.IDCPEXECROT (+)'
      'CPROTAPURADO.FLGTIPOAPUR = '#39'M'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '14'
      '14'
      '14'
      '14'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 256
    Top = 335
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 460
    Top = 7
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 534
    Top = 7
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsDetAfterOpen
    Left = 500
    Top = 7
  end
  object cdsRoteiro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 436
    Top = 63
  end
  object cdsEntrada: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 324
    Top = 343
  end
  object cdsMovimentacoes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 52
    Top = 343
  end
  object cdsSimulaMovim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 148
    Top = 343
  end
end
