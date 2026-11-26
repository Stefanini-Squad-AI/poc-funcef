inherited FrmPessoaMT: TFrmPessoaMT
  Left = 408
  Top = 226
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Banco'
  ClientHeight = 748
  ClientWidth = 1127
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object ToolTelContato: TToolWindow97 [0]
    Left = 388
    Top = 79
    Caption = 'Telefones Associados ao Contato'
    CloseButton = False
    ClientAreaHeight = 196
    ClientAreaWidth = 201
    DockableTo = []
    Resizable = False
    ShowCaption = False
    TabOrder = 3
    UseLastDock = False
    Visible = False
    OnVisibleChanged = ToolTelContatoVisibleChanged
    object LblTelContato: TLabel
      Left = 14
      Top = 68
      Width = 45
      Height = 13
      Caption = 'Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblRamal: TLabel
      Left = 14
      Top = 116
      Width = 36
      Height = 13
      Caption = 'Ramal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtRamal_Padrao: TwwDBEdit
      Left = 15
      Top = 129
      Width = 172
      Height = 21
      DataField = 'RAMAL'
      DataSource = dsTelContato
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblcContato: TCMDBLookupCombo
      Left = 14
      Top = 83
      Width = 172
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'Nome'
        'CARGO'#9'10'#9'Cargo')
      DataField = 'NOME'
      DataSource = dsTelContato
      LookupTable = CdsContato
      LookupField = 'NOME'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 4
      Visible = False
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = dblcContatoCloseUp
    end
    object dblcTelefone: TCMDBLookupCombo
      Left = 14
      Top = 82
      Width = 172
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMERO'#9'10'#9'Número'#9'No')
      DataField = 'NUMERO'
      DataSource = dsTelContato
      LookupTable = CdsTelefone
      LookupField = 'NUMERO'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 5
      Visible = False
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = dblcTelefoneCloseUp
    end
    object GrdTelContato: TwwDBGrid
      Left = 0
      Top = 53
      Width = 201
      Height = 113
      Selected.Strings = (
        'NOME'#9'20'#9'Contato'
        'RAMAL'#9'5'#9'Ramal')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTelContato
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      Visible = False
      IndicatorColor = icBlack
    end
    object GrdContatoTel: TwwDBGrid
      Left = 0
      Top = 53
      Width = 201
      Height = 113
      Selected.Strings = (
        'NUMERO'#9'10'#9'Telefone'
        'RAMAL'#9'5'#9'Ramal')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTelContato
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      UseTFields = False
      Visible = False
      IndicatorColor = icBlack
    end
    object PnlToolTelContato: TPanel
      Left = 0
      Top = 22
      Width = 201
      Height = 31
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object TbtnExcluiTC: TToolbarButton97
        Left = 52
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Excluir Ramal'
        AllowAllUp = True
        ImageIndex = 2
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnExcluiTCClick
      end
      object TbtnAlteraTC: TToolbarButton97
        Left = 27
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Alterar Ramal'
        AllowAllUp = True
        GroupIndex = 3
        ImageIndex = 1
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnAlteraTCClick
      end
      object TbtnInsereTC: TToolbarButton97
        Left = 2
        Top = 3
        Width = 25
        Height = 25
        Hint = 'Inserir Ramal'
        AllowAllUp = True
        GroupIndex = 3
        ImageIndex = 0
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnInsereTCClick
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 166
      Width = 201
      Height = 30
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object TbtnSairTC: TToolbarButton97
        Left = 174
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Fechar'
        AllowAllUp = True
        ImageIndex = 6
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnSairTCClick
      end
      object TbtnCancelaTC: TToolbarButton97
        Left = 145
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Cancelar Ramal'
        AllowAllUp = True
        Enabled = False
        ImageIndex = 5
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnCancelaTCClick
      end
      object TbtnConfirmaTC: TToolbarButton97
        Left = 119
        Top = 2
        Width = 25
        Height = 25
        Hint = 'Confirmar Ramal'
        AllowAllUp = True
        Enabled = False
        ImageIndex = 4
        Images = ImlPadrao
        ParentShowHint = False
        ShowHint = True
        OnClick = TbtnConfirmaTCClick
      end
    end
    object pnlCaptionTelContato: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 22
      Align = alTop
      Alignment = taLeftJustify
      Caption = 'Telefones Associados ao Contato'
      Color = clInactiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  inherited pnlFundo: TPanel
    Width = 1127
    Height = 662
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 106
      Width = 1125
      Height = 555
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 1027
        Height = 496
        ActivePage = tbsDocumento
        object tbsDocumento: TTabSheet [0]
          Caption = 'Documentação'
          object PgCtrlPesFisica_Padrao: TPageControl
            Left = 0
            Top = 0
            Width = 1019
            Height = 468
            ActivePage = TbsDocumentos_Padrao
            Align = alClient
            TabOrder = 0
            Visible = False
            object TbsDocumentos_Padrao: TTabSheet
              Caption = 'Documento(s)'
            end
            object TbsDadosPessoais_Padrao: TTabSheet
              Caption = 'Dados Pessoais'
              object BvlDadosNasc_Padrao: TBevel
                Left = 165
                Top = 92
                Width = 131
                Height = 93
                Shape = bsFrame
              end
              object BvlNatur_Padrao: TBevel
                Left = 6
                Top = 92
                Width = 154
                Height = 93
                Shape = bsFrame
              end
              object LblNomePai_Padrao: TLabel
                Left = 6
                Top = 3
                Width = 73
                Height = 13
                Caption = 'Nome do Pai'
              end
              object LblNomeMae_Padrao: TLabel
                Left = 6
                Top = 44
                Width = 79
                Height = 13
                Caption = 'Nome da Mãe'
              end
              object LblNaturalidade_Padrao: TLabel
                Left = 16
                Top = 99
                Width = 73
                Height = 13
                Caption = 'Naturalidade'
              end
              object LblNacionalidade_Padrao: TLabel
                Left = 16
                Top = 140
                Width = 82
                Height = 13
                Caption = 'Nacionalidade'
              end
              object LblDataNasc_Padrao: TLabel
                Left = 172
                Top = 100
                Width = 116
                Height = 13
                Caption = 'Data de Nascimento'
              end
              object LblTipoSang_Padrao: TLabel
                Left = 304
                Top = 158
                Width = 63
                Height = 26
                Caption = 'Tipo Sanguíneo'
                WordWrap = True
              end
              object LbVlrlINSS_Padrao: TLabel
                Left = 468
                Top = 4
                Width = 63
                Height = 13
                Caption = 'Valor INSS'
              end
              object LblvlrPensao_Padrao: TLabel
                Left = 468
                Top = 44
                Width = 76
                Height = 13
                Caption = 'Valor Pensão'
              end
              object CkbIsentoIrrf_Padrao: TDBCheckBox
                Left = 304
                Top = 138
                Width = 105
                Height = 17
                Caption = 'Isento de IRRF'
                DataField = 'FLGISENTOIRRF'
                DataSource = dsPessoaFisica
                TabOrder = 3
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object dbrgrpSexo_Padrao: TDBRadioGroup
                Left = 300
                Top = 86
                Width = 114
                Height = 47
                Caption = 'Sexo'
                DataField = 'SEXO'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Masculino'
                  'Feminino')
                TabOrder = 2
                TabStop = True
                Values.Strings = (
                  'M'
                  'F')
                Visible = False
              end
              object dbrgrpEstCivil_Padrao: TDBRadioGroup
                Left = 234
                Top = 8
                Width = 230
                Height = 76
                Caption = 'Estado Civil'
                Columns = 2
                DataField = 'ESTCIVIL'
                DataSource = dsPessoaFisica
                Items.Strings = (
                  'Solteiro(a)'
                  'Casado(a)'
                  'Divorciado(a)'
                  'Viúvo(a)'
                  'Desquitado'
                  'Separado Judic.'
                  'Outros')
                TabOrder = 8
                TabStop = True
                Values.Strings = (
                  'S'
                  'C'
                  'D'
                  'V'
                  'E'
                  'J'
                  'O')
              end
              object EdtNomePai_Padrao: TwwDBEdit
                Left = 6
                Top = 20
                Width = 224
                Height = 21
                DataField = 'NOMEPAI'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object EdtNomeMae_Padrao: TwwDBEdit
                Left = 6
                Top = 61
                Width = 224
                Height = 21
                DataField = 'NOMEMAE'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object CmbNaturalidade_Padrao: TwwDBLookupCombo
                Left = 16
                Top = 116
                Width = 135
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMEESTADO'#9'30'#9'Natural de')
                DataField = 'CODESTADO'
                DataSource = dsPessoaFisica
                LookupTable = CdsNaturalidade
                LookupField = 'CODESTADO'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 4
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object DbedNacionalidade_Padrao: TwwDBEdit
                Left = 16
                Top = 157
                Width = 135
                Height = 21
                Color = clSilver
                DataField = 'NOMENACIONALIDADE'
                DataSource = DsNaturalidade
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object EdtTipoSang_Padrao: TwwDBEdit
                Left = 373
                Top = 160
                Width = 37
                Height = 21
                DataField = 'TIPOSANG'
                DataSource = dsPessoaFisica
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object GpNumDepend_Padrao: TGroupBox
                Left = 418
                Top = 86
                Width = 134
                Height = 99
                Caption = ' Nº Dependentes '
                TabOrder = 7
                object LblDepenIr_Padrao: TLabel
                  Left = 11
                  Top = 21
                  Width = 30
                  Height = 13
                  Caption = 'IRRF'
                end
                object LblDepenSal_Padrao: TLabel
                  Left = 11
                  Top = 41
                  Width = 44
                  Height = 26
                  Caption = 'Salário Família'
                  WordWrap = True
                end
                object LblTotalDepende_Padrao: TLabel
                  Left = 11
                  Top = 76
                  Width = 30
                  Height = 13
                  Caption = 'Total'
                end
                object SpinDepenIr_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 17
                  Width = 57
                  Height = 21
                  Increment = 1
                  MaxValue = 100
                  DataField = 'NUMDEPIRRF'
                  DataSource = dsPessoaFisica
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                end
                object SpinDepenSal_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 43
                  Width = 57
                  Height = 21
                  Increment = 1
                  MaxValue = 100
                  DataField = 'NUMDEPSALF'
                  DataSource = dsPessoaFisica
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
                object SpinTotalDepente_Padrao: TwwDBSpinEdit
                  Left = 61
                  Top = 70
                  Width = 57
                  Height = 21
                  Increment = 1
                  MaxValue = 100
                  DataField = 'NUMDEPTOT'
                  DataSource = dsPessoaFisica
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                  UnboundDataType = wwDefault
                end
              end
              object EdtDataNasc_Padrao: TCMDateTimePicker
                Left = 170
                Top = 116
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATANASC'
                DataSource = dsPessoaFisica
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
                TabOrder = 9
              end
              object EdtvlrPensao_Padrao: TDBRealEdit
                Left = 468
                Top = 59
                Width = 85
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 11
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRPENSAO'
                DataSource = dsPessoaFisica
              end
              object EdtlrlINSS_Padrao: TDBRealEdit
                Left = 468
                Top = 20
                Width = 84
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 10
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'VLRINSS'
                DataSource = dsPessoaFisica
              end
            end
          end
          object PnlDocumentos_Padrao: TPanel
            Left = 0
            Top = 0
            Width = 1019
            Height = 468
            Align = alClient
            TabOrder = 1
            object pnlItemsDoc: TPanel
              Left = 317
              Top = 1
              Width = 172
              Height = 466
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              OnResize = pnlItemsDocResize
              object pnlNomeDoc: TPanel
                Left = 0
                Top = 0
                Width = 172
                Height = 21
                Align = alTop
                TabOrder = 0
                object DBText1: TDBText
                  Left = 10
                  Top = 3
                  Width = 150
                  Height = 17
                  DataField = 'NOMEDOCUMENTO'
                  DataSource = dsDocumento
                end
              end
              object pnlOrgao: TPanel
                Left = 0
                Top = 49
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 2
                Visible = False
                object lblPdOrgao: TLabel
                  Left = 10
                  Top = 3
                  Width = 81
                  Height = 13
                  Caption = 'Orgão emissor'
                end
                object EdtOrgaoEmissor: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  DataField = 'ORGAO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlEmissao: TPanel
                Left = 0
                Top = 141
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 3
                Visible = False
                object lblPdEmiss: TLabel
                  Left = 10
                  Top = 3
                  Width = 96
                  Height = 13
                  Caption = 'Data da Emissão'
                end
                object EdtDataEmissao_Padao: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAEMISSAO'
                  DataSource = dsDocumento
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
              object pnlUF: TPanel
                Left = 0
                Top = 95
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 5
                Visible = False
                object lblPdUF: TLabel
                  Left = 10
                  Top = 3
                  Width = 130
                  Height = 13
                  Caption = 'Unidade da Federação'
                end
                object dbcmbEstadoDoc: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 49
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'CODESTADO'#9'4'#9'UF'
                    'NOMEESTADO'#9'15'#9'Estado'
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDESTADO'
                  DataSource = dsDocumento
                  LookupTable = CdsEstado
                  LookupField = 'IDESTADO'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
              object pnlNumDoc: TPanel
                Left = 0
                Top = 21
                Width = 172
                Height = 28
                Align = alTop
                TabOrder = 1
                object edDocNumDocumento: TwwDBEdit
                  Left = 10
                  Top = 3
                  Width = 148
                  Height = 21
                  DataField = 'NUMDOCUMENTO'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnExit = edDocNumDocumentoExit
                end
              end
              object PnlValidade: TPanel
                Left = 0
                Top = 187
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 4
                Visible = False
                object LblDtValidade: TLabel
                  Left = 10
                  Top = 3
                  Width = 99
                  Height = 13
                  Caption = 'Data de Validade'
                end
                object EdtDataValidade_Padrao: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DATAVALIDADE'
                  DataSource = dsDocumento
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
              object pnlDataHabilitacao: TPanel
                Left = 0
                Top = 279
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 6
                Visible = False
                object lblDtHabilitacao: TLabel
                  Left = 10
                  Top = 3
                  Width = 160
                  Height = 13
                  Caption = 'Data da primeira habilitação'
                end
                object cbxDataHabilitacao: TCMDateTimePicker
                  Left = 11
                  Top = 18
                  Width = 150
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  DataField = 'DTPRIMEIRACNH'
                  DataSource = dsDocumento
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
              object pnlCategoria: TPanel
                Left = 0
                Top = 233
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 7
                Visible = False
                object lblCategoria: TLabel
                  Left = 10
                  Top = 3
                  Width = 55
                  Height = 13
                  Caption = 'Categoria'
                end
                object edtCategoria: TwwDBEdit
                  Left = 10
                  Top = 18
                  Width = 148
                  Height = 21
                  DataField = 'CATEGCNH'
                  DataSource = dsDocumento
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                end
              end
              object pnlPais: TPanel
                Left = 0
                Top = 325
                Width = 172
                Height = 46
                Align = alTop
                TabOrder = 8
                Visible = False
                object Label91: TLabel
                  Left = 10
                  Top = 3
                  Width = 27
                  Height = 13
                  Caption = 'País'
                end
                object dbcmdPais: TCMDBLookupCombo
                  Left = 10
                  Top = 18
                  Width = 151
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEPAIS'#9'20'#9'Pais')
                  DataField = 'IDPAIS'
                  DataSource = dsDocumento
                  LookupTable = CdsPais
                  LookupField = 'IDPAIS'
                  Options = [loTitles]
                  Style = csDropDownList
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  ShowMatchText = True
                  OnChange = dbcmbEstadoDocChange
                end
              end
            end
            object pnlFoto: TPanel
              Left = 489
              Top = 1
              Width = 529
              Height = 466
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object BvlImagem: TBevel
                Left = 0
                Top = 0
                Width = 2
                Height = 435
                Align = alLeft
                Shape = bsRightLine
              end
              object PnlAssociaFoto_Padrao: TPanel
                Left = 0
                Top = 435
                Width = 529
                Height = 31
                Align = alBottom
                BevelInner = bvRaised
                BevelOuter = bvLowered
                Ctl3D = True
                ParentCtl3D = False
                TabOrder = 0
                OnResize = PnlAssociaFoto_PadraoResize
                object btnAssociarimgPessoa: TButton
                  Left = 30
                  Top = 3
                  Width = 143
                  Height = 26
                  Caption = 'Associar &foto'
                  TabOrder = 0
                  OnClick = btnAssociarimgPessoaClick
                end
              end
              object SbImagePessoa_Padrao: TScrollBox
                Left = 2
                Top = 0
                Width = 527
                Height = 435
                Align = alClient
                BorderStyle = bsNone
                TabOrder = 1
                object imgPessoa1: TImage
                  Left = 0
                  Top = 0
                  Width = 200
                  Height = 250
                  Stretch = True
                end
                object imgPessoa: TDBImage
                  Left = 272
                  Top = 0
                  Width = 197
                  Height = 185
                  BorderStyle = bsNone
                  Center = False
                  DataField = 'IMAGEM'
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  Visible = False
                end
              end
            end
            object lstDocumentos: TListView
              Left = 1
              Top = 1
              Width = 316
              Height = 466
              Align = alLeft
              Columns = <
                item
                  Caption = 'Documento'
                  Width = 170
                end
                item
                  Caption = 'Número'
                  Width = 140
                end>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ReadOnly = True
              RowSelect = True
              ParentFont = False
              SmallImages = ImlDocumentos
              SortType = stText
              TabOrder = 2
              ViewStyle = vsReport
              OnChange = lstDocumentosChange
              OnDblClick = lstDocumentosDblClick
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Endereços'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 1019
            Height = 468
            Selected.Strings = (
              'NOME'#9'20'#9'Local'
              'LOGRADOURO'#9'20'#9'Logradouro'
              'TIPOEND_PADRAO'#9'20'#9'Tipo de Endereço'
              'NUMERO'#9'8'#9'Número'
              'COMPLEMENTO'#9'10'#9'Complemento'
              'BAIRRO'#9'10'#9'Bairro'
              'CEP'#9'10'#9'CEP'
              'NOMECIDADE'#9'20'#9'Cidade'
              'NOMEESTADO'#9'20'#9'Estado'
              'NOMEPAIS'#9'20'#9'Pais')
            DataSource = dsEndereco
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 1019
            Height = 468
            object lblPdLocal: TLabel
              Left = 14
              Top = 6
              Width = 32
              Height = 13
              Caption = 'Local'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdLogradouro: TLabel
              Left = 14
              Top = 46
              Width = 65
              Height = 13
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdComplemento: TLabel
              Left = 14
              Top = 87
              Width = 76
              Height = 13
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdCidade: TLabel
              Left = 14
              Top = 129
              Width = 40
              Height = 13
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdEstado: TLabel
              Left = 241
              Top = 129
              Width = 40
              Height = 13
              Caption = 'Estado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdNumero: TLabel
              Left = 402
              Top = 46
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdCEP: TLabel
              Left = 402
              Top = 87
              Width = 37
              Height = 13
              Caption = 'C.E.P.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblBairro: TLabel
              Left = 240
              Top = 87
              Width = 34
              Height = 13
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdPais: TLabel
              Left = 403
              Top = 129
              Width = 25
              Height = 13
              Caption = 'Pais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedNomeEndereco: TDBEdit
              Left = 14
              Top = 19
              Width = 377
              Height = 21
              DataField = 'NOME'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedLogradouro: TDBEdit
              Left = 14
              Top = 60
              Width = 377
              Height = 21
              DataField = 'LOGRADOURO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEDCOMPLEMENTO: TwwDBEdit
              Left = 14
              Top = 100
              Width = 211
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedEstado: TwwDBEdit
              Left = 239
              Top = 148
              Width = 150
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMEESTADO'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 6
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedBairro: TwwDBEdit
              Left = 239
              Top = 100
              Width = 150
              Height = 21
              DataField = 'BAIRRO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBNUMERO: TDBEdit
              Left = 402
              Top = 60
              Width = 70
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbedCEP: TwwDBEdit
              Left = 402
              Top = 100
              Width = 70
              Height = 21
              DataField = 'CEP'
              DataSource = dsEndereco
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              UnboundDataType = wwDefault
              UsePictureMask = False
              WantReturns = False
              WordWrap = False
            end
            object dbedPais: TwwDBEdit
              Left = 403
              Top = 148
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'NOMEPAIS'
              DataSource = dsEndereco
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object grpTipoEnd: TGroupBox
              Left = 822
              Top = 0
              Width = 197
              Height = 468
              Align = alRight
              Caption = 'Tipos'
              TabOrder = 8
              object chkTipoEndereco: TCheckListBox
                Left = 10
                Top = 18
                Width = 119
                Height = 114
                OnClickCheck = chkTipoEnderecoClickCheck
                BorderStyle = bsNone
                Color = clBtnFace
                Ctl3D = True
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Residencial'
                  'Entrega'
                  'Cobrança'
                  'Correspondência')
                ParentCtl3D = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
              end
            end
            object CmpCidades: TCMProcura
              Left = 14
              Top = 144
              Width = 211
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              MostraMensagens = True
              Mensagens.EmBranco = 'Cidade não pode estar em branco'
              Mensagens.NaoExiste = 'Cidade não existe'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              OnValidaDados = CmpCidadesValidaDados
              DataSource = dsEndereco
              DataField = 'IDCIDADES'
              LookupChave = 'IDCIDADES'
              LookupDescricao = 'NOME'
              MontaSelect = MsCidades
              LookupTabela = 'CIDADES'
              DataBaseName = 'BaseDados'
              ReadOnly = True
            end
          end
        end
        object tbsTelefone: TTabSheet
          Caption = 'Telefones'
          object SplContatos_Padrao: TSplitter
            Left = 790
            Top = 0
            Width = 3
            Height = 468
            Cursor = crHSplit
            Align = alRight
          end
          object dbgTelefone: TwwDBGrid
            Left = 0
            Top = 0
            Width = 790
            Height = 468
            Selected.Strings = (
              'NUMERO'#9'10'#9'Número'
              'DDD'#9'5'#9'DDD'
              'DDI'#9'4'#9'DDI'
              'TComercial'#9'3'#9'Com'
              'TParticular'#9'3'#9'Part'
              'TFax'#9'3'#9'Fax'
              'TCelular'#9'3'#9'Cel'
              'TRecado'#9'3'#9'Rec')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsTelefone
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
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
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 790
            Height = 468
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblDDI: TLabel
              Left = 14
              Top = 7
              Width = 23
              Height = 13
              Caption = 'DDI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDDD: TLabel
              Left = 80
              Top = 7
              Width = 28
              Height = 13
              Caption = 'DDD'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNumTelefone: TLabel
              Left = 14
              Top = 52
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEDDDI: TDBEdit
              Left = 14
              Top = 23
              Width = 54
              Height = 21
              DataField = 'DDI'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDDDD: TDBEdit
              Left = 80
              Top = 23
              Width = 54
              Height = 21
              DataField = 'DDD'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEDNUMERO: TwwDBEdit
              Left = 14
              Top = 68
              Width = 121
              Height = 21
              DataField = 'NUMERO'
              DataSource = dsTelefone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object GroupBox4: TGroupBox
              Left = 148
              Top = 6
              Width = 122
              Height = 128
              Caption = ' Tipo de Telefone '
              TabOrder = 3
              object chkTipoTelefone: TCheckListBox
                Left = 8
                Top = 14
                Width = 92
                Height = 111
                BorderStyle = bsNone
                Color = clBtnFace
                Columns = 1
                Ctl3D = False
                ItemHeight = 22
                Items.Strings = (
                  'Comercial'
                  'Particular'
                  'Fax'
                  'Celular'
                  'Recado')
                ParentCtl3D = False
                Style = lbOwnerDrawFixed
                TabOrder = 0
                OnClick = chkTipoTelefoneClick
              end
            end
            object BtnContatoTel: TBitBtn
              Left = 14
              Top = 102
              Width = 119
              Height = 25
              Hint = 'Associa Contatos Cadastrados ao Telefone'
              Caption = 'Contatos'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = BtnContatoTelClick
              Glyph.Data = {
                B6040000424DB604000000000000360000002800000015000000120000000100
                18000000000080040000C40E0000C40E00000000000000000000000080000080
                00008000008000008000000000FFFF00000000FFFF00000000FFFF000000FFFF
                FFFFFFFF000000FFFFFF000000FFFFFFC0C0C000000000008000000080000080
                00008000008000008000000000FFFF00000000FFFF00000000FFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C000000000008000000080000080
                FFFF00FFFF00FFFF00000000000000FFFF00FFFF00000000000000FFFF00FFFF
                00FFFFFF000000FFFFFF000000FFFFFFC0C0C000000000008000000080000000
                FFFF00FFFF00000000FFFF00FFFF00000000000000FFFF00000000FFFF000000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C000000000008000000080000080
                000000000000FFFF00FFFF00000000C6C3C6FFFFFF000000000000000000FFFF
                FFFFFFFF000000FFFFFF000000FFFFFFC0C0C000000000008000000080000080
                000080000000000000000000C6C3C6FFFFFFC6C3C600000000FFFF000000FFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C000000000008000000080000080
                000080000080000000C6C3C6FFFFFF000000000000000000000000000000FFFF
                FFFFFFFF000000FFFFFF000000FFFFFFC0C0C000000000008000000080000080
                000080000000000000000000C6C3C6FFFFFFC6C3C6FFFFFFC6C3C60000000000
                00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000008000008000000080000080
                000080000000000000000000FFFFFFC6C3C6FFFFFFC6C3C60000000000000000
                80000000FFFFFFFFFFFFFFFFFF00000000008000008000008000000080000080
                000000000000000000000000C6C3C6FFFFFFC6C3C6FFFFFFC6C3C60000000000
                80000080000000FFFFFF00000000008000008000008000008000000080000000
                000000000000000000C6C3C6FFFFFFC6C3C6FFFFFFC6C3C6FFFFFFC6C3C60000
                00000080000000FFFFFF00000000008000008000008000008000000080000000
                000000000000000000000000000000FFFFFFC6C3C6FF0000C6C3C60000000000
                8000008000008000000000008000008000008000008000008000000080000000
                000000000000000000000000FFFFFFC6C3C6FFFFFF0000000000000000800000
                8000008000008000008000008000008000008000008000008000000080000000
                000000000000000000848284C6C3C6FFFFFFC6C3C6FFFFFF0000000000800000
                8000008000008000008000008000008000008000008000008000000080000000
                000000000000000000000000000000848284FFFFFF0000000000800000800000
                8000008000008000008000008000008000008000008000008000000080000080
                0000000000000000000000000000000000000000000000000000000000800000
                8000008000008000008000008000008000008000008000008000000080000080
                0000800000000000000000000000000000000000000000000000800000800000
                8000008000008000008000008000008000008000008000008000000080000080
                0000800000800000800000800000800000800000800000800000800000800000
                8000008000008000008000008000008000008000008000008000}
            end
          end
          object PnlContatol_Padrao: TPanel
            Left = 793
            Top = 0
            Width = 226
            Height = 468
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object LblContatos_Padrao: TLabel
              Left = 0
              Top = 0
              Width = 51
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Contatos'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object GrdExibeContatos_Padrao: TwwDBGrid
              Left = 0
              Top = 13
              Width = 226
              Height = 331
              Selected.Strings = (
                'NOME'#9'20'#9'Contato'
                'RAMAL'#9'5'#9'Ramal')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsTelContato
              KeyOptions = []
              Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
              ParentShowHint = False
              ReadOnly = True
              ShowHint = False
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
            end
          end
        end
        object tbsContato: TTabSheet
          Caption = 'Contatos'
          object SplTelefones_Padrao: TSplitter
            Left = 817
            Top = 0
            Width = 3
            Height = 468
            Cursor = crHSplit
            Align = alRight
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 817
            Height = 468
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object mnbm: TLabel
              Left = 7
              Top = 97
              Width = 34
              Height = 13
              Caption = 'Cargo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdeMail: TLabel
              Left = 7
              Top = 51
              Width = 35
              Height = 13
              Caption = 'E-mail'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdNome: TLabel
              Left = 7
              Top = 6
              Width = 33
              Height = 13
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblPdSetor: TLabel
              Left = 185
              Top = 97
              Width = 31
              Height = 13
              Caption = 'Setor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblNasc: TLabel
              Left = 185
              Top = 51
              Width = 67
              Height = 13
              Caption = 'Nascimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblObs: TLabel
              Left = 310
              Top = 5
              Width = 69
              Height = 13
              Caption = 'Observação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedcontatoemail: TDBEdit
              Left = 7
              Top = 65
              Width = 173
              Height = 21
              DataField = 'EMAIL'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object EdtCargo_Padrao: TDBEdit
              Left = 7
              Top = 112
              Width = 173
              Height = 21
              DataField = 'CARGO'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object EdtSetor_Padrao: TDBEdit
              Left = 185
              Top = 112
              Width = 121
              Height = 21
              DataField = 'SETOR'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object DbmObs_Padrao: TDBMemo
              Left = 310
              Top = 19
              Width = 172
              Height = 115
              DataField = 'OBS'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object dbedContatoNome: TDBEdit
              Left = 7
              Top = 20
              Width = 173
              Height = 21
              DataField = 'NOME'
              DataSource = dsContato
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object EdtDataNascimento_Padrao: TCMDateTimePicker
              Left = 186
              Top = 66
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'NASCIMENTO'
              DataSource = dsContato
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
            object BtnTelefones: TBitBtn
              Left = 188
              Top = 17
              Width = 119
              Height = 25
              Hint = 'Associa Telefones Cadastrados Ao Contato'
              Caption = 'Telefones'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnClick = BtnTelefonesClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888000000000008888878888888880888887FFFFFFFF80008887F666666F80
                110887FFFFFFFF01911087F666666F09191087FFFFFFFF80911087F66FFFFF80
                990887FFFF00FF09910887F6F0110099108887FF09999991088887FF09999910
                8888877770999008888888888800088888888888888888888888}
            end
          end
          object dbgContato: TwwDBGrid
            Left = 0
            Top = 0
            Width = 817
            Height = 468
            Selected.Strings = (
              'NOME'#9'25'#9'Nome'
              'CARGO'#9'10'#9'Cargo'#9'No'
              'SETOR'#9'10'#9'Setor'#9'No'
              'Telefone'#9'20'#9'Telefone')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsContato
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
            TabOrder = 1
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
          end
          object PnlTelefones_Padrao: TPanel
            Left = 820
            Top = 0
            Width = 199
            Height = 468
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object LblTelefones_Padrao: TLabel
              Left = 0
              Top = 0
              Width = 57
              Height = 13
              Align = alTop
              Alignment = taCenter
              Caption = 'Telefones'
              Color = clGray
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object GrdTelefones_Padrao: TwwDBGrid
              Left = 0
              Top = 13
              Width = 199
              Height = 455
              Selected.Strings = (
                'NUMERO'#9'10'#9'Telefone'
                'RAMAL'#9'5'#9'Ramal')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsTelContato
              KeyOptions = []
              Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
              ParentShowHint = False
              ReadOnly = True
              ShowHint = False
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
            end
          end
        end
        object tbsDadosBancarios: TTabSheet
          Caption = 'Contas Bancárias'
          ImageIndex = 4
          object GrdContaBancaria_Padrao: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1019
            Height = 468
            Selected.Strings = (
              'NOMEBANCO'#9'30'#9'Banco'
              'NUMBANCO'#9'8'#9'Num.'
              'NUMAGENCIA'#9'15'#9'Num. Agência'
              'NOMEAGENCIA'#9'25'#9'Nome Agência'
              'CONTACORRENTE'#9'15'#9'Conta'
              'TIPOCONTA'#9'1'#9'Tipo'
              'FLGCONTAPREF'#9'4'#9'Pref.'
              'FLGCONTAINATIVA'#9'8'#9'Inativa')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsContaBancaria
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
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
          object PnlDadosBancarios_Padrao: TPanel
            Left = 0
            Top = 0
            Width = 1019
            Height = 468
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label14: TLabel
              Left = 10
              Top = 6
              Width = 37
              Height = 13
              Caption = 'Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 11
              Top = 93
              Width = 47
              Height = 13
              Caption = 'Agência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object BtnBuscaAgencia: TSpeedButton
              Left = 108
              Top = 106
              Width = 25
              Height = 23
              Glyph.Data = {
                42010000424D4201000000000000760000002800000011000000110000000100
                040000000000CC00000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
                D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
                0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
                000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
                8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
                0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
                DDDDD0000000}
              OnClick = BtnBuscaAgenciaClick
            end
            object Label9: TLabel
              Left = 138
              Top = 93
              Width = 44
              Height = 13
              Caption = 'Número'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkBanco: TwwDBLookupCombo
              Left = 10
              Top = 21
              Width = 252
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'RAZAOSOCIAL'#9'60'#9'RAZAOSOCIAL')
              DataField = 'IDBANCO'
              DataSource = DsContaBancaria
              LookupTable = CdsBanco
              LookupField = 'IDPESSOA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblkBancoCloseUp
            end
            object DbeAgencia: TwwDBEdit
              Left = 11
              Top = 108
              Width = 95
              Height = 21
              DataField = 'NUMAGENCIA'
              DataSource = DsContaBancaria
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedConta: TwwDBEdit
              Left = 138
              Top = 108
              Width = 124
              Height = 21
              DataField = 'CONTACORRENTE'
              DataSource = DsContaBancaria
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnEnter = dbedContaEnter
            end
            object RgTipoConta: TDBRadioGroup
              Left = 10
              Top = 47
              Width = 253
              Height = 43
              Caption = ' Tipo Conta '
              Columns = 3
              DataField = 'TIPOCONTA'
              DataSource = DsContaBancaria
              Items.Strings = (
                '&Corrente'
                '&Salário'
                '&Poupança')
              TabOrder = 1
              Values.Strings = (
                '1'
                '2'
                '3')
              OnClick = RgTipoContaClick
            end
            object ChbContaPref_Padrao: TDBCheckBox
              Left = 13
              Top = 140
              Width = 252
              Height = 17
              Caption = 'Conta preferencial para movimentação'
              DataField = 'FLGCONTAPREF'
              DataSource = DsContaBancaria
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chb_ContaInativa: TDBCheckBox
              Left = 13
              Top = 164
              Width = 164
              Height = 17
              Caption = 'Conta Inativa'
              DataField = 'FLGCONTAINATIVA'
              DataSource = DsContaBancaria
              TabOrder = 5
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1117
        inherited tb97BotoesDetalhe: TToolbar97
          DockableTo = [dpTop]
        end
        object tb97TituloDetalhe: TToolbar97
          Left = 79
          Top = 0
          Caption = 'tb97TituloDetalhe'
          DockPos = 79
          TabOrder = 1
          object dbedPaiDetalhe: TwwDBEdit
            Left = 0
            Top = 1
            Width = 300
            Height = 22
            BorderStyle = bsNone
            Color = clGray
            Ctl3D = False
            DataField = 'NOME'
            DataSource = dsEndereco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 1031
        Height = 496
        inherited tb97Detalhe: TToolbar97
          Visible = False
          inherited bbtnOkDet: TBitBtn
            TabOrder = 1
          end
          inherited bbtnCancelarDet: TBitBtn
            TabOrder = 0
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1125
      Height = 105
      BevelOuter = bvRaised
      ParentShowHint = False
      object lblNome: TLabel
        Left = 152
        Top = 8
        Width = 85
        Height = 13
        Caption = 'Nome Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDocumento: TLabel
        Left = 16
        Top = 8
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LabelRAZAOSOCIAL: TLabel
        Left = 16
        Top = 54
        Width = 76
        Height = 13
        Caption = 'Razão Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEMail: TLabel
        Left = 452
        Top = 8
        Width = 35
        Height = 13
        Caption = 'E-mail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPdGrupo: TLabel
        Left = 455
        Top = 54
        Width = 35
        Height = 13
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LblHomePage_Padrao: TLabel
        Left = 586
        Top = 8
        Width = 66
        Height = 13
        Caption = 'Home Page'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMsg: TLabel
        Left = 779
        Top = 20
        Width = 19
        Height = 13
        Caption = 'xxx'
        Color = 10395294
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object dbedNomeFantasia: TDBEdit
        Left = 152
        Top = 23
        Width = 289
        Height = 21
        Ctl3D = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnExit = dbedNomeFantasiaExit
      end
      object dbedDocumento: TwwDBEdit
        Left = 16
        Top = 23
        Width = 129
        Height = 21
        DataField = 'NUMDOCUMENTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedDocumentoExit
      end
      object dbedRazaoSocial: TDBEdit
        Left = 16
        Top = 72
        Width = 430
        Height = 21
        DataField = 'RAZAOSOCIAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object dbedemail: TwwDBEdit
        Left = 452
        Top = 23
        Width = 131
        Height = 21
        CharCase = ecLowerCase
        DataField = 'EMAIL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbeHomePage_Padrao: TwwDBEdit
        Left = 586
        Top = 23
        Width = 189
        Height = 21
        CharCase = ecLowerCase
        DataField = 'HOMEPAGE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object CmpGrupo: TCMProcura
        Left = 454
        Top = 69
        Width = 323
        Height = 27
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MostraMensagens = True
        Mensagens.EmBranco = 'Grupo não pode estar em branco'
        Mensagens.NaoExiste = 'Grupo não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        DataSource = ds
        DataField = 'IDGRUPO'
        LookupChave = 'IDPESSOA'
        LookupDescricao = 'RAZAOSOCIAL'
        MontaSelect = MSGrupo
        LookupTabela = 'PESSOA'
        DataBaseName = 'BaseDados'
        ReadOnly = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1127
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
      object sbtnFisJur: TToolbarButton97
        Left = 240
        Top = 0
        Width = 96
        Height = 41
        AllowAllUp = True
        DropdownCombo = True
        Caption = 'Pessoa &Jurídica'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333FFF33F333FF3F330E0330FFFCCFCC33777FF7F3377F7730EEE030FFFC
          CFCC377777F7F33773770EEE0000FFFFFCCF777777773F33377FEEE0BFBF0FFF
          FCCF7777333373F337730E0BFBFBF0FFCCFF77733333373F77F330BFBFBFBF0F
          CCFF37F333333F7F773330FBFBFB0B0FFFFF37F3F33F737FFFFF30B0BF0FB000
          000037F73F73F777777730FB0BF0FB0FFFFF373F73F73F7F333F330030BF0F0F
          FF993F77373F737F3377CC33330BF00FFF9977FFF373F77F3F77CC993330009F
          99FF7777F337777F77F333993330F99F99FF3F77FF37F773773F993CC330FFF9
          9F9977F77F37F3377F77993CC330FFF99F997737733733377377}
        ImageIndex = 11
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        Spacing = 0
        Visible = False
        OnClick = sbtnFisJurClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 336
        Top = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 709
    Width = 1127
    inherited tb97Fundo: TToolbar97
      Left = 610
      DockPos = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
      DockPos = 441
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 502
    Top = 3
    TargetsData = (
      1
      4
      (
        ''
        'Items'
        0)
      (
        ''
        'Hints'
        0)
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 60
    Top = 493
  end
  inherited ImlPadrao: TImageList
    Left = 467
    Top = 3
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000FFFF000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000000000FFFF00000000000000000000FFFF
      0000FFFF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF00000000
      000000000000FFFF0000FFFF00000000000000000000FFFF0000FFFF0000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      0000FFFF000000000000FFFF0000FFFF000000000000FFFF000000000000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF000000000000FFFF
      0000FFFF00000000000000000000FFFF000000000000FFFF000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFF0000FFFF000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      000000000000C6C6C600FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C6000000000000FFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600FFFFFF00C6C6C6000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600FF000000C6C6C6000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600FF000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000084000000FF00000084000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000840000008400000084000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      0000848400008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      84000000000000000000000000000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000848484008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      0000000000000000000000000000000000000000000084848400FFFF00008484
      0000848400000000000000000000848400008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0084848400000000008484840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      00008400000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000840000000000000000000000000000000000000084848400FFFF00008484
      0000FFFFFF00FFFFFF00FFFFFF00000000008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400840000008400
      0000840000008400000084848400FFFFFF008484840084000000840000008400
      00008400000000000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084840000848400008484
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000000000000000000000000000FFFF0000FFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000848400008484
      000084840000848400000000000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF000000000000000000000000008484840000FFFF00000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00000000008484
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00000084000000FF00FFFFFF00FFFFFF00FFFFFF000000FF00000084000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000840000008400000084000000FFFFFF000000000084000000840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF000000000084840000FFFFFF00FFFFFF00FFFFFF000000
      000084840000848400000000000000000000848484000000FF000000FF000000
      84000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      84000000FF0000008400000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00848484000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      000084000000840000008400000000000000FFFFFF00FFFFFF00840000008400
      00008400000084000000000000000000000084848400FFFF0000848400008484
      0000FFFFFF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF000000
      000084840000848400000000000000000000848484000000FF00000084000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF00000084000000FF00000000000000000084848400FFFFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FF000000840000008400
      0000FFFFFF00FFFFFF00840000008400000000000000FFFFFF00FFFFFF008400
      0000840000008400000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000FFFFFF00FFFF
      FF008484000000000000000000000000000000000000848484000000FF000000
      840084848400FFFFFF000000FF00000084000000FF00FFFFFF00848484000000
      84000000FF000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000000000000000008484840000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      0000FFFFFF00FFFFFF00000000008400000000000000FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000084848400FFFF00008484
      0000848400008484000084840000848400008484000084840000848400008484
      00008484000000000000000000000000000000000000848484000000FF000000
      FF00000084000000FF00000084000000FF00000084000000FF00000084000000
      FF00000084000000000000000000000000000000000084848400FFFFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000084848400FF0000008400
      000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008400
      000084000000000000000000000000000000000000000000000084848400FFFF
      0000FFFF00008484000084840000848400008484000084840000848400008484
      0000000000000000000000000000000000000000000000000000848484000000
      FF000000FF00000084000000FF00000084000000FF00000084000000FF000000
      840000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000084848400FF00
      0000FF00000084000000FFFFFF00FFFFFF00FFFFFF0084000000840000008400
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      8400848484000000FF000000FF000000FF000000FF000000FF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484
      8400000000000000000000000000000000000000000000000000000000008484
      840084848400FF000000FF000000FF000000FF000000FF000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000FFFF0000FFFF008484840084848400000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF00FFFFFF00000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000000000000000000000000000000000000000840000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000084000000
      8400000084000000840000008400FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000840000008400000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      000000FFFF0000FFFF000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000000084000000FF000000
      FF000000FF000000FF000000FF0000008400FFFFFF00FFFFFF00FF000000FFFF
      FF00000000000000000000000000000000000000840000008400000084000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000FFFF0000FFFF0000FFFF008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF00000000000000000084848400FFFF
      FF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000008400FF000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000008400000084000000
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF000000000000000000000000000000000000FFFF0000FF
      FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFFFF000000
      0000FFFFFF008484840084848400000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF00FF00
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000084000000
      0000FFFF000000000000FFFF0000000000000000000084840000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000FFFFFF00FFFFFF000000FF000000FF0000008400FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000FFFFFF00FFFF
      FF00FFFFFF0084848400848484000000000000000000000000000000000000FF
      FF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF00FFFF
      FF00FFFFFF00000000000000FF000000FF0000008400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840084848400000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000FFFFFF008484
      840084848400000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      840000FFFF0000FFFF0000000000000000000000000000000000000000000000
      000084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF000000FF0000000000FFFF
      FF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFFFF00FFFFFF008484
      840084848400000000000000000000000000000000000000000000000000FFFF
      000000000000FFFF000000000000FFFF00000000000000000000848484000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF00000000000000000000FFFF00848484008484840084848400000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000084008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000FFFF00000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00848484008484
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFE000E007FFFFFFFF0000E0070001
      FFFF0000E00F0005FFFF0000F03F0005FFFF8000F81F0005FFFFC000F00F0005
      E0078000F00F0005F00F8020E00F0005F81F0031E0070005FC3F0011E00F0005
      FE7F003BE01F0005FFFF007FE01F0003FFFF007FE03FFF07FFFF00FFE01FFF8F
      FFFF007FF03FFF8FFFFF80FFFFFFFFDFFFFFFFFFFFFFFFFFF83FF83FF83FF83F
      E00FE00FE00FE00FC007C007C007C00786038003800380038103800380038003
      0081000100010001004100010001008102210001000100810211000100010101
      001100010001008180038003800382838003800380038023C007C007C007C007
      E00FE00FE00FE00FF83FF83FF83FF83FFEFFFF1FFFFFFF9FBC3DFC0FFF9FFE1F
      CC33F00FFE1FF81FC003E00FF81FE00FC007E007E00FE00FC00FF007E00F6007
      C007C003C0073007C003C001800710030000C00000038001C003E0012001C500
      E001E0071000CA81E003F0030401D507C003F0012007CA9FCC33F803801FD53F
      BEFDFC0FC1FFEA7FFEFFFE3FFFFFF0FF00000000000000000000000000000000
      000000000000}
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 357
    Top = 59
  end
  inherited Cds: TCMClientDataSet
    Left = 28
    Top = 487
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Pessoa'
    Left = 572
    Top = 3
  end
  inherited CmeDetalhe: TCmEventosCadastro
    DataSource = dsEndereco
    Left = 424
    Top = 3
  end
  inherited dsDet: TwwDataSource
    Left = 378
    Top = 65531
  end
  object dsSubTipo: TwwDataSource
    AutoEdit = False
    DataSet = CdsSubTipo
    Left = 668
    Top = 317
  end
  object dsPessoaFisica: TwwDataSource
    AutoEdit = False
    DataSet = CdsPessoaFisica
    Left = 529
    Top = 189
  end
  object ImlDocumentos: TImageList
    Left = 761
    Top = 215
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      8400000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      8400848484000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001800100000000
      0001000100000000000100010000000000010001000000000001000100000000
      0001000300000000000100000000000000010000000000000001000000000000
      00010000000000000003000000000000F39FF80000000000F01FF80000000000
      F03FFD0500000000FFFFFF8F0000000000000000000000000000000000000000
      000000000000}
  end
  object dsTelefone: TwwDataSource
    AutoEdit = False
    DataSet = CdsTelefone
    OnDataChange = dsTelefoneDataChange
    Left = 553
    Top = 133
  end
  object dsEndereco: TwwDataSource
    AutoEdit = False
    DataSet = CdsEndereco
    OnDataChange = dsEnderecoDataChange
    Left = 617
    Top = 165
  end
  object dsContato: TwwDataSource
    AutoEdit = False
    DataSet = CdsContato
    Left = 575
    Top = 189
  end
  object dsTelContato: TwwDataSource
    DataSet = CdsTelContato
    Left = 487
    Top = 317
  end
  object dsDocumento: TwwDataSource
    DataSet = CdsDocumento
    OnStateChange = dsDocumentoStateChange
    Left = 238
    Top = 360
  end
  object dsEscolhePessoa: TwwDataSource
    DataSet = CdsEscolhePessoa
    Left = 575
    Top = 317
  end
  object dsImagem: TwwDataSource
    DataSet = CdsImagem
    OnDataChange = dsImagemDataChange
    Left = 530
    Top = 317
  end
  object dsImagensDoc: TwwDataSource
    DataSet = CdsImagensDoc
    Left = 623
    Top = 317
  end
  object MSGrupo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Grupo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Razão Social')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 537
    Top = 3
  end
  object DsNaturalidade: TwwDataSource
    DataSet = CdsNaturalidade
    Left = 553
    Top = 429
  end
  object CdsDocumento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 103
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 241
    Top = 287
  end
  object CdsTelefone: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    AfterScroll = CdsTelefoneAfterScroll
    OnCalcFields = CdsTelefoneCalcFields
    Left = 445
    Top = 143
    object CdsTelefoneNUMERO_Padrao: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 10
      FieldName = 'NUMERO'
    end
    object CdsTelefoneDDD_Padrao: TStringField
      DisplayWidth = 5
      FieldName = 'DDD'
      FixedChar = True
      Size = 5
    end
    object CdsTelefoneDDI_Padrao: TStringField
      DisplayWidth = 4
      FieldName = 'DDI'
      FixedChar = True
      Size = 4
    end
    object CdsTelefoneIDTELEFONE_Padrao: TFloatField
      FieldName = 'IDTELEFONE'
      Visible = False
    end
    object CdsTelefoneIDPESSOA_Padrao: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsTelefoneIDENDERECO_Padrao: TFloatField
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object CdsTelefoneTIPO_Padrao: TStringField
      FieldName = 'TIPO'
      Visible = False
      FixedChar = True
      Size = 5
    end
    object CdsTelefoneTIPOTEL_Padrao: TStringField
      DisplayLabel = 'Tipo de Telefone'
      FieldKind = fkCalculated
      FieldName = 'TIPOTEL'
      Size = 60
      Calculated = True
    end
  end
  object CdsContato: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    AfterScroll = CdsContatoAfterScroll
    Left = 436
    Top = 199
  end
  object CdsTelContato: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    AfterInsert = CdsTelContatoAfterInsert
    Left = 484
    Top = 271
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 530
    Top = 271
  end
  object CdsEscolhePessoa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 576
    Top = 271
  end
  object CdsImagensDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 623
    Top = 271
  end
  object CdsSubTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 669
    Top = 271
  end
  object CdsPessoaFisica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 170
    Top = 495
  end
  object CdsCidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 489
    Top = 183
  end
  object CdsNaturalidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 487
    Top = 151
  end
  object CdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 445
    Top = 231
  end
  object MsCidades: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO'
      'ESTADO.NOMEESTADO'
      'PAIS.NOMEPAIS'
      'PAIS.CODINTERNACIONAL'
      'PAIS.NOMENACIONALIDADE')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Cidade'
      'UF'
      'Nome Estado'
      'País'
      'Código Internacional'
      'Nacionalidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO'
      'PAIS')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'CIDADES.IDESTADO=ESTADO.IDESTADO(+)'
      'ESTADO.IDPAIS=PAIS.IDPAIS(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '20'
      '20'
      '3'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 607
    Top = 3
  end
  object DsContaBancaria: TwwDataSource
    DataSet = CdsContaBancaria
    Left = 124
    Top = 372
  end
  object CdsContaBancaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsContaBancariaAfterInsert
    Left = 58
    Top = 434
  end
  object MsBanco: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Banco'
    Colunas.Strings = (
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Banco'
      'Nº da Agência'
      'Nome da Agência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'AGENCIABANCARIA'
      'BANCO')
    CamposChave.Strings = (
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.NOME')
    Filtro.Strings = (
      '')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '15'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 642
    Top = 3
  end
  object CdsBanco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 178
    Top = 434
  end
  object ppmCaixa: TPopupMenu
    Left = 677
    Top = 3
    object N001ContaCorrente1: TMenuItem
      Tag = 1001
      AutoHotkeys = maManual
      Caption = '001 - Conta Corrente'
      OnClick = N001ContaCorrente1Click
    end
    object N002ContaCadernete1: TMenuItem
      Tag = 1002
      AutoHotkeys = maManual
      Caption = '002 - Conta Cadernete'
      OnClick = N001ContaCorrente1Click
    end
    object N003ContadePessoaJurdica1: TMenuItem
      Tag = 1003
      AutoHotkeys = maManual
      Caption = '003 - Conta de Pessoa Jurídica'
      OnClick = N001ContaCorrente1Click
    end
    object N004DepsitoJudicial1: TMenuItem
      Tag = 1004
      AutoHotkeys = maManual
      Caption = '004 - Depósito Judicial'
      OnClick = N001ContaCorrente1Click
    end
    object N635DepsitoJudicialIR1: TMenuItem
      Tag = 1635
      AutoHotkeys = maManual
      Caption = '635 - Depósito Judicial ( IR )'
      OnClick = N001ContaCorrente1Click
    end
    object N013ContadePoupana1: TMenuItem
      Tag = 1013
      AutoHotkeys = maManual
      Caption = '013 - Conta de Poupança'
      OnClick = N001ContaCorrente1Click
    end
    object N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem
      Tag = 1022
      AutoHotkeys = maManual
      Caption = '022 - Conta Cadernete de Poupança Pessoa Jurídica'
      OnClick = N001ContaCorrente1Click
    end
  end
  object CdsEndereco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforeDelete = CdsEnderecoBeforeDelete
    OnCalcFields = CdsEnderecoCalcFields
    Left = 121
    Top = 486
    object CdsEnderecoNOME: TStringField
      DisplayLabel = 'Local'
      DisplayWidth = 20
      FieldName = 'NOME'
      Size = 40
    end
    object CdsEnderecoTIPOLOGRADOURO: TStringField
      DisplayLabel = 'Tipo de Logradouro'
      DisplayWidth = 15
      FieldName = 'TIPOLOGRADOURO'
      Visible = False
      Size = 72
    end
    object CdsEnderecoLOGRADOURO: TStringField
      DisplayLabel = 'Logradouro'
      DisplayWidth = 20
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsEnderecoTIPOEND_PADRAO: TStringField
      DisplayLabel = 'Tipo de Endereço'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'TIPOEND_PADRAO'
      Size = 60
      Calculated = True
    end
    object CdsEnderecoNUMERO: TStringField
      DisplayLabel = 'Número'
      DisplayWidth = 8
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsEnderecoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      DisplayWidth = 10
      FieldName = 'COMPLEMENTO'
    end
    object CdsEnderecoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 10
      FieldName = 'BAIRRO'
    end
    object CdsEnderecoCEP: TStringField
      DisplayWidth = 10
      FieldName = 'CEP'
      Size = 8
    end
    object CdsEnderecoCODMUNICIPIO: TStringField
      DisplayLabel = 'Código do Município'
      DisplayWidth = 20
      FieldName = 'CODMUNICIPIO'
      Visible = False
      Size = 10
    end
    object CdsEnderecoNOMECIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 15
      FieldName = 'NOMECIDADE'
      Size = 50
    end
    object CdsEnderecoNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 15
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object CdsEnderecoCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 10
      FieldName = 'CODESTADO'
      Visible = False
    end
    object CdsEnderecoNOMEPAIS: TStringField
      DisplayLabel = 'Pais'
      DisplayWidth = 10
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object CdsEnderecoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsEnderecoIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
      Visible = False
    end
    object CdsEnderecoIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Visible = False
    end
    object CdsEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Visible = False
    end
    object CdsEnderecoIDTIPO_LOGRADOURO: TFloatField
      FieldName = 'IDTIPO_LOGRADOURO'
      Visible = False
    end
  end
  object CdsImagemOutro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 623
    Top = 365
  end
  object dsImagemOutro: TwwDataSource
    DataSet = CdsImagemOutro
    Left = 623
    Top = 411
  end
  object CdsPais: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 231
  end
end
