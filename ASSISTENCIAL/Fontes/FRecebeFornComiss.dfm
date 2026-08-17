inherited frmRecebeFornComiss: TfrmRecebeFornComiss
  Left = 56
  Top = 79
  Caption = 'Recebimento de Comissões via Interface'
  ClientHeight = 441
  ClientWidth = 628
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 628
    Height = 402
    object pnlResult: TPanel
      Left = 5
      Top = 147
      Width = 618
      Height = 250
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
        Width = 450
        Height = 248
        Align = alLeft
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 459
        Top = 15
        Width = 115
        Height = 38
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
        Left = 459
        Top = 59
        Width = 115
        Height = 38
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
    object pnlOpcoes: TPanel
      Left = 5
      Top = 147
      Width = 618
      Height = 250
      Align = alClient
      BevelOuter = bvLowered
      Caption = 'pnlOpcoes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label1: TLabel
        Left = 7
        Top = 28
        Width = 65
        Height = 13
        Caption = 'Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object chklstForn: TCheckListBox
        Left = 7
        Top = 43
        Width = 481
        Height = 180
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
      object StaticText2: TStaticText
        Left = 10
        Top = 3
        Width = 212
        Height = 27
        Caption = 'Opções do recebimento'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object chkResult: TCheckBox
        Left = 6
        Top = 228
        Width = 124
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Exibir exceções'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object pnlProgresso: TPanel
        Left = 45
        Top = 59
        Width = 406
        Height = 94
        Caption = 'pnlProgresso'
        TabOrder = 2
        object Label4: TLabel
          Left = 18
          Top = 24
          Width = 118
          Height = 13
          Caption = 'Recebento Comissões ...'
        end
        object pBar: TProgressBar
          Left = 18
          Top = 42
          Width = 361
          Height = 28
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
      object bbtnVerResultado: TBitBtn
        Left = 493
        Top = 46
        Width = 115
        Height = 38
        Hint = 'Ir para tela de resultado '
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
          DD00DDDDDDDDDDDDDD00}
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 5
      Width = 618
      Height = 142
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 298
        Height = 27
        Caption = 'Informações para o recebimento'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 30
        Width = 151
        Height = 57
        Caption = 'Mês e Ano de Referência'
        TabOrder = 0
        object cmbMesRef: TComboBox
          Left = 6
          Top = 21
          Width = 82
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro '
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object spedAnoRef: TSpinEdit
          Left = 90
          Top = 20
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 92
        Width = 304
        Height = 43
        Caption = 'Motivo'
        TabOrder = 1
        Visible = False
        object dblkpcmbmotivo: TwwDBLookupCombo
          Left = 9
          Top = 16
          Width = 286
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO')
          LookupTable = qrymotivo
          LookupField = 'DESCRICAO'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object bbtnReceber: TBitBtn
        Left = 459
        Top = 36
        Width = 115
        Height = 38
        Caption = '&Receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
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
      object GroupBox3: TGroupBox
        Left = 174
        Top = 30
        Width = 136
        Height = 57
        Caption = 'Data de Recebimento'
        TabOrder = 4
        object dtRecebimento: TCMDateTimePicker
          Left = 6
          Top = 24
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
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 628
    inherited tb97Fundo: TToolbar97
      Left = 462
      DockPos = 462
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 535
    Top = 44
  end
  object qryRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 339
    Top = 163
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 300
    Top = 128
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDMOTIVO,DESCRICAO,MOTIVORAIS,MOTIVOFGTS,OBSERVACAO,IDMOV' +
        'CONTRCAGED'
      'FROM   MOTIVO')
    ValidateWithMask = True
    Left = 416
    Top = 44
  end
  object qryforn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME,IDPESSOA'
      'FROM   PESSOA'
      'WHERE  (IDPESSOA IN (SELECT IDPESSOA'
      '                     FROM   FORNSERV))'
      'AND    (IDPESSOA IN (SELECT IDFORNSERV'
      '                     FROM   PLANASS))')
    ValidateWithMask = True
    Left = 373
    Top = 45
  end
end
