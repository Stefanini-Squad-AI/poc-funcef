inherited frmExecAlteraContrato: TfrmExecAlteraContrato
  Left = 26
  Top = 105
  HelpContext = 150028
  Caption = 'Alterações Contratuais'
  ClientHeight = 406
  ClientWidth = 749
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 749
    Height = 338
    object Label27: TLabel
      Left = 168
      Top = 64
      Width = 122
      Height = 13
      Caption = 'Plano Previdenciário '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 16
      Top = 16
      Width = 114
      Height = 13
      Caption = 'Número do Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label42: TLabel
      Left = 168
      Top = 16
      Width = 103
      Height = 13
      Caption = 'Situação Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 64
      Width = 117
      Height = 13
      Caption = 'Insc. em Empréstimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 424
      Top = 64
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 424
      Top = 16
      Width = 107
      Height = 13
      Caption = 'Matrícula Empresa'
    end
    object Label41: TLabel
      Left = 544
      Top = 16
      Width = 141
      Height = 13
      Caption = 'Situação do Participante'
    end
    object Label18: TLabel
      Left = 296
      Top = 16
      Width = 114
      Height = 13
      Caption = 'Insc. Previdenciária'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBedtCodInsc: TDBEdit
      Left = 16
      Top = 80
      Width = 138
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'INSCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBedtPlanoPrev: TDBEdit
      Left = 168
      Top = 80
      Width = 245
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'PLANOPREV'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBedtSituacao: TDBEdit
      Left = 168
      Top = 32
      Width = 118
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DESCSITCONTRATO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBedtParticipante: TDBEdit
      Left = 16
      Top = 112
      Width = 397
      Height = 32
      TabStop = False
      Color = clBtnFace
      DataField = 'TITULAR'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object DBedtNumContrato: TDBEdit
      Left = 16
      Top = 32
      Width = 112
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'IDContratoEmptmo'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DBedtPatro: TDBEdit
      Left = 424
      Top = 80
      Width = 313
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'PATRO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object DBedtInscricao: TDBEdit
      Left = 296
      Top = 32
      Width = 118
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'INSCRICAONUMERO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object DBedtMtrEmpresa: TDBEdit
      Left = 424
      Top = 32
      Width = 110
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'MATRICULA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object DBedtSitPart: TDBEdit
      Left = 544
      Top = 32
      Width = 193
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'SITUACAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object pgcAltContrato: TPageControl
      Left = 1
      Top = 156
      Width = 747
      Height = 181
      ActivePage = tbsInformacoes
      Align = alBottom
      TabOrder = 9
      object tbsInformacoes: TTabSheet
        Caption = 'Informações Contratuais'
        object Label43: TLabel
          Left = 328
          Top = 8
          Width = 90
          Height = 13
          Caption = 'Data do Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 208
          Top = 8
          Width = 109
          Height = 13
          Caption = 'Data de Assinatura'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 448
          Top = 8
          Width = 90
          Height = 13
          Caption = 'Valor Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 8
          Top = 8
          Width = 68
          Height = 13
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 56
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 384
          Top = 56
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBedtDataInsc: TCMDateTimePicker
          Left = 208
          Top = 24
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATAINSC'
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
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 0
        end
        object DBedtDataCredito: TCMDateTimePicker
          Left = 328
          Top = 24
          Width = 105
          Height = 21
          TabStop = False
          AutoSize = False
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          DataField = 'DATACREDITO'
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
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowButton = True
          TabOrder = 1
        end
        object DBedtValSolic: TDBEdit
          Left = 448
          Top = 24
          Width = 97
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'VLRCONTRATO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBedtBeneficiario: TDBEdit
          Left = 8
          Top = 24
          Width = 181
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'BENEFICIARIO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBedtTipoContrato: TDBEdit
          Left = 8
          Top = 72
          Width = 361
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'TceDescricao'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBedtTipoEmptmo: TDBEdit
          Left = 384
          Top = 72
          Width = 297
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'DESCTIPOEMPTMO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object tbsAlteraContrato: TTabSheet
        Caption = 'Alterações Contratuais'
        ImageIndex = 1
        object pnlIntegracao: TPanel
          Left = 0
          Top = 0
          Width = 739
          Height = 153
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label7: TLabel
            Left = 176
            Top = 10
            Width = 155
            Height = 13
            Caption = 'Conta bancária para débito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 177
            Top = 116
            Width = 233
            Height = 13
            Caption = 'Nº de Parcelas Atrasadas para Cobrança'
          end
          object DBrdgDebito: TDBRadioGroup
            Left = 6
            Top = 4
            Width = 154
            Height = 65
            Caption = 'Forma Cobrança'
            DataField = 'FLGFORMAREC'
            DataSource = ds
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Contas a Receber'
              'Folha de Pagamento')
            ParentFont = False
            TabOrder = 0
            Values.Strings = (
              'C'
              'F')
            OnChange = DBrdgDebitoChange
          end
          object DBgBanco: TDBGrid
            Left = -296
            Top = 148
            Width = 458
            Height = 64
            Color = clInactiveCaption
            DataSource = dsBanco
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Visible = False
            Columns = <
              item
                Expanded = False
                FieldName = 'BANCO'
                Title.Alignment = taCenter
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -8
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 178
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUMAGENCIA'
                Title.Alignment = taCenter
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONTACORRENTE'
                Title.Alignment = taCenter
                Title.Caption = 'Conta Corrente'
                Width = 128
                Visible = True
              end>
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 176
            Top = 24
            Width = 465
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DADOS'#9'80'#9'Banco - Agência - Conta Corrente'#9'F')
            DataField = 'IDCBANCARIADEB'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookDadosBancarios
            LookupField = 'IDCBANCARIA'
            ParentFont = False
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object pnlCAR: TPanel
            Left = 168
            Top = 48
            Width = 481
            Height = 57
            BevelOuter = bvNone
            TabOrder = 2
            object Label30: TLabel
              Left = 8
              Top = 18
              Width = 195
              Height = 13
              Caption = 'Conta-Caixa x Forma Recebimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 8
              Top = 8
              Width = 465
              Height = 4
              Shape = bsTopLine
            end
            object DBcboFormaRecebimento: TwwDBLookupCombo
              Left = 8
              Top = 32
              Width = 465
              Height = 21
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
              DataField = 'PORTFORMAREC'
              DataSource = ds
              LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
              LookupField = 'CODPORTFORMA'
              ParentFont = False
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 415
            Top = 113
            Width = 49
            Height = 21
            Increment = 1
            DataField = 'NUMPARCDESCONTO'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Beneficiário(s) do Seguro'
        ImageIndex = 2
        object Label36: TLabel
          Left = 4
          Top = 32
          Width = 91
          Height = 13
          Caption = 'Indenização (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 108
          Top = 32
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
        object Label3: TLabel
          Left = 164
          Top = 32
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
        object Label5: TLabel
          Left = 335
          Top = 32
          Width = 86
          Height = 13
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Dock974: TDock97
          Left = 0
          Top = 0
          Width = 737
          Height = 29
          AllowDrag = False
          BoundLines = [blTop, blBottom, blLeft, blRight]
          object Toolbar972: TToolbar97
            Left = 0
            Top = 0
            BorderStyle = bsNone
            Caption = 'tb97BotoesDetalhe'
            DockPos = 0
            TabOrder = 0
            object sbtnInsereBenef: TToolbarButton97
              Left = 73
              Top = 0
              Width = 73
              Height = 23
              Hint = 'Inserir'
              AllowAllUp = True
              GroupIndex = 2
              Caption = '&Inserir'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                88B888888888888888888888888B888888888888888888888888}
              ImageIndex = 0
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = sbtnInsereBenefClick
            end
            object sbtnAlteraBenef: TToolbarButton97
              Left = 146
              Top = 0
              Width = 73
              Height = 23
              Hint = 'Alterar'
              AllowAllUp = True
              GroupIndex = 2
              Caption = '&Alterar'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                777777777787FF88777777777778887777777777777888777777}
              ImageIndex = 1
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnAlteraBenefClick
            end
            object sbtnExcluiBenef: TToolbarButton97
              Left = 219
              Top = 0
              Width = 73
              Height = 23
              Hint = 'Excluir'
              AllowAllUp = True
              Caption = '&Excluir'
              ImageIndex = 2
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnExcluiBenefClick
            end
            object sbtnNovoBenef: TToolbarButton97
              Left = 0
              Top = 0
              Width = 73
              Height = 23
              Hint = 'Inserir'
              AllowAllUp = True
              GroupIndex = 2
              Caption = '&Novo'
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008888888B8888
                8888888888888F8888888B8888BB778888B88888888F77F8888888BB8800F088
                BB8888888F7787F8888888BB00FFF0BBBB88888F7788878F88888800FFFFFF0B
                B888887788888F7F8888887FFFFFCF0B8888887F88FF7878F888887FFCCCFFF0
                B8888878F77788F7F88888B7FFFFFCF0BB888887F88FF7878F88BBB7FFCCCFFF
                0BBB88878F77788F78F888BB7FFFFFCFF08888887F88FF78878F888B7FFCCCFF
                FF08888878F777888F78888BB7FFFFFF77888888878F888F778888BBBB7FFF77
                BB8888888878FF77888888BB88B77788BB8888888887778888888B88888B8888
                88B888888888888888888888888B888888888888888888888888}
              ImageIndex = 0
              Images = ImlPadrao
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = sbtnNovoBenefClick
            end
          end
        end
        object dbEdtPercIndeniz: TDBEdit
          Left = 5
          Top = 48
          Width = 88
          Height = 21
          DataField = 'PERCINDENIZACAO'
          DataSource = dsBenefSeguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object wwDBGrid1: TwwDBGrid
          Left = 2
          Top = 72
          Width = 735
          Height = 81
          Selected.Strings = (
            'NOME'#9'75'#9'Nome'
            'PERCINDENIZACAO'#9'11'#9'% Indenização')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsBenefSeguro
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          TabOrder = 2
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
        object bbtnOkDetBenef: TBitBtn
          Left = 575
          Top = 31
          Width = 81
          Height = 26
          Caption = 'OK'
          Enabled = False
          TabOrder = 3
          OnClick = bbtnOkDetBenefClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          Margin = 4
          NumGlyphs = 2
        end
        object bbtnCancelarDetBenef: TBitBtn
          Left = 657
          Top = 31
          Width = 81
          Height = 26
          Cancel = True
          Caption = 'Cancelar'
          Enabled = False
          TabOrder = 4
          OnClick = bbtnCancelarDetBenefClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          Margin = 4
          NumGlyphs = 2
        end
        object DBEdit1: TDBEdit
          Left = 109
          Top = 48
          Width = 36
          Height = 21
          DataField = 'NUMBANCO'
          DataSource = dsBenefSeguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit2: TDBEdit
          Left = 165
          Top = 48
          Width = 148
          Height = 21
          DataField = 'CODAGENCIA'
          DataSource = dsBenefSeguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 333
          Top = 48
          Width = 148
          Height = 21
          DataField = 'CONTACORRENTE'
          DataSource = dsBenefSeguro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 749
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 363
        Width = 17
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 749
    inherited tb97Fundo: TToolbar97
      Left = 577
      DockPos = 608
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 405
      DockPos = 436
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 992
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 432
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOEMPTMO'
      'set'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO,'
      '  FLGFORMAREC = :FLGFORMAREC,'
      '  PORTFORMAREC = :PORTFORMAREC,'
      '  IDCBANCARIADEB = :IDCBANCARIADEB,'
      '  IDTIPOSUSPEMPTMO = :IDTIPOSUSPEMPTMO,'
      '  DATAINICIOSUSP = :DATAINICIOSUSP,'
      '  DATAFIMSUSP = :DATAFIMSUSP,'
      '  DATALIBSUSP = :DATALIBSUSP,'
      '  HORALIBSUSP = :HORALIBSUSP,'
      '  USUARIOLIBSUSP = :USUARIOLIBSUSP,'
      '  FLGSUSPENSAOAUTO = :FLGSUSPENSAOAUTO,'
      '  ANOSUSPENSAO = :ANOSUSPENSAO,'
      '  MESSUSPENSAO = :MESSUSPENSAO,'
      '  NUMPARCDESCONTO = :NUMPARCDESCONTO'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 464
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'PPP.INSCRICAONUMERO'
      'C.IDCONTRATOEMPTMO'
      
        'DECODE(C.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','#39'C'#39', '#39'Contrato Cancel' +
        'ado'#39','#39'E'#39', '#39'Contrato Encerrado'#39','#39'Q'#39', '#39'Contrato Quitado'#39','#39'R'#39', '#39'Con' +
        'trato Refinanciado'#39','#39'S'#39', '#39'Contrato Suspenso'#39','#39'K'#39', '#39'Contrato Pend' +
        'ente de Quitação'#39') AS SITUACAO'
      'PL.NOME'
      'PA.NOME'
      'C.IDINSCRICAOEMPTMO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      ''
      '')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF ou CNPJ'
      'Inscrição'
      'Contrato'
      'Plano Previdenciário'
      'Patrocinadora'
      ''
      '')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'ELEGPATRO EL'
      'PARTPREVPLAN PPP'
      'CONTRATOEMPTMO C'
      'PESSOA PA'
      'PLANPREV PL')
    CamposChave.Strings = (
      'C.IDCONTRATOEMPTMO'
      'P.NOME'
      'C.IDINSCRICAOEMPTMO')
    Filtro.Strings = (
      'P.IDPESSOA        = EL.IDPESSOA(+)'
      'EL.IDPESSJUR      = PPP.IDPESSJUR'
      'P.IDPESSOA        = PPP.IDPESSOA(+)'
      'P.IDPESSOA        = C.IDPESSOA'
      'PA.IDPESSOA       = PPP.IDPESSJUR'
      'PL.IDPLANOPREV    = C.IDPLANOPREV'
      'EL.IDPESSOA       = PPP.IDPESSOA'
      'C.FLGSITUACAO     <> '#39'C'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '43'
      '18'
      '10'
      '12'
      '50'
      '60'
      '10'
      '10')
    RepeteConsulta = True
    ExibePergunta = False
    Left = 592
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 933
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 520
    Top = 0
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      'SELECT INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '       INS.DATAINSC,'
      '       CNT.IDCONTRATOEMPTMO,'
      '       CNT.IDBENEF,'
      '       CNT.DATACREDITO,'
      '       CNT.VLRCONTRATO,'
      '       CNT.FLGFORMAPAG,'
      '       CNT.FLGFORMAREC,'
      '       CNT.PORTFORMAPAG,'
      '       CNT.PORTFORMAREC,'
      '       CNT.IDCBANCARIADEB,'
      '       DECODE(CNT.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                              '#39'C'#39','#39'Cancelado'#39','
      '                              '#39'E'#39','#39'Encerrado'#39','
      '                              '#39'Q'#39','#39'Quitado'#39','
      '                              '#39'R'#39','#39'Refinanciado'#39','
      '                              '#39'S'#39','#39'Suspenso'#39','
      
        '                              '#39'K'#39','#39'Pendente de Quitação'#39') AS DES' +
        'CSITCONTRATO,'
      '       CNT.IDTIPOSUSPEMPTMO,'
      '       CNT.DATAINICIOSUSP,'
      '       CNT.DATAFIMSUSP,'
      '       CNT.DATALIBSUSP,'
      '       CNT.HORALIBSUSP,'
      '       CNT.USUARIOLIBSUSP,'
      '       CNT.IDTIPOCONTREMPTMO,'
      '       CNT.FLGSUSPENSAOAUTO,'
      '       CNT.ANOSUSPENSAO,'
      '       CNT.MESSUSPENSAO,'
      '       CNT.NUMPARCDESCONTO,'
      ''
      '       PPP.INSCRICAONUMERO,'
      '       SIT.DESCRICAO AS SITUACAO,'
      '       PLV.NOME      AS PLANOPREV,'
      '       JUR.NOME      AS PATRO,'
      '       ELP.MATRICULA,'
      '       TIT.NOME      AS TITULAR,'
      '       BEN.NOME      AS BENEFICIARIO,'
      '       TIP.TCEDESCRICAO,'
      '       TEM.DESCTIPOEMPTMO,'
      '       BAN.NOME AS BANCO,'
      '       CTB.CONTACORRENTE,'
      '       AGB.NUMAGENCIA,'
      '       NVL(FLGOBRIGBENEF,0) AS FLGOBRIGBENEF'
      'FROM'
      '   PESSOA              JUR,'
      '   PESSOA              TIT,'
      '   PESSOA              BEN,'
      '   PESSOA              BAN,'
      '   AGENCIABANCARIA     AGB,'
      '   CONTABANCARIA       CTB,'
      '   PARTPREVPLAN        PPP,'
      '   ELEGPATRO           ELP,'
      '   TIPOCONTREMPTMO     TIP,'
      '   TIPOEMPTMO          TEM,'
      '   SITPART             SIT,'
      '   CONTRATOEMPTMO      CNT,'
      '   INSCRICAOEMPTMO     INS,'
      '   PLANPREV            PLV'
      'WHERE'
      '       CNT.IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO'
      '   AND CNT.IDPESSOA          = PPP.IDPESSOA'
      '   AND CNT.IDPATRO           = PPP.IDPESSJUR'
      '   AND SIT.IDSITPART         = PPP.IDSITPART'
      '   AND CNT.IDPLANOPREV       = PLV.IDPLANOPREV'
      '   AND CNT.IDPATRO           = JUR.IDPESSOA'
      '   AND CNT.IDPESSOA          = ELP.IDPESSOA'
      '   AND CNT.IDPATRO           = ELP.IDPESSJUR'
      '   AND CNT.IDPESSOA          = TIT.IDPESSOA'
      '   AND CNT.IDBENEF           = BEN.IDPESSOA'
      '   AND CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO'
      '   AND TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO'
      '   AND CNT.IDINSCRICAOEMPTMO = INS.IDINSCRICAOEMPTMO(+)'
      '   AND INS.IDCBANCARIADEB    = CTB.IDCBANCARIA(+)'
      '   AND CTB.IDAGENCIA         = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO           = BAN.IDPESSOA(+)'
      '   AND PPP.INSCRICAODATA     = ('
      '                               SELECT'
      '                                  MAX(B.INSCRICAODATA)'
      '                               FROM'
      '                                  PARTPREVPLAN B'
      '                               WHERE'
      '                                      B.IDPESSOA  = PPP.IDPESSOA'
      
        '                                  AND B.IDPESSJUR = PPP.IDPESSJU' +
        'R'
      '                               )')
    Left = 400
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
    object qryINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
    end
    object qryINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryDATALIBSUSP: TDateTimeField
      FieldName = 'DATALIBSUSP'
    end
    object qryHORALIBSUSP: TStringField
      FieldName = 'HORALIBSUSP'
      Size = 8
    end
    object qryUSUARIOLIBSUSP: TStringField
      FieldName = 'USUARIOLIBSUSP'
      Size = 30
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
    object qryFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
    end
    object qryIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
    end
  end
  object dsBanco: TDataSource
    DataSet = dtmLookEmptmo.qryLookDadosBancarios
    Left = 680
    Top = 227
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDCONTRATOEMPTMO, IDCBANCARIADEB, FLGFORMAREC, PORTFORMAR' +
        'EC'
      'FROM   CONTRATOEMPTMO'
      'WHERE  IDCONTRATOEMPTMO = :PIDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 174
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end>
    object qryContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.PORTFORMAREC'
    end
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryContratoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCBANCARIADEB'
    end
  end
  object qryAlteraContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO ALTERACONTREMPTMO'
      
        '(DATA, IDUSUARIO, IDCONTRATOEMPTMO, TIPO, FLGFORMAREC, PORTFORMA' +
        'REC, IDCBANCARIA)'
      'VALUES'
      
        '(:PDATA, :PIDUSUARIO, :PIDCONTRATOEMPTMO, :PTIPO, :PFLGFORMAREC,' +
        ' :PPORTFORMAREC, :PIDCBANCARIA)')
    ValidateWithMask = True
    Left = 672
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PTIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGFORMAREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPORTFORMAREC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCBANCARIA'
        ParamType = ptUnknown
      end>
  end
  object qryBenefSeguro: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.IDINSCRICAOEMPTMO,'
      '       BF.IDBENEFSEGURO,'
      '       BF.PERCINDENIZACAO,'
      '       BF.NOME,'
      '       BF.NUMBANCO,'
      '       BF.CODAGENCIA,'
      '       BF.CONTACORRENTE'
      'FROM   CONTRATOXBENEFSEG BF'
      'WHERE  BF.IDINSCRICAOEMPTMO = :IDINSCRICAOEMPTMO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBenefSeguro
    ValidateWithMask = True
    Left = 616
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
    object qryBenefSeguroNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 75
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryBenefSeguroPERCINDENIZACAO: TFloatField
      DisplayLabel = '% Indenização'
      DisplayWidth = 11
      FieldName = 'PERCINDENIZACAO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.PERCINDENIZACAO'
      DisplayFormat = ',0.000'
      EditFormat = ',0.000'
    end
    object qryBenefSeguroIDBENEFSEGURO: TFloatField
      FieldName = 'IDBENEFSEGURO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDBENEFSEGURO'
      Visible = False
    end
    object qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.IDINSCRICAOEMPTMO'
    end
    object qryBenefSeguroNUMBANCO: TFloatField
      FieldName = 'NUMBANCO'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.NUMBANCO'
    end
    object qryBenefSeguroCODAGENCIA: TStringField
      FieldName = 'CODAGENCIA'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.CODAGENCIA'
      Size = 10
    end
    object qryBenefSeguroCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Origin = 'BASEDADOS.CONTRATOXBENEFSEG.CONTACORRENTE'
      Size = 10
    end
  end
  object dsBenefSeguro: TDataSource
    DataSet = qryBenefSeguro
    OnStateChange = dsBenefSeguroStateChange
    Left = 680
    Top = 304
  end
  object updBenefSeguro: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOXBENEFSEG'
      '  PERCINDENIZACAO = :PERCINDENIZACAO,'
      '  NUMBANCO = :NUMBANCO,'
      '  CODAGENCIA = :CODAGENCIA,'
      '  CONTACORRENTE = :CONTACORRENTE'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    DeleteSQL.Strings = (
      'delete from CONTRATOXBENEFSEG'
      'where'
      '  IDINSCRICAOEMPTMO = :OLD_IDINSCRICAOEMPTMO and'
      '  IDBENEFSEGURO = :OLD_IDBENEFSEGURO')
    Left = 680
    Top = 288
  end
  object qryAlteraParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   HMEFORMACOBRANCA =:PHMEFORMACOBRANCA'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND ( HMECENTRALIZA  = 1 OR HMEDESTACADO = 1 )'
      '   AND HMEVLREFETIVO    IS NULL')
    ValidateWithMask = True
    Left = 672
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'PHMEFORMACOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
