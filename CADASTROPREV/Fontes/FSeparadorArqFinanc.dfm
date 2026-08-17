inherited frmSeparadorArqFinanc: TfrmSeparadorArqFinanc
  Left = 214
  Top = 135
  HelpContext = 3360023
  Caption = 'Separador do Arquivo Financeiro da FUNCEF'
  ClientHeight = 522
  ClientWidth = 689
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 30
    Top = 65
    Width = 271
    Height = 13
    Caption = 'Indique o Arquivo de Entrada (Base de Cálculo)'
  end
  object SpeedButton2: TSpeedButton [1]
    Left = 437
    Top = 80
    Width = 22
    Height = 23
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      555555555555555555555555555555555555555FFFFFFFFFF555550000000000
      55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
      B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
      000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
      555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
      55555575FFF75555555555700007555555555557777555555555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  inherited pnlFundo: TPanel
    Width = 689
    Height = 483
    object lblBarraProgresso: TLabel
      Left = 1
      Top = 469
      Width = 687
      Height = 13
      Align = alBottom
      Alignment = taCenter
      Caption = 'Aguarde Processando ....'
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 687
      Height = 154
      Align = alTop
      Caption = ' Arquivos de Entrada '
      TabOrder = 0
      object lblPathArqProc: TLabel
        Left = 14
        Top = 18
        Width = 271
        Height = 13
        Caption = 'Indique o Arquivo de Entrada (Base de Cálculo)'
      end
      object Label1: TLabel
        Left = 2
        Top = 139
        Width = 683
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Caption = 'ATENÇÃO : OS ARQUIVOS DEVEM CONTER O FORMATO .TXT'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 306
        Top = 31
        Width = 22
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Label3: TLabel
        Left = 14
        Top = 58
        Width = 238
        Height = 13
        Caption = 'Indique o Arquivo de Entrada (Financeiro)'
      end
      object SpeedButton3: TSpeedButton
        Left = 306
        Top = 70
        Width = 22
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton3Click
      end
      object Label4: TLabel
        Left = 348
        Top = 17
        Width = 194
        Height = 13
        Caption = 'Arquivo de Seleção de Matrículas'
      end
      object SpeedButton4: TSpeedButton
        Left = 637
        Top = 31
        Width = 22
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton4Click
      end
      object Label6: TLabel
        Left = 14
        Top = 99
        Width = 198
        Height = 13
        Caption = 'Contribuição Prev. Privada - PADV'
      end
      object SpeedButton6: TSpeedButton
        Left = 306
        Top = 113
        Width = 22
        Height = 23
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton6Click
      end
      object edTxt: TEdit
        Left = 14
        Top = 33
        Width = 290
        Height = 21
        TabOrder = 0
      end
      object edtxtfinanc: TEdit
        Left = 14
        Top = 72
        Width = 290
        Height = 21
        TabOrder = 1
      end
      object edarqmat: TEdit
        Left = 345
        Top = 32
        Width = 290
        Height = 21
        TabOrder = 2
      end
      object edarqpadv: TEdit
        Left = 14
        Top = 114
        Width = 290
        Height = 21
        TabOrder = 3
      end
      object grpMesAnoRef: TGroupBox
        Left = 347
        Top = 62
        Width = 238
        Height = 57
        Caption = 'Mês e Ano de Cobrança (Competência)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object cmbMesCob: TComboBox
          Left = 6
          Top = 22
          Width = 107
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
          Left = 114
          Top = 22
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
    end
    object grpArquivos: TGroupBox
      Left = 1
      Top = 155
      Width = 687
      Height = 170
      Align = alTop
      Caption = ' Arquivos de Saída '
      TabOrder = 1
      object lblArqGravar: TLabel
        Left = 11
        Top = 18
        Width = 462
        Height = 13
        Caption = 
          'Indique o Caminho para o Arquivos de Saída - PARTICIPANTES e EMP' +
          'RÉSTIMO'
      end
      object spedArqGravar: TSpeedButton
        Left = 420
        Top = 31
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = spedArqGravarClick
      end
      object Label5: TLabel
        Left = 11
        Top = 66
        Width = 331
        Height = 13
        Caption = 'Indique o Caminho para o Arquivos de Saída - ELEGÍVEIS'
      end
      object SpeedButton5: TSpeedButton
        Left = 420
        Top = 79
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton5Click
      end
      object Label7: TLabel
        Left = 11
        Top = 114
        Width = 461
        Height = 13
        Caption = 
          'Indique o Caminho para o Arq. de Saída - REJEITADOS e EXCESSO DE' +
          ' DÉBITO'
      end
      object SpeedButton9: TSpeedButton
        Left = 420
        Top = 127
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButton9Click
      end
      object edArqGravar: TEdit
        Left = 11
        Top = 33
        Width = 407
        Height = 21
        TabOrder = 0
      end
      object edArqGravarEleg: TEdit
        Left = 11
        Top = 80
        Width = 407
        Height = 21
        TabOrder = 1
      end
      object GroupBox4: TGroupBox
        Left = 500
        Top = 15
        Width = 185
        Height = 153
        Align = alRight
        Caption = 'Ignorar'
        TabOrder = 2
        object chkAssistidos: TCheckBox
          Left = 15
          Top = 20
          Width = 108
          Height = 17
          Caption = 'Assistidos'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkCancelados: TCheckBox
          Left = 15
          Top = 41
          Width = 102
          Height = 17
          Caption = 'Cancelados'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object chkMantidos: TCheckBox
          Left = 15
          Top = 62
          Width = 102
          Height = 17
          Caption = 'Mantidos'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object chkAtivos: TCheckBox
          Left = 15
          Top = 82
          Width = 102
          Height = 17
          Caption = 'Ativos'
          TabOrder = 3
        end
      end
      object edArqGravarRejeitados: TEdit
        Left = 11
        Top = 128
        Width = 407
        Height = 21
        TabOrder = 3
      end
    end
    object pBar: TProgressBar
      Left = 1
      Top = 453
      Width = 687
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 2
    end
    object memresult: TRichEdit
      Left = 1
      Top = 325
      Width = 645
      Height = 128
      Align = alClient
      TabOrder = 3
    end
    object Panel1: TPanel
      Left = 646
      Top = 325
      Width = 42
      Height = 128
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object SpeedButton7: TSpeedButton
        Left = 10
        Top = 8
        Width = 27
        Height = 26
        Glyph.Data = {
          66030000424D6603000000000000360000002800000010000000110000000100
          18000000000030030000C30E0000C30E00000000000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000007F7F7F0000007F7F
          7F7F7F7F000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF000000000000BFBFBF000000BFBFBFBFBFBF000000000000BFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBF
          BFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF000000000000FFFFFF000000000000FFFFFF000000000000BF
          BFBF000000FF0000FF0000FF00000000FFFF0000FF0000000000000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000BFBFBF0000FF0000
          FF0000FFBFBFBFBFBFBF000000FFFFFF000000000000000000000000FFFFFF00
          0000FFFFFF0000000000FF0000FF0000FF0000FF0000FFBFBFBF000000FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FF0000FF0000FF0000
          FF0000FF0000FF0000FF000000FFFFFF000000000000FFFFFF00000000000000
          0000000000000000BFBFBF0000FF0000FF0000FFBFBFBFBFBFBF000000FFFFFF
          FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000BFBFBFBFBFBF0000FF0000
          FF0000FFBFBFBFBFBFBF000000FFFFFF000000BFBFBFFFFFFF000000FFFFFF00
          0000BFBFBFBFBFBF7F7F7F0000FF0000FF0000FFBFBFBFBFBFBF000000FFFFFF
          FFFFFFFFFFFFFFFFFF000000000000BFBFBF0000FF0000FF0000FF0000FF0000
          FFBFBFBFBFBFBFBFBFBF000000000000000000000000000000000000BFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
          BFBFBFBFBFBFBFBFBFBF}
        OnClick = SpeedButton7Click
      end
      object SpeedButton8: TSpeedButton
        Left = 10
        Top = 40
        Width = 27
        Height = 26
        Glyph.Data = {
          76050000424D7605000000000000360000002800000015000000150000000100
          18000000000040050000FE100000FE1000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          5151515151515151515151515151515151515151515151515151515151515151
          5100000000000000000000000000000000000000000000000000000000000000
          515151C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C05151
          5151515100000000000000000000000000000000000000000000000000515151
          515151515151515151515151515151515151515151515151515151515151C0C0
          C051515151515100000000000000000000000000000000000000000000515151
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C051515100000000000000000000000000000000000000000000515151
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF00FF00C0C0
          C0C0C0C051515100000000000000000000000000000000000000000000515151
          5151515151515151515151515151515151515151515151515151515151515151
          51515151C0C0C051515100000000000000000000000000000000000000000000
          515151C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0515151C0C0C05151
          51C0C0C051515151515100000000000000000000000000000000000000000000
          000000515151515151515151515151515151515151515151515151515151C0C0
          C0515151C0C0C051515100000000000000000000000000000000000000000000
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00C0C0C0515151C0C0C000000000000000000000000000000000000000000000
          000000000000000000FFFFFF515151515151515151515151515151FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFFFFF515151515151515151515151515151FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = SpeedButton8Click
      end
    end
  end
  inherited Dock971: TDock97
    Top = 483
    Width = 689
    inherited tb97Fundo: TToolbar97
      Left = 499
      DockPos = 521
      inherited sep1: TToolbarSep97
        Left = 183
      end
      inherited sep3: TToolbarSep97
        Left = 90
      end
      inherited bbtnSair: TBitBtn
        Width = 90
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 90
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 312
      DockPos = 334
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 332
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object ProcuraDirDlg1: TProcuraDirDlg
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    ShowPath = False
    Left = 39
    Top = 255
  end
  object qryFilial: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 378
    Top = 321
  end
  object qryAgencia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 322
    Top = 305
  end
  object tblDepen: TwwTable
    TableType = ttParadox
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 376
    Top = 200
  end
  object qryDBFDepen: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 306
    Top = 129
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 394
    Top = 297
  end
  object tblOcorr: TwwTable
    TableType = ttParadox
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 384
    Top = 256
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 291
    Top = 157
  end
  object sqlParam: TCMSqlParams
    Left = 207
    Top = 356
  end
  object cdsBuscaPessoa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 360
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 564
    Top = 313
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 392
  end
end
