inherited FrmCadConcederBenefInssLote: TFrmCadConcederBenefInssLote
  Left = 36
  Top = 64
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Concessão de Benefício do INSS'
  ClientHeight = 581
  ClientWidth = 1242
  Scaled = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 542
    Width = 1242
    object lbl_listados: TLabel [0]
      Left = 328
      Top = 8
      Width = 68
      Height = 13
      Caption = '## Listados'
    end
    inherited tb97Fundo: TToolbar97
      Left = 667
      ActivateParent = False
      DockPos = 667
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 492
      ActivateParent = False
      DockPos = 492
    end
    object bbtnDesfazer: TBitBtn
      Left = 16
      Top = 0
      Width = 75
      Height = 33
      Caption = 'Desfazer'
      Enabled = False
      TabOrder = 2
      OnClick = bbtnDesfazerClick
    end
    object cb_grava_indiv: TCheckBox
      Left = 104
      Top = 8
      Width = 169
      Height = 17
      Caption = 'Gravação Individual'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 1242
    Height = 495
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 169
      Width = 1240
      Height = 325
      Enabled = False
      Tabs.Strings = (
        'Concessão de Benefícios do INSS'
        'LOG'
        'Impressão')
      object SpeedButton1: TSpeedButton [0]
        Left = 64
        Top = 64
        Width = 23
        Height = 22
      end
      object pnl_impressao: TPanel [1]
        Left = 4
        Top = 55
        Width = 1142
        Height = 266
        Align = alClient
        TabOrder = 3
        object rg_opcao_impressao: TRadioGroup
          Left = 137
          Top = 57
          Width = 472
          Height = 112
          Items.Strings = (
            'LOG'
            'Demonstrativo de Concessão de Benefícios de INSS')
          TabOrder = 0
        end
        object bt_imprimir: TButton
          Left = 328
          Top = 176
          Width = 75
          Height = 25
          Caption = 'Imprimir'
          TabOrder = 1
          OnClick = bt_imprimirClick
        end
      end
      object pnl1: TPanel [2]
        Left = 4
        Top = 55
        Width = 1142
        Height = 266
        Align = alClient
        TabOrder = 4
        object grid_log: TwwDBGrid
          Left = 0
          Top = 0
          Width = 731
          Height = 247
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Color = clWhite
          DataSource = ds
          ImeMode = imHanguel
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = True
          IndicatorColor = icBlack
        end
      end
      inherited pgctrlDetalhe: TPageControl
        Width = 1142
        Height = 266
        inherited tbsDet: TTabSheet
          Caption = ''
          inherited dbgrdDet: TwwDBGrid
            Width = 1134
            Height = 192
            ControlType.Strings = (
              'SELECIONADO;CheckBox;S;N')
            Selected.Strings = (
              'SELECIONADO'#9'1'#9'S'
              'MATRICULA'#9'15'#9'Matrícula'
              'NOME'#9'60'#9'Nome'
              'NUMBENEFICIO'#9'15'#9'Número Benefício'
              'ESPECIE'#9'6'#9'Espécie'
              'BENEFICIO'#9'60'#9'Benefício'
              'SITBENEFICIO'#9'12'#9'Sit. do ~Benefício'
              'RMI'#9'10'#9'RMI'
              'Data do Evento'#9'18'#9'Data do Evento'
              'DIB'#9'18'#9'DIB'
              'DIP'#9'18'#9'DIP'
              'DIBANT'#9'18'#9'DIB Anterior'
              'DATAREQUERIMENTO'#9'18'#9'Data de Requerimento'
              'MOLESTIA'#9'6'#9'Moléstia'
              'DATAINICIO'#9'18'#9'Data Início'
              'DATAFIM'#9'18'#9'Data Fim'
              'BENEFREQ'#9'16'#9'Benefício Requerido'
              'Idplanprevcontab'#9'14'#9'Plano ~Contábil'
              'NUP'#9'17'#9'NUP'
              'CPF'#9'18'#9'CPF'
              'NOMEPLANOPREV'#9'20'#9'Plano ~Previdenciário'
              'SITPLANO'#9'20'#9'Situação ~no Plano'
              'VALORTOTAL'#9'11'#9'Valor ~Total'
              'NOMEUSUARIO'#9'20'#9'Usuário que ~Homologou'
              'IDPERFILINVEST'#9'10'#9'IDPERFILINVEST')
            Color = clWhite
            ImeMode = imHanguel
            KeyOptions = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            TitleLines = 2
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
          inherited pnlControlesDet: TPanel
            Width = 1134
            Height = 192
            object lbl_matri: TLabel
              Left = 8
              Top = 0
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object Label1: TLabel
              Left = 8
              Top = 48
              Width = 121
              Height = 13
              Caption = 'Número do Benefício'
            end
            object Label2: TLabel
              Left = 286
              Top = 96
              Width = 22
              Height = 13
              Caption = 'DIP'
            end
            object Label3: TLabel
              Left = 150
              Top = 0
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object Label4: TLabel
              Left = 150
              Top = 48
              Width = 46
              Height = 13
              Caption = 'Espécie'
            end
            object Label5: TLabel
              Left = 422
              Top = 96
              Width = 22
              Height = 13
              Caption = 'DIB'
            end
            object Label6: TLabel
              Left = 249
              Top = 48
              Width = 56
              Height = 13
              Caption = 'Benefício'
            end
            object Label7: TLabel
              Left = 562
              Top = 96
              Width = 70
              Height = 13
              Caption = 'DIB Anterior'
            end
            object Label8: TLabel
              Left = 991
              Top = 52
              Width = 24
              Height = 13
              Caption = 'RMI'
            end
            object Label9: TLabel
              Left = 150
              Top = 96
              Width = 90
              Height = 13
              Caption = 'Data do Evento'
            end
            object Label10: TLabel
              Left = 978
              Top = 96
              Width = 128
              Height = 13
              Caption = 'Data de Requerimento'
            end
            object Label11: TLabel
              Left = 701
              Top = 96
              Width = 116
              Height = 13
              Caption = 'Data Início-Moléstia'
            end
            object Label12: TLabel
              Left = 836
              Top = 96
              Width = 102
              Height = 13
              Caption = 'Data Fim-Moléstia'
            end
            object Label13: TLabel
              Left = 880
              Top = 143
              Width = 118
              Height = 13
              Caption = 'Benefício Requerido'
            end
            object lblNumBrdp: TLabel
              Left = 600
              Top = 0
              Width = 100
              Height = 13
              Caption = 'Número do BRDP'
            end
            object lblPctInss: TLabel
              Left = 495
              Top = 48
              Width = 43
              Height = 13
              Caption = '% INSS'
            end
            object lblIndReajTeto: TLabel
              Left = 573
              Top = 48
              Width = 138
              Height = 13
              Caption = 'Índice Reajuste do Teto'
            end
            object lblEstado: TLabel
              Left = 722
              Top = 48
              Width = 40
              Height = 13
              Caption = 'Estado'
            end
            object lblNup: TLabel
              Left = 858
              Top = 48
              Width = 27
              Height = 13
              Caption = 'NUP'
            end
            object lblDEC: TLabel
              Left = 8
              Top = 96
              Width = 26
              Height = 13
              Caption = 'DEC'
            end
            object lblTempoSevico: TLabel
              Left = 604
              Top = 141
              Width = 104
              Height = 13
              Caption = 'Tempo de Serviço'
            end
            object lblAnos: TLabel
              Left = 658
              Top = 160
              Width = 28
              Height = 13
              Caption = 'anos'
            end
            object lblMeses: TLabel
              Left = 751
              Top = 160
              Width = 36
              Height = 13
              Caption = 'meses'
            end
            object lblDias: TLabel
              Left = 840
              Top = 160
              Width = 24
              Height = 13
              Caption = 'dias'
            end
            object dbedNumProcINSS: TwwDBEdit
              Left = 8
              Top = 14
              Width = 120
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit1: TwwDBEdit
              Left = 8
              Top = 62
              Width = 120
              Height = 21
              DataField = 'NUMBENEFICIO'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit2: TwwDBEdit
              Left = 286
              Top = 108
              Width = 120
              Height = 21
              DataField = 'DIP'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 150
              Top = 14
              Width = 439
              Height = 21
              DataField = 'NOME'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit4: TwwDBEdit
              Left = 150
              Top = 62
              Width = 87
              Height = 21
              DataField = 'ESPECIE'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit5: TwwDBEdit
              Left = 422
              Top = 108
              Width = 120
              Height = 21
              DataField = 'DIB'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit6: TwwDBEdit
              Left = 249
              Top = 62
              Width = 234
              Height = 21
              DataField = 'BENEFICIO'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dtDataInicio: TCMDateTimePicker
              Left = 978
              Top = 108
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREQUERIMENTO'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 13
            end
            object dtEvento: TCMDateTimePicker
              Left = 150
              Top = 108
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'Data do Evento'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 6
            end
            object CMDateTimePicker2: TCMDateTimePicker
              Left = 701
              Top = 108
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 11
            end
            object CMDateTimePicker3: TCMDateTimePicker
              Left = 836
              Top = 108
              Width = 121
              Height = 21
              Hint = 'Data de Início do Pagamento do Benefício'
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
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              ShowButton = True
              TabOrder = 12
            end
            object wwDBEdit9: TwwDBEdit
              Left = 880
              Top = 156
              Width = 149
              Height = 21
              DataField = 'BENEFREQ'
              DataSource = dsDet
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object rg_molestia: TDBRadioGroup
              Left = 8
              Top = 142
              Width = 121
              Height = 49
              Caption = 'Moléstia'
              Columns = 2
              DataField = 'MOLESTIA'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              ReadOnly = True
              TabOrder = 10
              TabStop = True
              Values.Strings = (
                'SIM'
                'NAO')
            end
            object wwDBEdit10: TwwDBEdit
              Left = 991
              Top = 64
              Width = 128
              Height = 21
              DataField = 'RMI'
              DataSource = dsDet
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
              OnChange = wwDBEdit10Change
            end
            object dtDataFinal: TCMDateTimePicker
              Left = 562
              Top = 108
              Width = 114
              Height = 21
              Hint = 'Data Final do Pagamento do Benefício'
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DIBANT'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowButton = True
              TabOrder = 9
              OnChange = dtDataFinalChange
            end
            object cb_validado: TCheckBox
              Left = 1040
              Top = 157
              Width = 89
              Height = 17
              Caption = 'Validado'
              TabOrder = 16
            end
            object db_grid_irrf: TDBRadioGroup
              Left = 8
              Top = 136
              Width = 121
              Height = 49
              Caption = 'Isento de IRRF'
              Columns = 2
              DataField = 'ISENTOIRRF'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 14
              TabStop = True
              Values.Strings = (
                'SIM'
                'NAO')
            end
            object dbedNumBrdp: TwwDBEdit
              Left = 600
              Top = 14
              Width = 229
              Height = 21
              DataField = 'NUMBRDP'
              DataSource = dsDet
              TabOrder = 17
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedPctInss: TwwDBEdit
              Left = 494
              Top = 62
              Width = 60
              Height = 21
              DataField = 'PERCENTUALINSS'
              DataSource = dsDet
              TabOrder = 18
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedIndReajTeto: TwwDBEdit
              Left = 573
              Top = 62
              Width = 121
              Height = 21
              DataField = 'INDICEREAJUSTETETO'
              DataSource = dsDet
              TabOrder = 19
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkEstado: TwwDBLookupCombo
              Left = 722
              Top = 64
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              DataField = 'ESTADO'
              DataSource = dsDet
              TabOrder = 20
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedNup: TwwDBEdit
              Left = 858
              Top = 64
              Width = 121
              Height = 21
              DataField = 'NUP'
              DataSource = dsDet
              TabOrder = 21
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dtDec: TCMDateTimePicker
              Left = 8
              Top = 108
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DEC'
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
              TabOrder = 22
            end
            object rgSetencaJudicial: TDBRadioGroup
              Left = 132
              Top = 136
              Width = 145
              Height = 49
              Caption = 'Setença Judicial?'
              Columns = 2
              DataField = 'FLGSENTENCAJUDICIAL'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 23
              Values.Strings = (
                '1'
                '0')
            end
            object rgBeneficioLei142: TDBRadioGroup
              Left = 280
              Top = 136
              Width = 128
              Height = 49
              Caption = 'Benefício Lei 142?'
              Columns = 2
              DataField = 'BENEFLEI142'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 24
              Values.Strings = (
                '1'
                '0')
            end
            object rgBenefForaConvenio: TDBRadioGroup
              Left = 412
              Top = 136
              Width = 185
              Height = 49
              Caption = 'Benefício Fora do Convênio?'
              Columns = 2
              DataField = 'FLGPAGAINSS'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 25
              Values.Strings = (
                'SIM'
                'NAO')
            end
            object dbedAno: TwwDBEdit
              Left = 608
              Top = 158
              Width = 50
              Height = 21
              DataField = 'TEMPOSERVICOANOS'
              DataSource = dsDet
              TabOrder = 26
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedMeses: TwwDBEdit
              Left = 700
              Top = 158
              Width = 50
              Height = 21
              DataField = 'TEMPOSERVICOMES'
              DataSource = dsDet
              TabOrder = 27
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDias: TwwDBEdit
              Left = 788
              Top = 158
              Width = 50
              Height = 21
              DataField = 'TEMPOSERVICODIAS'
              DataSource = dsDet
              TabOrder = 28
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object PnlSelGravar: TPanel
            Left = 0
            Top = 192
            Width = 1134
            Height = 46
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object lbl_local: TLabel
              Left = 8
              Top = 5
              Width = 331
              Height = 13
              Caption = 'Local onde será gravado os demonstrativos de concessão'
            end
            object ed_local: TEdit
              Left = 8
              Top = 21
              Width = 337
              Height = 21
              TabOrder = 0
              Text = 'c:\'
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1232
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Visible = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
            Visible = False
          end
        end
        object bbtnInverte: TBitBtn
          Left = 287
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção das Rubricas'
          Caption = 'Desmarcar Tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnInverteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnSelTudo: TBitBtn
          Left = 135
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Seleciona Todas as Rubricas'
          Caption = '   Seleciona Tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnSelTudoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      inherited Dock974: TDock97
        Left = 1146
        Height = 266
        inherited tb97Detalhe: TToolbar97
          object bbtnOpcoes: TBitBtn
            Left = 0
            Top = 81
            Width = 85
            Height = 27
            Hint = 'Verificar Regra de Concessão do Benefício'
            Cancel = True
            Caption = 'O&pções'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = False
            Glyph.Data = {
              42010000424D4201000000000000760000002800000011000000110000000100
              040000000000CC00000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
              F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
              0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
              00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
              DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
              0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
              DDDDD0000000}
          end
        end
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 1240
      Height = 168
      object GroupBox1: TGroupBox
        Left = 24
        Top = 8
        Width = 161
        Height = 70
        Caption = 'Tipo de Recebedor'
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97 [2]
    Width = 1242
    object ToolbarButton971: TToolbarButton97 [0]
      Left = 120
      Top = 0
      Width = 60
      Height = 41
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Excluir'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      ImageIndex = 2
      Images = ImlPadrao
      Layout = blGlyphTop
      Opaque = False
      Spacing = 0
      OnClick = sbtnApagarClick
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 180
        ParentFont = False
        ParentShowHint = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
        Enabled = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 240
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 60
        Enabled = False
      end
      object sbtnRequerer: TToolbarButton97
        Left = 120
        Top = 0
        Width = 60
        Height = 41
        Hint = 'Requerer'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Conceder'
        Enabled = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FF0000000F0
          000033F77777773777773FFF0CCC0FF09990333F73F37337F33733FFF0C0FFF0
          99903333F7373337F337333FFF0FFFF0999033333F73FFF7FFF73333FFF000F0
          0000333333F77737777733333F07B70FFFFF3333337F337F33333333330BBB0F
          FFFF3FFFFF7F337F333300000307B70FFFFF77777F73FF733F330EEE033000FF
          0FFF7F337FF777337FF30EEE00033FF000FF7F33777F333777FF0EEE0E033300
          000F7FFF7F7FFF77777F00000E00000000007777737773777777330EEE0E0330
          00FF337FFF7F7F3777F33300000E033000FF337777737F3777F333330EEE0330
          00FF33337FFF7FF77733333300000000033F3333777777777333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnRequererClick
      end
    end
  end
  object cb_tipo_recebedor: TComboBox [3]
    Left = 32
    Top = 88
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnDropDown = CombosDropDown
    Items.Strings = (
      'Todos'
      'Aposentadoria'
      'Pensão'
      'Benefício Fora do Convênio')
  end
  object rd_benefreq: TRadioGroup [4]
    Left = 200
    Top = 54
    Width = 185
    Height = 73
    Caption = 'Benefício Concedido ?'
    ItemIndex = 1
    Items.Strings = (
      'Sim'
      'Não')
    TabOrder = 1
  end
  object gbxBeneficio: TGroupBox [5]
    Left = 24
    Top = 129
    Width = 819
    Height = 77
    TabOrder = 5
    object lblMatricula: TLabel
      Left = 6
      Top = 20
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object lblNumBenef: TLabel
      Left = 150
      Top = 20
      Width = 150
      Height = 13
      Caption = 'Número do Benefício (NB)'
    end
    object lblDer: TLabel
      Left = 552
      Top = 20
      Width = 27
      Height = 13
      Caption = 'DER'
    end
    object lblNome: TLabel
      Left = 6
      Top = 52
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object lblNmBenef: TLabel
      Left = 360
      Top = 52
      Width = 110
      Height = 13
      Caption = 'Nome do Benefício'
    end
    object dbedMatricula: TwwDBEdit
      Left = 62
      Top = 16
      Width = 70
      Height = 21
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNome: TwwDBEdit
      Left = 46
      Top = 48
      Width = 303
      Height = 21
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNumBenef: TwwDBEdit
      Left = 304
      Top = 16
      Width = 237
      Height = 21
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNmBenef: TwwDBEdit
      Left = 480
      Top = 48
      Width = 229
      Height = 21
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dtpDer: TCMDateTimePicker
      Left = 588
      Top = 16
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
      TabOrder = 2
    end
    object bbtnFiltrar: TBitBtn
      Left = 721
      Top = 28
      Width = 81
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 5
      OnClick = bbtnFiltrarClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000084FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF
        0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084000084
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF0000
        00FF00FFFF00FFFF00FF000084000084000084FF00FF848484FFFFFFFFFFFFFF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084
        000084000084000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFF000000FF00FFFF00FFFF00FF000084000000FFFF00FF00FFFFFF00FF
        00FF000000848400FF0000FFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000FFFFFFFFFFFFFFFF
        FF848484848484FF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FFFFFF848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000000FF00FFFFFF00FF00FFFFFF00000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1136
    Top = 18
    TargetsData = (
      1
      4
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'Cells'
        0))
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDet
    Left = 467
    Top = 82
  end
  inherited ds: TwwDataSource
    Left = 430
    Top = 82
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update pessoa set nome = '#39#39
      'where 1=2')
    Left = 430
    Top = 50
  end
  inherited MontaSelect: TMontaSelect
    Left = 1071
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 1169
    Top = 18
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 992
    Top = 18
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select 1 from dual')
    Left = 429
    Top = 18
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 1024
    Top = 18
  end
  object qry2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 497
    Top = 18
  end
  object qryaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 741
    Top = 18
  end
  object qryaux2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 525
    Top = 18
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFBFCIARIO'
      ''
      'set'
      '  DIBBENEFANT = :DIBANT'
      ''
      'where'
      ''
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 466
    Top = 50
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPART, SIT.FLGINTERNO'
      'FROM SITPART SIT , EVENTOXSITPART E'
      'WHERE '
      'SIT.IDSITPART = E.IDSITPART'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 619
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SIT.DESCRICAO , SIT.IDSITFUNC, SIT.FLGINTERNO, SIT.TIPOSI' +
        'T'
      'FROM SITFUNC SIT , EVENTOXSITFUNC E'
      'WHERE '
      'SIT.IDSITFUNC = E.IDSITFUNC'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 650
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object qrySitPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SIT.DESCRICAO , SIT.IDSITPLANOPREV, SIT.FLGINTERNO'
      ''
      'FROM SITPLANOPREV SIT , EVENTOXSITPLAPREV E'
      'WHERE '
      'SIT.IDSITPLANOPREV = E.IDSITPLANOPREV'
      'AND E.IDEVENTOGERADOR = :IDEVENTO'
      'ORDER BY SIT.DESCRICAO')
    ValidateWithMask = True
    Left = 712
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEVENTO'
        ParamType = ptUnknown
      end>
  end
  object IdHTTP1: TIdHTTP
    Request.Accept = 'text/html, */*'
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ProxyPort = 0
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Left = 1104
    Top = 16
  end
  object param: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 545
    Top = 50
  end
  object CrmRptCM: TCmRptManager
    IdUsuario = 0
    IdModulo = 0
    DeviceType = rdtScreen
    ShowPrintDialog = True
    ShowCancelDialog = True
    Report = rpReciboCedidos
    ConnectionType = cntADO
    Left = 1131
    Top = 48
  end
  object DevRptCM: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = False
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'Cm Soluções Informática LTDA'
    PDF.Title = 'Relatório CM'
    PDF.Author = 'Cm Soluções Informática LTDA'
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 944
    Top = 48
  end
  object CmpRptCM: TCmParamReport
    Params = <>
    ExibeMensagem = True
    Formheight = 433
    FormWidth = 525
    HelpContext = 0
    Left = 1008
    Top = 48
  end
  object rpReciboCedidos: TppReport
    AutoStop = False
    DataPipeline = ppReciboCedidos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Demonstrativo de Concessão de Benefícios de INSS'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 976
    Top = 48
    Version = '7.04'
    mmColumnWidth = 288000
    DataPipelineName = 'ppReciboCedidos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'DEMONSTRATIVO DE CONCESSÃO DE BENEFÍCIOS DO INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 1058
        mmTop = 21167
        mmWidth = 198702
        BandType = 0
      end
      object lbl_dataconce: TppLabel
        UserName = 'lbl_dataconce'
        Caption = 'Emissão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 165894
        mmTop = 24871
        mmWidth = 10033
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 28310
        mmWidth = 199232
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        DirectDraw = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170D6A90000424DD6A90000000000003604000028000000C800
          0000D40000000100080000000000A0A50000232E0000232E0000000100000000
          00006A4F4D006B504E006B514F006C514F006D5351006D5250006F5453006F55
          53006E5452006F555400705654007157550072585600735A5800745B5900745B
          5A00765D5B00775E5D00765D5C00785F5E0079615F0078605E007B6361007A62
          60007B6462007C6463007E6765007E6665007D6564007F6866002DA0D5002FA0
          D50030A1D50034A3D60036A4D6003AA5D70039A5D7003CA6D7003EA7D80041A9
          D80041A8D80043A9D90047ABDA004AADDA004DAEDB004FAFDB0057B3DD0055B2
          DC0053B0DC005DB5DE005EB6DE005FB6DF0058B3DD0060B7DF0064B8DF0062B8
          DF0066B9E00069BBE0006BBCE1006DBCE1006EBDE10072BFE20077C1E30074C0
          E3007EC4E5007AC3E40080696700826B6900836C6A00836D6B00826C6A00846E
          6D0086706E0085706E0087716F0088727100897473008B7674008A7574008C77
          76008C7876008D7877008F7B79008D797700927E7D00907C7A0093807F009480
          7F0095828100978583009987850098868400998685009B8887009C8B89009E8C
          8B009F8E8D00A08F8E00A1908F00A2929100A5959300A4949300A7979500A493
          9200A8989700A9999800AA9B9A00A99A9900AB9C9B00AD9E9D00AEA09F00AEA0
          9E00AFA1A000B0A2A100B2A4A300B3A5A400B4A6A500B4A7A600B5A7A600B5A8
          A700B6A9A800B7AAA900B7ABAA00B8ABAA00B9ACAB00BAAEAD00BCB0AF00BEB2
          B100BFB4B30081C5E50084C7E50086C8E6008BCAE70089C9E7008ECBE70096CF
          E90097CFE90095CEE9009AD1EA009ED3EB00A1D4EC00A6D6EC00A9D7ED00AEDA
          EE00ADD9EE00AAD8ED00B2DBEF00B6DEF000B9DFF000C2B7B700C2B7B600C1B5
          B500C3B8B700C3B9B800C5BAB900C5BBBA00C6BBBB00C4B9B900C6BCBB00C8BE
          BD00C8BEBE00CBC2C100CBC2C200CCC3C200CCC3C300CFC6C500CFC7C600CFC6
          C600CDC4C300D0C8C700D1C9C800D2CACA00D3CBCA00D2CAC900D4CDCC00D4CC
          CC00D5CECD00D6CFCF00D7D0D000D8D1D100DAD3D300D9D3D200DCD6D500DBD5
          D500DED8D700DFD9D900DFDAD900C6E5F300CCE7F400CEE8F400D2EAF500D7EC
          F600D4EBF500DBEEF700DBEFF700D9EDF700DDEFF800DEF0F800E0DBDA00E1DC
          DB00E2DDDD00E4E0DF00E7E3E200E6E2E200E6E1E100E8E4E300E9E4E400EAE6
          E600EBE7E700E9E6E500EBE8E800ECE8E800EEEBEB00EFECEC00E6F3F900E7F4
          FA00E7F4F900E3F2F800EAF5FA00EDF7FB00EDF6FB00EEF7FB00F0EDED00F1EF
          EE00F2EFEF00F2F0F000F3F1F100F4F2F200F6F5F500F7F6F500F7F6F600F5F4
          F400F3F9FC00F1F8FC00F5FAFC00F6FBFD00F4F9FC00F9F7F700F8F7F700F9F8
          F800FAF9F900FBFAFA00F8FBFD00F9FCFD00F8FCFD00FBFDFE00FCFBFB00FCFC
          FC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00FFFFFF00FCFDFE00FCFC
          FB00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFCE1B097726A666C7499B4E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDF8C99F786C686C779FCCFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD564444444444444444A4FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDE37E4B0200000000000000000004559EEFFDFDFDFDFDFD
          FDFDFDFD524444444444444449F6FDFDFDFDFDFDFDFD6C4444444444444444B6
          FDFDFDFDFDFDFDFDFDFCC665100000000000000000001671D5FDFDFDFDFDFDFD
          FDFDEF4644444444444444444444444444444444444444444444A5FDFDFDEE44
          4444444444444444C9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF87D0D0000000000000000000000000000
          0018A5FDFDFDFDFDFDFDFDFD140000000000000004F6FDFDFDFDFDFDFDB20000
          00000000000000AEFDFDFDFDFDFDFDFDD15B0000000000000000000000000000
          0A7CF9FDFDFDFDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE6540000000000000000
          00000000000000000000006EFCFDFDFDFDFDFDFD140000000000000004F6FDFD
          FDFDFDFDEE1C000000000000000000AEFDFDFDFDFDFDFC9E0A00000000000000
          0000000000000000000059E6FDFDFDFDFDFDED00000000000000000000000000
          000000000000000000009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF95800
          00000000000000000000000000000000000000007CFDFDFDFDFDFDFD14000000
          0000000004F6FDFDFDFDFDFD6C00000000000000000000AEFDFDFDFDFDFD7D01
          0000000000000000000000000000000000000054F1FDFDFDFDFDED0000000000
          0000000000000000000000000000000000009AFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFD980000000000000000000000000000000000000000000005CCFDFD
          FDFDFDFD140000000000000004F6FDFDFDFDFDB80200000000000000000000AE
          FDFDFDFDFDA3000000000000000000000000000000000000000000006CFDFDFD
          FDFDED00000000000000000000000000000000000000000000009AFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDF617000000000000000000000000000000000000
          00000000005EFDFDFDFDFDFD140000000000000004F6FDFDFDFDF14500000000
          00000000000000AEFDFDFDFDD40C000000000000000000000000000000000000
          0000000001C6FDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC0000000000000000000258
          747C704C00000000000000000004E3FDFDFDFDFD140000000000000004F6FDFD
          FDFD74000000000000000000000000AEFDFDFDFD60000000000000000000085F
          809F7B4800000000000000000057FDFDFDFDED0000000000000000001D484848
          48484848484848484848A9FDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD66000000
          000000000004B1FDFDFDFDFC7C000000000000000000A1FDFDFDFDFD14000000
          0000000004F6FDFDFDC904000000000000000000000000AEFDFDFDD202000000
          000000000042CDFDFDFDFDF970000000000000000001CFFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFD4B000000000000000066FDFDFDFDFDFDFB4600000000000000006CFD
          FDFDFDFD140000000000000004F6FDFDF74C00000000000000000000000000AE
          FDFDFD78000000000000000008CDFDFDFDFDFDFDFC4D00000000000000007EFD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFC0C0000000000000000A9FDFDFDFDFDFDFD6D0000
          00000000000057FDFDFDFDFD140000000000000004F7FDFD7D00000000000000
          00000000000000AEFDFDFD4E000000000000000065FDFDFDFDFDFDFDFDA80000
          0000000000005BFDFDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000005070707070707070707A4FDFDFDFDFDE4000000000000000000C8FDFD
          FDFDFDFDFD97000000000000000047FDFDFDFDFD14000000000000000DFCFDD1
          070000000000000000000000000000AEFDFDF0040000000000000000AEFDFDFD
          FDFDFDFDFDE300000000000000001BFDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE50000000000000000000807070707070707
          0707CEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDDE00000000
          0000000000CBFDFDFDFDFDFDFD9A000000000000000019FDFDFDFDFD14000000
          0000000014FDFB55000000000000000000000000000000AEFDFDCB0000000000
          00000000E1FDFDFDFDFDFDFDFDFCCFCFCFCFCFCFCFCFD0FCFDFDED0000000000
          000000000C0E0E0E0E0E0E0E0E0E0E58FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000A1FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000042FD9800000000000000000000000000000000AE
          FDFDB000000000000000000AF9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          000000000000000000000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000A1FDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000004AD40C000000000000005300
          00000000000000AEFDFDA1000000000000000011FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDED000000000000000000000000000000000000000051
          FDFDFDFDFDFDE500000000000000000000000000000000000000CDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000A1FDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000051590000
          000000000053980000000000000000AEFDFDA0000000000000000011FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED00000000000000000000000000
          0000000000000051FDFDFDFDFDFDE50000000000000000000000000000000000
          0000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          000000000B0000000000000008CA7E0000000000000000AEFDFDA60000000000
          0000000BFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED0000000000
          00000000000000000000000000000051FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A0000000000000000485A5A5A5A5A5A5A5A5AB6FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000000000000000000007CFD780000000000000000AE
          FDFDB8000000000000000000E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          0000000000000000525A5A5A5A5A5A5A5A5ADEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000000000000004AF6FD7000
          00000000000000AEFDFDE2000000000000000000B3FDFDFDFDFDFDFDFDEE6F6E
          6E6E6E6E6E6E9BFDFDFDED0000000000000000004E565656565656565656566D
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          000005C8FDFD690000000000000000AEFDFDFD1D00000000000000006DFDFDFD
          FDFDFDFDFDC7000000000000000064FDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000000000071FDFDFD640000000000000000AEFDFDFD6B00000000
          0000000012EEFDFDFDFDFDFDFD7900000000000000009AFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000000043F0FDFDFD640000000000000000AE
          FDFDFDB90000000000000000006DFDFDFDFDFDFDDE110000000000000001D4FD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000066A6A6A6A6
          A6A6A6A6A6A6A6AAFCFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000000000000001B7FDFDFDFD6400
          00000000000000AEFDFDFDFD530000000000000000006ADFFCFDE49915000000
          000000000054FDFDFDFDED0000000000000000007AA6A6A6A6A6A6A6A6A6A6A6
          A6B2FDFDFDFDE50000000000000000007DA6A6A6A6A6A6A6A6A6A6A6B4FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          69FDFDFDFDFD640000000000000000AEFDFDFDFDC60200000000000000000003
          181B0400000000000000000000B1FDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000019E4FDFDFDFDFD640000000000000000AEFDFDFDFDFD710000
          000000000000000000000000000000000000000059FCFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000000007
          F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000AEFDFDFDFDFDFD640000000000000000AE
          FDFDFDFDFDF758000000000000000000000000000000000000000013DEFDFDFD
          FDFDED0000000000000000000000000000000000000000000045FDFDFDFDE500
          00000000000000000000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000000007F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000062FCFDFDFDFDFDFD6400
          00000000000000AEFDFDFDFDFDFDF05800000000000000000000000000000000
          00000AB9FDFDFDFDFDFDED000000000000000000000000000000000000000000
          0045FDFDFDFDE50000000000000000000000000000000000000000004DFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000000000000011E2FD
          FDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDF77305000000000000
          00000000000000000016B8FDFDFDFDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000A8FDFDFDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDFD
          FDCB600400000000000000000000001377E6FDFDFDFDFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDACA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5
          FCFDFDEFA3A3A3A3A3A3A3A3A3E5FDFDFDFDFDFDFDD0A3A3A3A3A3A3A3A3ABFD
          FDFDFDFDA9A3A3A3A3A3A3A3ADFCFDFDFDFDFDFDFDFDC6A3A3A3A3A3A3A3A3DF
          FDFDFDFDFDFDFDFDFDFDFDDF965A1907050911475A78B4F7FDFDFDFDFDFDFDFD
          FDFDF7A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B0FDFDFDFDFFA4
          A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B3FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCF8F6F9FCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE8DB
          DBDBDBDBDBDBDBDDFCFCDBDBDBDBDBDBDBDBDBE8FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F6FDFD
          FDEEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E7FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDDDDBDBDBDBDBDBDBDBE8FDF5DBDBDBDBDBDBDBDBDB
          EBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7400000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD361E1E1E1E1E1E1E1E22FCFA221E1E1E1E1E
          1E1E1E36FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFA231E1E1E1E
          1E1E1E1E35FDC41E1E1E1E1E1E1E1E1E86FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA231E1E1E1E1E1E1E1E2D
          FCFC2D1E1E1E1E1E1E1E1E23EAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDC01E1E1E1E1E1E1E1E1E41FDEC1F1E1E1E1E1E1E1E1E2EFCFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC851E1E
          1E1E1E1E1E1E1E82FDFD821E1E1E1E1E1E1E1E1E85FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF5351E1E1E1E1E1E1E1E1E8FFDFC341E1E1E1E1E1E1E1E
          1E92FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDEB841E1E1E1E1E1E1E1E1E1EBEFDFDC01E1E1E1E1E1E1E1E1E1E84EBFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDA391E1E1E1E1E1E1E1E1E24E8FDFD8E
          1E1E1E1E1E1E1E1E1E208DFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC413E3E3E3E3E
          3E3E3E3E3E3E3E3E3E3E3C251E1E1E1E1E1E1E1E1E1E3BFCFDFDFC3B1E1E1E1E
          1E1E1E1E1E1E253B3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E41FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDD83E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E38211E1E1E1E1E1E1E
          1E1E1E8AFDFDFDF22B1E1E1E1E1E1E1E1E1E1E2A3D3E3E3E3E3E3E3E3E3E3E3E
          3E3E3E3E88FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E26D7FD
          FDFDFDD6261E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E2EF3FDFDFDFDBC201E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E22BDFDFDFDFDFDFDBD221E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E21FDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDC21E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2AD7FDFDFDFDFDFD901F1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E29BEFDFDFDFDFDFDFDFDBE291E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDC21E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2ED7FDFDFDFDFDFD
          FDFD93211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2040DDFDFDFDFDFDFDFDFDFDFDDB40
          201E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2487
          F3FDFDFDFDFDFDFDFDFDFDC4391E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC3731313131313131313131313131313131313131353D8CD6FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDD68C3D333131313131313131313131313131313131313136
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDD93131313131313131313131313131313131
          31313135418FE9FDFDFDFDFDFDFDFDFDFDFDFDFDFCC3873A3231313131313131
          31313131313131313131313182FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC4842F23232F84C5FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBC402C222631
          8ADCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3851F1E1E1E1E1E1E1F84F3FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          DB3A1E1E1E1E1E1E1E248EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3381E1E1E1E
          1E1E1E1E1E1E38F4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDDA2B1E1E1E1E1E1E1E1E1E1E84FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD831E1E1E1E1E1E1E1E1E1E1E1E82FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFE311E1E1E1E1E1E1E1E1E1E1E1E8FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDBF1E1E1E1E1E1E1E1E1E1E1E1E1E1EBFFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD8F1E1E1E1E1E1E1E1E1E
          1E1E1E1E25E8FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD811E1E1E1E1E1E1E1E1E1E1E1E1E1E
          81FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2F1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E91FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2A1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E2AFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDDC1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3DFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F2201E1E1E1E1E1E1E1E1E1E1E1E1E1E20F3FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2FFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDEB1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EEBFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBD1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E30FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC281E1E1E1E1E1E1E1E1E1E1E1E1E1E
          28FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD71E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E39FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3F1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E3FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFC2B1E1E1E1E1E1E1E1E1E1E1E1E1E1E8BFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDBB1E1E1E1E1E1E1E1E1E1E1E1E1E1EBBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD8A1E1E1E1E1E1E1E1E1E1E1E1E1E21DAFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC391E1E1E1E1E1E1E1E1E1E1E1E3AFCFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA2A1E1E1E1E1E1E1E1E
          1E1E1E1E89FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC2C1E1E1E1E1E1E1E1E1E1E2CDC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBF
          231E1E1E1E1E1E1E1E1E1E39F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC361E1E1E
          1E1E1E1E1E36DCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDC32C1E1E1E1E1E1E1E1E81F2FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFA9436211E1E213894FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF48D2E1F1E1E233DBDFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3D7D7F3FDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCEAD6DAFE
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7700000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE60000000000000000000000000000
          0000000000B1FDFDFD7B00000000000000000000000000000000000043FCFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDB3000000000000
          00000000000000000000000000C9FDFDFD9E0000000000000000000000000000
          0000000003E3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD6500000000000000000000000000000000000005EFFDFDFDB9000000000000
          0000000000000000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDCD040000000000000000000000000000000000004CFDFDFD
          FDF00700000000000000000000000000000000000018EEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF14D000000000000000000000000000000
          0000000074FDFDFDFDFD580000000000000000000000000000000000000066FC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF15E0000000000000000
          000000000000000000000001CEFDFDFDFDFDA100000000000000000000000000
          0000000000000079FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD35200
          0000000000000000000000000000000000000056FDFDFDFDFDFDF11500000000
          0000000000000000000000000000000063E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDF7C76A0A000000000000000000000000000000000000000000B7FDFDFDFD
          FDFDFD7F0000000000000000000000000000000000000000001179D1F9FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC1C14141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141509000000000000000000000000000000000000000000
          00005DFDFDFDFDFDFDFDFDF14200000000000000000000000000000000000000
          000000000C151414141414141414141414141414141414141414141414141414
          141414141414141414141414141414141414141414141414141414145BFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000DD5FDFDFDFDFDFDFDFDFDB40100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A5FDFDFDFDFDFDFDFDFDFDFD710000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000073FDFDFDFDFDFDFD
          FDFDFDFDFDF85800000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000064
          FCFDFDFDFDFDFDFDFDFDFDFDFDFDEE5100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000069F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE45400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000037EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F164000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000001DB6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCA00E0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000B76EFFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDF670500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001C
          78E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCF6A0F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC441A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A424C5E7DC7FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDF1B373594A1D1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A5EFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDE7B3967671799BB8F0FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEF9D5203000000000000000A5CAAF8FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF6801200000000000000
          00000000000043AAFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD04E00
          000000000000000000000000000000005FE7FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDB40F0000000000000000000000000000000000000046D3FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDB40700000000000000000000000000000000000000
          000017D2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCD0E000000000000000000000000
          000000000000000000000043E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1480000000000
          000000000000000000000000000000000000000061FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD7C000000000000000000000000000000000000000000000000000000B1FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDE30D00000000000000000000000000000000000000000000
          00000000004BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7D000000000000000000000000000000
          0000000000000000000000000000B5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC4700000000000000
          0000000000000000000000000000000000000000000063FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD3
          00000000000000000000000000000000000000000000000000000000000011F9
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDA1000000000000000000000000000000000000000000000000
          00000000000000D1FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7300000000000000000000000000000000
          000000000000000000000000000000AAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650000000000000000
          000000000000000000000000000000000000000000000095FDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD60
          000000000000000000000000000000000000000000000000000000000000007F
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFD67000000000000000000000000000000000000000000000000
          0000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7100000000000000000000000000000000
          000000000000000000000000000000A9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA00000000000000000
          0000000000000000000000000000000000000000000000CBFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCE
          0000000000000000000000000000000000000000000000000000000000000EF8
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFC420000000000000000000000000000000000000000000000
          0000000000005FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD77000000000000000000000000000000
          0000000000000000000000000000AFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE009000000000000
          00000000000000000000000000000000000000000046F9FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD72000000000000000000000000000000000000000000000000000000A9FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDEE42000000000000000000000000000000000000000000
          000000005BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC707000000000000000000000000
          00000000000000000000001CE2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA703000000
          0000000000000000000000000000000000000ECBFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDA7070000000000000000000000000000000000000014C8FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC7420000000000000000000000000000000000
          55DEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED720A00000000000000
          0000000000001598F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          E079430000000000000000014F98EFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFCD3A27569656A7BAAE0FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD}
        mmHeight = 17000
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 14000
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 1058
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 6879
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 'Brasília  DF CEP 70.712-900 - (061)329-1700 - www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10054
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'CNPJ: 03.296.968/0001-03 - Inscrição Estadual: 01.001.001-001-01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 201084
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 2582
        mmLeft = 175948
        mmTop = 24871
        mmWidth = 19685
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 120650
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDetalhe'
        mmHeight = 5292
        mmLeft = 0
        mmTop = 70115
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDetalhe
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Concessão de Benefícios de INSS'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Left = 384
          Top = 272
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDetalhe'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21960
            mmPrintPosition = 0
            object ppShape14: TppShape
              UserName = 'Shape14'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 15875
              mmWidth = 194734
              BandType = 1
            end
            object ppShape13: TppShape
              UserName = 'Shape13'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 10054
              mmWidth = 194734
              BandType = 1
            end
            object ppLabel89: TppLabel
              UserName = 'Label89'
              Caption = 'Mês Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 12171
              mmTop = 17198
              mmWidth = 20405
              BandType = 1
            end
            object ppLabel90: TppLabel
              UserName = 'Label90'
              Caption = 'Mês Reembolso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 48948
              mmTop = 17198
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel91: TppLabel
              UserName = 'Label91'
              Caption = 'Pagar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 96309
              mmTop = 17198
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel92: TppLabel
              UserName = 'Label92'
              Caption = 'Descontar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 137054
              mmTop = 17198
              mmWidth = 13462
              BandType = 1
            end
            object ppLabel93: TppLabel
              UserName = 'Label93'
              Caption = 'Plano Contábil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 171715
              mmTop = 17198
              mmWidth = 19304
              BandType = 1
            end
            object ppLabel94: TppLabel
              UserName = 'Label94'
              Caption = 'Histórico de Pagamento de Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5027
              mmTop = 11113
              mmWidth = 193675
              BandType = 1
            end
            object ppLine47: TppLine
              UserName = 'Line47'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 1058
              mmTop = 1852
              mmWidth = 199232
              BandType = 1
            end
            object ppLine48: TppLine
              UserName = 'Line48'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 1058
              mmTop = 7673
              mmWidth = 199232
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = ' VALORES A PAGAR / RECEBER '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5027
              mmTop = 3175
              mmWidth = 193675
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'mesreferencia'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 2910
              mmLeft = 5027
              mmTop = 1058
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'mesreembolso'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 2963
              mmLeft = 42598
              mmTop = 1058
              mmWidth = 37571
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'pagar'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 2963
              mmLeft = 80963
              mmTop = 1058
              mmWidth = 41540
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'descontar'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 2963
              mmLeft = 123296
              mmTop = 1058
              mmWidth = 41540
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'planocontabil'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 2910
              mmLeft = 166159
              mmTop = 1058
              mmWidth = 32015
              BandType = 4
            end
            object ppLine49: TppLine
              UserName = 'Line49'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 5027
              mmWidth = 194734
              BandType = 4
            end
            object ppShape15: TppShape
              UserName = 'Shape15'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 41804
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape16: TppShape
              UserName = 'Shape16'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 4233
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape17: TppShape
              UserName = 'Shape17'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 80433
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape18: TppShape
              UserName = 'Shape18'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 123031
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape19: TppShape
              UserName = 'Shape19'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 165894
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape20: TppShape
              UserName = 'Shape20'
              ParentHeight = True
              mmHeight = 5292
              mmLeft = 198702
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 0
              mmWidth = 194734
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 96838
        mmTop = 6350
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 6085
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NUMBENEFICIO'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 11906
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Número do Benefício INSS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 119327
        mmTop = 11906
        mmWidth = 39952
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Número do Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 0
        mmWidth = 32279
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'numeroprocesso'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3440
        mmLeft = 180975
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Nome do Participante: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 6350
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 6350
        mmWidth = 42863
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOMEPLANOPREV'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 23019
        mmWidth = 39423
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Plano Previdenciário: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 23019
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ESPECIE'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Espécie: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 11906
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Benefício: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 11906
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BENEFICIO'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 19315
        mmTop = 11906
        mmWidth = 60854
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Renda Mensal Inicial - RMI: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 49742
        mmWidth = 37550
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RMI'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 42598
        mmTop = 49742
        mmWidth = 23548
        BandType = 4
      end
      object lblCapIsentoIRRF: TppLabel
        UserName = 'lblCapIsentoIRRF'
        Caption = 'Isento IRRF: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 157427
        mmTop = 23019
        mmWidth = 17463
        BandType = 4
      end
      object lblIsentoIRRF: TppDBText
        UserName = 'lblIsentoIRRF'
        DataField = 'ISENTOIRRF'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3175
        mmLeft = 175684
        mmTop = 23019
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DIB'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3387
        mmLeft = 88900
        mmTop = 17463
        mmWidth = 22225
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'DIB: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 81492
        mmTop = 17463
        mmWidth = 6615
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'DIP: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 119327
        mmTop = 17463
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'DIP'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3387
        mmLeft = 126471
        mmTop = 17463
        mmWidth = 22225
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'DIB Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 39688
        mmTop = 17463
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DIBANT'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3387
        mmLeft = 59002
        mmTop = 17463
        mmWidth = 20902
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 34396
        mmWidth = 199232
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Tempo de Serviço INSS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 55563
        mmWidth = 36777
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 47890
        mmWidth = 199232
        BandType = 4
      end
      object lbl_anos: TppLabel
        UserName = 'lbl_anos'
        Caption = '__ lbl_anos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 41010
        mmTop = 55563
        mmWidth = 14478
        BandType = 4
      end
      object lbl_meses: TppLabel
        UserName = 'lbl_meses'
        Caption = '__ lbl_meses'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 56092
        mmTop = 55563
        mmWidth = 16764
        BandType = 4
      end
      object lbl_dias: TppLabel
        UserName = 'lbl_dias'
        Caption = '__ lbl_dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 73554
        mmTop = 55563
        mmWidth = 13547
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Conta Salário: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 36777
        mmWidth = 20066
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Banco: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 36777
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Conta Preferencial: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 42598
        mmWidth = 26797
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Banco: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 42598
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Agência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124354
        mmTop = 36777
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Agência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124354
        mmTop = 42598
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Valor Total do Benefício: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 144727
        mmTop = 49742
        mmWidth = 35983
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        CharWrap = True
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Valor Lançado em Histórico de Benefícios: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 85196
        mmWidth = 62442
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Valor Atual do Benefício: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 49742
        mmWidth = 37042
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        ShiftWithParent = True
        Caption = 'Mensagem de Impedimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 10054
        mmTop = 112977
        mmWidth = 44186
        BandType = 4
      end
      object lbl_banco: TppLabel
        UserName = 'lbl_banco'
        AutoSize = False
        Caption = 'lbl_banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 36777
        mmWidth = 28310
        BandType = 4
      end
      object lbl_agencia: TppLabel
        UserName = 'lbl_agencia'
        Caption = 'lbl_agencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 138113
        mmTop = 36777
        mmWidth = 14288
        BandType = 4
      end
      object lbl_conta: TppLabel
        UserName = 'lbl_conta'
        AutoSize = False
        Caption = 'lbl_conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 25135
        mmTop = 36777
        mmWidth = 53181
        BandType = 4
      end
      object lbl_conta2: TppLabel
        UserName = 'lbl_conta2'
        AutoSize = False
        Caption = 'lbl_conta2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 32279
        mmTop = 42598
        mmWidth = 46038
        BandType = 4
      end
      object lbl_banco2: TppLabel
        UserName = 'lbl_banco2'
        AutoSize = False
        Caption = 'lbl_banco2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 42598
        mmWidth = 28575
        BandType = 4
      end
      object lbl_agencia2: TppLabel
        UserName = 'lbl_agencia2'
        Caption = 'lbl_agencia2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 138113
        mmTop = 42598
        mmWidth = 15346
        BandType = 4
      end
      object lbl_valortotalhis: TppLabel
        UserName = 'lbl_valortotalhis'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'lbl_valortotalhis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 68527
        mmTop = 85196
        mmWidth = 25929
        BandType = 4
      end
      object lbl_valorbeneficio: TppLabel
        UserName = 'lbl_valorbeneficio'
        Caption = 'lbl_valorbeneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 181240
        mmTop = 49742
        mmWidth = 19315
        BandType = 4
      end
      object lbl_valoratualbeneficio: TppLabel
        UserName = 'lbl_valoratualbeneficio'
        Caption = 'lbl_valoratualbeneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 119856
        mmTop = 49742
        mmWidth = 19315
        BandType = 4
      end
      object lbl_msgimpeditiva: TppLabel
        UserName = 'lbl_msgimpeditiva'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'lbl_msgimpeditiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 55298
        mmTop = 113242
        mmWidth = 143404
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label301'
        CharWrap = True
        ShiftWithParent = True
        AutoSize = False
        Caption = 'Valor Lançado em Rubrica Inss:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 92075
        mmWidth = 46831
        BandType = 4
      end
      object lbl_valortotalinss: TppLabel
        UserName = 'lbl_valortotalinss'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'lbl_valortotalinss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 68527
        mmTop = 92075
        mmWidth = 25929
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 65617
        mmTop = 97896
        mmWidth = 32544
        BandType = 4
      end
      object lbl_valortotalgeral: TppLabel
        UserName = 'lbl_valortotalgeral'
        ShiftWithParent = True
        Caption = 'lbl_valortotalgeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 68527
        mmTop = 100013
        mmWidth = 25929
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        ShiftWithParent = True
        Caption = 'Valor Total Reembolsado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 100013
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'CPF: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 119856
        mmTop = 6085
        mmWidth = 7451
        BandType = 4
      end
      object lbl_CPF: TppLabel
        OnPrint = lbl_CPFPrint
        UserName = 'lbl_valortotalhis1'
        AutoSize = False
        Caption = 'lbl_CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 6085
        mmWidth = 25929
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'DER: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 17463
        mmWidth = 7747
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DATAREQUERIMENTO'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3387
        mmLeft = 11240
        mmTop = 17463
        mmWidth = 22225
        BandType = 4
      end
      object lblCapSituacaoPlano: TppLabel
        UserName = 'Label102'
        Caption = 'Situação no Plano: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 81492
        mmTop = 23019
        mmWidth = 26416
        BandType = 4
      end
      object lbl_SituacaoPlano: TppLabel
        OnPrint = lbl_SituacaoPlanoPrint
        UserName = 'lbl_SituacaoPlano'
        AutoSize = False
        Caption = 'lbl_SituacaoPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 23283
        mmWidth = 44979
        BandType = 4
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'ppDetalhe2'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 76200
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDetalhe2
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Concessão de Benefícios de INSS'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Left = 392
          Top = 280
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDetalhe2'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppShape21: TppShape
              UserName = 'Shape21'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 7408
              mmWidth = 194734
              BandType = 1
            end
            object ppShape22: TppShape
              UserName = 'Shape22'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 1588
              mmWidth = 194734
              BandType = 1
            end
            object ppLabel96: TppLabel
              UserName = 'Label96'
              Caption = 'Mês Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 12171
              mmTop = 8731
              mmWidth = 20405
              BandType = 1
            end
            object ppLabel97: TppLabel
              UserName = 'Label902'
              Caption = 'Mês Reembolso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 48948
              mmTop = 8731
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel98: TppLabel
              UserName = 'Label98'
              Caption = 'Pagar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 96309
              mmTop = 8731
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel99: TppLabel
              UserName = 'Label99'
              Caption = 'Descontar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 137054
              mmTop = 8731
              mmWidth = 13462
              BandType = 1
            end
            object ppLabel100: TppLabel
              UserName = 'Label100'
              Caption = 'Plano Contábil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3302
              mmLeft = 171715
              mmTop = 8202
              mmWidth = 19304
              BandType = 1
            end
            object ppLabel101: TppLabel
              UserName = 'Label101'
              Caption = 'Rubrica Individuais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3895
              mmLeft = 86519
              mmTop = 2646
              mmWidth = 29718
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'mesreferencia'
              DataPipeline = ppDetalhe2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe2'
              mmHeight = 2963
              mmLeft = 4763
              mmTop = 794
              mmWidth = 37042
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'mesreembolso'
              DataPipeline = ppDetalhe2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe2'
              mmHeight = 2963
              mmLeft = 42598
              mmTop = 794
              mmWidth = 37571
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'pagar'
              DataPipeline = ppDetalhe2
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe2'
              mmHeight = 2963
              mmLeft = 81227
              mmTop = 794
              mmWidth = 40481
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'descontar'
              DataPipeline = ppDetalhe2
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe2'
              mmHeight = 2963
              mmLeft = 123296
              mmTop = 794
              mmWidth = 41540
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'planocontabil'
              DataPipeline = ppDetalhe2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDetalhe2'
              mmHeight = 2910
              mmLeft = 166423
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppLine52: TppLine
              UserName = 'Line52'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 6350
              mmWidth = 194734
              BandType = 4
            end
            object ppShape23: TppShape
              UserName = 'Shape23'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 41804
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape24: TppShape
              UserName = 'Shape24'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 4233
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape25: TppShape
              UserName = 'Shape25'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 80433
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape26: TppShape
              UserName = 'Shape26'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 123031
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape27: TppShape
              UserName = 'Shape27'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 165894
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape28: TppShape
              UserName = 'Shape201'
              ParentHeight = True
              mmHeight = 6615
              mmLeft = 198702
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 265
        mmTop = 82021
        mmWidth = 199232
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 60590
        mmWidth = 199232
        BandType = 4
      end
      object plbl1: TppLabel
        UserName = 'Label202'
        Caption = 'Benefício Fora do Convênio: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 63765
        mmWidth = 41275
        BandType = 4
      end
      object plblDEC: TppLabel
        UserName = 'plblDEC'
        Caption = 'DEC: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 81492
        mmTop = 63765
        mmWidth = 7747
        BandType = 4
      end
      object plbl3: TppLabel
        UserName = 'plbl3'
        Caption = 'Benefício Lei 142: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 144727
        mmTop = 63765
        mmWidth = 25400
        BandType = 4
      end
      object plbl4: TppLabel
        UserName = 'plbl4'
        Caption = 'Índice de Reajuste do Teto: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 91811
        mmTop = 55563
        mmWidth = 39952
        BandType = 4
      end
      object plbl5: TppLabel
        UserName = 'plbl5'
        Caption = '%INSS: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 144727
        mmTop = 55563
        mmWidth = 10922
        BandType = 4
      end
      object lbl_FlgPagaInss: TppLabel
        UserName = 'lbl_FlgPagaInss'
        AutoSize = False
        Caption = 'lbl_FlgPagaInss'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 45508
        mmTop = 63765
        mmWidth = 20193
        BandType = 4
      end
      object lbl_DEC: TppLabel
        UserName = 'lbl_DEC'
        AutoSize = False
        Caption = 'lbl_DEC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 89959
        mmTop = 63765
        mmWidth = 25400
        BandType = 4
      end
      object lbl_BENEFLEI142: TppLabel
        UserName = 'lbl_BENEFLEI142'
        AutoSize = False
        Caption = 'lbl_BENEFLEI142'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 171186
        mmTop = 63765
        mmWidth = 22754
        BandType = 4
      end
      object lbl_PercINSS: TppLabel
        UserName = 'lbl_PercINSS'
        AutoSize = False
        Caption = 'lbl_PercINSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 156369
        mmTop = 55563
        mmWidth = 16933
        BandType = 4
      end
      object lbl_INDICEREAJUSTE: TppLabel
        UserName = 'lbl_INDICEREAJUSTE'
        Caption = 'lbl_INDICEREAJUSTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 132821
        mmTop = 55563
        mmWidth = 9525
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label103'
        Caption = 'Perfil de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 28575
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'NOMEPERFIL'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3260
        mmLeft = 37835
        mmTop = 28575
        mmWidth = 18415
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Data Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 160338
        mmTop = 17463
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATAFINAL'
        DataPipeline = ppReciboCedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppReciboCedidos'
        mmHeight = 3387
        mmLeft = 175684
        mmTop = 17463
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 182250
        mmTop = 16404
        mmWidth = 13589
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FUNCEF/DIBEN/GEBEN/CCOBE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 529
        mmTop = 19315
        mmWidth = 201084
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label6'
        Caption = 'DEMONSTRATIVO DE CONCESSÃO DE BENEFÍCIO INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 16669
        mmWidth = 68263
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 16140
        mmWidth = 199232
        BandType = 8
      end
      object lblNomUsuario: TppLabel
        UserName = 'lblNomUsuario'
        AutoSize = False
        Caption = '________________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 529
        mmWidth = 61648
        BandType = 8
      end
      object lbl_usuario: TppLabel
        UserName = 'lbl_usuario'
        Caption = 'lbl_usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 155575
        mmTop = 3969
        mmWidth = 15081
        BandType = 8
      end
      object lblNomNUP: TppLabel
        UserName = 'lblNomNUP'
        Caption = 'NUP Nº:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 8996
        mmWidth = 12435
        BandType = 8
      end
      object lbl_NUP: TppLabel
        OnPrint = lbl_NUPPrint
        UserName = 'lbl_valortotalinss1'
        AutoSize = False
        Caption = 'lbl_NUP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 15875
        mmTop = 8996
        mmWidth = 69056
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = ppReciboCedidos
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppReciboCedidos'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand3AfterPrint
        Visible = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365069570726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A6966205265636962
        6F43656469646F732E6669656C64735B305D2E4173537472696E673D274E2720
        7468656E0D0A202064657461696C2E76697369626C653A3D66616C73650D0A65
        6C736520200D0A202064657461696C2E76697369626C653A3D747275653B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060644657461696C0945
        76656E744E616D65060B4265666F72655072696E74074576656E744944021800
        00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppReciboCedidos: TppBDEPipeline
    DataSource = dsReciboCedidos
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ReciboCedidos'
    Left = 1072
    Top = 48
    object ppReciboCedidosppField1: TppField
      FieldAlias = 'SELECIONADO'
      FieldName = 'SELECIONADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField4: TppField
      FieldAlias = 'NUMBENEFICIO'
      FieldName = 'NUMBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField5: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField6: TppField
      FieldAlias = 'BENEFICIO'
      FieldName = 'BENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField7: TppField
      FieldAlias = 'SITBENEFICIO'
      FieldName = 'SITBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField8: TppField
      FieldAlias = 'RMI'
      FieldName = 'RMI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField9: TppField
      FieldAlias = 'Data do Evento'
      FieldName = 'Data do Evento'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField10: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField11: TppField
      FieldAlias = 'DIP'
      FieldName = 'DIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField12: TppField
      FieldAlias = 'DIBANT'
      FieldName = 'DIBANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField13: TppField
      FieldAlias = 'DATAREQUERIMENTO'
      FieldName = 'DATAREQUERIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField14: TppField
      FieldAlias = 'MOLESTIA'
      FieldName = 'MOLESTIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField15: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField16: TppField
      FieldAlias = 'DATAFIM'
      FieldName = 'DATAFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField17: TppField
      FieldAlias = 'BENEFREQ'
      FieldName = 'BENEFREQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField18: TppField
      FieldAlias = 'Idplanprevcontab'
      FieldName = 'Idplanprevcontab'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField19: TppField
      FieldAlias = 'NUP'
      FieldName = 'NUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField20: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField21: TppField
      FieldAlias = 'NOMEPLANOPREV'
      FieldName = 'NOMEPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField22: TppField
      FieldAlias = 'SITPLANO'
      FieldName = 'SITPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField23: TppField
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField24: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField25: TppField
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField26: TppField
      FieldAlias = 'FLGSENTENCAJUDICIAL'
      FieldName = 'FLGSENTENCAJUDICIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField27: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField28: TppField
      FieldAlias = 'NUMBRDP'
      FieldName = 'NUMBRDP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField29: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField30: TppField
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField31: TppField
      FieldAlias = 'DATAMORTE'
      FieldName = 'DATAMORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField32: TppField
      FieldAlias = 'IDSITPART'
      FieldName = 'IDSITPART'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField33: TppField
      FieldAlias = 'IDSITFUNC'
      FieldName = 'IDSITFUNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField34: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField35: TppField
      FieldAlias = 'IDSITPLANOPREV'
      FieldName = 'IDSITPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField36: TppField
      FieldAlias = 'INSCNUMERO'
      FieldName = 'INSCNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField37: TppField
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField38: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField39: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField40: TppField
      FieldAlias = 'IDBENEFHABILITA'
      FieldName = 'IDBENEFHABILITA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField41: TppField
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField42: TppField
      FieldAlias = 'eventogerador'
      FieldName = 'eventogerador'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField43: TppField
      FieldAlias = 'numeroprocesso'
      FieldName = 'numeroprocesso'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField44: TppField
      FieldAlias = 'ISENTOIRRF'
      FieldName = 'ISENTOIRRF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField45: TppField
      FieldAlias = 'FLGREQUERIMENTO'
      FieldName = 'FLGREQUERIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField46: TppField
      FieldAlias = 'FLGPAGAINSS'
      FieldName = 'FLGPAGAINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField47: TppField
      FieldAlias = 'BENEFLEI142'
      FieldName = 'BENEFLEI142'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField48: TppField
      FieldAlias = 'TEMPOSERVICOANOS'
      FieldName = 'TEMPOSERVICOANOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField49: TppField
      FieldAlias = 'TEMPOSERVICOMES'
      FieldName = 'TEMPOSERVICOMES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField50: TppField
      FieldAlias = 'TEMPOSERVICODIAS'
      FieldName = 'TEMPOSERVICODIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField51: TppField
      FieldAlias = 'INDICEREAJUSTETETO'
      FieldName = 'INDICEREAJUSTETETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField52: TppField
      FieldAlias = 'PERCENTUALINSS'
      FieldName = 'PERCENTUALINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField53: TppField
      FieldAlias = 'DEC'
      FieldName = 'DEC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField54: TppField
      FieldAlias = 'DATAMORTETIT'
      FieldName = 'DATAMORTETIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField55: TppField
      FieldAlias = 'FLGPAGAINSS_SN'
      FieldName = 'FLGPAGAINSS_SN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField56: TppField
      FieldAlias = 'BENEFLEI142_SN'
      FieldName = 'BENEFLEI142_SN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField57: TppField
      FieldAlias = 'NOMEPERFIL'
      FieldName = 'NOMEPERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField58: TppField
      FieldAlias = 'IDPERFILINVEST'
      FieldName = 'IDPERFILINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField59: TppField
      FieldAlias = 'ideventogerador'
      FieldName = 'ideventogerador'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField60: TppField
      FieldAlias = 'RMIREAJ'
      FieldName = 'RMIREAJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppReciboCedidosppField61: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
  end
  object dsReciboCedidos: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 468
    Top = 112
  end
  object CdsReciboCedidos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPREGADO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PAGINA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PIS'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NUMCONTASALARIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMAGENCIA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMBANCO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPOCONTRATO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMDEPIRRF'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPSALF'
        DataType = ftFloat
      end
      item
        Name = 'NATUREZA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CODRUBRICA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB1'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB3'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB4'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB5'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB6'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB7'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB8'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB9'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB10'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB11'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB12'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB13'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB14'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB15'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA16'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA16'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA16'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO16'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO16'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB16'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA17'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA17'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA17'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO17'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO17'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB17'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA18'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA18'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA18'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO18'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO18'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB18'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA19'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA19'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA19'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO19'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO19'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB19'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA20'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA20'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA20'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO20'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO20'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB20'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA21'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA21'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA21'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO21'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO21'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB21'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA22'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA22'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA22'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO22'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO22'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB22'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA23'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA23'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA23'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO23'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO23'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB23'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA24'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA24'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA24'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO24'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO24'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB24'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA25'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA25'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA25'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO25'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO25'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB25'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS'
        DataType = ftFloat
      end
      item
        Name = 'SALPART'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALORMARGEM1'
        DataType = ftFloat
      end
      item
        Name = 'VALORMARGEM2'
        DataType = ftFloat
      end
      item
        Name = 'EMPREGADO_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PAGINA_2'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO_2'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CARGO_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CGC_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CPF_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'PIS_2'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NUMCONTASALARIO_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMAGENCIA_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NUMBANCO_2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODCENTROCUSTO_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPOCONTRATO_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMDEPIRRF_2'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPSALF_2'
        DataType = ftFloat
      end
      item
        Name = 'NATUREZA_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'CODRUBRICA1_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA1_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA1_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB1_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA2_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA2_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA2_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO2_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO2_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB2_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA3_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA3_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA3_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO3_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO3_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB3_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA4_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA4_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA4_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO4_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO4_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB4_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA5_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA5_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA5_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO5_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO5_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB5_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA6_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA6_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA6_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO6_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO6_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB6_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA7_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA7_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA7_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO7_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO7_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB7_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA8_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA8_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA8_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO8_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO8_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB8_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA9_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA9_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA9_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO9_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO9_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB9_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA10_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA10_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA10_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO10_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO10_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB10_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA11_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA11_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA11_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO11_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO11_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB11_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA12_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA12_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA12_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO12_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO12_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB12_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA13_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA13_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA13_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO13_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO13_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB13_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA14_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA14_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA14_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO14_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO14_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB14_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA15_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA15_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA15_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO15_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO15_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB15_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA16_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA16_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA16_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO16_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO16_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB16_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA17_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA17_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA17_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO17_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO17_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB17_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA18_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA18_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA18_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO18_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO18_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB18_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA19_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA19_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA19_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO19_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO19_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB19_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA20_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA20_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA20_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO20_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO20_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB20_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA21_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA21_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA21_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO21_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO21_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB21_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA22_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA22_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA22_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO22_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO22_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB22_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA23_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA23_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA23_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO23_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO23_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB23_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA24_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA24_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA24_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO24_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO24_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB24_2'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA25_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'RUBRICA25_2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'REFERENCIA25_2'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTO25_2'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTO25_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORRUB25_2'
        DataType = ftFloat
      end
      item
        Name = 'SALBASE_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEINSS_2'
        DataType = ftFloat
      end
      item
        Name = 'SALPART_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEFGTS_2'
        DataType = ftFloat
      end
      item
        Name = 'FGTSMES_2'
        DataType = ftFloat
      end
      item
        Name = 'BASEIRRF_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROVENTOS_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_DESCONTOS_2'
        DataType = ftFloat
      end
      item
        Name = 'TOT_GERAL_2'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VALORMARGEM1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORMARGEM2_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORBRUTO1_2'
        DataType = ftFloat
      end
      item
        Name = 'VALORBRUTO2_2'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IndicePrimario'
        Fields = 'EMPRESA;EMPREGADO'
      end>
    Params = <>
    StoreDefs = True
    Left = 880
    Top = 16
  end
  object sqlReciboCedidos: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'S'#39' AS SELECIONADO,'
      '       B.IDBENEFHABILITA,'
      '       B.NUMEROPROCESSO,'
      '       B.EVENTOGERADOR,'
      '       (SELECT MATRICULA'
      '          FROM DEPENTIT'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MATRICULA,'
      
        '       (SELECT NOME FROM PESSOA WHERE IDPESSOA = B.IDPESSOA) AS ' +
        'NOME,'
      '       (SELECT DISTINCT DATAMORTE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA IN'
      
        '               (SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = I' +
        'DTITULAR)'
      '           AND IDPESSOA = B.IDPESSOA) AS DATAMORTE,'
      '       TEMP.IDPLANOPREV,'
      '       TEMP.IDSITPART,'
      '       TEMP.IDSITFUNC,'
      '       TEMP.IDPESSJUR, '
      '       TEMP.IDSITPLANOPREV,'
      '       TEMP.SEQPROPOSTA,'
      '       TEMP.INSCRICAONUMERO AS INSCNUMERO,'
      '       B.IDBENEFICIO,'
      '       (SELECT NUMPROCINSS'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS NUMBENEFICIO,'
      '       B.IDPESSOA,'
      '       B.IDTITULAR,'
      
        '       DECODE(B.IDTITULAR, B.IDPESSOA, '#39'APOSENTADO'#39', '#39'PENSIONIST' +
        'A'#39') AS TIPO,'
      
        '       (SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = B.IDBENEF' +
        'ICIO) AS BENEFICIO,'
      '       DIB AS "DATA DO EVENTO",'
      '       DIB,'
      '       DIP,'
      '       (SELECT DIBBENEFANT'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS DIBANT,'
      '       (SELECT TEMP.RMI'
      '          FROM (SELECT IDPESSOA, IDBENEFICIO, RMREAJ AS RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS RMI,'
      '       (SELECT TEMP.DTINICIOCRED'
      
        '          FROM (SELECT IDPESSOA, IDBENEFICIO,DTINICIOCRED, RMREA' +
        'J AS RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS DTINICIOCRED,'
      
        '       (DECODE(B.FLGREQUERIMENTO, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO'#39')) AS' +
        ' BENEFREQ,'
      
        '       (SELECT CODBENEFICIO FROM BENEFICIO WHERE IDBENEFICIO = B' +
        '.IDBENEFICIO) AS ESPECIE,'
      
        '       (DECODE((SELECT CODBENEFICIO FROM BENEFICIO WHERE IDBENEF' +
        'ICIO = B.IDBENEFICIO),92,'#39'SIM'#39','#39'NAO'#39')) AS ISENTOIRRF,'
      '       DATAREQUERIMENTO,'
      '       NUMBENEFICIO,'
      
        '       (SELECT DECODE(FLGMOLESTIAGRAVE, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO' +
        #39')'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MOLESTIA,'
      '       (SELECT DATAMOLESTIAGRAVE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA) AS DATAINICIO,'
      
        '       (SELECT DATAFIMMOLESTIA FROM PESSOAFISICA WHERE IDPESSOA ' +
        '= B.IDPESSOA) AS DATAFIM'
      '  FROM BENEFHABILITA B,       '
      '       (SELECT D.IDPESSOA,'
      '               D.IDTITULAR,'
      '               P.NOME,'
      '               P.NUMDOCUMENTO,'
      '               PF.DATANASC,'
      '               EL.IDSITFUNC,'
      '               EL.IDPESSJUR,'
      
        '               DECODE(D.MATRICULA, DT.MATRICULA, '#39#39', D.MATRICULA' +
        ') MATRICULADEP,'
      '               DT.MATRICULA AS MATRICULATITULAR,'
      '               (SELECT NVL(BF.IDPLANOPREV, PP.IDPLANOPREV)'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDPLANOPREV,'
      '               '
      '               (SELECT IDSITPART'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1--A'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPART,'
      '               '
      '               (SELECT IDSITPLANOPREV'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --   AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPLANOPREV,'
      '               '
      '               (SELECT PP.SEQPROPOSTA'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) SEQPROPOSTA,'
      '               '
      '               (SELECT PP.INSCRICAONUMERO'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) INSCRICAONUMERO'
      '        '
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P'
      '            ON D.IDPESSOA = P.IDPESSOA'
      '          JOIN PESSOAFISICA PF'
      '            ON D.IDPESSOA = PF.IDPESSOA'
      '          JOIN DEPENTIT DT'
      '            ON D.IDTITULAR = DT.IDPESSOA'
      '           AND D.IDTITULAR = DT.IDTITULAR'
      '          JOIN ELEGPATRO EL'
      '            ON EL.IDPESSOA = D.IDPESSOA'
      '        -- WHERE D.IDPESSOA = B.IDPESSOA'
      '        --   AND D.IDTITULAR = B.IDTITULAR) TEMP'
      '        ) TEMP'
      ''
      ' WHERE TEMP.IDPESSOA = B.IDPESSOA'
      '   AND TEMP.IDTITULAR = B.IDTITULAR'
      '   AND B.FLGREQUERIMENTO = 1'
      '   AND B.FLGCONCESSAO = 1'
      '   AND B.IDTITULAR = B.IDPESSOA ---TRAVA'
      '      --  AND B.IDPESSOA = 386679')
    ClientDataSet = CdsReciboCedidos
    Left = 880
    Top = 50
  end
  object qryDETCONCINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 577
    Top = 50
  end
  object qryRubricaxInss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 681
    Top = 18
  end
  object qryAux3: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 557
    Top = 18
  end
  object qryAux4: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 589
    Top = 18
  end
  object arPreview: TppArchiveReader
    AllowPrintToFile = True
    DeviceType = 'Screen'
    SuppressOutline = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 913
    Top = 18
    Version = '7.04'
  end
  object QExport3PDF1: TQExport3PDF
    About = '(Sobre - Planus - Exportação de Dados)'
    _Version = '3.36'
    Options.PageOptions.MarginLeft = 1.17
    Options.PageOptions.MarginRight = 0.57
    Options.PageOptions.MarginTop = 0.78
    Options.PageOptions.MarginBottom = 0.78
    Left = 1197
    Top = 49
  end
  object qeCustomSource1: TqeCustomSource
    Columns = <>
    Left = 1165
    Top = 49
  end
  object ExtraOptions1: TExtraOptions
    About = 'TExtraDevices 3.00'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.FastCompression = False
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf24bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppModify, ppCopy, ppModifyAnnot]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 913
    Top = 49
  end
  object qryDetRel: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 773
    Top = 18
    object qryDetRelSELECIONADO: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qryDetRelNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetRelNUMBENEFICIO: TStringField
      DisplayLabel = 'Número Benefício'
      DisplayWidth = 15
      FieldName = 'NUMBENEFICIO'
      Size = 15
    end
    object qryDetRelESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryDetRelBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryDetRelRMI: TFloatField
      DisplayWidth = 10
      FieldName = 'RMI'
    end
    object qryDetRelDatadoEvento: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Data do Evento'
    end
    object qryDetRelDIB: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIB'
    end
    object qryDetRelDIP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIP'
    end
    object qryDetRelDIBANT: TDateTimeField
      DisplayLabel = 'DIB Anterior'
      DisplayWidth = 18
      FieldName = 'DIBANT'
    end
    object qryDetRelDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de Requerimento'
      DisplayWidth = 18
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDetRelMOLESTIA: TStringField
      DisplayLabel = 'Moléstia'
      DisplayWidth = 3
      FieldName = 'MOLESTIA'
      Size = 3
    end
    object qryDetRelDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
    end
    object qryDetRelDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 18
      FieldName = 'DATAFIM'
    end
    object qryDetRelBENEFREQ: TStringField
      DisplayLabel = 'Benefício Requerido'
      DisplayWidth = 3
      FieldName = 'BENEFREQ'
      Size = 3
    end
    object qryDetRelIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetRelIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetRelDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Visible = False
    end
    object qryDetRelIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryDetRelIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryDetRelIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetRelIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
      Visible = False
    end
    object qryDetRelINSCNUMERO: TFloatField
      FieldName = 'INSCNUMERO'
      Visible = False
    end
    object qryDetRelSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetRelIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetRelTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      Size = 11
    end
    object qryDetRelIDBENEFHABILITA: TFloatField
      FieldName = 'IDBENEFHABILITA'
      Visible = False
    end
    object qryDetRelIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetReleventogerador: TFloatField
      FieldName = 'eventogerador'
      Visible = False
    end
    object qryDetRelnumeroprocesso: TFloatField
      FieldName = 'numeroprocesso'
      Visible = False
    end
    object qryDetRelISENTOIRRF: TStringField
      FieldName = 'ISENTOIRRF'
      Visible = False
      Size = 3
    end
    object qryDetRelFLGREQUERIMENTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FLGREQUERIMENTO'
      Visible = False
      Calculated = True
    end
    object qryDetRelIdplanprevcontab: TFloatField
      FieldName = 'Idplanprevcontab'
    end
    object qryDetRelMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#39'S'#39' AS SELECIONADO,'
      '       BH.IDBENEFHABILITA,'
      '       BH.NUMEROPROCESSO,'
      '       BH.EVENTOGERADOR,'
      '       BH.FLGREQUERIMENTO,'
      '       BH.FLGSENTENCAJUDICIAL, '
      '       BH.NUMBRDP, BH.ESTADO, BH.NUP, BH.DEC, '
      
        '       '#39'Usuario'#39' NOMEUSUARIO,                                   ' +
        '                         '
      '       0 VALORTOTAL,                    '
      '      '#39'Normal'#39' SITBENEFICIO,                     '
      '       '#39'00000'#39' MATRICULA,'
      '       BH.FLGPAGAINSS, '
      '       BH.BENEFLEI142, '
      '       BH.TEMPOSERVICOANOS, '
      '       BH.TEMPOSERVICOMES,  '
      '       BH.TEMPOSERVICODIAS, '
      '       BH.INDICEREAJUSTETETO, '
      '       BH.PERCENTUALINSS,     '
      '       BH.DEC,  '
      '       PFTIT.DATAMORTE DATAMORTETIT, '
      
        ' (DECODE(BH.FLGPAGAINSS, 1, '#39'Não'#39', 0, '#39'Sim'#39', '#39'Sim'#39')) AS FLGPAGAI' +
        'NSS_SN,'
      
        ' (DECODE(BH.BENEFLEI142, 0, '#39'Não'#39', 1, '#39'Sim'#39', '#39'Não'#39')) AS BENEFLEI' +
        '142_SN,'
      '       P.NOME,'
      '       PF.DATAMORTE,'
      '       0 IDPLANOPREV,'
      '       0 IDSITPART,'
      '       0 IDSITFUNC,'
      '       0 IDPESSJUR, '
      '       0 IDSITPLANOPREV,'
      '       0 SEQPROPOSTA,'
      '       0 INSCNUMERO,'
      '       BH.IDBENEFICIO,'
      '       BH.NUMBENEFICIO,'
      '       BH.IDPESSOA,'
      '       BH.IDTITULAR,'
      
        '       DECODE(BH.IDTITULAR, BH.IDPESSOA, '#39'APOSENTADO'#39', '#39'PENSIONI' +
        'STA'#39') AS TIPO,'
      '       B.NOME BENEFICIO,'
      '       BH.DIB "DATA DO EVENTO",'
      '       BH.DIB,'
      '       BH.DIP,'
      '       (SELECT BF.DIBBENEFANT'
      '        FROM BENEFBFCIARIO BF'
      '        WHERE BF.IDTITULAR = BH.IDTITULAR'
      '          AND BF.IDPESSOA = BH.IDPESSOA'
      '          AND BF.FONTEPAGADORA = 2'
      '          AND ROWNUM = 1) AS DIBANT,'
      '       0  RMI,'
      '       0 RMIREAJ,'
      '       0 VALORATUAL, '
      
        '       (DECODE(BH.FLGREQUERIMENTO, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO'#39')) A' +
        'S BENEFREQ,'
      '       B.CODBENEFICIO ESPECIE,'
      '       DECODE(B.CODBENEFICIO,92,'#39'SIM'#39','#39'NÃO'#39') ISENTOIRRF,'
      '       BH.DATAREQUERIMENTO,'
      '       DECODE(PF.FLGMOLESTIAGRAVE,1,'#39'SIM'#39','#39'NAO'#39') MOLESTIA,'
      '       PF.DATAMOLESTIAGRAVE DATAINICIO,'
      '       PF.DATAFIMMOLESTIA DATAFIM,'
      '       0 IDPLANPREVCONTAB,'
      '       BH.NUP,'
      '       P.NUMDOCUMENTO AS CPF,'
      '      '#39'Nomeplano'#39' NOMEPLANOPREV,        '
      '      '#39'SitPlano'#39' SITPLANO,'
      ''
      '       (SELECT P.NOME'
      '          FROM BENEFBFCIARIO BF'
      
        '          LEFT JOIN PERFILINVEST P ON P.IDPERFILINVEST = BF.IDPE' +
        'RFILINVEST'
      '         WHERE BF.FONTEPAGADORA = 2'
      '           AND BF.IDBENEFICIO = BH.IDBENEFICIO'
      '           AND BF.IDTITULAR = BH.IDTITULAR'
      '           AND BF.IDPESSOA = BH.IDPESSOA'
      '           AND ROWNUM = 1'
      '       ) NOMEPERFIL,'
      ''
      '       0 AS IDPERFILINVEST ,b.ideventogerador, BB.DATAFINAL'
      ''
      'FROM BENEFHABILITA BH'
      
        '     JOIN BENEFBFCIARIO BB ON BH.NUMEROPROCESSO = BB.NUMEROPROCE' +
        'SSO'
      '                              AND BH.IDPESSOA = BB.IDPESSOA AND'
      '                             BH.IDTITULAR = BB.IDTITULAR '
      '                             AND BB.IDSITBENEFICIO = 4     '
      '     JOIN DEPENTIT D ON BH.IDPESSOA = D.IDPESSOA AND'
      '                        BH.IDTITULAR = D.IDTITULAR  '
      '     JOIN PESSOA P ON BH.IDPESSOA = P.IDPESSOA'
      '     JOIN PESSOAFISICA PF ON BH.IDPESSOA = PF.IDPESSOA'
      '     JOIN BENEFICIO B ON BH.IDBENEFICIO = B.IDBENEFICIO'
      
        '     LEFT JOIN PESSOAFISICA PFTIT ON BH.IDTITULAR = PFTIT.IDPESS' +
        'OA  '
      '    '
      'WHERE '
      ' 1 = 2'
      ''
      '/*'
      'SELECT '#39'N'#39' AS SELECIONADO,'
      '       B.IDBENEFHABILITA,'
      '       B.NUMEROPROCESSO,'
      '       B.EVENTOGERADOR,  '
      '       B.NUP, '
      '      --SIG26527 -INICIO'
      '       B.NUMBRDP,'
      '       B.PERCENTUALINSS,'
      '       B.INDICEREAJUSTETETO,'
      '       B.ESTADO,'
      '       B.DEC,'
      '       B.TEMPOSERVICOANOS,'
      '       B.TEMPOSERVICOMES,'
      '       B.TEMPOSERVICODIAS,'
      '       B.FLGSENTENCAJUDICIAL, '
      '       B.BENEFLEI142,'
      '       B.FLGPAGAINSS,'#9'  '
      '       --SIG26527 -FIM  '
      '       '#39#39' AS SITPLANO,'
      '      B.RMI AS VALORATUAL, '
      
        '(SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = B.IDPESSOA) AS' +
        ' CPF,'
      
        '       (SELECT NOME FROM PLANPREV WHERE PLANPREV.IDPLANOPREV = T' +
        'EMP.IDPLANOPREV) AS NOMEPLANOPREV,'
      '  '
      '(SELECT IDEMPRESA FROM BENEFPLANPREV'
      'where '
      '     IDPLANOPREV=TEMP.IDPLANOPREV AND     '
      '     IDBENEFICIO=B.IDBENEFICIO )AS IDEMPRESA,       '
      '       (SELECT MATRICULA'
      '          FROM DEPENTIT'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MATRICULA,'
      
        '       (SELECT NOME FROM PESSOA WHERE IDPESSOA = B.IDPESSOA) AS ' +
        'NOME,'
      '       (SELECT DISTINCT DATAMORTE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA IN'
      
        '               (SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = I' +
        'DTITULAR)'
      '           AND IDPESSOA = B.IDPESSOA) AS DATAMORTE,'
      '       TEMP.IDPLANOPREV,'
      '       TEMP.IDSITPART,'
      '       TEMP.IDSITFUNC,'
      '       TEMP.IDPESSJUR, '
      '       TEMP.IDSITPLANOPREV,'
      '       TEMP.SEQPROPOSTA,'
      '       TEMP.INSCRICAONUMERO AS INSCNUMERO,'
      '       B.IDBENEFICIO,'
      '       (SELECT NUMPROCINSS'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS NUMBENEFICIO,'
      '       B.IDPESSOA,'
      '       B.IDTITULAR,'
      
        '       DECODE(B.IDTITULAR, B.IDPESSOA, '#39'APOSENTADO'#39', '#39'PENSIONIST' +
        'A'#39') AS TIPO,'
      
        '       (SELECT NOME FROM BENEFICIO WHERE IDBENEFICIO = B.IDBENEF' +
        'ICIO) AS BENEFICIO,'
      '       DIB AS "DATA DO EVENTO",'
      '       DIB,'
      '       DIP,'
      '       (SELECT DIBBENEFANT'
      '          FROM BENEFBFCIARIO'
      '         WHERE IDTITULAR = B.IDTITULAR'
      '           AND IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS DIBANT,'
      '       (SELECT TEMP.RMI'
      '          FROM (SELECT IDPESSOA, IDBENEFICIO, RMREAJ AS RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS RMI,'
      '           '
      ' (SELECT TEMP.IDRUBRICA'
      
        '          FROM (SELECT IDRUBRICA,IDPESSOA, IDBENEFICIO, RMREAJ A' +
        'S RMI'
      '                  FROM DETCONCINSS'
      
        '                 WHERE DTINICIOCRED = '#39'01'#39' || SUBSTR(DTINICIOCRE' +
        'D, 4, 7)'
      '                   AND DTFIMCRED ='
      '                       TO_DATE('#39'01/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      '                                      '#39'01'#39','
      
        '                                      SUBSTR(DTINICIOCRED, 4, 2)' +
        ' + 1) || '#39'/'#39' ||'
      
        '                               DECODE(SUBSTR(DTINICIOCRED, 4, 2)' +
        ','
      '                                      12,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ' + 1,'
      
        '                                      SUBSTR(DTINICIOCRED, 7, 4)' +
        ')) - 1'
      '                 ORDER BY IDPESSOA, DTINICIOCRED) TEMP'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND IDBENEFICIO = B.IDBENEFICIO'
      '           AND ROWNUM = 1) AS IDRUBRICA,           '
      '           '
      
        '       (DECODE(B.FLGREQUERIMENTO, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO'#39')) AS' +
        ' BENEFREQ,'
      
        '       (SELECT CODBENEFICIO FROM BENEFICIO WHERE IDBENEFICIO = B' +
        '.IDBENEFICIO) AS ESPECIE,'
      '       DATAREQUERIMENTO,'
      '       NUMBENEFICIO,'
      
        '       (SELECT DECODE(FLGMOLESTIAGRAVE, 0, '#39'NAO'#39', 1, '#39'SIM'#39', '#39'NAO' +
        #39')'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA'
      '           AND ROWNUM = 1) AS MOLESTIA,'
      '       (SELECT DATAMOLESTIAGRAVE'
      '          FROM PESSOAFISICA'
      '         WHERE IDPESSOA = B.IDPESSOA) AS DATAINICIO,'
      
        '       (SELECT DATAFIMMOLESTIA FROM PESSOAFISICA WHERE IDPESSOA ' +
        '= B.IDPESSOA) AS DATAFIM'
      '  FROM BENEFHABILITA B,       '
      '       (SELECT D.IDPESSOA,'
      '               D.IDTITULAR,'
      '               P.NOME,'
      '               P.NUMDOCUMENTO,'
      '               PF.DATANASC,'
      '               EL.IDSITFUNC,'
      '               EL.IDPESSJUR,'
      
        '               DECODE(D.MATRICULA, DT.MATRICULA, '#39#39', D.MATRICULA' +
        ') MATRICULADEP,'
      '               DT.MATRICULA AS MATRICULATITULAR,'
      '               (SELECT NVL(BF.IDPLANOPREV, PP.IDPLANOPREV)'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDPLANOPREV,'
      '               '
      '               (SELECT IDSITPART'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1--A'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPART,'
      '               '
      '               (SELECT IDSITPLANOPREV'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --   AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) IDSITPLANOPREV,'
      '               '
      '               (SELECT PP.SEQPROPOSTA'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --      AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) SEQPROPOSTA,'
      '               '
      '               (SELECT PP.INSCRICAONUMERO'
      '                  FROM PARTPREVPLAN PP'
      '                  LEFT JOIN BENEFBFCIARIO BF'
      '                    ON PP.IDPESSOA = BF.IDTITULAR'
      '                      --       AND BF.IDPESSOA = 386679'
      '                   AND BF.IDTPPAGTOBENEFIC = 1'
      '                   AND BF.FONTEPAGADORA = 1'
      '                   AND BF.IDSITBENEFICIO = 1'
      '                   AND (BF.IDPLANPREVCONTAB = 28 OR'
      '                       (BF.IDPLANPREVCONTAB <> 28 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM BENEFBFCIARIO BF1'
      '                           WHERE BF1.IDTPPAGTOBENEFIC = 1'
      '                             AND BF1.FONTEPAGADORA = 1'
      '                             AND BF1.IDPLANPREVCONTAB = 28'
      '                             AND BF1.IDSITBENEFICIO = 1'
      '                             AND BF1.IDTITULAR = BF.IDTITULAR'
      '                             AND BF1.IDPESSOA = BF.IDPESSOA)))'
      '                 WHERE PP.IDPESSOA = D.IDTITULAR'
      
        '                   AND (PP.IDSITPLANOPREV IN (25, 26, 27, 28, 29' +
        ') OR'
      
        '                       (PP.IDSITPLANOPREV NOT IN (25, 26, 27, 28' +
        ', 29) AND'
      '                       PP.FLGDESATIVADO = 0 AND NOT EXISTS'
      '                        (SELECT 1'
      '                            FROM PARTPREVPLAN PPP1'
      '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA'
      
        '                             AND PPP1.IDSITPLANOPREV IN (25, 26,' +
        ' 27, 28, 29))))'
      '                   AND ROWNUM = 1) INSCRICAONUMERO'
      '        '
      '          FROM DEPENTIT D'
      '          JOIN PESSOA P'
      '            ON D.IDPESSOA = P.IDPESSOA'
      '          JOIN PESSOAFISICA PF'
      '            ON D.IDPESSOA = PF.IDPESSOA'
      '          JOIN DEPENTIT DT'
      '            ON D.IDTITULAR = DT.IDPESSOA'
      '           AND D.IDTITULAR = DT.IDTITULAR'
      '          JOIN ELEGPATRO EL'
      '            ON EL.IDPESSOA = D.IDPESSOA'
      '        -- WHERE D.IDPESSOA = B.IDPESSOA'
      '        --   AND D.IDTITULAR = B.IDTITULAR) TEMP'
      '        ) TEMP'
      ''
      ' WHERE TEMP.IDPESSOA = B.IDPESSOA'
      '   AND TEMP.IDTITULAR = B.IDTITULAR'
      '   AND B.FLGREQUERIMENTO = 0'
      '   AND B.IDTITULAR = B.IDPESSOA ---TRAVA'
      '      --  AND B.IDPESSOA = 386679'
      '   AND EXISTS (SELECT *'
      '          FROM HISTBENEFHABILITA HB,'
      '               (SELECT BH.IDBENEFHABILITA,'
      '                       BH.IDPESSOA,'
      '                       MAX(HB.DATAREGISTRO) AS DATAREGISTRO'
      '                  FROM BENEFHABILITA BH, HISTBENEFHABILITA HB'
      '                 WHERE BH.IDBENEFHABILITA = HB.IDBENEFHABILITA'
      
        '                 GROUP BY BH.IDBENEFHABILITA, BH.IDPESSOA) MAXDA' +
        'TA'
      '         WHERE MAXDATA.DATAREGISTRO = HB.DATAREGISTRO'
      '           AND MAXDATA.IDBENEFHABILITA = HB.IDBENEFHABILITA'
      '           AND MAXDATA.IDPESSOA = B.IDPESSOA'
      '           AND EXISTS (SELECT *'
      '                  FROM SITHABILITACAOINSS SIT'
      '                 WHERE HB.IDSITHABILITACAO ='
      '                     SIT.IDSITHABILITACAO))'
      ''
      '*/'
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 465
    Top = 18
    object qryDetSELECIONADO: TStringField
      DisplayLabel = 'S'
      DisplayWidth = 1
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qryDetMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryDetNUMBENEFICIO: TStringField
      DisplayLabel = 'Número Benefício'
      DisplayWidth = 15
      FieldName = 'NUMBENEFICIO'
      Size = 15
    end
    object qryDetESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Size = 6
    end
    object qryDetBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 60
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryDetSITBENEFICIO: TStringField
      DisplayLabel = 'Sit. do ~Benefício'
      DisplayWidth = 12
      FieldName = 'SITBENEFICIO'
      FixedChar = True
      Size = 6
    end
    object qryDetRMI: TFloatField
      DisplayWidth = 10
      FieldName = 'RMI'
    end
    object qryDetDatadoEvento: TDateTimeField
      DisplayWidth = 18
      FieldName = 'Data do Evento'
    end
    object qryDetDIB: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIB'
    end
    object qryDetDIP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIP'
    end
    object qryDetDIBANT: TDateTimeField
      DisplayLabel = 'DIB Anterior'
      DisplayWidth = 18
      FieldName = 'DIBANT'
    end
    object qryDetDATAREQUERIMENTO: TDateTimeField
      DisplayLabel = 'Data de Requerimento'
      DisplayWidth = 18
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDetMOLESTIA: TStringField
      DisplayLabel = 'Moléstia'
      DisplayWidth = 6
      FieldName = 'MOLESTIA'
      Size = 3
    end
    object qryDetDATAINICIO: TDateTimeField
      DisplayLabel = 'Data Início'
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
    end
    object qryDetDATAFIM: TDateTimeField
      DisplayLabel = 'Data Fim'
      DisplayWidth = 18
      FieldName = 'DATAFIM'
    end
    object qryDetBENEFREQ: TStringField
      DisplayLabel = 'Benefício Requerido'
      DisplayWidth = 16
      FieldName = 'BENEFREQ'
      Size = 3
    end
    object qryDetIdplanprevcontab: TFloatField
      DisplayLabel = 'Plano ~Contábil'
      DisplayWidth = 14
      FieldName = 'Idplanprevcontab'
    end
    object qryDetNUP: TStringField
      DisplayWidth = 17
      FieldName = 'NUP'
      Size = 17
    end
    object qryDetCPF: TStringField
      DisplayWidth = 18
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object qryDetNOMEPLANOPREV: TStringField
      DisplayLabel = 'Plano ~Previdenciário'
      DisplayWidth = 20
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
    object qryDetSITPLANO: TStringField
      DisplayLabel = 'Situação ~no Plano'
      DisplayWidth = 20
      FieldName = 'SITPLANO'
      Size = 200
    end
    object qryDetVALORTOTAL: TFloatField
      DisplayLabel = 'Valor ~Total'
      DisplayWidth = 11
      FieldName = 'VALORTOTAL'
    end
    object qryDetNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário que ~Homologou'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 7
    end
    object qryDetVALORATUAL: TFloatField
      DisplayWidth = 11
      FieldName = 'VALORATUAL'
      Visible = False
    end
    object qryDetFLGSENTENCAJUDICIAL: TFloatField
      DisplayWidth = 20
      FieldName = 'FLGSENTENCAJUDICIAL'
      Visible = False
    end
    object qryDetESTADO: TStringField
      DisplayWidth = 7
      FieldName = 'ESTADO'
      Visible = False
      Size = 2
    end
    object qryDetNUMBRDP: TStringField
      DisplayWidth = 15
      FieldName = 'NUMBRDP'
      Visible = False
      Size = 15
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
      Visible = False
    end
    object qryDetIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Visible = False
    end
    object qryDetIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDSITPLANOPREV: TFloatField
      FieldName = 'IDSITPLANOPREV'
      Visible = False
    end
    object qryDetINSCNUMERO: TFloatField
      FieldName = 'INSCNUMERO'
      Visible = False
    end
    object qryDetSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      Size = 11
    end
    object qryDetIDBENEFHABILITA: TFloatField
      FieldName = 'IDBENEFHABILITA'
      Visible = False
    end
    object qryDetIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDeteventogerador: TFloatField
      FieldName = 'eventogerador'
      Visible = False
    end
    object qryDetnumeroprocesso: TFloatField
      FieldName = 'numeroprocesso'
      Visible = False
    end
    object qryDetISENTOIRRF: TStringField
      FieldName = 'ISENTOIRRF'
      Visible = False
      Size = 3
    end
    object qryDetFLGREQUERIMENTO: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FLGREQUERIMENTO'
      Visible = False
      Calculated = True
    end
    object qryDetFLGPAGAINSS: TFloatField
      FieldName = 'FLGPAGAINSS'
      Visible = False
    end
    object qryDetBENEFLEI142: TFloatField
      FieldName = 'BENEFLEI142'
      Visible = False
    end
    object qryDetTEMPOSERVICOANOS: TFloatField
      FieldName = 'TEMPOSERVICOANOS'
      Visible = False
    end
    object qryDetTEMPOSERVICOMES: TFloatField
      FieldName = 'TEMPOSERVICOMES'
      Visible = False
    end
    object qryDetTEMPOSERVICODIAS: TFloatField
      FieldName = 'TEMPOSERVICODIAS'
      Visible = False
    end
    object qryDetINDICEREAJUSTETETO: TFloatField
      FieldName = 'INDICEREAJUSTETETO'
      Visible = False
    end
    object qryDetPERCENTUALINSS: TFloatField
      FieldName = 'PERCENTUALINSS'
      Visible = False
    end
    object qryDetDEC: TDateTimeField
      FieldName = 'DEC'
      Visible = False
    end
    object qryDetDATAMORTETIT: TDateTimeField
      FieldName = 'DATAMORTETIT'
      Visible = False
    end
    object qryDetFLGPAGAINSS_SN: TStringField
      FieldName = 'FLGPAGAINSS_SN'
      Visible = False
    end
    object qryDetBENEFLEI142_SN: TStringField
      FieldName = 'BENEFLEI142_SN'
      Visible = False
    end
    object qryDetNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Visible = False
      Size = 60
    end
    object qryDetIDPERFILINVEST: TFloatField
      FieldName = 'IDPERFILINVEST'
    end
    object qryDetideventogerador: TFloatField
      DisplayWidth = 10
      FieldName = 'ideventogerador'
      Visible = False
    end
    object qryDetDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryDetRMIREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'RMIREAJ'
      Visible = False
    end
  end
  object qrydetconcaux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  '#39'N'#39' as SELECIONADO,1 as  "matricula" from dual')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 513
    Top = 50
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'select  '#39'                                                  '#39' mes' +
        'ano, '#39'                                                  '#39' mesref' +
        'erencia, '#39'                                                  '#39' me' +
        'sreembolso , 0 pagar, 0 descontar ,'#39'                            ' +
        '                     '#39' planocontabil'
      'from dual')
    UpdateObject = UpdDetalhe
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 393
    Top = 18
    object qryDetalhemesano: TStringField
      FieldName = 'mesano'
      Size = 15
    end
    object qryDetalhemesreferencia: TStringField
      FieldName = 'mesreferencia'
      Size = 50
    end
    object qryDetalhemesreembolso: TStringField
      FieldName = 'mesreembolso'
      Size = 50
    end
    object qryDetalhepagar: TFloatField
      FieldName = 'pagar'
    end
    object qryDetalhedescontar: TFloatField
      FieldName = 'descontar'
    end
    object qryDetalheplanocontabil: TStringField
      DisplayWidth = 50
      FieldName = 'planocontabil'
      Size = 50
    end
  end
  object dsDetalhe: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe
    Left = 396
    Top = 80
  end
  object ppDetalhe: TppBDEPipeline
    DataSource = dsDetalhe
    UserName = 'Detalhe'
    Left = 1041
    Top = 49
    object ppDetalheppField6: TppField
      FieldAlias = 'mesano'
      FieldName = 'mesano'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDetalheppField1: TppField
      FieldAlias = 'mesreferencia'
      FieldName = 'mesreferencia'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField2: TppField
      FieldAlias = 'mesreembolso'
      FieldName = 'mesreembolso'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField3: TppField
      FieldAlias = 'pagar'
      FieldName = 'pagar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField4: TppField
      FieldAlias = 'descontar'
      FieldName = 'descontar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField5: TppField
      FieldAlias = 'planocontabil'
      FieldName = 'planocontabil'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object UpdDetalhe: TUpdateSQL
    Left = 394
    Top = 50
  end
  object qryDetalhe2: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'select  '#39'                                                  '#39' mes' +
        'ano, '#39'                                                  '#39' mesref' +
        'erencia, '#39'                                                  '#39' me' +
        'sreembolso , 0 pagar, 0 descontar ,'#39'                            ' +
        '                      '#39' planocontabil'
      'from dual')
    UpdateObject = UpdDetalhe2
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 805
    Top = 18
    object qryDetalhe2mesano: TStringField
      FieldName = 'mesano'
      Size = 15
    end
    object qryDetalhe2mesreferencia: TStringField
      FieldName = 'mesreferencia'
      Size = 50
    end
    object qryDetalhe2mesreembolso: TStringField
      FieldName = 'mesreembolso'
      Size = 50
    end
    object qryDetalhe2pagar: TFloatField
      FieldName = 'pagar'
    end
    object qryDetalhe2descontar: TFloatField
      FieldName = 'descontar'
    end
    object qryDetalhe2planocontabil: TStringField
      DisplayWidth = 50
      FieldName = 'planocontabil'
      Size = 50
    end
  end
  object dsDetalhe2: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe2
    Left = 804
    Top = 84
  end
  object ppDetalhe2: TppBDEPipeline
    DataSource = dsDetalhe2
    UserName = 'ppDetalhe2'
    Left = 1101
    Top = 49
    object ppField1: TppField
      FieldAlias = 'mesano'
      FieldName = 'mesano'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'mesreferencia'
      FieldName = 'mesreferencia'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'mesreembolso'
      FieldName = 'mesreembolso'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'pagar'
      FieldName = 'pagar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppField5: TppField
      FieldAlias = 'descontar'
      FieldName = 'descontar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppField6: TppField
      FieldAlias = 'planocontabil'
      FieldName = 'planocontabil'
      FieldLength = 50
      DisplayFormat = '50'
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object UpdDetalhe2: TUpdateSQL
    Left = 806
    Top = 50
  end
end
