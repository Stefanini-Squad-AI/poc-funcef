inherited frmBaixaContribPIDPIA: TfrmBaixaContribPIDPIA
  Left = 20
  Top = 109
  HelpContext = 160047
  Caption = 'Baixa de Contribuições de Plano de Incentivo'
  ClientHeight = 443
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 737
    Height = 404
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 735
      Height = 124
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 209
        Height = 27
        Caption = 'Informações para baixa'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object grpMesAnoRef: TGroupBox
        Left = 6
        Top = 35
        Width = 265
        Height = 75
        Caption = 'Mês e Ano de Cobrança (Competência)'
        TabOrder = 1
        object cmbMesCob: TComboBox
          Left = 6
          Top = 21
          Width = 187
          Height = 21
          ItemHeight = 13
          TabOrder = 0
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
          Left = 198
          Top = 21
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
        end
        object chkApenas13: TCheckBox
          Left = 6
          Top = 48
          Width = 251
          Height = 17
          Caption = 'Baixar apenas contribuições sobre 13º'
          TabOrder = 2
        end
      end
      object GroupBox1: TGroupBox
        Left = 288
        Top = 35
        Width = 193
        Height = 75
        Caption = 'Informe a Data de Recebimento'
        TabOrder = 2
        object dtRecebimento: TCMDateTimePicker
          Left = 8
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
      object bbtnEnviar: TBitBtn
        Left = 604
        Top = 36
        Width = 115
        Height = 38
        Caption = '&Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bbtnEnviarClick
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
      object bbtnDesfazer: TBitBtn
        Left = 604
        Top = 78
        Width = 115
        Height = 38
        Caption = '&Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
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
    object PageControl1: TPageControl
      Left = 1
      Top = 125
      Width = 735
      Height = 278
      ActivePage = tbsBasico
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsBasico: TTabSheet
        Caption = 'Opções Básicas'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 727
          Height = 250
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object lbPatro: TLabel
            Left = 7
            Top = 5
            Width = 71
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 7
            Top = 107
            Width = 107
            Height = 13
            Caption = 'Planos Previdenciários'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object lbParticipante: TLabel
            Left = 410
            Top = 4
            Width = 135
            Height = 13
            Caption = 'Receber Contribuições de ...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chklstPatro: TCheckListBox
            Left = 6
            Top = 19
            Width = 397
            Height = 81
            Columns = 3
            ItemHeight = 13
            TabOrder = 0
          end
          object chklstPlano: TCheckListBox
            Left = 8
            Top = 120
            Width = 397
            Height = 116
            ItemHeight = 13
            TabOrder = 1
          end
          object chklstSituacao: TCheckListBox
            Left = 409
            Top = 19
            Width = 301
            Height = 217
            ItemHeight = 13
            Items.Strings = (
              'Plano de Incentivo a Aposentadoria ( PIA )'
              'Plano de Incentivo a Demissão ( PID )')
            TabOrder = 2
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 719
          Height = 242
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 588
            Height = 240
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object bbtnSalvar: TBitBtn
            Left = 604
            Top = 5
            Width = 110
            Height = 38
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
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
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA  P , PATRO PA'
      'WHERE'
      '  P.IDPESSOA =  PA.IDPESSOA'
      'AND PA.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY'
      '  P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPLANOPREV, NOME'
      'FROM'
      '  PLANPREV'
      
        'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANPREVPATRO ' +
        'PLP, PATRO P'
      '                      WHERE   P.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = P.IDPESSOA )'
      'ORDER BY'
      '  NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 369
    Top = 185
  end
end
