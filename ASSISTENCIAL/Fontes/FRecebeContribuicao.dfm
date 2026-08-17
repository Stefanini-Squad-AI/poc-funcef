inherited frmRecebeContribuicao: TfrmRecebeContribuicao
  Left = 191
  Top = 109
  Caption = '*'
  ClientHeight = 410
  ClientWidth = 566
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 566
    Height = 371
    object pnlOpcoes: TPanel
      Left = 1
      Top = 97
      Width = 564
      Height = 273
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 4
        Top = 5
        Width = 86
        Height = 13
        Caption = 'Patrocinadoras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlProgresso: TPanel
        Left = 93
        Top = 75
        Width = 372
        Height = 115
        BevelWidth = 2
        TabOrder = 0
        object Label4: TLabel
          Left = 19
          Top = 24
          Width = 131
          Height = 13
          Caption = 'Recebento contribuições ...'
        end
        object pBar: TProgressBar
          Left = 19
          Top = 42
          Width = 334
          Height = 15
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
        object btncancelaprogress: TBitBtn
          Left = 250
          Top = 72
          Width = 89
          Height = 27
          Cancel = True
          Caption = '&Cancelar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = btncancelaprogressClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333333333000033338833333333333333333F333333333333
            0000333911833333983333333388F333333F3333000033391118333911833333
            38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
            911118111118333338F3338F833338F3000033333911111111833333338F3338
            3333F8330000333333911111183333333338F333333F83330000333333311111
            8333333333338F3333383333000033333339111183333333333338F333833333
            00003333339111118333333333333833338F3333000033333911181118333333
            33338333338F333300003333911183911183333333383338F338F33300003333
            9118333911183333338F33838F338F33000033333913333391113333338FF833
            38F338F300003333333333333919333333388333338FFF830000333333333333
            3333333333333333333888330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object Marca: TBitBtn
        Left = 4
        Top = 24
        Width = 21
        Height = 20
        Hint = 'Inverter Seleção'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = MarcaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object chklstPatro: TCheckListBox
        Left = 1
        Top = 48
        Width = 562
        Height = 224
        Align = alBottom
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
      end
    end
    object pnlResult: TPanel
      Left = 1
      Top = 97
      Width = 564
      Height = 273
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'pnlResult'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object memResult: TMemo
        Left = 1
        Top = 1
        Width = 424
        Height = 271
        Align = alLeft
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 442
        Top = 19
        Width = 111
        Height = 35
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
      object bbtnSalvar: TBitBtn
        Left = 442
        Top = 72
        Width = 111
        Height = 35
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 564
      Height = 96
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 562
        Height = 93
        Align = alTop
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 454
          Top = 1
          Width = 107
          Height = 91
          Align = alRight
          TabOrder = 0
          object bbtnReceber: TBitBtn
            Left = 5
            Top = 12
            Width = 98
            Height = 37
            Caption = '&Receber'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnReceberClick
            Glyph.Data = {
              06010000424D060100000000000076000000280000000B000000120000000100
              0400000000009000000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
              000033833333333F00003088333333380000300883333337000030A088333338
              000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
              000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
              000030AA0333333800003070333333380000300333333338000030333333333F
              00003333333333300000}
          end
          object btnDesfazer: TBitBtn
            Left = 5
            Top = 51
            Width = 98
            Height = 37
            Caption = '&Desfazer'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = btnDesfazerClick
            Glyph.Data = {
              06010000424D060100000000000076000000280000000B000000120000000100
              0400000000009000000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
              0000333333338330000033333338803000003333338800300000333338809030
              0000333388099030000033388079703000003388099990300000388097979030
              0000330999999030000033307979703000003333099990300000333330979030
              0000333333099030000033333330703000003333333300300000333333333030
              00003333333333300000}
          end
        end
        object grpMesAnoRef: TGroupBox
          Left = 1
          Top = 1
          Width = 150
          Height = 91
          Align = alLeft
          Caption = 'Mês e Ano de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object cmbMesCob: TComboBox
            Left = 6
            Top = 38
            Width = 82
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Text = 'cmbMesCob'
            Items.Strings = (
              'janeiro'
              'fevereiro'
              'março'
              'abril'
              'maio'
              'junho'
              'julho'
              'agosto'
              'setembro '
              'outubro'
              'novembro'
              'dezembro')
          end
          object spedAnoCob: TSpinEdit
            Left = 90
            Top = 38
            Width = 55
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 4
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 1998
          end
        end
        object rgrpTipoFolha: TRadioGroup
          Left = 151
          Top = 1
          Width = 169
          Height = 91
          Align = alLeft
          Caption = ' Tipo de Folha '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Folha da Patrocinadora'
            'Folha de Benefícios'
            'Boleto Bancário')
          ParentFont = False
          TabOrder = 2
        end
        object GroupBox3: TGroupBox
          Left = 326
          Top = 1
          Width = 128
          Height = 91
          Align = alRight
          Caption = 'Data Recebimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          object dtRecebimento: TCMDateTimePicker
            Left = 6
            Top = 38
            Width = 108
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 566
    inherited tb97Fundo: TToolbar97
      Left = 397
      DockPos = 547
      inherited sep1: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Width = 78
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 143
      DockPos = 293
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 85
      end
      inherited bbtnCancelar: TBitBtn
        Left = 169
      end
      object bbtnVerResultado: TBitBtn
        Left = 0
        Top = 0
        Width = 85
        Height = 33
        Caption = '&Resultado'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          76020000424D7602000000000000760000002800000040000000100000000100
          0400000000000002000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00331111133333
          333333FFFFF33333333333222223332222233333333333444443333199933333
          333333388883333333333332AAA333AAA2333333333333CCC433333199933333
          1133333888833333FF333332AAA333AAA2333334433333CCC433339919933333
          99133388F883333388F333AA2AA333AA2A2333CC433333CC4C43339133933333
          3913338F33833333388F33A233A333A33A2333C4333333C33CC4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4391333333333
          339138F333333333338F3A233333333333A23C433333333333C4339133333333
          3991338F33333333388F33A2333333333AA233C4333333333CC4339913333333
          99133388F333333388F333AA23333333AA2333CC43333333CC43333991333339
          913333388F3333388F33333AA233333AA233333CC433333CC433333399111119
          1333333388FFFFF8F3333333AA22222A23333333CC44444C4333333333999993
          33333333338888833333333333AAAAA33333333333CCCCC33333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 4
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 60
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 103
    Top = 60
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  P.IDPESSOA, P.NOME, DECODE(F.IDPESSOA, NULL, 0, 1) FLGFU' +
        'NDACAO'
      'FROM PESSOA P, PATRO PT, FUNDACAO F'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      '  AND P.IDPESSOA = F.IDPESSOA(+)'
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 25
    Top = 311
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDMOTIVO,DESCRICAO,MOTIVORAIS,MOTIVOFGTS,OBSERVACAO,IDMOV' +
        'CONTRCAGED'
      'FROM   MOTIVO')
    ValidateWithMask = True
    Left = 137
    Top = 311
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 340
    Top = 328
  end
  object qryRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 203
    Top = 314
  end
  object qrycontribass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTASS,PAGADOR,IDPLANASS '
      'FROM CONTRIBASS')
    ValidateWithMask = True
    Left = 471
    Top = 314
  end
  object qryaux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 391
    Top = 328
  end
  object qryHstContribass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTITULAR,'
      '      IDPESSJUR,'
      '      IDPLANASS,'
      '      VALORESPERADO,'
      '      VALORRECEBIDO,'
      '      DATA,'
      '      CODDOCPREV,'
      '      NUMRECEBIMENTO,'
      '      MESCOBRANCA,'
      '      MES,'
      '      IDMOTIVO,'
      '      FLGCOBCARNE,'
      '      SITRECEBIMENTO,'
      '      IDPAGADOR'
      ''
      'FROM'
      '    HSTCONTRIBASS'
      ''
      'WHERE '
      '     (IDMOTIVO = 31)'
      'AND'
      '     (MESCOBRANCA = '#39'2000/12'#39')'
      'AND'
      '     (MES = '#39'2000/12'#39')'
      'AND'
      '     ROWNUM < 20'
      ''
      ''
      ''
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 485
    Top = 218
    object qryHstContribassIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTCONTRIBASS.IDTITULAR'
    end
    object qryHstContribassIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.HSTCONTRIBASS.IDPESSJUR'
    end
    object qryHstContribassIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.HSTCONTRIBASS.IDPLANASS'
    end
    object qryHstContribassVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
      Origin = 'BASEDADOS.HSTCONTRIBASS.VALORESPERADO'
    end
    object qryHstContribassVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
      Origin = 'BASEDADOS.HSTCONTRIBASS.VALORRECEBIDO'
    end
    object qryHstContribassDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'BASEDADOS.HSTCONTRIBASS.DATA'
    end
    object qryHstContribassCODDOCPREV: TFloatField
      FieldName = 'CODDOCPREV'
      Origin = 'BASEDADOS.HSTCONTRIBASS.CODDOCPREV'
    end
    object qryHstContribassNUMRECEBIMENTO: TFloatField
      FieldName = 'NUMRECEBIMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBASS.NUMRECEBIMENTO'
    end
    object qryHstContribassMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS.HSTCONTRIBASS.MESCOBRANCA'
      Size = 7
    end
    object qryHstContribassMES: TStringField
      FieldName = 'MES'
      Origin = 'BASEDADOS.HSTCONTRIBASS.MES'
      Size = 7
    end
    object qryHstContribassIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.HSTCONTRIBASS.IDMOTIVO'
    end
    object qryHstContribassSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      Origin = 'BASEDADOS.HSTCONTRIBASS.SITRECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object qryHstContribassFLGCOBCARNE: TFloatField
      FieldName = 'FLGCOBCARNE'
      Origin = 'BASEDADOS.HSTCONTRIBASS.FLGCOBCARNE'
    end
    object qryHstContribassIDPAGADOR: TFloatField
      FieldName = 'IDPAGADOR'
      Origin = 'BASEDADOS.HSTCONTRIBASS.IDPAGADOR'
    end
  end
  object qryAcumulo: TQuery
    DatabaseName = 'BaseDados'
    Left = 69
    Top = 309
  end
  object qryParam: TQuery
    DatabaseName = 'BaseDados'
    Left = 37
    Top = 269
  end
end
