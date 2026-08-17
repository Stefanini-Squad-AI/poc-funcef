inherited frmCadPpraCipa: TfrmCadPpraCipa
  Left = 51
  Top = 100
  HelpContext = 750107
  Caption = 'Cadastro de CIPA (Comissão Interna de Prevenção de Acidentes)'
  ClientHeight = 442
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 692
    Height = 356
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 688
      Height = 149
      object Label1: TLabel
        Left = 17
        Top = 3
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label3: TLabel
        Left = 17
        Top = 88
        Width = 146
        Height = 13
        Caption = 'Descrição / Observações'
      end
      object Label6: TLabel
        Left = 17
        Top = 51
        Width = 279
        Height = 13
        Caption = 'Empresa a que Pertence (em branco se for geral)'
      end
      object Label2: TLabel
        Left = 579
        Top = 3
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtde. Membros'
        FocusControl = dbedCodigo
      end
      object Label9: TLabel
        Left = 345
        Top = 51
        Width = 324
        Height = 13
        Caption = 'Estabelecimento a que Pertence (em branco se for geral)'
      end
      object dbedCodigo: TDBEdit
        Left = 17
        Top = 17
        Width = 80
        Height = 21
        Color = clGray
        DataField = 'IDPPRACIPA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbmemOBS: TDBMemo
        Left = 17
        Top = 103
        Width = 652
        Height = 42
        DataField = 'DESCRICAO'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 1
        WantTabs = True
      end
      object dblcEmpresa: TwwDBLookupCombo
        Left = 17
        Top = 65
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDEMPRESA'
        DataSource = ds
        LookupTable = CdsEmpresa
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        OrderByDisplay = False
        AllowClearKey = True
      end
      object dbrgTipo: TDBRadioGroup
        Left = 150
        Top = 3
        Width = 384
        Height = 41
        Caption = 'Tipo / Composição'
        Columns = 3
        DataField = 'INDCIPA'
        DataSource = ds
        Items.Strings = (
          'Interna'
          'Externa'
          'Mista')
        TabOrder = 3
        Values.Strings = (
          'I'
          'E'
          'M')
      end
      object dbedNumPess: TDBRealEdit
        Left = 579
        Top = 17
        Width = 86
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMPESSCIPA'
        DataSource = ds
      end
      object dblcEstab: TwwDBLookupCombo
        Left = 345
        Top = 65
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDESTAB'
        DataSource = ds
        LookupTable = CdsPessoaFilialPessoa
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        OrderByDisplay = False
        AllowClearKey = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 151
      Width = 688
      Height = 203
      Tabs.Strings = (
        'Membros Componentes')
      inherited pgctrlDetalhe: TPageControl
        Width = 590
        Height = 144
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 582
            Height = 116
            Selected.Strings = (
              'NOME'#9'41'#9'Nome'
              'DATAINI'#9'12'#9'Data Início'
              'DATAFIM'#9'11'#9'Data Final'
              'DESCRICAO'#9'80'#9'Função na CIPA')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 582
            Height = 116
            object sbtnProcFunc: TToolbarButton97
              Left = 444
              Top = 5
              Width = 128
              Height = 41
              AllowAllUp = True
              GroupIndex = 1
              Caption = '&Procurar Empregado'
              Flat = False
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
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = sbtnProcFuncClick
            end
            object Label4: TLabel
              Left = 5
              Top = 86
              Width = 65
              Height = 13
              Caption = 'Data Início'
              FocusControl = dbedCodigo
            end
            object Label5: TLabel
              Left = 380
              Top = 86
              Width = 59
              Height = 13
              Caption = 'Data Final'
              FocusControl = dbedCodigo
            end
            object Label7: TLabel
              Left = 6
              Top = 9
              Width = 33
              Height = 13
              Caption = 'Nome'
              FocusControl = dbedCodigo
            end
            object Label8: TLabel
              Left = 6
              Top = 49
              Width = 75
              Height = 13
              Caption = 'Função CIPA'
              FocusControl = dbedCodigo
            end
            object dbedNomeCand: TwwDBEdit
              Left = 86
              Top = 5
              Width = 351
              Height = 21
              TabStop = False
              Color = clGray
              DataField = 'NOME'
              DataSource = dsDet
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
            object dbDataIni: TCMDateTimePicker
              Left = 86
              Top = 83
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINI'
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
              TabOrder = 1
            end
            object dbDataFim: TCMDateTimePicker
              Left = 451
              Top = 83
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFIM'
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
              TabOrder = 2
            end
            object dblcFuncaoCIPA: TwwDBLookupCombo
              Left = 86
              Top = 44
              Width = 351
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'80'#9'DESCRICAO'#9'F')
              DataField = 'IDCIPAFUNCAO'
              DataSource = dsDet
              LookupTable = CdsClpaFuncao
              LookupField = 'IDCIPAFUNCAO'
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcFuncaoCIPACloseUp
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 680
      end
      inherited Dock974: TDock97
        Left = 594
        Height = 144
      end
    end
  end
  inherited Dock972: TDock97
    Width = 692
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 692
    inherited tb97Fundo: TToolbar97
      Left = 520
      DockPos = 532
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 750107
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 351
      DockPos = 363
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 613
    Top = 15
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 613
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 414
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona CIPA'
    Colunas.Strings = (
      'IDPPRACIPA'
      'DECODE(INDCIPA, '#39'I'#39','#39'Intrena'#39', '#39'E'#39', '#39'Externa'#39', '#39'Mista'#39') AS TIPO'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PPRACIPA')
    CamposChave.Strings = (
      'IDPPRACIPA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '200')
    ExibePergunta = False
    Left = 494
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 414
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 354
    Top = 1
  end
  object CdsPessoaFilialPessoa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsPessoaFilialPessoaNOME'
        Fields = 'NOME'
      end>
    IndexName = 'CdsPessoaFilialPessoaNOME'
    Params = <>
    StoreDefs = True
    Left = 130
    Top = 385
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 314
    Top = 1
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'UPPER(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME'
      'CARGO.TITULO')
    Filtro.Strings = (
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 494
    Top = 1
  end
  object CdsClpaFuncao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'IDCIPAFUNCAO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 234
    Top = 385
  end
  object CdsEmpresa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsPessoaFilialPessoaNOME'
        Fields = 'NOME'
      end>
    IndexName = 'CdsPessoaFilialPessoaNOME'
    Params = <>
    StoreDefs = True
    Left = 306
    Top = 385
  end
end
