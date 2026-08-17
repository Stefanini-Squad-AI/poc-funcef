inherited frmGeraLgoPrzOrcamMT: TfrmGeraLgoPrzOrcamMT
  Left = 271
  Top = 172
  HelpContext = 90030
  ActiveControl = dblcExercicio
  Caption = 'Geração de Fluxo Orçado de Longo Prazo a partir do Orçamento'
  ClientHeight = 386
  ClientWidth = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 419
    Height = 346
    object pnlDatas: TPanel
      Left = 1
      Top = 126
      Width = 417
      Height = 219
      Align = alClient
      TabOrder = 0
      object lblExercicio: TLabel
        Left = 8
        Top = 122
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object prgbarGeraFluxo: TProgressBar
        Left = 1
        Top = 196
        Width = 415
        Height = 22
        Align = alBottom
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 2
      end
      object gbPeriodos: TGroupBox
        Left = 104
        Top = 106
        Width = 303
        Height = 65
        Caption = ' Faixa de Períodos '
        Enabled = False
        TabOrder = 1
        object lblInicio: TLabel
          Left = 18
          Top = 16
          Width = 35
          Height = 13
          Caption = 'Inicial'
        end
        object lblFinal: TLabel
          Left = 159
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Final'
        end
        object dblcPeriodoInicial: TCMDBLookupCombo
          Left = 18
          Top = 31
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPERIODO'#9'60'#9'Nome'
            'PERIODO'#9'10'#9'Número')
          LookupTable = cdsPeriodo
          LookupField = 'PERIODO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcPeriodoExit
        end
        object dblcPeriodoFinal: TCMDBLookupCombo
          Left = 159
          Top = 31
          Width = 121
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPERIODO'#9'60'#9'Nome'
            'PERIODO'#9'10'#9'Número')
          LookupTable = cdsPeriodo
          LookupField = 'PERIODO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnExit = dblcPeriodoExit
        end
      end
      object dblcExercicio: TCMDBLookupCombo
        Left = 8
        Top = 137
        Width = 81
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'Exercício')
        LookupTable = cdsExercicio
        LookupField = 'EXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcExercicioExit
      end
      object Panel1: TPanel
        Left = 0
        Top = 1
        Width = 408
        Height = 102
        BorderWidth = 3
        Caption = 'pnlComentario'
        TabOrder = 3
        object Memo1: TMemo
          Left = 4
          Top = 4
          Width = 400
          Height = 94
          Align = alClient
          Alignment = taCenter
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Lines.Strings = (
            'A T E N Ç Ã O'
            'Esta operação fará com que os dados'
            'atualmente lançados sejam substituídos'
            'pelos dados do Orçamento Financeiro.'
            ''
            ' ')
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object pnlComentario: TPanel
      Left = 1
      Top = 1
      Width = 417
      Height = 125
      Align = alTop
      BorderWidth = 3
      Caption = 'pnlComentario'
      TabOrder = 1
      object mmComentario: TMemo
        Left = 4
        Top = 4
        Width = 409
        Height = 117
        Align = alClient
        Alignment = taCenter
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Esta tela tem por objetivo buscar informações'
          'contidas no Sistema Planejamento e Orçamento referentes'
          'ao orçamento financeiro para arquivá-las como Fluxo '
          'Orçado de'
          'Longo Prazo, para no futuro haver a comparação'
          'entre Fluxo Realizado e Fluxo Orçado.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 419
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 53
      inherited sep1: TToolbarSep97
        Left = 279
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 196
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 198
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 281
        HelpContext = 90030
      end
      object bbtnGeraFluxo: TBitBtn
        Left = 0
        Top = 0
        Width = 196
        Height = 34
        Caption = 'Gera Fluxo'
        Enabled = False
        TabOrder = 2
        OnClick = bbtnGeraFluxoClick
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
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 147
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 136
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 312
    Top = 200
  end
end
