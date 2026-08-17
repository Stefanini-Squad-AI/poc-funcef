inherited frmCadProcHabINSS: TfrmCadProcHabINSS
  Left = 299
  Top = 49
  HelpContext = 4870003
  Caption = 'Cadastro de Processos INSS'
  ClientHeight = 611
  ClientWidth = 984
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1114
    Height = 625
    Align = alNone
    inherited pnlMestre: TPanel
      Width = 984
      Height = 500
      Align = alNone
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = -2
      Top = 343
      Width = 984
      Height = 185
      Align = alNone
      Tabs.Strings = (
        'Histórico de Movimentações')
      object TPanel [0]
        Left = 8
        Top = 56
        Width = 889
        Height = 119
        BevelOuter = bvNone
        TabOrder = 3
        object Label15: TLabel
          Left = 16
          Top = 9
          Width = 86
          Height = 13
          Caption = 'Data Alteração'
        end
        object Label16: TLabel
          Left = 272
          Top = 9
          Width = 310
          Height = 13
          Caption = 'Nova Situação para Habitação de Benefícios do INSS'
        end
        object Label17: TLabel
          Left = 16
          Top = 34
          Width = 164
          Height = 13
          Caption = 'Observações Complemetares'
        end
        object cmdtpDtAlt: TCMDateTimePicker
          Left = 112
          Top = 6
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATAREGISTRO'
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
        object dblkpcmbNovaSitHabBfINSS: TwwDBLookupCombo
          Left = 600
          Top = 7
          Width = 257
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO'#9'F')
          LookupTable = qryLookStiHabBf
          LookupField = 'IDSITHABILITACAO'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          SearchDelay = 1
          AllowClearKey = True
          ShowMatchText = True
          OnNotInList = dblkpcmbNovaSitHabBfINSSNotInList
        end
        object dbeObservacoes: TDBMemo
          Left = 16
          Top = 50
          Width = 841
          Height = 65
          DataField = 'OBSERVACAO'
          DataSource = dsDet
          TabOrder = 2
        end
      end
      inherited pgctrlDetalhe: TPageControl
        Left = 3
        Top = 34
        Width = 886
        Height = 154
        Align = alNone
        Style = tsButtons
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 878
            Height = 123
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 878
            Height = 123
            ControlType.Strings = (
              'OBSERVACAO;RichEdit;')
            OnCellChanged = dbgrdDetCellChanged
          end
        end
      end
      inherited Dock974: TDock97 [2]
        Left = 890
        Height = 126
        inherited tb97Detalhe: TToolbar97
          Visible = False
          inherited bbtnOkDet: TBitBtn
            Enabled = False
          end
          inherited bbtnCancelarDet: TBitBtn
            Enabled = False
          end
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
          end
        end
      end
      inherited Dock973: TDock97 [3]
        Width = 976
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 277
      Width = 963
      Height = 65
      BorderStyle = bsSingle
      TabOrder = 2
      object Label8: TLabel
        Left = 264
        Top = 38
        Width = 238
        Height = 13
        Caption = 'Benefício Identificado para Requerimento'
      end
      object dbeBenefIdentReq: TDBEdit
        Left = 512
        Top = 35
        Width = 129
        Height = 21
        Color = clScrollBar
        Enabled = False
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 984
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 572
    Width = 984
    inherited tb97Fundo: TToolbar97
      Left = 371
      DockPos = 371
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4870003
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 189
      DockPos = 189
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
    object bbtnGeraRelatorio: TButton
      Left = 8
      Top = 4
      Width = 145
      Height = 29
      Caption = 'Gerar Relatório'
      Enabled = False
      TabOrder = 2
      OnClick = bbtnGeraRelatorioClick
    end
  end
  object Panel1: TPanel [3]
    Left = 8
    Top = 51
    Width = 425
    Height = 307
    BorderStyle = bsSingle
    Enabled = False
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 7
      Width = 150
      Height = 13
      Caption = 'Número do Benefício (NB)'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 56
      Height = 13
      Caption = 'Benefício'
    end
    object Label3: TLabel
      Left = 16
      Top = 58
      Width = 100
      Height = 13
      Caption = 'Número do BRDP'
    end
    object Label4: TLabel
      Left = 16
      Top = 85
      Width = 27
      Height = 13
      Caption = 'DER'
    end
    object Label5: TLabel
      Left = 16
      Top = 111
      Width = 22
      Height = 13
      Caption = 'DIB'
    end
    object Label6: TLabel
      Left = 211
      Top = 111
      Width = 22
      Height = 13
      Caption = 'DIP'
    end
    object Label7: TLabel
      Left = 16
      Top = 136
      Width = 40
      Height = 13
      Caption = 'Estado'
    end
    object Label18: TLabel
      Left = 210
      Top = 136
      Width = 27
      Height = 13
      Caption = 'NUP'
      FocusControl = dbNup
    end
    object Label19: TLabel
      Left = 16
      Top = 231
      Width = 104
      Height = 13
      Caption = 'Tempo de Serviço'
    end
    object Label20: TLabel
      Left = 180
      Top = 231
      Width = 28
      Height = 13
      Caption = 'anos'
    end
    object Label21: TLabel
      Left = 267
      Top = 231
      Width = 36
      Height = 13
      Caption = 'meses'
    end
    object Label22: TLabel
      Left = 360
      Top = 231
      Width = 24
      Height = 13
      Caption = 'dias'
    end
    object Label23: TLabel
      Left = 16
      Top = 256
      Width = 43
      Height = 13
      Caption = '% INSS'
    end
    object Label24: TLabel
      Left = 145
      Top = 256
      Width = 138
      Height = 13
      Caption = 'Índice Reajuste do Teto'
    end
    object lblDec: TLabel
      Left = 211
      Top = 85
      Width = 26
      Height = 13
      Caption = 'DEC'
    end
    object lblBenefFora: TLabel
      Left = 16
      Top = 161
      Width = 167
      Height = 13
      Caption = 'Benefício Fora do Convênio?'
    end
    object lbllei142: TLabel
      Left = 16
      Top = 210
      Width = 109
      Height = 13
      Caption = 'Benefício Lei 142?'
    end
    object lblRMI: TLabel
      Left = 16
      Top = 186
      Width = 24
      Height = 13
      Caption = 'RMI'
    end
    object lblSentencaJud: TLabel
      Left = 16
      Top = 279
      Width = 109
      Height = 13
      Caption = 'Sentença Judicial?'
    end
    object lblDtFinal: TLabel
      Left = 16
      Top = 300
      Width = 59
      Height = 13
      Caption = 'Data Final'
      Visible = False
    end
    object lblObs: TLabel
      Left = 15
      Top = 322
      Width = 75
      Height = 13
      Caption = 'Observações'
    end
    object cmdtpDIB: TCMDateTimePicker
      Left = 72
      Top = 107
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DIB'
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
    object cmdtpDIP: TCMDateTimePicker
      Left = 249
      Top = 107
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DIP'
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
      TabOrder = 6
    end
    object cmdtpDER: TCMDateTimePicker
      Left = 72
      Top = 81
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAREQUERIMENTO'
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
    object dblkpcmbBenef: TwwDBLookupCombo
      Left = 134
      Top = 30
      Width = 235
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryLookBenef
      LookupField = 'IDBENEFICIO'
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      SearchDelay = 1
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblkpcmbBenefExit
      OnNotInList = dblkpcmbBenefNotInList
    end
    object dbeNumBDRP: TDBEdit
      Left = 134
      Top = 55
      Width = 235
      Height = 21
      DataField = 'NUMBRDP'
      DataSource = ds
      TabOrder = 2
      OnKeyPress = dbeNumBDRPKeyPress
    end
    object dbeNumBenef: TDBEdit
      Left = 176
      Top = 5
      Width = 193
      Height = 21
      DataField = 'NUMBENEFICIO'
      DataSource = ds
      MaxLength = 16
      TabOrder = 0
      OnExit = dbeNumBenefExit
      OnKeyPress = dbeNumBenefKeyPress
    end
    object dblkpcmbEstado: TwwDBLookupCombo
      Left = 72
      Top = 132
      Width = 120
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLACENTRAL'#9'2'#9'SIGLACENTRAL'#9'F')
      LookupTable = qryLookEstado
      LookupField = 'SIGLACENTRAL'
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
      AllowClearKey = False
      OnNotInList = dblkpcmbEstadoNotInList
    end
    object dbNup: TDBEdit
      Left = 249
      Top = 132
      Width = 120
      Height = 21
      DataField = 'NUP'
      DataSource = ds
      TabOrder = 8
    end
    object edtTempoAno: TDBEdit
      Left = 128
      Top = 228
      Width = 49
      Height = 21
      DataField = 'TEMPOSERVICOANOS'
      DataSource = ds
      MaxLength = 4
      TabOrder = 12
      OnKeyPress = edtTempoAnoKeyPress
    end
    object edtTempoMes: TDBEdit
      Left = 214
      Top = 228
      Width = 49
      Height = 21
      DataField = 'TEMPOSERVICOMES'
      DataSource = ds
      MaxLength = 12
      TabOrder = 13
      OnKeyPress = edtTempoMesKeyPress
    end
    object edtTempoDia: TDBEdit
      Left = 309
      Top = 228
      Width = 49
      Height = 21
      DataField = 'TEMPOSERVICODIAS'
      DataSource = ds
      MaxLength = 2
      TabOrder = 14
      OnKeyPress = edtTempoDiaKeyPress
    end
    object edtINSS: TDBEdit
      Left = 72
      Top = 253
      Width = 49
      Height = 21
      DataField = 'PERCENTUALINSS'
      DataSource = ds
      TabOrder = 15
      OnExit = edtINSSExit
      OnKeyPress = edtINSSKeyPress
    end
    object edtIndiceReajuste: TDBEdit
      Left = 289
      Top = 253
      Width = 97
      Height = 21
      DataField = 'INDICEREAJUSTETETO'
      DataSource = ds
      TabOrder = 16
      OnExit = edtINSSExit
      OnKeyPress = edtIndiceReajusteKeyPress
    end
    object tmpDEC: TCMDateTimePicker
      Left = 249
      Top = 81
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DEC'
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
    object dbeRMI: TDBEdit
      Left = 72
      Top = 182
      Width = 120
      Height = 21
      DataField = 'RMI'
      DataSource = ds
      MaxLength = 16
      TabOrder = 10
      OnExit = edtINSSExit
      OnKeyPress = edtIndiceReajusteKeyPress
    end
    object pnlEscondeBorda1: TPanel
      Left = 189
      Top = 157
      Width = 134
      Height = 21
      TabOrder = 9
      object dbrgBenefFora: TDBRadioGroup
        Left = -4
        Top = -12
        Width = 144
        Height = 37
        Color = clBtnFace
        Columns = 2
        DataField = 'FLGPAGAINSS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Sim'
          'Não')
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '0'
          '1')
      end
    end
    object pnlEscondeBorda2: TPanel
      Left = 130
      Top = 205
      Width = 134
      Height = 22
      TabOrder = 11
      object dbrgLei142: TDBRadioGroup
        Left = -5
        Top = -12
        Width = 144
        Height = 39
        Color = clBtnFace
        Columns = 2
        DataField = 'BENEFLEI142'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Sim'
          'Não')
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
      end
    end
    object tmpDATAFINAL: TCMDateTimePicker
      Left = 79
      Top = 298
      Width = 120
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAFINAL'
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
      TabOrder = 18
      Visible = False
    end
    object pnlEscondeBorda3: TPanel
      Left = 128
      Top = 275
      Width = 134
      Height = 21
      TabOrder = 17
      object dbrgSentencaJud: TDBRadioGroup
        Left = -4
        Top = -12
        Width = 144
        Height = 37
        Color = clBtnFace
        Columns = 2
        DataField = 'FLGSENTENCAJUDICIAL'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Sim'
          'Não')
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
        OnChange = dbrgSentencaJudChange
      end
    end
    object dbmObs: TDBMemo
      Left = 16
      Top = 340
      Width = 363
      Height = 46
      DataField = 'OBSSENTENCAJUDICIAL'
      DataSource = ds
      MaxLength = 3000
      TabOrder = 19
    end
  end
  object Panel2: TPanel [4]
    Left = 426
    Top = 51
    Width = 545
    Height = 307
    BorderStyle = bsSingle
    TabOrder = 4
    object Label9: TLabel
      Left = 16
      Top = 25
      Width = 24
      Height = 13
      Caption = 'CPF'
    end
    object Label10: TLabel
      Left = 16
      Top = 54
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 16
      Top = 83
      Width = 116
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label12: TLabel
      Left = 16
      Top = 111
      Width = 95
      Height = 13
      Caption = 'Matrícula Titular'
    end
    object Label14: TLabel
      Left = 16
      Top = 139
      Width = 83
      Height = 13
      Caption = 'Plano Contábil'
    end
    object lblMatr: TLabel
      Left = 16
      Top = 168
      Width = 126
      Height = 13
      Caption = 'Matrícula Beneficiário'
    end
    object lblNome: TLabel
      Left = 16
      Top = 196
      Width = 104
      Height = 13
      Caption = 'Nome Beneficiário'
    end
    object dbeCPFSegurado: TDBEdit
      Left = 148
      Top = 21
      Width = 169
      Height = 21
      Color = clScrollBar
      DataField = 'NUMDOCUMENTO'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 0
    end
    object dbeNmTitular: TDBEdit
      Left = 148
      Top = 50
      Width = 369
      Height = 21
      Color = clScrollBar
      DataField = 'NOMETITULAR'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 1
    end
    object dbeDtNascSegurado: TDBEdit
      Left = 148
      Top = 79
      Width = 105
      Height = 21
      Color = clScrollBar
      DataField = 'DATANASC'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 2
    end
    object dbeMatTitSegurado: TDBEdit
      Left = 148
      Top = 107
      Width = 105
      Height = 21
      Color = clScrollBar
      DataField = 'MATRICULATITULAR'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 3
    end
    object dbeMatBenefSegurado: TDBEdit
      Left = 148
      Top = 164
      Width = 193
      Height = 21
      Color = clScrollBar
      DataField = 'MATRICULADEP'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 4
    end
    object dbePlanContSegurado: TDBEdit
      Left = 148
      Top = 135
      Width = 193
      Height = 21
      Color = clScrollBar
      DataField = 'DESCRICAOPLANOCONTABIL'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 5
    end
    object bbtnSelSegurado: TButton
      Left = 336
      Top = 16
      Width = 177
      Height = 25
      Caption = 'Selecionar Segurado'
      Enabled = False
      TabOrder = 6
      OnClick = bbtnSelSeguradoClick
    end
    object dbeNomeSegurado: TDBEdit
      Left = 148
      Top = 192
      Width = 193
      Height = 21
      Color = clScrollBar
      DataField = 'NOMEDEP'
      DataSource = DsSelSegurado
      Enabled = False
      TabOrder = 7
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 704
    Top = 10
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 667
    Top = 330
  end
  inherited ds: TwwDataSource
    Left = 514
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFHABILITA'
      'set'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMBENEFICIO = :NUMBENEFICIO,'
      '  NUMBRDP = :NUMBRDP,'
      '  DATAREQUERIMENTO = :DATAREQUERIMENTO,'
      '  DIB = :DIB,'
      '  DIP = :DIP,'
      '  ESTADO = :ESTADO,'
      '  NUP = :NUP,'
      '  TEMPOSERVICOANOS = :TEMPOSERVICOANOS,'
      '  TEMPOSERVICOMES = :TEMPOSERVICOMES,'
      '  TEMPOSERVICODIAS = :TEMPOSERVICODIAS,'
      '  PERCENTUALINSS = :PERCENTUALINSS,'
      '  INDICEREAJUSTETETO = :INDICEREAJUSTETETO,'
      '  RMI = :RMI,'
      '  DEC = :DEC,'
      '  FLGPAGAINSS = :FLGPAGAINSS,'
      '  BENEFLEI142 = :BENEFLEI142,'
      '  FLGSENTENCAJUDICIAL = :FLGSENTENCAJUDICIAL,'
      '  DATAFINAL = :DATAFINAL,'
      '  OBSSENTENCAJUDICIAL = :OBSSENTENCAJUDICIAL'
      'where'
      '  IDBENEFHABILITA = :OLD_IDBENEFHABILITA')
    InsertSQL.Strings = (
      'insert into BENEFHABILITA'
      
        ' (IDBENEFHABILITA, IDPESSOA, IDTITULAR, IDBENEFICIO, NUMBENEFICI' +
        'O,'
      
        '   NUMBRDP,  DATAREQUERIMENTO ,DIB,  DIP,  ESTADO, NUP,TEMPOSERV' +
        'ICOANOS,'
      
        '    TEMPOSERVICOMES,TEMPOSERVICODIAS,PERCENTUALINSS,INDICEREAJUS' +
        'TETETO, RMI, DEC, FLGPAGAINSS, BENEFLEI142, '
      '    FLGSENTENCAJUDICIAL, DATAFINAL,  OBSSENTENCAJUDICIAL)'
      'values'
      
        '  (:IDBENEFHABILITA, :IDPESSOA, :IDTITULAR, :IDBENEFICIO, :NUMBE' +
        'NEFICIO,'
      
        '   :NUMBRDP, :DATAREQUERIMENTO ,:DIB, :DIP, :ESTADO, :NUP,:TEMPO' +
        'SERVICOANOS,'
      
        '   :TEMPOSERVICOMES,:TEMPOSERVICODIAS,:PERCENTUALINSS,:INDICEREA' +
        'JUSTETETO,  :RMI, :DEC, :FLGPAGAINSS, :BENEFLEI142,'
      '   :FLGSENTENCAJUDICIAL, :DATAFINAL,  :OBSSENTENCAJUDICIAL)')
    DeleteSQL.Strings = (
      'delete from BENEFHABILITA'
      'where'
      '  IDBENEFHABILITA = :OLD_IDBENEFHABILITA')
    Left = 554
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleção de Processo de Benefício'
    Colunas.Strings = (
      'BH.NUMBENEFICIO'
      'DT.MATRICULA'
      'D.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número Benefício'
      'Matricula Titular'
      'Matricula Beneficiário'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOAFISICA PF'
      'DEPENTIT D'
      'DEPENTIT DT'
      'PARTPREVPLAN PPP'
      'PLANPREVCONTABIL PPC'
      'BENEFHABILITA BH')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'BH.IDBENEFHABILITA')
    Filtro.Strings = (
      'P.IDPESSOA  = PF.IDPESSOA'
      'P.IDPESSOA  = D.IDPESSOA'
      'D.IDTITULAR = DT.IDPESSOA'
      'P.IDPESSOA  = PPP.IDPESSOA(+)'
      'PPP.IDPLANOPREV = PPC.IDPLANOPREV(+)'
      'PPP.FLGDESATIVADO(+)  = 0'
      'D.MATRICULA IS NOT NULL'
      'P.IDPESSOA = BH.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '15'
      '15'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 659
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 745
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    Operacao = opVazio
    Left = 268
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT P.IDPESSOA,'
      '       D.IDTITULAR,'
      '       P.NOME,'
      '       P.NUMDOCUMENTO,'
      '       PF.DATANASC,'
      '       D.MATRICULA AS MATRICULADEP,'
      '       DT.MATRICULA AS MATRICULATITULAR,'
      '       PPP.IDPLANOPREV,'
      '       PPC.IDPLANOPREV AS IDPLANPREVCONTAB,'
      '       BH.IDBENEFHABILITA,'
      '       BH.NUMBENEFICIO,'
      '       BH.DATAREQUERIMENTO,'
      '       BH.DIB,'
      '       BH.DIP,'
      '       BH.ESTADO,'
      '       BH.IDBENEFICIO,'
      '       BH.NUMBRDP,'
      '       BH.FLGREQUERIMENTO,'
      '       BH.FLGCONCESSAO,'
      '       BH.NUP,'
      '       BH.TEMPOSERVICOANOS,'
      '       BH.TEMPOSERVICOMES,'
      '       BH.TEMPOSERVICODIAS,'
      '       BH.PERCENTUALINSS,'
      '       BH.INDICEREAJUSTETETO,'
      '       BH.RMI,'
      '       BH.DEC,'
      '       BH.FLGPAGAINSS,'
      '       BH.BENEFLEI142,'
      '       BH.FLGSENTENCAJUDICIAL,'
      '       BH.DATAFINAL,'
      '       BH.OBSSENTENCAJUDICIAL '
      '       '
      '  FROM PESSOA           P,'
      '       PESSOAFISICA     PF,'
      '       DEPENTIT         D,'
      '       DEPENTIT         DT,'
      '       PARTPREVPLAN     PPP,'
      '       PLANPREVCONTABIL PPC,'
      '       BENEFHABILITA BH'
      '       '
      ' WHERE '
      '   P.IDPESSOA  = PF.IDPESSOA  '
      '   AND P.IDPESSOA  = D.IDPESSOA  '
      '   AND D.IDTITULAR = DT.IDPESSOA  '
      '   AND P.IDPESSOA  = PPP.IDPESSOA(+) '
      '   AND PPP.IDPLANOPREV = PPC.IDPLANOPREV(+) '
      '   AND PPP.FLGDESATIVADO(+)  = 0  '
      '   AND P.IDPESSOA = BH.IDPESSOA '
      '   AND P.IDPESSOA = :IDPESSOA'
      '   AND BH.IDBENEFHABILITA = :IDBENEFHABILITA')
    Left = 473
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFHABILITA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object qryMATRICULADEP: TStringField
      FieldName = 'MATRICULADEP'
      Size = 15
    end
    object qryMATRICULATITULAR: TStringField
      FieldName = 'MATRICULATITULAR'
      Size = 15
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
    object qryIDBENEFHABILITA: TFloatField
      FieldName = 'IDBENEFHABILITA'
    end
    object qryNUMBENEFICIO: TStringField
      FieldName = 'NUMBENEFICIO'
      Size = 15
    end
    object qryDATAREQUERIMENTO: TDateTimeField
      FieldName = 'DATAREQUERIMENTO'
    end
    object qryDIB: TDateTimeField
      FieldName = 'DIB'
    end
    object qryDIP: TDateTimeField
      FieldName = 'DIP'
    end
    object qryESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryNUMBRDP: TStringField
      FieldName = 'NUMBRDP'
      Size = 15
    end
    object qryFLGREQUERIMENTO: TFloatField
      FieldName = 'FLGREQUERIMENTO'
    end
    object qryFLGCONCESSAO: TFloatField
      FieldName = 'FLGCONCESSAO'
    end
    object qryNUP: TStringField
      FieldName = 'NUP'
      EditMask = '99999.999999/9999;0;_'
      Size = 17
    end
    object qryTEMPOSERVICOANOS: TFloatField
      FieldName = 'TEMPOSERVICOANOS'
    end
    object qryTEMPOSERVICOMES: TFloatField
      FieldName = 'TEMPOSERVICOMES'
    end
    object qryTEMPOSERVICODIAS: TFloatField
      FieldName = 'TEMPOSERVICODIAS'
    end
    object qryPERCENTUALINSS: TFloatField
      FieldName = 'PERCENTUALINSS'
    end
    object qryINDICEREAJUSTETETO: TFloatField
      FieldName = 'INDICEREAJUSTETETO'
    end
    object qryRMI: TFloatField
      FieldName = 'RMI'
    end
    object qryDEC: TDateTimeField
      FieldName = 'DEC'
    end
    object qryFLGPAGAINSS: TFloatField
      FieldName = 'FLGPAGAINSS'
    end
    object qryBENEFLEI142: TFloatField
      FieldName = 'BENEFLEI142'
    end
    object qryFLGSENTENCAJUDICIAL: TFloatField
      FieldName = 'FLGSENTENCAJUDICIAL'
    end
    object qryDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryOBSSENTENCAJUDICIAL: TMemoField
      FieldName = 'OBSSENTENCAJUDICIAL'
      BlobType = ftMemo
      Size = 3000
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 908
    Top = 490
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HISTBENEFHABILITA HBH,  SITHABILITACAOINSS SH'
      'WHERE '
      'HBH.IDBENEFHABILITA = :IDBENEFHABILITA'
      'AND HBH.IDSITHABILITACAO = SH.IDSITHABILITACAO'
      'ORDER BY DATAREGISTRO DESC')
    UpdateObject = updDet
    ControlType.Strings = (
      'OBSERVACAO;RichEdit;')
    ValidateWithMask = True
    Left = 467
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBENEFHABILITA'
        ParamType = ptUnknown
      end>
    object qryDetDATAREGISTRO: TDateTimeField
      DisplayLabel = 'Data Alteração'
      DisplayWidth = 18
      FieldName = 'DATAREGISTRO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.DATAREGISTRO'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Situação para Habilitação'
      DisplayWidth = 39
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Size = 40
    end
    object qryDetOBSERVACAO: TMemoField
      DisplayLabel = 'Observações Complementares'
      DisplayWidth = 61
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object qryDetIDBENEFHABILITA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFHABILITA'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDBENEFHABILITA'
      Visible = False
    end
    object qryDetIDHISTBENEFHABILITA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTBENEFHABILITA'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDHISTBENEFHABILITA'
      Visible = False
    end
    object qryDetIDSITHABILITACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITHABILITACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDSITHABILITACAO'
      Visible = False
    end
    object qryDetTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetTRGDTALTERACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGDTALTERACAO'
      Visible = False
    end
    object qryDetTRGUSERALTERACAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
    object qryDetIDSITHABILITACAO_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITHABILITACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object qryDetFLGHABILITACAOINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGHABILITACAOINSS'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object qryDetTRGDTINCLUSAO_1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO_1: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
    object qryDetTRGDTALTERACAO_1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTALTERACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object qryDetTRGUSERALTERACAO_1: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERALTERACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'Update HISTBENEFHABILITA'
      'Set'
      '   DATAREGISTRO = :DATAREGISTRO,'
      '   IDSITHABILITACAO = :IDSITHABILITACAO,'
      '   OBSERVACAO = :OBSERVACAO'
      'Where'
      '  IDHISTBENEFHABILITA = :OLD_IDHISTBENEFHABILITA')
    InsertSQL.Strings = (
      'Insert into HISTBENEFHABILITA'
      '  (IDBENEFHABILITA,IDHISTBENEFHABILITA,DATAREGISTRO,'
      '   IDSITHABILITACAO, OBSERVACAO)'
      ' values'
      '  (:IDBENEFHABILITA,SEQHSTBFHABIDHSTBFHAB.nextval,:DATAREGISTRO,'
      '   :IDSITHABILITACAO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'Delete from HISTBENEFHABILITA'
      'where     IDHISTBENEFHABILITA = :OLD_IDHISTBENEFHABILITA')
    Left = 777
    Top = 479
  end
  object MSseg: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleção de Segurado'
    Colunas.Strings = (
      'DT.MATRICULA'
      'D.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula Titular'
      'Matricula Beneficiário'
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOAFISICA PF'
      'DEPENTIT D'
      'DEPENTIT DT'
      'PARTPREVPLAN PPP'
      'PLANPREVCONTABIL PPC')
    CamposChave.Strings = (
      'DT.MATRICULA'
      'D.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    Filtro.Strings = (
      'P.IDPESSOA  = PF.IDPESSOA'
      'P.IDPESSOA  = D.IDPESSOA'
      'D.IDTITULAR = DT.IDPESSOA'
      'P.IDPESSOA  = PPP.IDPESSOA(+)'
      'PPP.IDPLANOPREV = PPC.IDPLANOPREV(+)'
      'PPP.FLGDESATIVADO(+)  = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '15'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MSsegBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 875
    Top = 2
  end
  object DsSelSegurado: TwwDataSource
    DataSet = qrySelSegurado
    Left = 923
    Top = 162
  end
  object qrySelSegurado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.IDPESSOA, D.IDTITULAR, P.NOME, P.NUMDOCUMENTO, PF.DATAN' +
        'ASC, '
      
        '  PTIT.NOME AS NOMETITULAR, decode(D.MATRICULA,DT.MATRICULA,'#39#39', ' +
        'P.NOME) NOMEDEP,   '
      
        '       decode(D.MATRICULA,DT.MATRICULA,'#39#39',D.MATRICULA) MATRICULA' +
        'DEP, DT.MATRICULA AS MATRICULATITULAR,'
      '       (SELECT nvl(bf.idplanoprev,PP.IDPLANOPREV)'
      '        FROM PARTPREVPLAN PP'
      
        '             LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idti' +
        'tular AND'
      
        '                                           bf.idpessoa = :idpess' +
        'oa AND'
      
        '                                           BF.IDTPPAGTOBENEFIC =' +
        ' 1 AND'
      
        '                                           BF.FONTEPAGADORA = 1 ' +
        'AND'
      
        '                                           BF.IDSITBENEFICIO = 1' +
        ' AND'
      
        '                                           (BF.IDPLANPREVCONTAB ' +
        '= 28 OR'
      
        '                                            (BF.IDPLANPREVCONTAB' +
        ' <> 28 AND'
      
        '                                             NOT EXISTS (SELECT ' +
        '1'
      
        '                                                         FROM BE' +
        'NEFBFCIARIO BF1'
      
        '                                                         WHERE B' +
        'F1.IDTPPAGTOBENEFIC = 1 AND'
      
        '                                                               B' +
        'F1.FONTEPAGADORA = 1 AND'
      
        '                                                               B' +
        'F1.IDPLANPREVCONTAB = 28 AND'
      
        '                                                               B' +
        'F1.IDSITBENEFICIO = 1 AND'
      
        '                                                               B' +
        'F1.IDTITULAR = BF.IDTITULAR AND'
      
        '                                                               B' +
        'F1.IDPESSOA = BF.IDPESSOA)))'
      '        WHERE PP.IDPESSOA = D.IDTITULAR AND'
      '              (pp.idsitplanoprev IN (25,26,27,28,29) OR'
      '              (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND'
      '               pp.flgdesativado = 0 AND'
      '               NOT EXISTS (SELECT 1'
      '                           FROM partprevplan ppp1'
      '                           WHERE ppp1.idpessoa = pp.idpessoa'
      
        '                             AND ppp1.idsitplanoprev IN (25,26,2' +
        '7,28,29)))) AND'
      '               rownum = 1) IDPLANOPREV,'
      
        '       (SELECT nvl(bf.Idplanprevcontab,decode(pp.idsitplanoprev,' +
        '25,28,26,28,27,28,28,28,29,28,PP.IDPLANOPREV))'
      '        FROM PARTPREVPLAN PP'
      
        '             LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idti' +
        'tular AND'
      
        '                                           bf.idpessoa = :idpess' +
        'oa AND'
      
        '                                           BF.IDTPPAGTOBENEFIC =' +
        ' 1 AND'
      
        '                                           BF.FONTEPAGADORA = 1 ' +
        'AND'
      
        '                                           BF.IDSITBENEFICIO = 1' +
        ' AND'
      
        '                                           (BF.IDPLANPREVCONTAB ' +
        '= 28 OR'
      
        '                                            (BF.IDPLANPREVCONTAB' +
        ' <> 28 AND'
      
        '                                             NOT EXISTS (SELECT ' +
        '1'
      
        '                                                         FROM BE' +
        'NEFBFCIARIO BF1'
      
        '                                                         WHERE B' +
        'F1.IDTPPAGTOBENEFIC = 1 AND'
      
        '                                                               B' +
        'F1.FONTEPAGADORA = 1 AND'
      
        '                                                               B' +
        'F1.IDPLANPREVCONTAB = 28 AND'
      
        '                                                               B' +
        'F1.IDSITBENEFICIO = 1 AND'
      
        '                                                               B' +
        'F1.IDTITULAR = BF.IDTITULAR AND'
      
        '                                                               B' +
        'F1.IDPESSOA = BF.IDPESSOA)))'
      '        WHERE PP.IDPESSOA = D.IDTITULAR AND'
      '              (pp.idsitplanoprev IN (25,26,27,28,29) OR'
      '              (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND'
      '               pp.flgdesativado = 0 AND'
      '               NOT EXISTS (SELECT 1'
      '                           FROM partprevplan ppp1'
      '                           WHERE ppp1.idpessoa = pp.idpessoa'
      
        '                             AND ppp1.idsitplanoprev IN (25,26,2' +
        '7,28,29)))) AND'
      '               rownum = 1) IDPLANPREVCONTAB,'
      '       (SELECT (SELECT PPC.NOME'
      '                FROM PLANPREVCONTABIL PPC'
      
        '                WHERE PPC.IDPLANOPREV = nvl(bf.Idplanprevcontab,' +
        'decode(pp.idsitplanoprev,25,28,26,28,27,28,28,28,29,28,PP.IDPLAN' +
        'OPREV)))'
      '        FROM PARTPREVPLAN PP'
      
        '             LEFT JOIN benefbfciario bf ON pp.idpessoa = bf.idti' +
        'tular AND'
      
        '                                           bf.idpessoa = :idpess' +
        'oa AND'
      
        '                                           BF.IDTPPAGTOBENEFIC =' +
        ' 1 AND'
      
        '                                           BF.FONTEPAGADORA = 1 ' +
        'AND'
      
        '                                           BF.IDSITBENEFICIO = 1' +
        ' AND'
      
        '                                           (BF.IDPLANPREVCONTAB ' +
        '= 28 OR'
      
        '                                            (BF.IDPLANPREVCONTAB' +
        ' <> 28 AND'
      
        '                                             NOT EXISTS (SELECT ' +
        '1'
      
        '                                                         FROM BE' +
        'NEFBFCIARIO BF1'
      
        '                                                         WHERE B' +
        'F1.IDTPPAGTOBENEFIC = 1 AND'
      
        '                                                               B' +
        'F1.FONTEPAGADORA = 1 AND'
      
        '                                                               B' +
        'F1.IDPLANPREVCONTAB = 28 AND'
      
        '                                                               B' +
        'F1.IDSITBENEFICIO = 1 AND'
      
        '                                                               B' +
        'F1.IDTITULAR = BF.IDTITULAR AND'
      
        '                                                               B' +
        'F1.IDPESSOA = BF.IDPESSOA)))'
      '        WHERE PP.IDPESSOA = D.IDTITULAR AND'
      '              (pp.idsitplanoprev IN (25,26,27,28,29) OR'
      '              (pp.idsitplanoprev NOT IN (25,26,27,28,29) AND'
      '               pp.flgdesativado = 0 AND'
      '               NOT EXISTS (SELECT 1'
      '                           FROM partprevplan ppp1'
      '                           WHERE ppp1.idpessoa = pp.idpessoa'
      
        '                             AND ppp1.idsitplanoprev IN (25,26,2' +
        '7,28,29)))) AND'
      '               rownum = 1) DESCRICAOPLANOCONTABIL'
      'FROM DEPENTIT D'
      '     JOIN PESSOA P ON D.IDPESSOA = P.IDPESSOA'
      '     JOIN PESSOA PTIT ON D.IDTITULAR = PTIT.IDPESSOA'
      '     JOIN PESSOAFISICA PF ON D.IDPESSOA = PF.IDPESSOA'
      '     JOIN DEPENTIT DT ON D.IDTITULAR = DT.IDPESSOA AND'
      '                         D.IDTITULAR = DT.IDTITULAR'
      'WHERE D.IDPESSOA = :idpessoa'
      '        and D.IDTITULAR = :idpessoatitular'
      '')
    ValidateWithMask = True
    Left = 923
    Top = 146
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessoatitular'
        ParamType = ptUnknown
      end>
  end
  object qryLookEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT distinct(SIGLACENTRAL)FROM UFINSS'
      'order by SIGLACENTRAL')
    ValidateWithMask = True
    Left = 438
    Top = 472
  end
  object dsLookEstado: TwwDataSource
    AutoEdit = False
    DataSet = qryLookEstado
    Left = 726
    Top = 369
  end
  object qryLookBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  distinct b.idbeneficio, b.nome FROM beneficio b , benefp' +
        'lanprev bp'
      'where b.idbeneficio = bp.idbeneficio'
      'and bp.FLGHABILITAINSS = 1'
      'order by nome desc')
    ControlType.Strings = (
      'IDBENEFICIO;ImageIndex;Original Size')
    ValidateWithMask = True
    Left = 398
    Top = 128
  end
  object dsLookBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryLookBenef
    Left = 398
    Top = 73
  end
  object dsLookStiHabBf: TwwDataSource
    AutoEdit = False
    DataSet = qryLookStiHabBf
    Left = 814
    Top = 385
  end
  object qryLookStiHabBf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM SITHABILITACAOINSS')
    ValidateWithMask = True
    Left = 846
    Top = 368
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 891
    Top = 304
  end
  object ppdbpSegurado: TppDBPipeline
    DataSource = DsSelSegurado
    UserName = 'dbpSegurado'
    Left = 582
    Top = 464
    object ppdbpSeguradoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppdbpSeguradoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppdbpSeguradoppField3: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object ppdbpSeguradoppField4: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppdbpSeguradoppField5: TppField
      FieldAlias = 'MATRICULADEP'
      FieldName = 'MATRICULADEP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppdbpSeguradoppField6: TppField
      FieldAlias = 'MATRICULATITULAR'
      FieldName = 'MATRICULATITULAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppdbpSeguradoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdbpSeguradoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCONTAB'
      FieldName = 'IDPLANPREVCONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdbpSeguradoppField9: TppField
      FieldAlias = 'DESCRICAOPLANOCONTABIL'
      FieldName = 'DESCRICAOPLANOCONTABIL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
  end
  object ppdbpBeneficio: TppDBPipeline
    DataSource = ds
    UserName = 'dbpSegurado1'
    Left = 686
    Top = 464
    object ppdbpBeneficioppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppdbpBeneficioppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppdbpBeneficioppField3: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object ppdbpBeneficioppField4: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppdbpBeneficioppField5: TppField
      FieldAlias = 'MATRICULADEP'
      FieldName = 'MATRICULADEP'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppdbpBeneficioppField6: TppField
      FieldAlias = 'MATRICULATITULAR'
      FieldName = 'MATRICULATITULAR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppdbpBeneficioppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppdbpBeneficioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCONTAB'
      FieldName = 'IDPLANPREVCONTAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppdbpBeneficioppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFHABILITA'
      FieldName = 'IDBENEFHABILITA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppdbpBeneficioppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMBENEFICIO'
      FieldName = 'NUMBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppdbpBeneficioppField11: TppField
      FieldAlias = 'DATAREQUERIMENTO'
      FieldName = 'DATAREQUERIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object ppdbpBeneficioppField12: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppdbpBeneficioppField13: TppField
      FieldAlias = 'DIP'
      FieldName = 'DIP'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppdbpBeneficioppField14: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppdbpBeneficioppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppdbpBeneficioppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMBRDP'
      FieldName = 'NUMBRDP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppdbpBeneficioppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGREQUERIMENTO'
      FieldName = 'FLGREQUERIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppdbpBeneficioppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGCONCESSAO'
      FieldName = 'FLGCONCESSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
  end
  object ppdbpHistmov: TppDBPipeline
    DataSource = dsDet
    UserName = 'dbpHistmov'
    Left = 734
    Top = 448
    object ppdbpHistmovppField1: TppField
      FieldAlias = 'DATAREGISTRO'
      FieldName = 'DATAREGISTRO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object ppdbpHistmovppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 40
      DisplayWidth = 39
      Position = 1
    end
    object ppdbpHistmovppField3: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 61
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppdbpHistmovppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFHABILITA'
      FieldName = 'IDBENEFHABILITA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppdbpHistmovppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTBENEFHABILITA'
      FieldName = 'IDHISTBENEFHABILITA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppdbpHistmovppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSITHABILITACAO'
      FieldName = 'IDSITHABILITACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppdbpHistmovppField7: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppdbpHistmovppField8: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppdbpHistmovppField9: TppField
      FieldAlias = 'TRGDTALTERACAO'
      FieldName = 'TRGDTALTERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppdbpHistmovppField10: TppField
      FieldAlias = 'TRGUSERALTERACAO'
      FieldName = 'TRGUSERALTERACAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object ppdbpHistmovppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSITHABILITACAO_1'
      FieldName = 'IDSITHABILITACAO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppdbpHistmovppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGHABILITACAOINSS'
      FieldName = 'FLGHABILITACAOINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppdbpHistmovppField13: TppField
      FieldAlias = 'TRGDTINCLUSAO_1'
      FieldName = 'TRGDTINCLUSAO_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppdbpHistmovppField14: TppField
      FieldAlias = 'TRGUSERINCLUSAO_1'
      FieldName = 'TRGUSERINCLUSAO_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object ppdbpHistmovppField15: TppField
      FieldAlias = 'TRGDTALTERACAO_1'
      FieldName = 'TRGDTALTERACAO_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object ppdbpHistmovppField16: TppField
      FieldAlias = 'TRGUSERALTERACAO_1'
      FieldName = 'TRGUSERALTERACAO_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
  end
  object pprRelHabINSS: TppReport
    AutoStop = False
    DataPipeline = ppdbpHistmov
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 489
    Top = 391
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppdbpHistmov'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 188119
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = 'Fundação dos Economiários Federais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 50536
        mmTop = 3969
        mmWidth = 76465
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28046
        mmLeft = 24077
        mmTop = 0
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label2'
        Caption = 'DIBEN - Diretoria de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 11906
        mmWidth = 47096
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        Caption = 'GESEG - Gerência de Seguridade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 17727
        mmWidth = 50271
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        Caption = 'COABE - Coordenação de Assistidos e Gestão de Benefícios'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 50536
        mmTop = 23283
        mmWidth = 91811
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label5'
        Caption = 
          ' Demonstrativo de Pré-Cadastro para Habilitação de Benefícios do' +
          ' INSS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 39158
        mmTop = 39158
        mmWidth = 146050
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label6'
        Caption = ' Informações do Segurado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 83608
        mmTop = 51594
        mmWidth = 49107
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label7'
        Caption = 'CPF do Segurado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 24606
        mmTop = 63765
        mmWidth = 33909
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label8'
        Caption = 'Nome do Segurado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 24606
        mmTop = 70644
        mmWidth = 36957
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label9'
        Caption = 'Data de Nascimento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 77258
        mmWidth = 38629
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label10'
        Caption = 'Matrícula Titular:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 83608
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label11'
        Caption = 'Plano Contábil:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 89959
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label12'
        Caption = 'Benefício Identificado para Requerimento:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 96573
        mmWidth = 78317
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label13'
        Caption = 'Matrícula Segurado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 100013
        mmTop = 83608
        mmWidth = 37571
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = ppdbpSegurado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpSegurado'
        mmHeight = 4763
        mmLeft = 60590
        mmTop = 63765
        mmWidth = 115888
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = ppdbpSegurado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpSegurado'
        mmHeight = 4763
        mmLeft = 63765
        mmTop = 70644
        mmWidth = 112713
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText3'
        DataField = 'DATANASC'
        DataPipeline = ppdbpSegurado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpSegurado'
        mmHeight = 4763
        mmLeft = 65352
        mmTop = 76994
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULATITULAR'
        DataPipeline = ppdbpSegurado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpSegurado'
        mmHeight = 4763
        mmLeft = 57415
        mmTop = 83608
        mmWidth = 38100
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULADEP'
        DataPipeline = ppdbpSegurado
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpSegurado'
        mmHeight = 4763
        mmLeft = 138907
        mmTop = 83608
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label14'
        Caption = ' Informações do Benefício do INSS '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 77523
        mmTop = 111390
        mmWidth = 65881
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label15'
        Caption = 'Número do Benefício (NB):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 120386
        mmWidth = 49742
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label17'
        Caption = 'Benefício:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 126736
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText8'
        DataField = 'NUMBENEFICIO'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 76200
        mmTop = 120386
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label101'
        Caption = 'Número do BRDP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 138907
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label19'
        Caption = 'DIP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 150813
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label20'
        Caption = 'DIB:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 144992
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label18'
        Caption = 'Estado:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 156634
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label22'
        Caption = 'Histórico de Movimentação '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 84667
        mmTop = 170392
        mmWidth = 51858
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText11'
        DataField = 'NUMBRDP'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 59796
        mmTop = 138907
        mmWidth = 44979
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText12'
        DataField = 'DIP'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 33073
        mmTop = 144992
        mmWidth = 31750
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText13'
        DataField = 'DIB'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 33073
        mmTop = 150813
        mmWidth = 31750
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText14'
        DataField = 'ESTADO'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 39688
        mmTop = 156634
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText15'
        DataField = 'DATAREQUERIMENTO'
        DataPipeline = ppdbpBeneficio
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpBeneficio'
        mmHeight = 4763
        mmLeft = 101071
        mmTop = 133086
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label25'
        Caption = 'Data de entrada do Requerimento (DER):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 24871
        mmTop = 133086
        mmWidth = 75406
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label21'
        Caption = 'Data Alteração '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 20902
        mmTop = 178594
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label26'
        Caption = 'Situação para Habitação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 52917
        mmTop = 178594
        mmWidth = 45244
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label27'
        Caption = 'Observações Complementares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 103452
        mmTop = 178594
        mmWidth = 57150
        BandType = 0
      end
      object pplbBenefIdeReq: TppLabel
        UserName = 'Label24'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 103717
        mmTop = 96573
        mmWidth = 73025
        BandType = 0
      end
      object pplbBeneficio: TppLabel
        UserName = 'Label28'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 44979
        mmTop = 126736
        mmWidth = 131763
        BandType = 0
      end
      object pplbPlanoContabil: TppLabel
        UserName = 'Label16'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 53975
        mmTop = 89959
        mmWidth = 122502
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        UserName = 'DBText16'
        CharWrap = True
        DataField = 'DESCRICAO'
        DataPipeline = ppdbpHistmov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbpHistmov'
        mmHeight = 10319
        mmLeft = 52388
        mmTop = 265
        mmWidth = 45773
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'DATAREGISTRO'
        DataPipeline = ppdbpHistmov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppdbpHistmov'
        mmHeight = 4657
        mmLeft = 20902
        mmTop = 264
        mmWidth = 30141
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText18'
        CharWrap = True
        DataField = 'OBSERVACAO'
        DataPipeline = ppdbpHistmov
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppdbpHistmov'
        mmHeight = 10583
        mmLeft = 103452
        mmTop = 265
        mmWidth = 78846
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLabel49: TppLabel
        UserName = 'Label23'
        Caption = 'Benefício Previdenciário'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 20108
        mmTop = 7673
        mmWidth = 45508
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 153459
        mmTop = 7408
        mmWidth = 35719
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 119592
        mmTop = 7408
        mmWidth = 2117
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label29'
        Caption = 'de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 112713
        mmTop = 7408
        mmWidth = 4498
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 107950
        mmTop = 7408
        mmWidth = 2117
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label30'
        Caption = 'Página'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 92869
        mmTop = 7408
        mmWidth = 12700
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleção de Processo de Benefício'
    Colunas.Strings = (
      'BH.NUMBENEFICIO'
      'DT.MATRICULA'
      'D.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número Benefício'
      'Matricula Titular'
      'Matricula Beneficiário'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOAFISICA PF'
      'DEPENTIT D'
      'DEPENTIT DT'
      'PARTPREVPLAN PPP'
      'PLANPREVCONTABIL PPC'
      'BENEFHABILITA BH')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'BH.IDBENEFHABILITA'
      'D.IDTITULAR')
    Filtro.Strings = (
      'P.IDPESSOA  = PF.IDPESSOA'
      'P.IDPESSOA  = D.IDPESSOA'
      'D.IDTITULAR = DT.IDPESSOA'
      'P.IDPESSOA  = PPP.IDPESSOA(+)'
      'PPP.IDPLANOPREV = PPC.IDPLANOPREV(+)'
      'PPP.FLGDESATIVADO(+)  = 0'
      'P.IDPESSOA = BH.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '15'
      '15'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MontaSelectBenefBeforeOpenCds
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 347
    Top = 2
  end
  object wwClientDataSet1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 882
    Top = 257
  end
  object dspDet: TDataSetProvider
    DataSet = qryDet
    Constraints = True
    Left = 566
    Top = 296
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DATAREGISTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
        Size = 500
      end
      item
        Name = 'IDBENEFHABILITA'
        DataType = ftFloat
      end
      item
        Name = 'IDHISTBENEFHABILITA'
        DataType = ftFloat
      end
      item
        Name = 'IDSITHABILITACAO'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TRGDTALTERACAO'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERALTERACAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDSITHABILITACAO_1'
        DataType = ftFloat
      end
      item
        Name = 'FLGHABILITACAOINSS'
        DataType = ftFloat
      end
      item
        Name = 'TRGDTINCLUSAO_1'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERINCLUSAO_1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TRGDTALTERACAO_1'
        DataType = ftDateTime
      end
      item
        Name = 'TRGUSERALTERACAO_1'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'Indice'
        Fields = 'DATAREGISTRO'
        Options = [ixDescending]
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDBENEFHABILITA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspDet'
    StoreDefs = True
    AfterScroll = cdsDetAfterScroll
    Left = 616
    Top = 328
    object cdsDetDATAREGISTRO: TDateTimeField
      DisplayLabel = 'Data Alteração'
      DisplayWidth = 18
      FieldName = 'DATAREGISTRO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.DATAREGISTRO'
    end
    object cdsDetDESCRICAO: TStringField
      DisplayLabel = 'Situação para Habilitação'
      DisplayWidth = 39
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Size = 40
    end
    object cdsDetOBSERVACAO: TMemoField
      DisplayLabel = 'Observações Complementares'
      DisplayWidth = 61
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
    object cdsDetIDBENEFHABILITA: TFloatField
      FieldName = 'IDBENEFHABILITA'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDBENEFHABILITA'
      Visible = False
    end
    object cdsDetIDHISTBENEFHABILITA: TFloatField
      FieldName = 'IDHISTBENEFHABILITA'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDHISTBENEFHABILITA'
      Visible = False
    end
    object cdsDetIDSITHABILITACAO: TFloatField
      FieldName = 'IDSITHABILITACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.IDSITHABILITACAO'
      Visible = False
    end
    object cdsDetTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGDTINCLUSAO'
      Visible = False
    end
    object cdsDetTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object cdsDetTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGDTALTERACAO'
      Visible = False
    end
    object cdsDetTRGUSERALTERACAO: TStringField
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
    object cdsDetIDSITHABILITACAO_1: TFloatField
      FieldName = 'IDSITHABILITACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object cdsDetFLGHABILITACAOINSS: TFloatField
      FieldName = 'FLGHABILITACAOINSS'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object cdsDetTRGDTINCLUSAO_1: TDateTimeField
      FieldName = 'TRGDTINCLUSAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object cdsDetTRGUSERINCLUSAO_1: TStringField
      FieldName = 'TRGUSERINCLUSAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
    object cdsDetTRGDTALTERACAO_1: TDateTimeField
      FieldName = 'TRGDTALTERACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
    end
    object cdsDetTRGUSERALTERACAO_1: TStringField
      FieldName = 'TRGUSERALTERACAO_1'
      Origin = 'BASEDADOS.HISTBENEFHABILITA.TRGUSERALTERACAO'
      Visible = False
      Size = 30
    end
  end
  object dsDet_Grid: TwwDataSource
    AutoEdit = False
    DataSet = cdsDet
    Left = 771
    Top = 314
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 499
    Top = 354
  end
end
