inherited frmAcertaNumPlanilhaMT: TfrmAcertaNumPlanilhaMT
  Left = 227
  Top = 197
  Caption = 'Atualiza Numeração das Planilhas'
  ClientWidth = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    object gbPeriodo: TGroupBox
      Left = 35
      Top = 123
      Width = 335
      Height = 70
      Caption = 'Período'
      TabOrder = 0
      object dblcPeriodo: TCMDBLookupCombo
        Left = 30
        Top = 27
        Width = 271
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'20'#9'Nome'
          'PERNUMERO'#9'5'#9'Número'
          'PERDATINI'#9'10'#9'Data Inicial'
          'PERDATFIM'#9'10'#9'Data Final'
          'PEREXERCICIO'#9'4'#9'Exercício')
        LookupTable = cdsPeriodo
        LookupField = 'PERNUMERO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object prgBarAtualiza: TProgressBar
      Left = 1
      Top = 211
      Width = 392
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 1
      Visible = False
    end
    object mmComentario: TMemo
      Left = 1
      Top = 1
      Width = 392
      Height = 104
      Align = alTop
      Alignment = taCenter
      Color = clCaptionText
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Esta tela tem por objetivo renumerar todas '
        'as planilhas do período solicitado. Este tela '
        'somente pode ser usada para quem usa '
        'numeração por período ou por dia.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object Anim: TAnimate
      Left = 11
      Top = 201
      Width = 18
      Height = 18
      Active = False
      AutoSize = False
      CommonAVI = aviFindFile
      StopFrame = 8
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 74
      DockPos = 74
      inherited sep1: TToolbarSep97
        Left = 148
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 231
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 150
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 233
      end
      object bbtnAtualiza: TBitBtn
        Left = 0
        Top = 0
        Width = 148
        Height = 33
        Cancel = True
        Caption = 'A&tualiza'
        TabOrder = 2
        OnClick = bbtnAtualizaClick
        Glyph.Data = {
          16030000424D160300000000000076000000280000003F000000150000000100
          040000000000A002000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777770777888888888
          8888887777778888888888888887777778888888888888887770770000000000
          000008888770000000000000008888770000000000000008888070B7B7B70FBF
          BFB7B000070B7B7B70FBFBFB7B000070B7B7B70FBFBFB7B0000070FBFFFF0BFB
          FBFB7B7B770FBFFFF0BFBFBFB7B7B770FBFFFF0BFBFBFB7B7B7077000000BFBF
          BFFFB7B7B77000000BFBFBFFFB7B7B77000000BFBFBFFFB7B7B0707B7B7B0BFB
          FBFBFBFBF707B7B7B0BFBFBFBFBFBF707B7B7B0BFBFBFBFBFBF070BFBFFF0FFF
          FFFFBFBFB70BFBFFF0FFFFFFFBFBFB70BFBFFF0FFFFFFFBFBFB077000000FBFF
          FFFBFFFBF77000000FBFFFFFBFFFBF77000000FBFFFFFBFFFBF070B7B7BF0FF0
          FFFFFFBFF70B7B7BF0FF0FFFFFFBFF70B7B7BF0FF0FFFFFFBFF070FBFFFB0B0F
          FBFBFBFBF70FBFFFB0B0FFBFBFBFBF70FBFFFB0B0FFBFBFBFBF077000000BF0F
          BFFFFFFFF77000000BF0FBFFFFFFFF77000000BF0FBFFFFFFFF0707B7BFB00FB
          FBFBFBFBF707B7BFB00FBFBFBFBFBF707B7BFB00FBFBFBFBFBF070BFBFFF00FF
          BFBF0000070BFBFFF00FFBFBF0000070BFBFFF00FFBFBF0000007700000000FB
          FBF0777777700000000FBFBF0777777700000000FBFBF08888807777777770BF
          BF07777777777777770BFBF07777777777777770BFBF08888880777777770BFB
          F07777777777777770BFBF07777777777777770BFBF088777770777777770FBF
          077777777777777770FBF077777777777777770FBF0887777770777777770BF0
          777777777777777770BF0777777777777777770BF08877777770777777770FB0
          777777777777777770FB0777777777777777770FB08777777770777777777007
          7777777777777777770077777777777777777770087777777770}
        NumGlyphs = 3
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 235
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 235
    Top = 139
  end
end
