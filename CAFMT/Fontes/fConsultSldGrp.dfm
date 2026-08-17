inherited frmConsultSldGrp: TfrmConsultSldGrp
  Left = 17
  Top = 113
  HelpContext = 70052
  BorderStyle = bsSingle
  Caption = 'Saldo Contábil por Grupo'
  ClientHeight = 406
  ClientWidth = 768
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 768
    Height = 367
    object pnlGrid: TPanel
      Left = 5
      Top = 38
      Width = 758
      Height = 324
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object dbgBalPatBem: TwwDBGrid
        Left = 1
        Top = 1
        Width = 756
        Height = 322
        Selected.Strings = (
          'CLASSE'#9'14'#9'Grupo'
          'DESCGRUPO'#9'40'#9'Descrição'
          'S_A'#9'1'#9'A/S'
          'VALORG'#9'16'#9'Aquisição'
          'CMBEM'#9'16'#9'C.M. Aquisição'
          'DEPLANC'#9'16'#9'Depreciação'
          'CMDEP'#9'16'#9'C.M.Depreciação'
          'VALCTB'#9'16'#9'Val.Contábil')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsBalPat
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        Visible = False
        IndicatorColor = icBlack
      end
    end
    object Dock973: TDock97
      Left = 5
      Top = 5
      Width = 758
      Height = 33
      AllowDrag = False
      Background.Data = {
        760F0000424D760F0000000000007600000028000000800000003C0000000100
        040000000000000F000000000000000000001000000000000000000000008080
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        777777777777171717777777777777177771777777777777777077F7FF7FFFF7
        77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
        777777777771717717777777777777777717777777777777777777777FFFFF7F
        7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
        77777777777777171777777777777777717777777777777777777777777FF7FF
        7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
        7777777777771771777777777777777771777777777777777777777777777FFF
        FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
        777777777777771777777777777777777777777777777777777777777777777F
        F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
        7777777777777777777777777777777777777777777777777777777777777777
        7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
        7777777777777777777777777777777777777777777777777777777777777771
        77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
        7777777777777177777777777777777777777777777777777777777777777777
        777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
        7777777777777777771777777777777777777777777777777777777777777777
        7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
        7777777777777717771777777777777777777777777777777777777777777777
        77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
        7777777777777771777777777777777777777777777777777777777777777777
        777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
        7777777777777777777777777777777777777777777777777777777777777777
        777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
        7777777777777777177777777777777777777777777777777777777777777777
        7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
        7777777777777777717777777777777777777777777777777777777777777777
        7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
        7777777777777777777771777777777777777777777777777777777777777777
        7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
        F7F7777777777777771777777777177777777777777777777777777777777777
        77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
        777F7F7777777777777177177771717777777777777777777777777777777777
        77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
        77777F7F77777777777717771777777777777777777777777777777777777777
        777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
        1777777777777777777771717717777177777777777777777777777777777777
        777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
        7777777777771777777777177771777777777777777777777777777777777777
        77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
        7777777777777777777771777777777777777777777777777777777777777777
        777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
        7777777777171777777717777777777777777777777777777777777777777777
        77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
        7777777777777177777771777777777777777777777777777777777777777777
        777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
        7777777777777777777771177777777777777777777777777777777777777777
        7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
        7777777777777777777777777777777777777777777777777777777777777777
        7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
        7777777777777777777771717777777777777777777777777777777777777777
        777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
        7777777777777777777777171777777777777777777777777777777777777777
        71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
        7777777777777777777777177777777777777777777777777777777777777717
        77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
        77777777777777777777777777777777777F7777777777777777777777777171
        7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
        771777777777777777777777777777777177F777777777777777777777777717
        171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
        7777777777777777777777777777777777777F77777777777777777777777777
        77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
        7177777177777777777777777777777777777FF7F77771777777777777777777
        1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
        7777777717777777777777777777777777777777777777777777777777777777
        717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
        7177777777777777777777777777777777771777777777777777777777777777
        77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
        777777F777777777777777777777777777777777717177717777777777777777
        77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
        171777F7F7777777777777177777777777777777777777777777777777777777
        777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
        7777777F77777777777777777777777777777777777777777777777777777777
        77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
        7717777F77777777777777717177777777777777777777777777777777777777
        7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
        777777777F777777777777777717777777777777777777777777777777777777
        777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
        7777777777777777777777771777777777777777777777777777777777777777
        77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
        7777777777777777777777777717177777777771777777777777777777777777
        7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
        7777777777777177777777777777777777777717177777777777777777777777
        77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
        7777777777717777777777777717177777777777777777777777777777777777
        777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
        777777777717171717777777777777777777777771777777777F777777777777
        777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
        77777777171777777777777777777777777777777777777777F7F77777777777
        77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
        7777777777171777777777777777777777777777777777777777777777777777
        777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
        7777777717177777777777777777777777777777777777777777777777777777
        77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
        7777777777171777777777777777777777777777777777777777777777777777
        7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
        77777777777777777F7F77777717777777777777777777777777777771777777
        7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
        77777777777777777F7F7F777777777777777777777777777777771777777777
        77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
        777777777777777777FFF77F7777717777777777777777777777777777177777
        77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
        77F7777777777777777777F77777777777777777777777777777777777777777
        77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
        F77777777777777777777777F7F7777777777777777777777777777777777777
        777777777717777777777777777777777777717777777777777F7F7F7F77F77F
        77F77777777F77777717777777F7777777777777777777777777777777777777
        77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
        7F77F77777777F77777717777777777777777777777777777777777777777777
        7777777777771777777777777777777777777777777777777F77F7F7F777F777
        F77F777777777777771771777777771777777777777777777777777777777777
        777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
        F7F7777777777777777717171777777777777777777777777777777777777777
        77777777777771777777777777777177777777777771777777777777F777F777
        7777777777777777777171717177771777777777777777777777777777777777
        77777777777777777777777777777777777777777777777777777F7F7F7F7777
        F77F77F777777777777771771717177777777777777777777777777777777777
        7777777777777777777777777777777777777777777177777777}
      BoundLines = [blTop, blBottom, blLeft, blRight]
      object ToolWindow971: TToolWindow97
        Left = 281
        Top = 0
        Caption = 'ToolWindow971'
        ClientAreaHeight = 27
        ClientAreaWidth = 471
        DockPos = 281
        TabOrder = 0
        object sbtnGrupo: TSpeedButton
          Left = 442
          Top = 3
          Width = 23
          Height = 22
          Hint = 
            'Pesquisa os lançamentos do bem selecionado até a data especifica' +
            'da|'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
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
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnGrupoClick
        end
        object fcLabel2: TfcLabel
          Left = 6
          Top = 5
          Width = 42
          Height = 16
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.FarColor = clBlue
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Transparent = True
        end
        object edCodGrupo: TMaskEdit
          Left = 52
          Top = 2
          Width = 76
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edDescGrupo: TMaskEdit
          Left = 129
          Top = 2
          Width = 306
          Height = 24
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      object ToolWindow972: TToolWindow97
        Left = 0
        Top = 0
        Caption = 'ToolWindow971'
        ClientAreaHeight = 27
        ClientAreaWidth = 277
        DockPos = 0
        TabOrder = 1
        object fcLabel3: TfcLabel
          Left = 8
          Top = 5
          Width = 127
          Height = 16
          Caption = 'Movimentação até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.FarColor = clBlue
          TextOptions.Style = fclsRaised
          TextOptions.VAlignment = vaTop
          Transparent = True
        end
        object bbtnProcessa: TSpeedButton
          Left = 250
          Top = 3
          Width = 23
          Height = 22
          Hint = 
            'Pesquisa os lançamentos do bem selecionado até a data especifica' +
            'da|'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E668866666
            608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
            66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
            66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
            660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = bbtnProcessaClick
        end
        object dtedfim: TCMDateTimePicker
          Left = 144
          Top = 2
          Width = 101
          Height = 24
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
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ShowButton = True
          TabOrder = 0
          OnEnter = dtedfimEnter
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 768
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 589
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70052
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryGrpAnaliticos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO,'
      '       SB.VALORG0,'
      '       SB.CMBEM0,'
      '       SB.DEPLANC0,'
      '       SB.CMDEP0,'
      '       SB.VALCTB0'
      'FROM BEM B,'
      '     GRUPO G,'
      '     (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      
        '             (SCB.VALORG + SCB.REAVVALORG + SCB.ULTREAVVALORG) A' +
        'S VALORG0,'
      
        '             (SCB.CMBEM + SCB.REAVCMBEM + SCB.ULTREAVCMBEM) AS C' +
        'MBEM0,'
      
        '             (SCB.DEPLANC + SCB.REAVDEPLANC + SCB.ULTREAVDEPLANC' +
        ') AS DEPLANC0,'
      
        '             (SCB.CMDEP + SCB.REAVCMDEP + SCB.ULTREAVCMDEP) AS C' +
        'MDEP0,'
      '             (SCB.VALORG + SCB.CMBEM - SCB.DEPLANC - SCB.CMDEP +'
      
        '              SCB.REAVVALORG + SCB.REAVCMBEM - SCB.REAVDEPLANC -' +
        ' SCB.REAVCMDEP +'
      
        '              SCB.ULTREAVVALORG + SCB.ULTREAVCMBEM - SCB.ULTREAV' +
        'DEPLANC - SCB.ULTREAVCMDEP'
      '             ) AS VALCTB0'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB'
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      ''
      '  AND (B.IDBEM = SB.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO) '
      'ORDER BY G.CLASSE'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 304
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryGrpAnaliticosIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryGrpAnaliticosCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGrpAnaliticosDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryGrpAnaliticosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qryGrpAnaliticosVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryGrpAnaliticosCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qryGrpAnaliticosDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qryGrpAnaliticosCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
    object qryGrpAnaliticosVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
  object qryGrpSinteticos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 440
    Top = 304
    object qryGrpSinteticosCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrpSinteticosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrpSinteticosIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryBalPatGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'ORDER BY CLASSE')
    UpdateObject = updBalPatGrp
    ValidateWithMask = True
    Left = 112
    Top = 304
    object qryBalPatGrpCLASSE: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 10
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryBalPatGrpDESCGRUPO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 44
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBalPatGrpS_A: TStringField
      DisplayLabel = 'S/A'
      DisplayWidth = 2
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatGrpVALORG: TFloatField
      DisplayLabel = 'Aquisição'
      DisplayWidth = 10
      FieldName = 'VALORG'
    end
    object qryBalPatGrpCMBEM: TFloatField
      DisplayLabel = 'C.M. Aquisição'
      DisplayWidth = 15
      FieldName = 'CMBEM'
    end
    object qryBalPatGrpDEPLANC: TFloatField
      DisplayLabel = 'Depreciação'
      DisplayWidth = 12
      FieldName = 'DEPLANC'
    end
    object qryBalPatGrpCMDEP: TFloatField
      DisplayLabel = 'C.M. Depreciação'
      DisplayWidth = 17
      FieldName = 'CMDEP'
    end
    object qryBalPatGrpVALCTB: TFloatField
      DisplayLabel = 'Valor Contábil'
      DisplayWidth = 14
      FieldName = 'VALCTB'
    end
    object qryBalPatGrpIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
  end
  object dsBalPat: TwwDataSource
    DataSet = qryBalPat
    Left = 624
    Top = 216
  end
  object updBalPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDE' +
        'P, VALCTB)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLAN' +
        'C, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 192
    Top = 304
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 24
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = '"CM.PARAMETROSCAFMANUT".MASCCODGRUPO'
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARAMETROSCAFMANUT".IDPESSOA'
    end
  end
  object MSGrupos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Grupo Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO')
    CamposChave.Strings = (
      'GRUPO.IDGRUPO')
    Filtro.Strings = (
      'GRUPO.TIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 152
    Top = 192
  end
  object qrySelGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.NOME, G.IDGRUPO, G.DEPRECIACAO, G.ULTIDBEM, G.CLASSE'
      'FROM  GRUPO G, PLANOGRUPO P'
      'WHERE (G.IDGRUPO = :PIDGRUPO)'
      '  AND (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.STATUS   = '#39'A'#39')'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (P.IDGRUPO  = G.IDGRUPO)'
      'ORDER BY G.CLASSE')
    ValidateWithMask = True
    Left = 216
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySelGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qrySelGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qrySelGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qrySelGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qrySelGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = qrySelGrupo
    Left = 280
    Top = 192
  end
  object qryBalPat: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'WHERE (IDGRUPO IS NULL)'
      'ORDER BY CLASSE')
    UpdateObject = updBalPat
    ValidateWithMask = True
    Left = 552
    Top = 216
    object qryBalPatCLASSE: TStringField
      DisplayLabel = 'Grupo'
      DisplayWidth = 14
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryBalPatDESCGRUPO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBalPatS_A: TStringField
      Alignment = taCenter
      DisplayLabel = 'A/S'
      DisplayWidth = 1
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatVALORG: TFloatField
      DisplayLabel = 'Aquisição'
      DisplayWidth = 16
      FieldName = 'VALORG'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCMBEM: TFloatField
      DisplayLabel = 'C.M. Aquisição'
      DisplayWidth = 16
      FieldName = 'CMBEM'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatDEPLANC: TFloatField
      DisplayLabel = 'Depreciação'
      DisplayWidth = 16
      FieldName = 'DEPLANC'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatCMDEP: TFloatField
      DisplayLabel = 'C.M.Depreciação'
      DisplayWidth = 16
      FieldName = 'CMDEP'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatVALCTB: TFloatField
      DisplayLabel = 'Val.Contábil'
      DisplayWidth = 16
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBalPatIDGRUPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPO'
      Visible = False
    end
  end
  object updBalPat: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDE' +
        'P, VALCTB)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLAN' +
        'C, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 696
    Top = 216
  end
  object qryGrpAnaliticosOriginal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       /*+ INDEX(B XPKBEM) */ G.IDGRUPO,G.CLASSE,G.NOME AS  DESC' +
        'GRUPO,G.TIPO,'
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS  VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS  CMBEM0,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS  DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0) ) AS  CMDEP0,'
      '       ('
      
        '       (NVL(BEMACUM.VALBEMACUM,0) + NVL(CMBEMACUM.VALCMBEMACUM,0' +
        ') -'
      
        '        NVL(DEPBEMACUM.VALDEPBEMACUM,0) + NVL(CMDEPBEMACUM.VALCM' +
        'DEPBEMACUM,0)) -'
      
        '       (NVL(BXBEMACUM.BXVALBEMACUM,0) + NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0) -'
      
        '        NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) + NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) ) AS  VALCTB0'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41,08,32,45,09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  BEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42,22,46,34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  CMBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  VALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43,18,33,47,35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  DEPBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  VALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44,19,48,36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  CMDEPBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (6,20,37))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  BXBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  BXVALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (25,28,38))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  BXCMBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  BXVALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (24,27,39))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  BXDEPBEMACUM,'
      ''
      
        '   (SELECT /*+ INDEX(HM XPKHISTORICOMOV) */ HM.IDPESSOA, HM.IDBE' +
        'M, SUM(HM.VALOFI) AS  BXVALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (26,29,40))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM)  BXCMDEPBEMACUM'
      ''
      
        'WHERE ((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NUL' +
        'L))'
      ''
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      'ORDER BY G.CLASSE'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 224
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDGRUPO'
    end
    object StringField1: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object StringField2: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object StringField3: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object FloatField2: TFloatField
      FieldName = 'VALORG0'
    end
    object FloatField3: TFloatField
      FieldName = 'CMBEM0'
    end
    object FloatField4: TFloatField
      FieldName = 'DEPLANC0'
    end
    object FloatField5: TFloatField
      FieldName = 'CMDEP0'
    end
    object FloatField6: TFloatField
      FieldName = 'VALCTB0'
    end
  end
end
