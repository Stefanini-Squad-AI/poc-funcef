inherited frmCadAlteraPdv: TfrmCadAlteraPdv
  Left = 38
  Top = 22
  HelpContext = 160036
  Caption = 'Alteração da  Manutenção por PDV'
  ClientHeight = 470
  ClientWidth = 732
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 732
    Height = 431
    object lblValores: TLabel
      Left = 15
      Top = 5
      Width = 222
      Height = 23
      AutoSize = False
      Caption = 'Dados do Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 10
      Top = 29
      Width = 329
      Height = 166
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 11
        Top = 8
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 11
        Top = 83
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 46
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 123
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 11
        Top = 21
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatro: TEdit
        Left = 11
        Top = 96
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMatricula: TEdit
        Left = 11
        Top = 59
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlano: TEdit
        Left = 11
        Top = 136
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 619
      Top = 29
      Width = 101
      Height = 166
      TabOrder = 1
      object ConsPart1: TConsPart
        Left = 5
        Top = 62
        Width = 91
        Height = 37
        Caption = '&Consulta'
        Enabled = False
        Glyph.Data = {
          76020000424D7602000000000000760000002800000020000000200000000100
          0400000000000002000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333300333333
          3333333333333333333333330033333333333333333333333333333303333330
          3333333333333333333333330333333033333333333333333333333330333300
          0333333333333333333333333033330003333333333333333333333330033003
          3333333333333333333333333003300333333333333333333333333333030033
          3333333333333333333333333303003333333333333333333333333333000333
          3333333333333333333333333300033333333333333333330033333333000333
          3333333333333330003333333300033333333337000733000333333303300003
          333333000000000333333333033000033333307888EE70333333333330300333
          33337088888EE073333333333030033333330888888888033333333333000333
          33330888888888033333333333000333333308E8888888033333333333300333
          333308EEE888880333333333333003333333307EEE8870333333333333330033
          3333330088800333333333333333003333333337000733333333333333330033
          3333333333333333333333333333003333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
      end
      object bbtnProcurar: TBitBtn
        Left = 5
        Top = 18
        Width = 91
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object bbtnOpcoes: TBitBtn
        Left = 5
        Top = 105
        Width = 91
        Height = 37
        Hint = 'Verificar Regra de Concessão do Benefício'
        Cancel = True
        Caption = '&Opções'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
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
    object Panel5: TPanel
      Left = 343
      Top = 29
      Width = 271
      Height = 166
      Enabled = False
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSitPatro: TLabel
        Left = 8
        Top = 45
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 83
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 121
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edInscNumero: TEdit
        Left = 8
        Top = 21
        Width = 154
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edSitPatro: TEdit
        Left = 8
        Top = 58
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edSitPlano: TEdit
        Left = 8
        Top = 96
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edSitFundacao: TEdit
        Left = 8
        Top = 134
        Width = 230
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 10
      Top = 200
      Width = 329
      Height = 220
      TabOrder = 3
      object lblBeneficio: TLabel
        Left = 11
        Top = 99
        Width = 229
        Height = 13
        Caption = 'Benefício a Requerer Após Manutenção'
      end
      object Label5: TLabel
        Left = 11
        Top = 151
        Width = 134
        Height = 13
        Caption = 'Programa de Demissão '
      end
      object Label9: TLabel
        Left = 11
        Top = 4
        Width = 222
        Height = 23
        AutoSize = False
        Caption = 'Informação Atual'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label10: TLabel
        Left = 11
        Top = 48
        Width = 72
        Height = 13
        Caption = 'Data Evento'
      end
      object edBeneficio: TEdit
        Left = 11
        Top = 114
        Width = 294
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edEventoPdv: TEdit
        Left = 11
        Top = 166
        Width = 294
        Height = 21
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dtEvento: TCMDateTimePicker
        Left = 11
        Top = 62
        Width = 146
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clSilver
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 2
      end
    end
    object Panel4: TPanel
      Left = 343
      Top = 200
      Width = 376
      Height = 220
      TabOrder = 4
      object Label4: TLabel
        Left = 11
        Top = 101
        Width = 263
        Height = 13
        Caption = 'Novo Benefício a Requerer Após Manutenção'
      end
      object Label7: TLabel
        Left = 11
        Top = 154
        Width = 168
        Height = 13
        Caption = 'Novo Programa de Demissão '
      end
      object Label11: TLabel
        Left = 11
        Top = 48
        Width = 106
        Height = 13
        Caption = 'Nova Data Evento'
      end
      object dblkedBeneficio: TwwDBLookupCombo
        Left = 11
        Top = 114
        Width = 326
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Benefício')
        LookupTable = qryBenef
        LookupField = 'IDBENEFICIO'
        Options = [loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkcmbEventoPdv: TwwDBLookupCombo
        Left = 11
        Top = 167
        Width = 326
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Evento do PDV')
        LookupTable = qryEvento
        LookupField = 'IDEVENTOGERADOR'
        Options = [loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object edDataEventoNova: TCMDateTimePicker
        Left = 11
        Top = 62
        Width = 146
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = clWhite
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 732
    inherited tb97Fundo: TToolbar97
      Left = 560
      DockPos = 563
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 391
      DockPos = 394
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 563
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  b.idbeneficio, b.nome,  bp.idregracalculo'
      'from     benefplanprev bp, beneficio b'
      'where  bp.idplanoprev = :idplanoprev'
      'and     bp.idbeneficio  = b.idbeneficio')
    ValidateWithMask = True
    Left = 567
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end>
  end
  object qryEvento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select  ideventogerador, nome  from  eventogerador'
      'where flginterno = '#39'PD'#39)
    ValidateWithMask = True
    Left = 623
    Top = 376
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 370
  end
  object regCalculo: TRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 118
    Top = 370
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'P1.NOME'
      'PP.INSCRICAONUMERO'
      'PP.INSCRICAODATA'
      'PL.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Data de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOSPREV EP'
      'PESSOA P1'
      'PESSOA PATRO'
      'PLANPREV PL'
      'EVENTOGERADOR EG'
      'SITFUNC SF'
      'SITPART SP'
      'SITPLANOPREV SPP'
      'ELEGPATRO EL '
      'PARTPREVPLAN PP'
      'BENEFICIO BE')
    CamposChave.Strings = (
      'P1.NOME AS PARTICIPANTE'
      'PATRO.NOME AS PATRO'
      'PL.NOME AS PLANO'
      'EG.NOME AS EVENTO'
      'EP.DATAEVENTO'
      'SF.DESCRICAO AS SITFUNC'
      'SP.DESCRICAO AS SITPART'
      'SPP.DESCRICAO AS SITPLANO'
      'EP.IDPESSOA'
      'EP.IDPESSJUR'
      'EP.IDPLANOPREV'
      'EP.IDEVENTOGERADOR'
      'EP.IDSITPLANOATUAL'
      'EP.IDSITFUNCATUAL'
      'EP.IDSITPARTATUAL'
      'PP.SEQPROPOSTA'
      'EP.IDEVENTOSPREV'
      'EP.IDSITPARTNOVO'
      'EL .MATRICULA'
      'PP.INSCRICAONUMERO'
      'BE.NOME')
    Filtro.Strings = (
      'EP.IDPESSOA  = P1.IDPESSOA'
      'EP.IDPESSJUR = PATRO.IDPESSOA'
      'EP.IDPLANOPREV = PL.IDPLANOPREV'
      'EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'EP.IDSITFUNCNOVO = SF.IDSITFUNC'
      'EP.IDSITPARTNOVO = SP.IDSITPART'
      'EP.IDSITPLANONOVO = SPP.IDSITPLANOPREV'
      'EP.FLGEFETIVADO = 1'
      'EP.DATAVOLTA IS NULL'
      'EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR'
      'EG.FLGINTERNO = '#39'PD'#39
      'EP.IDPESSOA = EL.IDPESSOA'
      'EP.IDPESSJUR = EL.IDPESSJUR'
      'EP.IDPESSOA = PP.IDPESSOA'
      'EP.IDPESSJUR = PP.IDPESSJUR'
      'EP.IDPLANOPREV = PP.IDPLANOPREV'
      'EP.IDBENEFICIO =  BE.IDBENEFICIO'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 189
    Top = 370
  end
  object qryGrava: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 296
    Top = 370
  end
end
