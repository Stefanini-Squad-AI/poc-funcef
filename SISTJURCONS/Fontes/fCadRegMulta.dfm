inherited frmCadRegMulta: TfrmCadRegMulta
  Left = 341
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Informações Sobre Multa Associada a Esta Etapa'
  ClientHeight = 353
  ClientWidth = 571
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 571
    Height = 314
    BorderWidth = 2
    object PageControl: TPageControl
      Left = 2
      Top = 2
      Width = 567
      Height = 310
      ActivePage = tbshCondicoes
      Align = alClient
      TabOrder = 0
      OnChange = PageControlChange
      object tbshCondicoes: TTabSheet
        Caption = 'Condições'
        object Label17: TLabel
          Left = 222
          Top = 4
          Width = 115
          Height = 13
          Caption = 'Valor Base da Multa'
        end
        object Label9: TLabel
          Left = 10
          Top = 4
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object lblMultaPaga: TLabel
          Left = 366
          Top = 21
          Width = 182
          Height = 16
          Caption = 'Multa Consta Como Paga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          Visible = False
        end
        object dbredValorMulta: TDBRealEdit
          Left = 222
          Top = 20
          Width = 115
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          WordWrap = False
          IntDigits = 15
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
          DataField = 'VALORMULTA'
          DataSource = dsEtapa
        end
        object dbrgIndMulta: TDBRadioGroup
          Left = 10
          Top = 56
          Width = 538
          Height = 208
          Caption = 'Valor Informado Acima Refere-se a'
          Columns = 2
          DataField = 'INDMULTA'
          DataSource = dsEtapa
          Items.Strings = (
            '% Diário s/ Causa'
            '% Mensal s/ Causa'
            '% Único s/ Causa'
            '% Diário s/ Estim. Original'
            '% Mensal s/ Estim. Original'
            '% Único s/ Estim. Original'
            '% Diário s/ Estim. Atual'
            '% Mensal s/ Estim. Atual'
            '% Único s/ Estim. Atual'
            '% Diário s/ Valor Real'
            '% Mensal s/ Valor Real'
            '% Único s/ Valor Real'
            '% Diário s/ Valor da Etapa'
            '% Mensal s/ Valor da Etapa'
            '% Único s/ Valor da Etapa'
            'Valor Diário'
            'Valor Mensal'
            'Valor Único')
          TabOrder = 1
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            '17'
            '18')
        end
        object dtedInicial: TCMDateTimePicker
          Left = 10
          Top = 20
          Width = 106
          Height = 21
          Hint = 'A multa passa a contar a partir desta data'
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAINIMULTA'
          DataSource = dsEtapa
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
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 2
        end
        object btnPagar: TBitBtn
          Left = 365
          Top = 14
          Width = 68
          Height = 30
          Hint = 'Aciona a Tela para Informações da Penhora'
          Caption = 'Pagar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnPagarClick
          Glyph.Data = {
            06020000424D0602000000000000760000002800000028000000140000000100
            0400000000009001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008B8888888BCB
            8888888B8888888888788888888888BBB8888BCB8888BBB88888888888788888
            888888BBB8888BCB8888BBB88888888888788888888888BBBBB88CCC88BBBBB8
            888888888777888888888888B8CCCCCCCCC8B888888888777777777888888888
            BCC888C888CCB8888888877888788877888888888CC888C888CC888888888778
            88788877888888888CC888C888CC8888888887788878887788888888888888C8
            88CC8888888888888878887788888888B8888CCCCCC8B8888888888887777778
            88888BBBB8CCCCCC8888BBBB888888777777888888888888BCC888C88888B888
            888887788878888888888888BCC888C88888B888888887788878888888888888
            8CC888C888CC8888888887788878887788888888BCC888C888CCB88888888778
            8878887788888888B8CCCCCCCCC8B8888888887777777778888888BBBBB88CCC
            88BBBBB88888888887778888888888BBBBB88CCC88BBBBB88888888887778888
            888888BBB8888BCB8888BBB8888888888878888888888B8888888BCB8888888B
            88888888887888888888}
          NumGlyphs = 2
        end
      end
      object tbshPagamento: TTabSheet
        Caption = 'Pagamento'
        ImageIndex = 1
        object Label1: TLabel
          Left = 152
          Top = 4
          Width = 95
          Height = 13
          Caption = 'Data Pagamento'
        end
        object Label5: TLabel
          Left = 292
          Top = 4
          Width = 113
          Height = 13
          Caption = 'Valor a Pagar/Pago'
        end
        object dtedPagamento: TCMDateTimePicker
          Left = 152
          Top = 20
          Width = 95
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAPAGMULTA'
          DataSource = dsEtapa
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
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
          OnChange = dtedPagamentoChange
        end
        object dbredValorPago: TDBRealEdit
          Left = 292
          Top = 20
          Width = 116
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          WordWrap = False
          IntDigits = 15
          DecDigits = 2
          NumberFormat = fNumber
          Signal = True
          DataField = 'VALORMULTAPAGA'
          DataSource = dsEtapa
        end
        object gbxCAP: TGroupBox
          Left = 3
          Top = 43
          Width = 550
          Height = 55
          Caption = 'Contas a Pagar'
          TabOrder = 2
          object Label3: TLabel
            Left = 7
            Top = 13
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object dblckTipoDoc: TwwDBLookupCombo
            Left = 7
            Top = 26
            Width = 537
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
        object gbxContab: TGroupBox
          Left = 3
          Top = 213
          Width = 550
          Height = 59
          Caption = 'Contabilização'
          TabOrder = 3
          object Label4: TLabel
            Left = 8
            Top = 15
            Width = 198
            Height = 13
            Caption = 'Tipo de Operação (Contabilização)'
          end
          object dblckTipOper: TwwDBLookupCombo
            Left = 8
            Top = 29
            Width = 537
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
        object gbxCapContab: TGroupBox
          Left = 3
          Top = 103
          Width = 550
          Height = 107
          Caption = 'Contas a Pagar e/ou Contabilização'
          TabOrder = 4
          object Label2: TLabel
            Left = 7
            Top = 16
            Width = 116
            Height = 13
            Caption = 'Tipo de Desembolso'
          end
          object dblckTipoDesemb: TwwDBLookupCombo
            Left = 7
            Top = 30
            Width = 537
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
          object cmprocFonecedor: TCMProcuraForCli
            Left = 7
            Top = 55
            Width = 537
            Height = 46
            Caption = 'Favorecido'
            TabOrder = 1
            CampoEdit = ceRazaoSocial
            MostraMensagens = True
            Mensagens.EmBranco = 'Fornecedor não pode estar em branco'
            Mensagens.NaoExiste = 'Fornecedor não existe'
            PermiteChaveInvalida = True
            PermiteChaveEmBranco = False
            ForCli = fcFornecedor
            MostraEndereco = True
            StatusForCli = fcAll
            MostraStatusCredito = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 571
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
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
    Left = 443
    Top = 9
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object dsEtapa: TwwDataSource
    Left = 489
    Top = 9
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 234
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 220
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 206
  end
end
