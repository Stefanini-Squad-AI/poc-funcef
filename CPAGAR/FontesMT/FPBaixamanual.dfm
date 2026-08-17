inherited Frmpbaixamanual: TFrmpbaixamanual
  Left = 502
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Seleção de Documentos Para Baixa Manual '
  ClientHeight = 482
  ClientWidth = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 541
    Height = 443
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 539
      Height = 441
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Seleção'
        object Label1: TLabel
          Left = 7
          Top = 129
          Width = 188
          Height = 13
          Caption = 'Contas Caixas x Forma de Pagto.'
        end
        object Label2: TLabel
          Left = 8
          Top = 156
          Width = 126
          Height = 13
          Caption = 'Formas de Pagamento'
        end
        object Label3: TLabel
          Left = 8
          Top = 182
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label4: TLabel
          Left = 8
          Top = 209
          Width = 106
          Height = 13
          Caption = 'Sistema de Origem'
        end
        object Label5: TLabel
          Left = 8
          Top = 232
          Width = 99
          Height = 13
          Caption = 'Data Programada'
        end
        object Label6: TLabel
          Left = 8
          Top = 259
          Width = 123
          Height = 13
          Caption = 'Data de Lançamento '
        end
        object Label7: TLabel
          Left = 8
          Top = 284
          Width = 65
          Height = 13
          Caption = 'Documento'
        end
        object SBdoc: TSpeedButton
          Left = 374
          Top = 279
          Width = 27
          Height = 22
          Hint = 'Seleciona Documento'
          Anchors = [akLeft, akBottom]
          Caption = '...'
          ParentShowHint = False
          ShowHint = True
          OnClick = SBdocClick
        end
        object Label9: TLabel
          Left = 326
          Top = 284
          Width = 7
          Height = 13
          Caption = '/'
        end
        object Label10: TLabel
          Left = 379
          Top = 232
          Width = 28
          Height = 13
          Caption = 'Final'
        end
        object Label11: TLabel
          Left = 202
          Top = 232
          Width = 35
          Height = 13
          Caption = 'Inicial'
        end
        object CPForCli: TCMProcuraForCli
          Left = 4
          Top = 62
          Width = 501
          Height = 54
          Caption = 'Fornecedor'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          CampoEdit = ceRazaoSocial
          MostraMensagens = True
          Mensagens.EmBranco = ' não pode estar em branco'
          Mensagens.NaoExiste = ' não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          ForCli = fcFornecedor
          MostraEndereco = False
          StatusForCli = fcAll
          MostraStatusCredito = False
        end
        object EdDoc: TEdit
          Left = 201
          Top = 279
          Width = 124
          Height = 21
          TabOrder = 1
        end
        object CmbSistema: TCMDBLookupCombo
          Left = 200
          Top = 200
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEMODULO'#9'50'#9'Descricao'#9'F')
          DataField = 'IDMODULO'
          LookupTable = CdsModulo
          LookupField = 'IDMODULO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbTipo: TCMDBLookupCombo
          Left = 200
          Top = 176
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO')
          DataField = 'CODTIPDOC'
          LookupTable = CdsTipoDocRecPag
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object CmbFormas: TCMDBLookupCombo
          Left = 200
          Top = 152
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO')
          DataField = 'CODFORMA'
          LookupTable = CdsFormaRecPag
          LookupField = 'CODFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object Cmbcontas: TCMDBLookupCombo
          Left = 201
          Top = 127
          Width = 305
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'DESCRICAO')
          DataField = 'CODPORTFORMA'
          LookupTable = CdsUmPortadorForma
          LookupField = 'CODPORTFORMA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object Dtini: TCMDateTimePicker
          Left = 242
          Top = 225
          Width = 93
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
          TabOrder = 6
        end
        object DtLanc: TCMDateTimePicker
          Left = 384
          Top = 249
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
          TabOrder = 7
        end
        object CmbDataLanc: TComboBox
          Left = 201
          Top = 252
          Width = 172
          Height = 21
          ItemHeight = 13
          TabOrder = 8
        end
        object rgselecao: TRadioGroup
          Left = 8
          Top = 8
          Width = 489
          Height = 49
          Caption = 'Tipo de Seleção'
          Columns = 2
          Items.Strings = (
            'Razão Social'
            'Nome Fantasia')
          TabOrder = 9
        end
        object GBFiltro: TGroupBox
          Left = 8
          Top = 310
          Width = 497
          Height = 89
          Caption = 'Filtro para Seleção dos Documentos'
          TabOrder = 10
          object CBCC: TCheckBox
            Left = 10
            Top = 20
            Width = 279
            Height = 13
            Caption = 'Contas Caixas X Formas de Pagamento'
            TabOrder = 0
          end
          object CBFP: TCheckBox
            Left = 10
            Top = 36
            Width = 279
            Height = 13
            Caption = 'Formas de Pagamento'
            TabOrder = 1
          end
          object CBdoc: TCheckBox
            Left = 10
            Top = 52
            Width = 279
            Height = 13
            Caption = 'Lista apenas documentos marcados'
            TabOrder = 2
          end
          object CBlista: TCheckBox
            Left = 10
            Top = 69
            Width = 279
            Height = 13
            Caption = 'Lista também Documentos do tipo CPMF'
            TabOrder = 3
          end
        end
        object Edit1: TEdit
          Left = 334
          Top = 279
          Width = 36
          Height = 21
          TabOrder = 11
        end
        object DtFim: TCMDateTimePicker
          Left = 412
          Top = 225
          Width = 93
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
          TabOrder = 12
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Plano Previdenciário Contábil'
        ImageIndex = 1
        object Label8: TLabel
          Left = 11
          Top = 152
          Width = 176
          Height = 13
          Caption = 'Plano Previdenciário Contábil :'
        end
        object grpPlanoPrev: TGroupBox
          Left = 2
          Top = 24
          Width = 529
          Height = 249
          Caption = 'Plano Previdenciário'
          TabOrder = 0
          object dbgrPlanoPrev: TwwDBGrid
            Left = 2
            Top = 15
            Width = 519
            Height = 227
            ControlType.Strings = (
              'MARCA;CheckBox;S;N')
            Selected.Strings = (
              'MARCA'#9'6'#9'Selecionar'#9'F'
              'NOME'#9'50'#9'NOME'#9'T')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsPlanoPrev
            TabOrder = 0
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
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 443
    Width = 541
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 11
  end
  object SqlUmPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO,'
      '  CODPORTFORMA,'
      '  DMAIS,'
      '  LANCAFINANC,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODPORTADOR,'
      '  DESCFINAN,'
      '  FLGCHEQUEDIFERIDO,'
      '  FLGCONTROLACHEQUE'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY DESCRICAO')
    ClientDataSet = CdsUmPortadorForma
    Left = 325
    Top = 65521
  end
  object CdsUmPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 285
    Top = 9
  end
  object SqlTipoDocRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE,'
      '  FLGENGLOBAPARCELA,'
      '  FLGGERANUMDOC,'
      '  FLGDOCFISCAL'
      'FROM'
      '  TIPODOCRECPAG A'
      'WHERE'
      '   A.RECPAG =  :RECPAG AND'
      '   NOT EXISTS (SELECT'
      '                  *'
      '               FROM'
      '                  USUARIOXTPDOCTO B'
      '               WHERE'
      '                  B.IDUSUARIO = :IDUSUARIO AND'
      '                  RECPAG = :RECPAG)'
      '   UNION'
      'SELECT'
      '   CODTIPDOC,'
      '   DESCRICAO,'
      '   DEBCRE,'
      '   FLGENGLOBAPARCELA,'
      '   FLGGERANUMDOC,'
      '   FLGDOCFISCAL'
      'FROM'
      '   TIPODOCRECPAG A'
      'WHERE'
      '   A.RECPAG = :RECPAG AND'
      '   EXISTS (SELECT'
      '              *'
      '           FROM'
      '              USUARIOXTPDOCTO B'
      '           WHERE'
      '              A.CODTIPDOC=B.CODTIPDOC AND'
      '              B.IDUSUARIO=:IDUSUARIO AND'
      '              RECPAG=:RECPAG)'
      'ORDER BY DESCRICAO'
      '')
    ClientDataSet = CdsTipoDocRecPag
    Left = 365
    Top = 65497
  end
  object CdsTipoDocRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 245
    Top = 9
  end
  object SqlFormaRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODFORMA,'
      '  DESCRICAO'
      'FROM'
      '  FORMARECPAG'
      'WHERE'
      '  (RECPAG = :RECPAG) AND'
      '  (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '  DESCRICAO')
    ClientDataSet = CdsFormaRecPag
    Left = 445
    Top = 65529
  end
  object CdsFormaRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 189
    Top = 17
  end
  object SqlModulo: TCMSqlParams
    SQL.Strings = (
      'select idmodulo,nomemodulo from modulo'
      ''
      ' '
      'order by nomemodulo'
      '')
    ClientDataSet = CdsModulo
    Left = 157
    Top = 49
  end
  object CdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 125
    Top = 9
  end
  object MsDoc: TMontaSelect
    Tag = 8
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
      
        'DECODE(DOCUMENTO.COMPLDOCUMENTO, NULL, TO_CHAR(DOCUMENTO.NODOCUM' +
        'ENTO), DOCUMENTO.NODOCUMENTO || '#39' - '#39' || DOCUMENTO.COMPLDOCUMENT' +
        'O)'
      'DOCUMENTO.CODDOCUMENTO')
    Filtro.Strings = (
      'DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO'
      'DOCUMENTO.OPERACAO=LANCTODOCUM.OPERACAO'
      'DOCUMENTO.IDFORCLI=PESSOA.IDPESSOA'
      
        '((DOCUMENTO.STATUS='#39'0'#39') OR  (DOCUMENTO.STATUS='#39'1'#39' ) OR (DOCUMENT' +
        'O.STATUS is  NULL))'
      
        '((DOCUMENTO.OPERACAO='#39'2'#39') OR (DOCUMENTO.OPERACAO='#39'3'#39') OR (DOCUME' +
        'NTO.OPERACAO=14))'
      'LANCTODOCUM.ESTORNO IS NULL')
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
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 405
    Top = 57
  end
  object SqlSelecionados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR, '
      ' PLANO.NOME AS PLANOPREV'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      ''
      'WHERE'
      ''
      '  1 = 2  '
      ' ')
    ClientDataSet = CdsSelecionados
    Left = 397
    Top = 321
  end
  object CdsSelecionados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 273
  end
  object DsSelecionados: TwwDataSource
    DataSet = CdsSelecionados
    Left = 397
    Top = 369
  end
  object SqlDocVazio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR, '
      ' PLANO.NOME AS PLANOPREV'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      ''
      'WHERE'
      ''
      '  1 = 2  '
      ' ')
    Left = 469
    Top = 249
  end
  object CdsPendentes: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDFORCLI'
        DataType = ftFloat
      end
      item
        Name = 'OPERACAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CODTIPDOC'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'NODOCUMENTO'
        DataType = ftFloat
      end
      item
        Name = 'COMPLDOCUMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DATAPROGRAMADA'
        DataType = ftDateTime
      end
      item
        Name = 'DATAVENCTO'
        DataType = ftDateTime
      end
      item
        Name = 'IDMODULO'
        DataType = ftFloat
      end
      item
        Name = 'RECPAG'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'STATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MOECODIGO'
        DataType = ftFloat
      end
      item
        Name = 'PLANO'
        DataType = ftFloat
      end
      item
        Name = 'PLACONTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CODSUBCONTA'
        DataType = ftFloat
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODGRUPOCNAB'
        DataType = ftFloat
      end
      item
        Name = 'NOSSONUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NUMLANCTO'
        DataType = ftFloat
      end
      item
        Name = 'DATALANCTO'
        DataType = ftDateTime
      end
      item
        Name = 'VLRLIQUIDO'
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
        Name = 'DEBCRE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SITUACAO'
        DataType = ftFloat
      end
      item
        Name = 'STATUSVALOR'
        DataType = ftFloat
      end
      item
        Name = 'PLANOPREV'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 333
    Top = 275
    object CdsPendentesIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsPendentesOPERACAO: TStringField
      FieldName = 'OPERACAO'
      FixedChar = True
      Size = 2
    end
    object CdsPendentesCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object CdsPendentesIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object CdsPendentesCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsPendentesNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsPendentesCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsPendentesDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsPendentesDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsPendentesIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object CdsPendentesRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object CdsPendentesNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsPendentesSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object CdsPendentesMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object CdsPendentesPLANO: TFloatField
      FieldName = 'PLANO'
    end
    object CdsPendentesPLACONTA: TStringField
      FieldName = 'PLACONTA'
      FixedChar = True
      Size = 18
    end
    object CdsPendentesCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object CdsPendentesCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object CdsPendentesCODGRUPOCNAB: TFloatField
      FieldName = 'CODGRUPOCNAB'
    end
    object CdsPendentesNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object CdsPendentesNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
    end
    object CdsPendentesDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object CdsPendentesVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
    end
    object CdsPendentesVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsPendentesVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsPendentesDEBCRE: TStringField
      FieldName = 'DEBCRE'
      FixedChar = True
      Size = 1
    end
    object CdsPendentesSITUACAO: TFloatField
      FieldName = 'SITUACAO'
    end
    object CdsPendentesSTATUSVALOR: TFloatField
      FieldName = 'STATUSVALOR'
    end
    object CdsPendentesPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
  end
  object SqlPendentes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  D.IDFORCLI,'
      '  D.OPERACAO,'
      '  D.CODTIPDOC,'
      '  D.IDPESSOA,'
      '  D.CODDOCUMENTO,'
      '  D.NODOCUMENTO,'
      '  D.COMPLDOCUMENTO,'
      '  D.DATAPROGRAMADA,'
      '  D.DATAVENCTO,'
      '  D.IDMODULO,'
      '  D.RECPAG,'
      '  P.NOME,'
      '  D.STATUS,'
      '  D.MOECODIGO,'
      '  D.PLANO,'
      '  D.PLACONTA,'
      '  D.CODSUBCONTA,'
      '  D.CODCENTROCUSTO,'
      '  D.CODGRUPOCNAB,'
      '  D.NOSSONUMERO,'
      '  L.NUMLANCTO,'
      '  L.DATALANCTO,'
      '  L.VLRLIQUIDO,'
      '  L.VALOR,'
      '  L.VALOROUTRAMOEDA,'
      '  L.DEBCRE,'
      '  DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO,'
      '  2 AS STATUSVALOR, '
      ' P.NOME||P.NOME||P.NOME||P.NOME AS PLANOPREV'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  PESSOA P,'
      '  LANCTODOCUM L,'
      '  (select distinct pp.idplanoprev, pp.nome, r.coddocumento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev'
      'union'
      'select pc.idplanoprev, pc.nome, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev) plano'
      ''
      'WHERE'
      ''
      '  1 = 2  '
      ' ')
    ClientDataSet = CdsPendentes
    Left = 336
    Top = 321
  end
  object DsPendentes: TwwDataSource
    DataSet = CdsPendentes
    Left = 333
    Top = 371
  end
  object cdsaux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPLANOPREV'
        DataType = ftFloat
      end
      item
        Name = 'PLANOPREV'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CODDOCUMENTO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 165
    Top = 323
  end
  object sqlaux: TCMSqlParams
    SQL.Strings = (
      ''
      
        'select distinct pp.idplanoprev, pp.nome as planoprev , r.coddocu' +
        'mento'
      'from planprev pp, planprevcontabil pc, rateiodocum r'
      'where pp.idplanoprev = pc.idplanoprevprev and'
      'pc.idplanoprev = r.idplanoprev and'
      'r.coddocumento =:coddocumento'
      'union'
      'select pc.idplanoprev, pc.nome as planoprev, r.coddocumento'
      'from planprevcontabil pc, rateiodocum r'
      'where idplanoprevprev is null and'
      'pc.idplanoprev = r.idplanoprev'
      'and '
      'r.coddocumento=:coddocumento'
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsaux
    Left = 117
    Top = 353
  end
  object CmpBaixa: TCmParamReport
    Caption = 'Seleção de Documentos Para Baixa Manual'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Tipo de Seleção'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Razão Social'
          'Nome Fantasia')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
        Caption = 'Cliente'
        Controle = tcProcuraFC
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
        Caption = 'Contas Caixas X Tipos de Cobrança'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA,'
          '  CODPORTADOR,'
          '  DESCFINAN,'
          '  FLGCHEQUEDIFERIDO,'
          '  FLGCONTROLACHEQUE'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODFORMA,'
          '  DESCRICAO'
          'FROM'
          '  FORMARECPAG'
          'WHERE'
          '   1=2')
        LookupSettings.Chave = 'CODFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODTIPDOC,'
          '  DESCRICAO,'
          '  DEBCRE,'
          '  FLGENGLOBAPARCELA,'
          '  FLGGERANUMDOC,'
          '  FLGDOCFISCAL'
          'FROM'
          '  TIPODOCRECPAG A'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDMODULO, NOMEMODULO'
          'FROM'
          '  MODULO'
          'ORDER BY'
          '  NOMEMODULO')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Descrição'
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
      end
      item
        Caption = 'Documento'
        Controle = tcMontaSelect
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
        MontaSelect = MsDoc
        Width = 0
      end>
    ExibeMensagem = True
    Formheight = 380
    FormWidth = 525
    Left = 253
    Top = 329
  end
  object CmpDadosParaBaixaCAR: TCmParamReport
    Caption = 'Dados Para Baixa de Documentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Contas Caixas X Tipos de Cobranca'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA,'
          '  CODPORTADOR,'
          '  DESCFINAN,'
          '  FLGCHEQUEDIFERIDO,'
          '  FLGCONTROLACHEQUE'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        Required = True
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
        Caption = 'Nº Cheque\Borderô'
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
        MostraComboCompara = False
        Required = True
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
        Caption = 'Data de Recebimento'
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
        MostraComboCompara = False
        Required = True
        TextDefault = '01/01/2001'
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
        Caption = 'Data de Disponibilidade'
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
        MostraComboCompara = False
        Required = False
        TextDefault = '01/01/2001'
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
        Caption = 'Valor total'
        Controle = tcEdit
        TipodeDado = tdReal
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
        MostraComboCompara = False
        Required = False
        TextDefault = '1245,50'
        EditSettings.Color = 13041663
        EditSettings.Readonly = True
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
    Formheight = 206
    FormWidth = 525
    Left = 639
    Top = 321
  end
  object CmpDadosParaBaixaCAP: TCmParamReport
    Caption = 'Dados Para Baixa de Documentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Contas Caixas X Tipos de Cobranca'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  DESCRICAO,'
          '  CODPORTFORMA,'
          '  DMAIS,'
          '  LANCAFINANC,'
          '  PLANO,'
          '  PLACONTA,'
          '  CODPORTADOR,'
          '  DESCFINAN,'
          '  FLGCHEQUEDIFERIDO,'
          '  FLGCONTROLACHEQUE'
          'FROM'
          '  PORTADORFORMA'
          'WHERE'
          '  1=2')
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        Required = True
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
        Caption = 'Nº Cheque\Borderô'
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
        MostraComboCompara = False
        Required = True
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
        Caption = 'Data de Pagamento'
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
        MostraComboCompara = False
        Required = True
        TextDefault = '01/01/2001'
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
        Caption = 'Valor total'
        Controle = tcEdit
        TipodeDado = tdReal
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
        MostraComboCompara = False
        Required = False
        TextDefault = '1245,50'
        EditSettings.Color = 13041663
        EditSettings.Readonly = True
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
    Formheight = 206
    FormWidth = 500
    Left = 640
    Top = 365
  end
  object SqlPortadorForma: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO,'
      '  CODPORTFORMA,'
      '  DMAIS,'
      '  LANCAFINANC,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODPORTADOR,'
      '  DESCFINAN,'
      '  FLGCHEQUEDIFERIDO,'
      '  FLGCONTROLACHEQUE'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  RECPAG   = :RECPAG   AND'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY DESCRICAO')
    ClientDataSet = CdsUmPortadorForma
    Left = 269
    Top = 249
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 159
    Top = 197
  end
  object dsPlanoPrev: TDataSource
    DataSet = CdsPlanoPrev
    Left = 145
    Top = 265
  end
  object sqlplanoprev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '                             IDPLANOPREV, '
      '                             NOME,'
      '                             '#39'N'#39' AS MARCA '
      '                             FROM'
      '                            PLANPREVCONTABIL'
      '                            ORDER BY'
      '                            NOME')
    ClientDataSet = CdsPlanoPrev
    Left = 245
    Top = 81
  end
end
