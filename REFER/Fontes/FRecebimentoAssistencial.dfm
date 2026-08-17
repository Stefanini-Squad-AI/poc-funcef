inherited FrmRecebimentoAssistencial: TFrmRecebimentoAssistencial
  Left = 163
  Top = 220
  Caption = 'Recebimento Assistencial'
  ClientHeight = 159
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 120
    object grbArq_Recebido: TGroupBox
      Left = 5
      Top = 68
      Width = 518
      Height = 47
      Align = alClient
      Caption = 'Nome do Arquivo a ser Recebido'
      TabOrder = 0
      object BevelArqRecebido: TBevel
        Left = 6
        Top = 17
        Width = 406
        Height = 22
      end
      object lblNomeArq_Recebido: TLabel
        Left = 10
        Top = 22
        Width = 394
        Height = 13
        AutoSize = False
        Caption = 'C:\'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sbtnOrigem: TSpeedButton
        Left = 427
        Top = 15
        Width = 72
        Height = 26
        Caption = 'Origem'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnOrigemClick
      end
    end
    object pnlOpcoes: TPanel
      Left = 5
      Top = 5
      Width = 518
      Height = 63
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object grbMesAno: TGroupBox
        Left = 2
        Top = 2
        Width = 163
        Height = 59
        Align = alLeft
        Caption = 'Receber para'
        TabOrder = 0
        object dtpDtReceb: TCMDateTimePicker
          Left = 13
          Top = 25
          Width = 127
          Height = 21
          Hint = 'Data da efetivação usada para o lançamento contábil se existir.'
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
        end
      end
      object grbPatro: TGroupBox
        Left = 168
        Top = 2
        Width = 348
        Height = 59
        Align = alRight
        Caption = 'Patrocinadora'
        TabOrder = 1
        object dblkPatro: TwwDBLookupCombo
          Left = 8
          Top = 25
          Width = 329
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Patrocinadora'#9'F')
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 120
    inherited tb97Fundo: TToolbar97
      DockPos = 401
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
      DockPos = 109
      inherited ToolbarSep971: TToolbarSep97
        Left = 260
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 84
        Width = 92
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 176
        Width = 84
      end
      object bbtnVerificaArq_Recebido: TBitBtn
        Left = 0
        Top = 0
        Width = 84
        Height = 33
        Caption = '&Verificar'
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnVerificaArq_RecebidoClick
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
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 123
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  PT.IDPESSOA, '
      '  P.NOME '
      ''
      'FROM '
      '  PATRO PT, '
      '  PESSOA P'
      ''
      'WHERE '
      '  P.IDPESSOA = PT.IDPESSOA'
      ''
      'ORDER BY '
      '  P.NOME')
    ValidateWithMask = True
    Left = 240
    Top = 32
  end
  object OpenDlg: TOpenDialog
    InitialDir = 'C:\'
    Left = 480
    Top = 80
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 325
    Top = 31
  end
end
