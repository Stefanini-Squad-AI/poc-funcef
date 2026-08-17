inherited frmCustomCadRegHon: TfrmCustomCadRegHon
  Left = 221
  Top = 156
  HelpContext = 760021
  Caption = 'Registro de Honorários do Processo'
  ClientHeight = 461
  ClientWidth = 731
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 731
    Height = 375
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 727
      object Label1: TLabel
        Left = 9
        Top = 5
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 9
        Top = 56
        Width = 118
        Height = 13
        Caption = 'Data do Ajuizamento'
      end
      object dbedNumero: TDBEdit
        Left = 9
        Top = 20
        Width = 120
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NUMPROCTRAB'
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
      object dbedDataAju: TCMDateTimePicker
        Left = 9
        Top = 71
        Width = 120
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clGray
        ButtonStyle = cbsCustom
        DataField = 'DATAJUIZO'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 137
        Top = 56
        Width = 118
        Height = 17
        Caption = 'Data da Notificação'
        TabOrder = 2
      end
      object dbedDataNot: TCMDateTimePicker
        Left = 137
        Top = 71
        Width = 120
        Height = 21
        TabStop = False
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clGray
        ButtonStyle = cbsCustom
        DataField = 'DATANOTIF'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 100
      Width = 727
      Height = 273
      Tabs.Strings = (
        'Honorários Pagos'
        'Contabilização e Contas a Pagar')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 629
        Height = 214
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 621
            Height = 186
            Selected.Strings = (
              'DATAPAGTOHONOR'#9'10'#9'Data Pagto/Prev'
              'NOME'#9'46'#9'Favorecido'
              'VALORHONOR'#9'12'#9'    Valor'
              'INDHONOR'#9'10'#9'0/Nada=Valor, 1=%'
              'FLGPROVISAO'#9'10'#9'0=Pagto, 1=Prov')
            Font.Style = []
            Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 621
            Height = 186
            OnEnter = pnlControlesDetEnter
            object Label5: TLabel
              Left = 114
              Top = 4
              Width = 113
              Height = 13
              Caption = 'Data do Pagamento'
            end
            object Label7: TLabel
              Left = 114
              Top = 47
              Width = 64
              Height = 13
              Caption = 'Favorecido'
            end
            object Label8: TLabel
              Left = 114
              Top = 94
              Width = 107
              Height = 13
              Caption = 'Valor do Honorário'
            end
            object lblDataPrev: TLabel
              Left = 228
              Top = 21
              Width = 152
              Height = 13
              Caption = '(Pode ser apenas uma previsão)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object dtPagamento: TCMDateTimePicker
              Left = 114
              Top = 19
              Width = 113
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPAGTOHONOR'
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
              TabOrder = 0
            end
            object cbxSucumbencia: TCheckBox
              Left = 495
              Top = 16
              Width = 97
              Height = 17
              Hint = 'Se Marcado, Habilitará o Advogado da Contraparte Como Favorecido'
              Caption = 'Sucumbência'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = cbxSucumbenciaClick
            end
            object dblckFavor: TwwDBLookupCombo
              Left = 114
              Top = 62
              Width = 478
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME')
              DataField = 'IDFORNSERV'
              DataSource = dsDet
              LookupTable = CdsAdvog
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dbedValHon: TDBRealEdit
              Left = 114
              Top = 109
              Width = 109
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORHONOR'
              DataSource = dsDet
            end
            object dbrgIndHonor: TDBRadioGroup
              Left = 272
              Top = 94
              Width = 320
              Height = 36
              Caption = 'Valor Informado Ao Lado Refere-se a'
              Columns = 2
              DataField = 'INDHONOR'
              DataSource = dsDet
              Items.Strings = (
                'Valor Mesmo'
                '% s/ Valor Real Abaixo')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1')
              Visible = False
              OnChange = dbrgIndHonorChange
            end
            object redValorTotal: TDBRealEdit
              Left = 476
              Top = 146
              Width = 116
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Enabled = False
              Lines.Strings = (
                '0,00')
              ParentShowHint = False
              ReadOnly = True
              ShowHint = False
              TabOrder = 5
              Visible = False
              WordWrap = False
              IntDigits = 15
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
            object dbrgPagtoProv: TDBRadioGroup
              Left = 114
              Top = 142
              Width = 199
              Height = 36
              Caption = 'Valor Acima Refere-se a'
              Columns = 2
              DataField = 'FLGPROVISAO'
              DataSource = dsDet
              Items.Strings = (
                'Pagamento'
                'Provisão')
              TabOrder = 6
              Values.Strings = (
                '0'
                '1')
              OnChange = dbrgIndHonorChange
            end
          end
        end
        object tbshCAP: TTabSheet
          Caption = 'tbshCAP'
          object gbkTipoDesemb: TGroupBox
            Left = 146
            Top = 12
            Width = 405
            Height = 53
            Caption = 'Tipo de Desembolso (Contabilização e Contas a Pagar)'
            TabOrder = 0
            object dblckTipoDesemb: TwwDBLookupCombo
              Left = 14
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = CdsTipoDesemb
              LookupField = 'CODTIPRECDES'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object gbxContabilizacao: TGroupBox
            Left = 146
            Top = 70
            Width = 405
            Height = 53
            Caption = 'Tipo de Operação (Contabilização)'
            TabOrder = 1
            object dblckTipOper: TwwDBLookupCombo
              Left = 14
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
          object gbxCAP: TGroupBox
            Left = 146
            Top = 128
            Width = 405
            Height = 53
            Caption = 'Tipo de Documento (Contas a Pagar)'
            TabOrder = 2
            object dblckTipoDoc: TwwDBLookupCombo
              Left = 14
              Top = 20
              Width = 376
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = CdsTipoDoc
              LookupField = 'CODTIPDOC'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 719
      end
      inherited Dock974: TDock97
        Left = 633
        Height = 214
      end
    end
  end
  inherited Dock972: TDock97
    Width = 731
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 731
    inherited tb97Fundo: TToolbar97
      Left = 559
      DockPos = 571
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 390
      DockPos = 402
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 677
    Top = 27
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 677
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 408
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+) ')
    Left = 677
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 339
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = CdsDetBeforeEdit
    BeforeDelete = CdsDetBeforeDelete
    Left = 306
    Top = 1
  end
  object CdsVara: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 353
  end
  object CdsAdvog: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 340
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 327
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 313
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 666
    Top = 299
  end
end
