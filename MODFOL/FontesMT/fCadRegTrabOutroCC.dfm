inherited frmCadRegTrabOutroCC: TfrmCadRegTrabOutroCC
  Left = 37
  Top = 92
  HelpContext = 210201
  Caption = 'Registro de Horas Trabalhadas em Outro Setor'
  ClientHeight = 452
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 366
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 717
      Height = 85
      object Label1: TLabel
        Left = 18
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 240
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedMat: TwwDBEdit
        Left = 81
        Top = 6
        Width = 112
        Height = 21
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
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
      object dbedNome: TwwDBEdit
        Left = 277
        Top = 6
        Width = 416
        Height = 21
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edSitFunc: TEdit
        Left = 18
        Top = 30
        Width = 250
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object edCargo: TEdit
        Left = 277
        Top = 30
        Width = 416
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object edCentroCusto: TEdit
        Left = 277
        Top = 55
        Width = 416
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 87
      Width = 717
      Height = 277
      Tabs.Strings = (
        'Horas Trabalhadas')
      inherited pgctrlDetalhe: TPageControl
        Width = 619
        Height = 218
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 611
            Height = 190
            ControlType.Strings = (
              'FLGRATEIO;CheckBox;1;0')
            Selected.Strings = (
              'DATATRAB'#9'18'#9'Data Referência'#9'F'
              'HORASTRAB'#9'19'#9'Horas Trabalhadas'#9'F'
              'CENTROCUSTO'#9'60'#9'Centro de Custo'#9'F'
              'FLGRATEIO'#9'10'#9'Rateia ?'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 611
            Height = 190
            object Label7: TLabel
              Left = 98
              Top = 77
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object dbedNomeCC: TwwDBEdit
              Left = 228
              Top = 90
              Width = 318
              Height = 21
              Color = clGray
              DataField = 'CENTROCUSTO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblcLotac: TwwDBLookupCombo
              Left = 98
              Top = 90
              Width = 112
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'Código'
                'NOME'#9'30'#9'Nome'
                'ATIVO'#9'6'#9'Ativo?'#9'F')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsLotacao
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
              OnChange = dblcLotacChange
            end
            object dbrgRateio: TDBRadioGroup
              Left = 211
              Top = 136
              Width = 185
              Height = 41
              Caption = 'Rateio na Contabilização ?'
              Columns = 2
              DataField = 'FLGRATEIO'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 7
              Values.Strings = (
                '1'
                '0')
            end
            object bbtnEmpresas: TBitBtn
              Left = 61
              Top = 91
              Width = 30
              Height = 20
              Hint = 'Habilita Trabalho para Outra Empresa'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Visible = False
              OnClick = bbtnEmpresasClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333FF3333333333333003333
                3333333333773FF3333333333309003333333333337F773FF333333333099900
                33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
                99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
                33333333337F3F77333333333309003333333333337F77333333333333003333
                3333333333773333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
            end
            object gbxDataServico: TGroupBox
              Left = 153
              Top = 8
              Width = 145
              Height = 49
              Caption = 'Data do Serviço'
              TabOrder = 1
              object dbedDatTrab: TCMDateTimePicker
                Left = 17
                Top = 19
                Width = 112
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATATRAB'
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
            end
            object gbxQtdeHoras: TGroupBox
              Left = 478
              Top = 8
              Width = 108
              Height = 49
              Caption = 'Qtde. Horas'
              TabOrder = 3
              object dbedHoras: TDBRealEdit
                Left = 17
                Top = 19
                Width = 72
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00')
                TabOrder = 0
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fFixed
                Signal = False
                DataField = 'HORASTRAB'
                DataSource = dsDet
              end
            end
            object dbrgPermanente: TDBRadioGroup
              Left = 19
              Top = 8
              Width = 126
              Height = 49
              Hint = 'Sim = O que for informado repete-se todos os meses'
              Caption = 'Permanente ?'
              Columns = 2
              DataField = 'FLGPERMANENTE'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgPermanenteChange
            end
            object dbrgCargaTotal: TDBRadioGroup
              Left = 324
              Top = 8
              Width = 145
              Height = 49
              Hint = 'Sim = Dedicação total no mês ou permanente'
              Caption = 'Carga HoráriaTotal ?'
              Columns = 2
              DataField = 'FLGCARGATOTAL'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              Values.Strings = (
                '1'
                '0')
              OnChange = dbrgCargaTotalChange
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 709
      end
      inherited Dock974: TDock97
        Left = 623
        Height = 218
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
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
    Top = 413
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 550
      DockPos = 562
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 210201
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 381
      DockPos = 393
    end
  end
  object townEmpresas: TToolWindow97 [3]
    Left = 0
    Top = 132
    Caption = 'Habiliatação de Trabalho para Outra Empresa'
    CloseButton = False
    ClientAreaHeight = 87
    ClientAreaWidth = 410
    Resizable = False
    TabOrder = 3
    Visible = False
    object btnOkMudar: TBitBtn
      Left = 195
      Top = 53
      Width = 99
      Height = 30
      Caption = ' &OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkMudarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        777777770022222007777778222222222077778A227722222207778A2FFF7222
        220778A22FFFF722222078A22FFFFF72222078A22FF7FFF7222078A22FF72FFF
        722078A22FF222FF7220778A2222222FF207778A2222222222077778AA222222
        2077777788AAAAA8877777777788888777777777777777777777}
      Spacing = 2
    end
    object btnCancelarMudar: TBitBtn
      Left = 308
      Top = 53
      Width = 99
      Height = 30
      Caption = ' &Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarMudarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object gbxEmpresas: TGroupBox
      Left = 2
      Top = 5
      Width = 405
      Height = 43
      Caption = 'Selecione a Empresa Desejada'
      TabOrder = 2
      object dblcEmpresas: TwwDBLookupCombo
        Left = 6
        Top = 14
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = CdsEmpresa
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 597
    Top = 14
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
    Left = 597
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 664
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'FUNCIONARIO.CODCENTROCUSTO'
      'CC.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Cod. do C. de Custo'
      'Nome do C. de Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'CENTCUST CC')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA'
      'FUNCIONARIO.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      'FUNCIONARIO.IDEMPRESA = CC.IDEMPRESA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '15'
      '40')
    Left = 530
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 664
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 341
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 306
    Top = 1
  end
  object CdsCargo2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 285
  end
  object CdsLotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 272
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 655
    Top = 341
  end
  object CdsEmpresa: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 66
    Top = 337
    Data = {
      720000009619E0BD0100000018000000020002000000030000005100044E4F4D
      450100490000000100055749445448020002003C00084944504553534F410800
      0400000000000100044C43494404000100090800000000055245464552000000
      000000004000000652454645523200000000EABE3741}
  end
  object CdsHorario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 575
    Top = 341
  end
end
