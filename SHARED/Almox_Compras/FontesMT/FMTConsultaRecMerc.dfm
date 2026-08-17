inherited FrmMTConsultaRecMerc: TFrmMTConsultaRecMerc
  Left = 41
  Top = 39
  Caption = 'Consulta Recebimento de Mercadoria '
  ClientHeight = 452
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 413
    object pnlMestre: TPanel
      Left = 5
      Top = 5
      Width = 711
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object lblNumDoc: TLabel
        Left = 8
        Top = 64
        Width = 130
        Height = 13
        Caption = 'Número da Nota Fiscal'
      end
      object lblBarra: TLabel
        Left = 152
        Top = 88
        Width = 7
        Height = 13
        Caption = '/'
      end
      object lblValor: TLabel
        Left = 216
        Top = 64
        Width = 149
        Height = 13
        Caption = 'Valor Total da Nota Fiscal'
      end
      object lblEmissao: TLabel
        Left = 384
        Top = 16
        Width = 96
        Height = 13
        Caption = 'Data de Emissão'
      end
      object lblData: TLabel
        Left = 520
        Top = 16
        Width = 94
        Height = 13
        Caption = 'Data de Entrada'
      end
      object dbenNumDoc: TDBRealEdit
        Left = 8
        Top = 80
        Width = 142
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fNumber
        Signal = False
        DataField = 'NUMNF'
        DataSource = ds
      end
      object dblcFornCli: TCMProcuraForCli
        Left = 8
        Top = 8
        Width = 363
        Height = 48
        Caption = ' Favorecido '
        TabOrder = 0
        CampoEdit = ceRazaoSocial
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDFORCLI'
        Mensagens.EmBranco = 'Fornecedor em branco'
        Mensagens.NaoExiste = 'Fornecedor não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        ForCli = fcFornecedor
        MostraEndereco = False
        StatusForCli = fcAll
        MostraStatusCredito = False
      end
      object dbeCompl: TwwDBEdit
        Left = 160
        Top = 80
        Width = 44
        Height = 21
        DataField = 'COMPLNF'
        DataSource = ds
        MaxLength = 3
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeValorCorrente: TDBRealEdit
        Left = 216
        Top = 80
        Width = 154
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRNOTAFISCAL'
        DataSource = ds
      end
      object chkCap: TCheckBox
        Left = 384
        Top = 80
        Width = 313
        Height = 17
        Caption = 'Não integra este documento com o Contas a Pagar'
        TabOrder = 3
      end
      object dbeDataEmi: TCMDateTimePicker
        Left = 384
        Top = 32
        Width = 122
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAEMISNF'
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
        TabOrder = 4
      end
      object dbeDataLanc: TCMDateTimePicker
        Left = 520
        Top = 32
        Width = 121
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAENTDEVOL'
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
        TabOrder = 5
      end
    end
    object PageControl1: TPageControl
      Left = 5
      Top = 120
      Width = 711
      Height = 288
      ActivePage = TabCAP
      Align = alBottom
      TabOrder = 1
      object TabItens: TTabSheet
        Caption = 'Intes'
        object dbgrdDet: TwwDBGrid
          Left = 0
          Top = 0
          Width = 703
          Height = 260
          Selected.Strings = (
            'NUMOC'#9'8'#9'O.C.'#9'F'
            'CODARTIGO'#9'14'#9'Código Item'#9'F'
            'DESCPROD'#9'30'#9'Descrição do Item'#9'F'
            'QTDERECEBDEVOL'#9'10'#9'Quantidade'#9'F'
            'CODMEDIDA'#9'4'#9'Unid.'#9'F'
            'VLRUNITARIO'#9'10'#9'Valor Unitário'#9'F'
            'VALORTOTAL'#9'10'#9'Valor Total'#9'F'
            'VLRESTOQUE'#9'10'#9'Valor do Estoque'#9'F'
            'CODCENTROCUSTO'#9'10'#9'Centro de Custo'#9'F'
            'CODFISCAL'#9'4'#9'Código Fiscal'#9'F'
            'DATAVALIDADE'#9'10'#9'Validade'#9'F'
            'CODALMOXARIFADO'#9'10'#9'Almoxarifado'#9'F'
            'CODCENTRORESPON'#9'10'#9'C.Respon.'#9'F'
            'UNIDNEGOC'#9'10'#9'Atividade'#9'F'
            'CODTIPRECDES'#9'15'#9'Tipo Desemb.'#9'F'
            'CODCOR'#9'5'#9'Cor'#9'F'
            'CODTAMANHO'#9'3'#9'Tam.'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDet
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
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
      object TabAgrerg: TTabSheet
        Caption = 'Agregados da Nota'
        ImageIndex = 1
        object grdAgreg: TwwDBGrid
          Left = 0
          Top = 0
          Width = 703
          Height = 260
          Selected.Strings = (
            'DESCCUSTAGREG'#9'21'#9'Descrição'
            'BASE'#9'10'#9'Base'
            'PERCENT'#9'10'#9'Aliquota'
            'VALOR'#9'10'#9'Valor')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAgregNota
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TabCAP: TTabSheet
        Caption = 'Integração com Contas a Pagar'
        Enabled = False
        ImageIndex = 2
        object Label11: TLabel
          Left = 24
          Top = 16
          Width = 67
          Height = 13
          Caption = 'Vencimento'
        end
        object Label14: TLabel
          Left = 152
          Top = 16
          Width = 134
          Height = 13
          Caption = 'Histórico Complementar'
        end
        object LblFormaPag: TLabel
          Left = 360
          Top = 176
          Width = 73
          Height = 13
          Caption = 'Observação '
        end
        object Label16: TLabel
          Left = 360
          Top = 56
          Width = 112
          Height = 13
          Caption = 'Tipo de Documento'
        end
        object Label17: TLabel
          Left = 360
          Top = 96
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
        end
        object Label18: TLabel
          Left = 456
          Top = 16
          Width = 63
          Height = 13
          Caption = 'Referência'
        end
        object Label21: TLabel
          Left = 360
          Top = 136
          Width = 208
          Height = 13
          Caption = 'Contas/Caixa e forma de Pagamento'
        end
        object Label20: TLabel
          Left = 24
          Top = 80
          Width = 251
          Height = 13
          Caption = 'Linha Digitável (Parte Superior do Bloquete)'
        end
        object Label19: TLabel
          Left = 24
          Top = 123
          Width = 256
          Height = 13
          Caption = 'Código de Barras (Parte Inferior do Bloquete)'
        end
        object cbEnglobParc: TCheckBox
          Left = 24
          Top = 56
          Width = 281
          Height = 17
          Caption = 'Este documento será parcelado ou englobado'
          TabOrder = 0
        end
        object dbeDataVenc: TCMDateTimePicker
          Left = 24
          Top = 32
          Width = 114
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAVENCTO'
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
          TabOrder = 1
        end
        object EdHist: TEdit
          Left = 152
          Top = 32
          Width = 289
          Height = 21
          MaxLength = 40
          TabOrder = 2
        end
        object DblcCodForma: TwwDBLookupCombo
          Left = 360
          Top = 112
          Width = 264
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          LookupTable = cdsFormaPag
          LookupField = 'CODFORMA'
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbclTipoDoc: TwwDBLookupCombo
          Left = 360
          Top = 72
          Width = 265
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'CODTIPDOC'#9'10'#9'Código')
          LookupTable = CdsTipoDoc
          LookupField = 'codtipdoc'
          Options = [loColLines, loTitles]
          Style = csDropDownList
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
        object memObsCap: TMemo
          Left = 360
          Top = 192
          Width = 264
          Height = 41
          MaxLength = 1000
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object edRef: TEdit
          Left = 456
          Top = 32
          Width = 169
          Height = 21
          MaxLength = 30
          TabOrder = 6
        end
        object GpConta: TGroupBox
          Left = 24
          Top = 168
          Width = 322
          Height = 65
          Caption = 'Conta Bancária '
          TabOrder = 7
          object Label22: TLabel
            Left = 10
            Top = 15
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
          object Label23: TLabel
            Left = 118
            Top = 15
            Width = 52
            Height = 13
            Caption = 'Nº Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 58
            Top = 15
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
          object edtBanco: TEdit
            Left = 9
            Top = 30
            Width = 42
            Height = 21
            TabOrder = 0
          end
          object edtAgencia: TEdit
            Left = 57
            Top = 30
            Width = 56
            Height = 21
            TabOrder = 1
          end
          object edtConta: TEdit
            Left = 119
            Top = 30
            Width = 160
            Height = 21
            TabOrder = 2
          end
          object edtDescTipoConta: TEdit
            Left = 176
            Top = 15
            Width = 100
            Height = 13
            BorderStyle = bsNone
            Color = clBtnFace
            TabOrder = 3
            Text = 'edtDescTipoConta'
          end
        end
        object dblcPortForma: TwwDBLookupCombo
          Left = 360
          Top = 152
          Width = 264
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição')
          LookupTable = CdsContaCaixa
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          TabOrder = 8
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object EdLinhaDig: TEdit
          Left = 24
          Top = 96
          Width = 289
          Height = 21
          TabOrder = 9
          Text = 'EdLinhaDig'
        end
        object EdCodBarra: TEdit
          Left = 24
          Top = 139
          Width = 289
          Height = 21
          TabOrder = 10
          Text = 'EdCodBarra'
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Contabilização'
        ImageIndex = 3
        object dbgContab: TwwDBGrid
          Left = 0
          Top = 0
          Width = 703
          Height = 260
          Selected.Strings = (
            'LACNUMLAN'#9'6'#9'Lanç.'
            'LACDEBCRE'#9'1'#9'D/C'
            'PLACONTA'#9'18'#9'Conta'
            'CODSUBCONTA'#9'10'#9'Sub-Conta'
            'LACVALOR'#9'10'#9'Valor'
            'LACNUMDOC'#9'15'#9'Documento'
            'LACHIST1'#9'40'#9'Histórico 1'
            'LACHIST2'#9'40'#9'Histórico 2'
            'UNIDNEGOC'#9'10'#9'Atividade/Projeto'
            'CODCENTROCUSTO'#9'10'#9'Centro de Custo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContab
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
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
  inherited Dock971: TDock97
    Top = 413
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 458
      DockPos = 573
      inherited sep1: TToolbarSep97
        Left = 95
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 177
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 97
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 179
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = 'S&elecionar'
        TabOrder = 2
        OnClick = BtnSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65531
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'PESSOA.NOME'
      'NFRECEBDEVOL.NUMNF'
      'NFRECEBDEVOL.COMPLNF'
      'NFRECEBDEVOL.DATAEMISNF'
      'NFRECEBDEVOL.DATAENTDEVOL'
      'NFRECEBDEVOL.VLRNOTAFISCAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Razão Social'
      'Nome do Fornecedor'
      'Número da NF'
      'Complemento'
      'Data de Emissão'
      'Data da Entrada'
      'Valor da Nota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'NFRECEBDEVOL'
      'PESSOA')
    CamposChave.Strings = (
      'NFRECEBDEVOL.IDNFRECEBDEVOL')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = NFRECEBDEVOL.IDFORCLI')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '#,##0.00')
    Larguras.Strings = (
      '45'
      '30'
      '10'
      '5'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 277
    Top = 7
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 431
    Top = 63
  end
  object ds: TwwDataSource
    DataSet = Cds
    Left = 545
    Top = 111
  end
  object cdsItemNota: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'pNUMIDNF'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dspItemNota'
    Left = 434
    Top = 111
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = cdsItemNota
    Left = 544
    Top = 95
  end
  object dsAgregNota: TwwDataSource
    DataSet = cdsAgregNotaTela
    Left = 545
    Top = 79
  end
  object dsContab: TwwDataSource
    AutoEdit = False
    DataSet = CdsContab
    Left = 549
    Top = 60
  end
  object cdsAgregNotaTela: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'iAgregNota'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspAgregNota'
    Left = 438
    Top = 207
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 438
    Top = 159
  end
  object CdsCAP: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 548
    Top = 167
  end
  object spListItemRecMerc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      I.IDITENSRECDEV,'
      '      I.NUMOC,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      '      I.CODFISCAL,'
      '      I.IDMOV,'
      '      I.IDEMPRESA,'
      '      I.CODCENTROCUSTO,'
      '      I.CODALMOXARIFADO,'
      '      I.IDPESSOA,'
      '      I.IDITEMOC,'
      '      I.IDNFRECEBDEVOL,'
      '      I.QTDERECEBDEVOL,'
      '      I.VLRUNITARIO,'
      '      I.VLRESTOQUE,'
      '      (I.QTDERECEBDEVOL* I.VLRUNITARIO) AS VALORTOTAL,'
      '      I.FLGDESTINO,'
      '      I.DATAVALIDADE,'
      '      I.RECPAG,'
      '      I.CODTIPRECDES,'
      '      I.UNIDNEGOC,'
      '      I.CODCENTRORESPON,'
      '      I.IDPRODVARI,'
      '      I.IDRESERVAORCAMEN,'
      
        '      SUBSTR(DECODE(I.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI' +
        '),1,60)  AS DESCPROD,'
      '      P.CODFISCALPADRAO,'
      '      P.CONSUMOREVENDA,'
      '      P.CODGRUPOPROD,'
      '      A.CODCOR,'
      '      A.CODTAMANHO,'
      '      (0) AS QTDETOTAL,'
      '      I.CODMEDIDA AS CODMEDORI,'
      '      '#39'T'#39' AS FLGPARCTOT,'
      '      (0) AS CODCUSTEIO,'
      '      (0) AS CODCUSTEIOLOGIN,'
      '      (0) AS CODALMOXARIFADOLOGIN,'
      '      (0) AS CODCENTROCUSTOLOGIN,'
      '      NF.DATAENTDEVOL'
      'FROM'
      '      ITENSRECEBDEVOL I,'
      '      NFRECEBDEVOL NF,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '        ( I.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '    AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL)        '
      '    AND (I.CODARTIGO = A.CODARTIGO)'
      '    AND (P.CODPRODUTO = A.CODPRODUTO)'
      '    AND (PV.IDPRODVARI(+) = I.IDPRODVARI)'
      ''
      ''
      '')
    ClientDataSet = cdsItemNota
    Left = 624
    Top = 200
  end
  object spListRecMerc: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '       N.IDNFRECEBDEVOL,'
      '       N.NUMNF,'
      '       N.COMPLNF,'
      '       N.IDPESSOA,'
      '       N.CODDOCUMENTO,'
      '       N.FLGTIPONOTA,'
      '       N.DATAEMISNF,'
      '       D.DATAVENCTO,'
      '       N.IDFORCLI,'
      '       N.DATAENTDEVOL,'
      '       N.VLRNOTAFISCAL,'
      '       N.PLNCODIGO,'
      '       N.IDNFREFERENCIA'
      ' FROM'
      '       NFRECEBDEVOL N,'
      '       DOCUMENTO D'
      '  WHERE'
      '       (N.IDNFRECEBDEVOL = :IDNFRECEBDEVOL)'
      '   AND (D.CODDOCUMENTO(+) = N.CODDOCUMENTO)'
      '')
    ClientDataSet = Cds
    Left = 624
    Top = 152
  end
  object spListContab: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM LANCAMENTO'
      'WHERE (PLNCODIGO = :PLNCODIGO)'
      'ORDER BY LACDEBCRE DESC')
    ClientDataSet = CdsContab
    Left = 624
    Top = 304
  end
  object spListDadosCAP: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' L.HISTORICOCOMPL,  '
      ' D.NUMLEITCODBARRAS,'
      ' D.REFERENCIA,      '
      ' D.NUMDIGCODBARRAS, '
      ' D.CODFORMA,        '
      ' D.CODPORTFORMA,    '
      ' D.CODTIPDOC,'
      ' D.OBS,'
      ' D.OPERACAO'
      'FROM'
      '     DOCUMENTO D,'
      '     LANCTODOCUM L'
      'WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO)'
      ' AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ' AND (D.OPERACAO = L.OPERACAO )'
      ' ')
    ClientDataSet = CdsCAP
    Left = 624
    Top = 256
  end
  object spGetAgregNota: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     T.CODTIPOCUSTAGREG,'
      '     T.CODTRATFISCE,'
      '     T.DESCCUSTAGREG,'
      '     T.PERCVALOR,'
      '     T.FLGBASE,'
      '     A.IDAGRNFRECDEV,'
      '     A.IDNFRECEBDEVOL,'
      '     A.IDNFCOMPLEMENTAR,'
      '     A.ALIQUOTA AS PERCENT,'
      '     A.BASECALCULO AS BASE,'
      '     A.VLRAGREGADO AS VALOR,'
      '     A.VLRRECUPERADO,'
      '     (0)  AS ACUMBASE'
      'FROM'
      '     TIPOAGRE T,'
      '     AGRNFRECDEV A'
      'WHERE'
      '         (T.FLGINCIDERECEB = '#39'S'#39')'
      '     AND (T.TOTALITEM = '#39'T'#39')'
      '     AND (T.CODTRATFISCE < '#39'8'#39' )'
      '     AND (A.IDNFRECEBDEVOL(+) = :IDNFRECEBDEVOL)'
      '     AND (T.CODTIPOCUSTAGREG = A.CODTIPOCUSTAGREG(+))'
      ' '
      ' '
      ' ')
    ClientDataSet = cdsAgregNotaTela
    Left = 624
    Top = 104
  end
  object spContaCaixa: TCMSqlParams
    SQL.Strings = (
      'SELECT CODPORTFORMA, DESCRICAO'
      'FROM PORTADORFORMA'
      'ORDER BY 2')
    ClientDataSet = CdsContaCaixa
    Left = 621
    Top = 356
  end
  object spFormaPag: TCMSqlParams
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG'
      'WHERE  (RECPAG = '#39'P'#39')'
      '   AND (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCRICAO')
    ClientDataSet = cdsFormaPag
    Left = 533
    Top = 364
  end
  object CdsContaCaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 349
    Top = 212
  end
  object cdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 340
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 437
    Top = 260
  end
  object spTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      CODTIPDOC,'
      '      DESCRICAO'
      'FROM'
      '    TIPODOCRECPAG'
      'WHERE'
      '      (RECPAG = '#39'P'#39')'
      '  AND (DEBCRE = '#39'C'#39')'
      'ORDER BY 2')
    ClientDataSet = CdsTipoDoc
    Left = 473
    Top = 352
  end
end
