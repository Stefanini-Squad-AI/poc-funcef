inherited frmCadParamTransfPlano: TfrmCadParamTransfPlano
  Left = 178
  Top = 13
  HelpContext = 160117
  Caption = 'Parametrização de Eventos de Transferência de Plano'
  ClientHeight = 473
  ClientWidth = 733
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel [0]
    Left = 216
    Top = 50
    Width = 30
    Height = 13
    Caption = 'Tipo '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 733
    Height = 387
    inherited pnlMestre: TPanel
      Width = 731
      Height = 87
      Align = alClient
      object Label2: TLabel
        Left = 61
        Top = 14
        Width = 141
        Height = 13
        Caption = 'Evento de Transferência'
      end
      object lblCodigo: TLabel
        Left = 4
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label7: TLabel
        Left = 457
        Top = 14
        Width = 107
        Height = 13
        Caption = 'Data Busca Dados'
      end
      object Label8: TLabel
        Left = 571
        Top = 14
        Width = 108
        Height = 13
        Caption = 'Data da Simulação'
      end
      object dbedTitulo: TwwDBEdit
        Left = 62
        Top = 28
        Width = 387
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
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
      object dbedCodigoCargoExt: TDBEdit
        Left = 3
        Top = 28
        Width = 54
        Height = 21
        Color = clSilver
        DataField = 'IDEVENTOGERADOR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object CMDateTimePicker1: TCMDateTimePicker
        Left = 457
        Top = 28
        Width = 106
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATADADOS'
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
      end
      object CMDateTimePicker2: TCMDateTimePicker
        Left = 571
        Top = 28
        Width = 106
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATATRANSACAO'
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
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 88
      Width = 731
      Height = 298
      Align = alBottom
      Tabs.Strings = (
        'Parâmetros Usados nos Cálculos'
        'Opções Oferecidas pelo Evento'
        'Bases de Cálculo para Opções'
        'Estimativas Oferecidas pelo Evento')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdOpcoes'
        'dbgrdBases'
        'dbgrdEstimativa')
      inherited pgctrlDetalhe: TPageControl
        Width = 633
        Height = 239
        ActivePage = tbsNivel
        inherited tbsDet: TTabSheet
          Caption = 'Parâmetros Usados nos Cálculos'
          inherited dbgrdDet: TwwDBGrid
            Width = 625
            Height = 211
            Selected.Strings = (
              'DESCSIT'#9'11'#9'Situação'
              'ORDEM'#9'10'#9'Ordem'
              'DESCRICAO'#9'46'#9'Parâmetro'
              'DESCTIPO'#9'23'#9'Tipo'
              'NOMEPARAREGRA'#9'15'#9'Nome ~para Regra'
              'IDREGRA'#9'10'#9'Regra de ~Cálculo')
            FixedCols = 2
            Font.Style = []
            ParentFont = False
            TitleFont.Color = clBlack
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 625
            Height = 211
            BevelInner = bvLowered
            object Label1: TLabel
              Left = 12
              Top = 4
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object lblCampoBD: TLabel
              Left = 198
              Top = 46
              Width = 155
              Height = 13
              Caption = 'Campo do Banco de Dados'
            end
            object lblCampoRegra: TLabel
              Left = 198
              Top = 81
              Width = 273
              Height = 13
              Caption = 'Nome para Identificação em Regras de Negócio'
            end
            object lblRegraCalc: TLabel
              Left = 198
              Top = 46
              Width = 178
              Height = 13
              Caption = 'Regra de Cálculo do Parâmetro'
            end
            object Label4: TLabel
              Left = 198
              Top = 161
              Width = 75
              Height = 13
              Caption = 'Valor Default'
            end
            object Label5: TLabel
              Left = 286
              Top = 161
              Width = 37
              Height = 13
              Caption = 'Ordem'
            end
            object Label9: TLabel
              Left = 198
              Top = 122
              Width = 192
              Height = 13
              Caption = 'Regra de Validação do Parâmetro'
            end
            object dblkpcmbCampos: TwwDBLookupCombo
              Left = 198
              Top = 60
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCAMPO'#9'45'#9'Campo do Banco de Dados'#9'F')
              DataField = 'CAMPO'
              DataSource = dsDet
              LookupTable = qryCampos
              LookupField = 'NOMECAMPO'
              Options = [loTitles]
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblkpcmbRegraCalc: TwwDBLookupCombo
              Left = 198
              Top = 60
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo'#9'F')
              DataField = 'IDREGRA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbedDescInput: TDBEdit
              Left = 12
              Top = 20
              Width = 526
              Height = 21
              DataField = 'DESCRICAO'
              DataSource = dsDet
              TabOrder = 0
            end
            object dbrgrpTipoInput: TDBRadioGroup
              Left = 12
              Top = 41
              Width = 178
              Height = 75
              Caption = ' Tipo  '
              DataField = 'FLGTIPO'
              DataSource = dsDet
              Items.Strings = (
                'Campo da Base de Dados'
                'Campo Informado'
                'Campo Calculado')
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              TabStop = True
              Values.Strings = (
                'C'
                'I'
                'R')
              OnClick = dbrgrpTipoInputClick
            end
            object dbedCampoRegra: TDBEdit
              Left = 198
              Top = 95
              Width = 337
              Height = 21
              DataField = 'NOMEPARAREGRA'
              DataSource = dsDet
              TabOrder = 4
            end
            object grbSituacao: TGroupBox
              Left = 12
              Top = 118
              Width = 178
              Height = 89
              Caption = ' Situação na Fundação '
              TabOrder = 2
              TabStop = True
              object rdbAtivo: TRadioButton
                Left = 11
                Top = 13
                Width = 57
                Height = 17
                Caption = 'Ativo'
                TabOrder = 0
              end
              object rdbMantido: TRadioButton
                Left = 11
                Top = 27
                Width = 65
                Height = 17
                Caption = 'Mantido'
                TabOrder = 1
              end
              object rdbMantParc: TRadioButton
                Left = 11
                Top = 42
                Width = 113
                Height = 17
                Caption = 'Mantido Parcial'
                TabOrder = 2
              end
              object rdbAssistido: TRadioButton
                Left = 11
                Top = 56
                Width = 81
                Height = 17
                Caption = 'Assistido'
                TabOrder = 3
              end
              object rdbBeneficiario: TRadioButton
                Left = 11
                Top = 70
                Width = 89
                Height = 17
                Caption = 'Beneficiário'
                TabOrder = 4
              end
            end
            object dbedValorDefault: TDBEdit
              Left = 198
              Top = 175
              Width = 79
              Height = 21
              DataField = 'VALORDEFAULT'
              DataSource = dsDet
              TabOrder = 6
            end
            object dbchkPodeAlterar: TDBCheckBox
              Left = 372
              Top = 179
              Width = 286
              Height = 17
              Caption = 'Permitir Alteração Manual'
              DataField = 'FLGPODEALTERAR'
              DataSource = dsDet
              TabOrder = 8
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbedOrder: TDBEdit
              Left = 286
              Top = 175
              Width = 79
              Height = 21
              DataField = 'ORDEM'
              DataSource = dsDet
              TabOrder = 7
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 198
              Top = 136
              Width = 337
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo'#9'F')
              DataField = 'IDREGRAVALIDA'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsNivel: TTabSheet
          Caption = 'Opções Oferecidas pelo Evento'
          object pnlControlesNivel: TPanel
            Left = 0
            Top = 0
            Width = 625
            Height = 211
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label3: TLabel
              Left = 12
              Top = 12
              Width = 58
              Height = 13
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 12
              Top = 50
              Width = 155
              Height = 13
              Caption = 'Valor a Migrar como Opção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 207
              Top = 50
              Width = 107
              Height = 13
              Caption = 'Titulo Para Valor 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel
              Left = 405
              Top = 50
              Width = 106
              Height = 13
              Caption = 'Titulo para Valor 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedDescOpcao: TDBEdit
              Left = 12
              Top = 28
              Width = 526
              Height = 21
              DataField = 'NOME'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBCheckBox2: TDBCheckBox
              Left = 12
              Top = 90
              Width = 211
              Height = 17
              Caption = 'Opção permitida para Ativos'
              DataField = 'FLGATIVO'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 12
              Top = 180
              Width = 226
              Height = 17
              Caption = 'Opção permitida para Beneficiários'
              DataField = 'FLGBENEFICIARIO'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 12
              Top = 113
              Width = 211
              Height = 17
              Caption = 'Opção permitida para Mantidos'
              DataField = 'FLGMANTIDO'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox4: TDBCheckBox
              Left = 12
              Top = 135
              Width = 301
              Height = 17
              Caption = 'Opção permitida para Mantidos Parciais'
              DataField = 'FLGMANTPARC'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 12
              Top = 158
              Width = 211
              Height = 17
              Caption = 'Opção permitida para Assistidos'
              DataField = 'FLGASSISTIDO'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbedValoraMigrar: TDBEdit
              Left = 12
              Top = 63
              Width = 191
              Height = 21
              DataField = 'VALORAMIGRAR'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object DBEdit1: TDBEdit
              Left = 207
              Top = 63
              Width = 191
              Height = 21
              DataField = 'TITULOVLR1'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 7
            end
            object DBEdit3: TDBEdit
              Left = 405
              Top = 63
              Width = 191
              Height = 21
              DataField = 'TITULOVLR2'
              DataSource = dsOpcoes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 8
            end
          end
          object dbgrdOpcoes: TwwDBGrid
            Left = 0
            Top = 0
            Width = 625
            Height = 211
            Selected.Strings = (
              'VALORAMIGRAR'#9'10'#9'Cód.'
              'NOME'#9'40'#9'Opção'
              'FLGATIVO'#9'10'#9'Oferecida ~para ~Ativos'
              'FLGMANTIDO'#9'10'#9'Oferecida ~para ~Mantidos'
              'FLGMANTPARC'#9'10'#9'Oferecida ~para ~Mantidos ~Parciais'
              'FLGASSISTIDO'#9'10'#9'Oferecida ~para ~Assistidos'
              'FLGBENEFICIARIO'#9'10'#9'Oferecida ~para ~Beneficiários'
              'TITULOVLR1'#9'15'#9'Título do Valor 1'
              'TITULOVLR2'#9'15'#9'Título do Valor 2')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsOpcoes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 4
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsBases: TTabSheet
          Caption = 'Bases de Cálculo para Opções'
          ImageIndex = 3
          object dbgrdBases: TwwDBGrid
            Left = 0
            Top = 0
            Width = 625
            Height = 211
            Selected.Strings = (
              'VALORAMIGRAR'#9'10'#9'Cód.'
              'NOME'#9'40'#9'Opção'
              'FLGATIVO'#9'10'#9'Oferecida ~para ~Ativos'
              'FLGMANTIDO'#9'10'#9'Oferecida ~para ~Mantidos'
              'FLGMANTPARC'#9'10'#9'Oferecida ~para ~Mantidos ~Parciais'
              'FLGASSISTIDO'#9'10'#9'Oferecida ~para ~Assistidos'
              'FLGBENEFICIARIO'#9'10'#9'Oferecida ~para ~Beneficiários')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsBases
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 4
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 625
            Height = 211
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label12: TLabel
              Left = 12
              Top = 12
              Width = 58
              Height = 13
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 12
              Top = 50
              Width = 37
              Height = 13
              Caption = 'Ordem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 237
              Top = 50
              Width = 30
              Height = 13
              Caption = 'Tipo '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label18: TLabel
              Left = 237
              Top = 86
              Width = 149
              Height = 13
              Caption = 'Regra de Cálculo da Base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedDescBase: TDBEdit
              Left = 12
              Top = 28
              Width = 526
              Height = 21
              DataField = 'NOME'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBCheckBox11: TDBCheckBox
              Left = 12
              Top = 90
              Width = 211
              Height = 17
              Caption = 'Base Utilizada para Ativos'
              DataField = 'FLGATIVO'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox12: TDBCheckBox
              Left = 12
              Top = 180
              Width = 226
              Height = 17
              Caption = 'Base Utilziada para Beneficiários'
              DataField = 'FLGBENEFICIARIO'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox13: TDBCheckBox
              Left = 12
              Top = 113
              Width = 211
              Height = 17
              Caption = 'Base Utilziada para Mantidos'
              DataField = 'FLGMANTIDO'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox14: TDBCheckBox
              Left = 12
              Top = 135
              Width = 301
              Height = 17
              Caption = 'Base Utilziada para Mantidos Parciais'
              DataField = 'FLGMANTPARC'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox15: TDBCheckBox
              Left = 12
              Top = 158
              Width = 211
              Height = 17
              Caption = 'Base Utilziada para Assistidos'
              DataField = 'FLGASSISTIDO'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEdit4: TDBEdit
              Left = 12
              Top = 63
              Width = 191
              Height = 21
              DataField = 'VALORAMIGRAR'
              DataSource = dsBases
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
            object dblkpcmbTipoBase: TwwDBLookupCombo
              Left = 237
              Top = 63
              Width = 301
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TIPO'#9'24'#9'Tipo da Base de Cálculo'#9'F')
              DataField = 'TIPODADO'
              DataSource = dsBases
              LookupTable = qryTipoDado
              LookupField = 'CODIGO'
              Options = [loTitles]
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object wwDBLookupCombo4: TwwDBLookupCombo
              Left = 237
              Top = 100
              Width = 301
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra de Cálculo'#9'F')
              DataField = 'IDREGRABASE'
              DataSource = dsBases
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
        object tbsEstimativa: TTabSheet
          Caption = 'Estimativas Oferecidas pelo Evento'
          ImageIndex = 2
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 617
            Height = 211
            Align = alClient
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label10: TLabel
              Left = 12
              Top = 12
              Width = 58
              Height = 13
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 12
              Top = 50
              Width = 101
              Height = 13
              Caption = 'Ordem de Cálculo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedDescEstimativa: TDBEdit
              Left = 12
              Top = 28
              Width = 526
              Height = 21
              DataField = 'NOME'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object DBCheckBox6: TDBCheckBox
              Left = 12
              Top = 90
              Width = 211
              Height = 17
              Caption = 'Estimativa Utilizada para Ativos'
              DataField = 'FLGATIVO'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox7: TDBCheckBox
              Left = 12
              Top = 180
              Width = 250
              Height = 17
              Caption = 'Estimativa Utilizada para Beneficiários'
              DataField = 'FLGBENEFICIARIO'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox8: TDBCheckBox
              Left = 12
              Top = 113
              Width = 211
              Height = 17
              Caption = 'Estimativa Utilizada para Mantidos'
              DataField = 'FLGMANTIDO'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox9: TDBCheckBox
              Left = 12
              Top = 135
              Width = 301
              Height = 17
              Caption = 'Estimativa Utilizada para Mantidos Parciais'
              DataField = 'FLGMANTPARC'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox10: TDBCheckBox
              Left = 12
              Top = 158
              Width = 241
              Height = 17
              Caption = 'Estimativa Utilizada para Assistidos'
              DataField = 'FLGASSISTIDO'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEdit2: TDBEdit
              Left = 12
              Top = 63
              Width = 191
              Height = 21
              DataField = 'VALORAMIGRAR'
              DataSource = dsEstimativa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 6
            end
          end
          object dbgrdEstimativa: TwwDBGrid
            Left = 0
            Top = 0
            Width = 617
            Height = 211
            Selected.Strings = (
              'VALORAMIGRAR'#9'10'#9'Ordem'
              'NOME'#9'40'#9'Opção'
              'FLGATIVO'#9'10'#9'Oferecida ~para ~Ativos'
              'FLGMANTIDO'#9'10'#9'Oferecida ~para ~Mantidos'
              'FLGMANTPARC'#9'10'#9'Oferecida ~para ~Mantidos ~Parciais'
              'FLGASSISTIDO'#9'10'#9'Oferecida ~para ~Assistidos'
              'FLGBENEFICIARIO'#9'10'#9'Oferecida ~para ~Beneficiários')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 1
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsEstimativa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 4
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 723
      end
      inherited Dock974: TDock97
        Left = 637
        Height = 239
      end
    end
  end
  inherited Dock972: TDock97
    Width = 733
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 733
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 430
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 390
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 388
    Top = 45
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOGERADOR'
      'set'
      '  NOME = :NOME,'
      '  DATADADOS = :DATADADOS,'
      '  DATATRANSACAO = :DATATRANSACAO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    InsertSQL.Strings = (
      'insert into EVENTOGERADOR'
      '  (IDEVENTOGERADOR, NOME, DATADADOS, DATATRANSACAO)'
      'values'
      '  (:IDEVENTOGERADOR, :NOME, :DATADADOS, :DATATRANSACAO)')
    DeleteSQL.Strings = (
      'delete from EVENTOGERADOR'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR')
    Left = 469
    Top = 45
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargos ou Funções '
    Colunas.Strings = (
      'EVENTOGERADOR.NOME'
      'EVENTOGERADOR.IDEVENTOGERADOR')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Evento'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOGERADOR')
    CamposChave.Strings = (
      'EVENTOGERADOR.IDEVENTOGERADOR')
    Filtro.Strings = (
      'FLGINTERNO = '#39'TP'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    Left = 345
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 44
    Top = 433
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 256
    Top = 1
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME, DATADADOS, DATATRANSACAO'
      'FROM   EVENTOGERADOR'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ' ')
    Left = 429
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
      end>
  end
  object qryCampos: TwwQuery [12]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Código da Patrocinadora'#39'             AS DESCAMPO, '#39'IDPES' +
        'SJUR'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Código do Plano'#39'                     AS DESCAMPO, '#39'IDPLA' +
        'NOPREV'#39'      AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Código da Pessoa a Migrar'#39'           AS DESCAMPO, '#39'IDPES' +
        'SOA'#39'         AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Ano/Mês dos Dados'#39'                   AS DESCAMPO, '#39'ANOME' +
        'SREF'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Matrícula'#39'                           AS DESCAMPO, '#39'MATRI' +
        'CULA'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Situação do Participante'#39'            AS DESCAMPO, '#39'SITUA' +
        'CAO'#39'         AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Nome'#39'                                AS DESCAMPO, '#39'NOME'#39 +
        '             AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Sexo'#39'                                AS DESCAMPO, '#39'SEXO'#39 +
        '             AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Estado Civil'#39'                        AS DESCAMPO, '#39'ESTCI' +
        'VIL'#39'         AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Nascimento'#39'                  AS DESCAMPO, '#39'DATAN' +
        'ASC'#39'         AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Admissão do Participante'#39'    AS DESCAMPO, '#39'DATAA' +
        'DMISSAO'#39'     AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Inscrição do Participante'#39'   AS DESCAMPO, '#39'INSCR' +
        'ICAODATA'#39'    AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Remuneração Total do Participante'#39'   AS DESCAMPO, '#39'REMUN' +
        'ERACAO'#39'      AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Salário de Participação'#39'             AS DESCAMPO, '#39'SALPA' +
        'RTICIPACAO'#39'  AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Contribuição do Participante'#39'        AS DESCAMPO, '#39'CONTR' +
        'IBUICAO'#39'     AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Tempo de INSS'#39'                       AS DESCAMPO, '#39'TEMPO' +
        'INSS'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Contribuição de Jóia'#39'                AS DESCAMPO, '#39'JOIA'#39 +
        '             AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Prazo Total de Jóia'#39'                 AS DESCAMPO, '#39'PRAZO' +
        'JOIAFALTA'#39'   AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Prazo de Jóia já Pago'#39'               AS DESCAMPO, '#39'PRAZO' +
        'JOIAPAGO'#39'    AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Taxa de Jóia'#39'                        AS DESCAMPO, '#39'TAXAJ' +
        'OIA'#39'         AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Reserva Tributável'#39'                  AS DESCAMPO, '#39'RPTRI' +
        'BUTAVEL'#39'     AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Reserva Não Tributável'#39'              AS DESCAMPO, '#39'RPNAO' +
        'TRIBUTAVEL'#39'  AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'SRB'#39'                                 AS DESCAMPO, '#39'SRB'#39' ' +
        '             AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'DIB'#39'                                 AS DESCAMPO, '#39'DATAI' +
        'NICIOFUND'#39'   AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Valor da Suplementação'#39'              AS DESCAMPO, '#39'VALOR' +
        'ATUAL'#39'       AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Valor do INSS'#39'                       AS DESCAMPO, '#39'VLRIN' +
        'FINSS'#39'       AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Código do Benefício'#39'                 AS DESCAMPO, '#39'IDBEN' +
        'EFICIO'#39'      AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Valor do Abono'#39'                      AS DESCAMPO, '#39'VALOR' +
        'ABONO'#39'       AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data do Falecimento do Participante'#39' AS DESCAMPO, '#39'DATAM' +
        'ORTE'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Demissão do Participante'#39'    AS DESCAMPO, '#39'DATAD' +
        'EMISSAO'#39'     AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Idade (Em Meses) na Aposentadoria '#39'  AS DESCAMPO, '#39'IDADE' +
        'APOS'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Fator Redutor de Benefício'#39'          AS DESCAMPO, '#39'PROPO' +
        'RCAO'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Cota Familiar de Pensão'#39'             AS DESCAMPO, '#39'COTAP' +
        'ENSAO'#39'       AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Nasc. do Benef. Vitalício mais Jovem'#39'  AS DESCAM' +
        'PO, '#39'DATANASCVIT'#39'  AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Data de Nasc. do Benef. Temporário mais Jovem'#39' AS DESCAM' +
        'PO, '#39'DATANASCTEMP'#39' AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Número Total de Beneficiários'#39'       AS DESCAMPO, '#39'NUMDE' +
        'PEN'#39'        AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Número de Beneficiários Vitalícios'#39'  AS DESCAMPO, '#39'NUMDE' +
        'PENVIT'#39'     AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Número de Beneficiários Temporários'#39' AS DESCAMPO, '#39'NUMDE' +
        'PENTEMP'#39'    AS NOMECAMPO FROM DUAL UNION'
      
        'SELECT '#39'Grau de Parentesco'#39'                  AS DESCCAMPO,'#39'IDDEP' +
        'ENDENCIA'#39'   AS NOMECAMPO FROM DUAL'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 594
    Top = 216
  end
  object updDet: TUpdateSQL [13]
    ModifySQL.Strings = (
      'update INPUTTRANSFPLANO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGTIPO = :FLGTIPO,'
      '  TABELA = :TABELA,'
      '  CAMPO = :CAMPO,'
      '  IDREGRA = :IDREGRA,'
      '  NOMEPARAREGRA = :NOMEPARAREGRA,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGMANTIDO = :FLGMANTIDO,'
      '  FLGMANTPARC = :FLGMANTPARC,'
      '  FLGASSISTIDO = :FLGASSISTIDO,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  VALORDEFAULT = :VALORDEFAULT,'
      '  FLGPODEALTERAR = :FLGPODEALTERAR,'
      '  ORDEM = :ORDEM,'
      '  IDREGRAVALIDA = :IDREGRAVALIDA'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDINPUT = :OLD_IDINPUT')
    InsertSQL.Strings = (
      'insert into INPUTTRANSFPLANO'
      
        '  (IDEVENTOGERADOR, IDINPUT, DESCRICAO, FLGTIPO, TABELA, CAMPO, ' +
        'IDREGRA, '
      
        '   NOMEPARAREGRA, FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTID' +
        'O, FLGBENEFICIARIO, '
      '   VALORDEFAULT, FLGPODEALTERAR, ORDEM, IDREGRAVALIDA)'
      'values'
      
        '  (:IDEVENTOGERADOR, :IDINPUT, :DESCRICAO, :FLGTIPO, :TABELA, :C' +
        'AMPO, :IDREGRA, '
      
        '   :NOMEPARAREGRA, :FLGATIVO, :FLGMANTIDO, :FLGMANTPARC, :FLGASS' +
        'ISTIDO, '
      
        '   :FLGBENEFICIARIO, :VALORDEFAULT, :FLGPODEALTERAR, :ORDEM, :ID' +
        'REGRAVALIDA)')
    DeleteSQL.Strings = (
      'delete from INPUTTRANSFPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDINPUT = :OLD_IDINPUT')
    Left = 479
    Top = 1
  end
  object dsOpcoes: TwwDataSource [14]
    AutoEdit = False
    DataSet = qryOpcoes
    Left = 530
    Top = 65524
  end
  object updOpcoes: TUpdateSQL [15]
    ModifySQL.Strings = (
      'update TIPOSTRANSFPLANO'
      'set'
      '  NOME = :NOME,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGMANTIDO = :FLGMANTIDO,'
      '  FLGMANTPARC = :FLGMANTPARC,'
      '  FLGASSISTIDO = :FLGASSISTIDO,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGTIPO = :FLGTIPO,'
      '  VALORAMIGRAR = :VALORAMIGRAR,'
      '  TIPODADO = :TIPODADO,'
      '  IDREGRABASE = :IDREGRABASE,'
      '  TITULOVLR1 = :TITULOVLR1,'
      '  TITULOVLR2 = :TITULOVLR2'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    InsertSQL.Strings = (
      'insert into TIPOSTRANSFPLANO'
      
        '  (IDEVENTOGERADOR, IDTIPOTRANSF, NOME, FLGATIVO, FLGMANTIDO, FL' +
        'GMANTPARC, '
      
        '   FLGASSISTIDO, FLGBENEFICIARIO, FLGTIPO, VALORAMIGRAR, TIPODAD' +
        'O, IDREGRABASE, '
      '   TITULOVLR1, TITULOVLR2)'
      'values'
      
        '  (:IDEVENTOGERADOR, :IDTIPOTRANSF, :NOME, :FLGATIVO, :FLGMANTID' +
        'O, :FLGMANTPARC, '
      
        '   :FLGASSISTIDO, :FLGBENEFICIARIO, :FLGTIPO, :VALORAMIGRAR, :TI' +
        'PODADO, '
      '   :IDREGRABASE, :TITULOVLR1, :TITULOVLR2)')
    DeleteSQL.Strings = (
      'delete from TIPOSTRANSFPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    Left = 625
    Top = 65533
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 301
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, IDINPUT, DESCRICAO,'
      '       FLGTIPO, TABELA, CAMPO, IDREGRA, NOMEPARAREGRA,'
      
        '       FLGATIVO, FLGMANTIDO, FLGMANTPARC, FLGASSISTIDO, FLGBENEF' +
        'ICIARIO,'
      '       VALORDEFAULT, FLGPODEALTERAR, ORDEM,'
      '       IDREGRAVALIDA,'
      '       DECODE(FLGATIVO, 1, '#39'Ativo'#39','
      '              DECODE(FLGMANTIDO,1,'#39'Mantido'#39','
      '                     DECODE(FLGASSISTIDO,1,'#39'Assistido'#39','
      
        '                            DECODE(FLGBENEFICIARIO,1,'#39'Pensionist' +
        'a'#39','#39'Ativo'#39')))) AS DESCSIT,'
      '       DECODE(FLGTIPO, '#39'C'#39', '#39'Campo do Banco de Dados'#39','
      '                       '#39'I'#39', '#39'Campo Informado'#39','
      '                            '#39'Campo Calculado'#39') AS DESCTIPO'
      'FROM   INPUTTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'ORDER BY DECODE(FLGATIVO, 1, '#39'Ativo'#39','
      '                DECODE(FLGMANTIDO,1,'#39'Mantido'#39','
      '                        DECODE(FLGASSISTIDO,1,'#39'Assistido'#39','
      
        '                                DECODE(FLGBENEFICIARIO,1,'#39'Pensio' +
        'nista'#39','#39'Ativo'#39')))),'
      '         ORDEM'
      ''
      ''
      ''
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 429
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object qryOpcoes: TwwQuery
    CachedUpdates = True
    BeforePost = qryOpcoesBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, IDTIPOTRANSF, NOME,'
      '       FLGATIVO, FLGMANTIDO, FLGMANTPARC,'
      '       FLGASSISTIDO, FLGBENEFICIARIO,'
      '       FLGTIPO, VALORAMIGRAR, TIPODADO, IDREGRABASE,'
      '       TITULOVLR1, TITULOVLR2'
      'FROM   TIPOSTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    FLGTIPO = '#39'O'#39
      
        'ORDER BY FLGATIVO DESC, FLGMANTIDO DESC, FLGMANTPARC DESC,FLGASS' +
        'ISTIDO DESC,FLGBENEFICIARIO DESC,NOME'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updOpcoes
    ControlType.Strings = (
      'FLGATIVO;CheckBox;1;0'
      'FLGMANTIDO;CheckBox;1;0'
      'FLGMANTPARC;CheckBox;1;0'
      'FLGASSISTIDO;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 570
    Top = 65535
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updEstimativa: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSTRANSFPLANO'
      'set'
      '  NOME = :NOME,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGMANTIDO = :FLGMANTIDO,'
      '  FLGMANTPARC = :FLGMANTPARC,'
      '  FLGASSISTIDO = :FLGASSISTIDO,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGTIPO = :FLGTIPO,'
      '  VALORAMIGRAR = :VALORAMIGRAR,'
      '  TIPODADO = :TIPODADO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    InsertSQL.Strings = (
      'insert into TIPOSTRANSFPLANO'
      
        '  (IDEVENTOGERADOR, IDTIPOTRANSF, NOME, FLGATIVO, FLGMANTIDO, FL' +
        'GMANTPARC, '
      
        '   FLGASSISTIDO, FLGBENEFICIARIO, FLGTIPO, VALORAMIGRAR, TIPODAD' +
        'O)'
      'values'
      
        '  (:IDEVENTOGERADOR, :IDTIPOTRANSF, :NOME, :FLGATIVO, :FLGMANTID' +
        'O, :FLGMANTPARC, '
      
        '   :FLGASSISTIDO, :FLGBENEFICIARIO, :FLGTIPO, :VALORAMIGRAR, :TI' +
        'PODADO)')
    DeleteSQL.Strings = (
      'delete from TIPOSTRANSFPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    Left = 622
    Top = 114
  end
  object dsEstimativa: TwwDataSource
    AutoEdit = False
    DataSet = qryEstimativa
    Left = 545
    Top = 111
  end
  object qryEstimativa: TwwQuery
    CachedUpdates = True
    BeforePost = qryEstimativaBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, IDTIPOTRANSF, NOME,'
      '       FLGATIVO, FLGMANTIDO, FLGMANTPARC,'
      '       FLGASSISTIDO, FLGBENEFICIARIO,'
      '       FLGTIPO, VALORAMIGRAR, TIPODADO '
      'FROM   TIPOSTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    FLGTIPO = '#39'E'#39
      
        'ORDER BY FLGATIVO DESC, FLGMANTIDO DESC, FLGMANTPARC DESC,FLGASS' +
        'ISTIDO DESC,FLGBENEFICIARIO DESC,NOME'
      ' '
      ' ')
    UpdateObject = updEstimativa
    ControlType.Strings = (
      'FLGATIVO;CheckBox;1;0'
      'FLGMANTIDO;CheckBox;1;0'
      'FLGMANTPARC;CheckBox;1;0'
      'FLGASSISTIDO;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 585
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object dsBases: TwwDataSource
    AutoEdit = False
    DataSet = qryBases
    Left = 593
    Top = 342
  end
  object qryBases: TwwQuery
    CachedUpdates = True
    BeforePost = qryBasesBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, IDTIPOTRANSF, NOME,'
      '       FLGATIVO, FLGMANTIDO, FLGMANTPARC,'
      '       FLGASSISTIDO, FLGBENEFICIARIO,'
      '       FLGTIPO, VALORAMIGRAR, TIPODADO, IDREGRABASE'
      'FROM   TIPOSTRANSFPLANO'
      'WHERE  IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    FLGTIPO = '#39'B'#39' '
      
        'ORDER BY FLGATIVO DESC, FLGMANTIDO DESC, FLGMANTPARC DESC,FLGASS' +
        'ISTIDO DESC,FLGBENEFICIARIO DESC,NOME'
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    UpdateObject = updBases
    ControlType.Strings = (
      'FLGATIVO;CheckBox;1;0'
      'FLGMANTIDO;CheckBox;1;0'
      'FLGMANTPARC;CheckBox;1;0'
      'FLGASSISTIDO;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 633
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updBases: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOSTRANSFPLANO'
      'set'
      '  NOME = :NOME,'
      '  FLGATIVO = :FLGATIVO,'
      '  FLGMANTIDO = :FLGMANTIDO,'
      '  FLGMANTPARC = :FLGMANTPARC,'
      '  FLGASSISTIDO = :FLGASSISTIDO,'
      '  FLGBENEFICIARIO = :FLGBENEFICIARIO,'
      '  FLGTIPO = :FLGTIPO,'
      '  VALORAMIGRAR = :VALORAMIGRAR,'
      '  TIPODADO = :TIPODADO,'
      '  IDREGRABASE = :IDREGRABASE'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    InsertSQL.Strings = (
      'insert into TIPOSTRANSFPLANO'
      
        '  ( IDEVENTOGERADOR,  IDTIPOTRANSF, NOME, FLGATIVO, FLGMANTIDO, ' +
        'FLGMANTPARC, FLGASSISTIDO, FLGBENEFICIARIO,'
      '   FLGTIPO, VALORAMIGRAR, TIPODADO, IDREGRABASE)'
      'values'
      
        '  ( :IDEVENTOGERADOR,  :IDTIPOTRANSF, :NOME, :FLGATIVO, :FLGMANT' +
        'IDO, :FLGMANTPARC, :FLGASSISTIDO, :FLGBENEFICIARIO, '
      '   :FLGTIPO, :VALORAMIGRAR, :TIPODADO, :IDREGRABASE)'
      ' ')
    DeleteSQL.Strings = (
      'delete from TIPOSTRANSFPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDTIPOTRANSF = :OLD_IDTIPOTRANSF')
    Left = 670
    Top = 345
  end
  object qryTipoDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Numérico'#39' AS TIPO,                 '#39'N'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Alfanumérico'#39' AS TIPO,             '#39'C'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Data'#39' AS TIPO,                     '#39'D'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Anos e Meses'#39' AS TIPO,    '#39'I'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Anos Completos'#39' AS TIPO,  '#39'A'#39' AS CODIGO FROM DU' +
        'AL UNION'
      
        'SELECT '#39'Idade em Meses Completos'#39' AS TIPO, '#39'M'#39' AS CODIGO FROM DU' +
        'AL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 649
    Top = 291
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 669
    Top = 93
  end
end
