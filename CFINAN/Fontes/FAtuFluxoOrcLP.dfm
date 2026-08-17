inherited frmAtuFluxoOrcLP: TfrmAtuFluxoOrcLP
  Left = 134
  Top = 160
  Caption = 'Geração do Fluxo Orçado a partir do Orçamento'
  ClientHeight = 334
  ClientWidth = 436
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 294
    object pnlComentario: TPanel
      Left = 5
      Top = 5
      Width = 426
      Height = 128
      Align = alTop
      BorderWidth = 3
      Caption = 'pnlComentario'
      TabOrder = 0
      object mmComentario: TMemo
        Left = 4
        Top = 4
        Width = 418
        Height = 120
        Align = alClient
        Alignment = taCenter
        Color = clBtnFace
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Esta tela tem por objetivo buscar informações '
          'contidas no orçamento referente ao orçamento '
          'financeiro para arquivá-las como fluxo orçado de '
          'longo prazo para no futuro haver a comparação '
          'entre fluxo real e fluxo orçado.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlDatas: TPanel
      Left = 5
      Top = 133
      Width = 426
      Height = 156
      Align = alClient
      TabOrder = 1
      object lblExercicio: TLabel
        Left = 13
        Top = 6
        Width = 55
        Height = 13
        Caption = 'Exercício'
      end
      object prgBarAtuFluxo: TProgressBar
        Left = 1
        Top = 133
        Width = 424
        Height = 22
        Align = alBottom
        Min = 0
        Max = 100
        Step = 2
        TabOrder = 0
        Visible = False
      end
      object gbPeriodos: TGroupBox
        Left = 13
        Top = 50
        Width = 400
        Height = 65
        Caption = ' Faixa de Períodos '
        TabOrder = 2
        object lblInicio: TLabel
          Left = 15
          Top = 16
          Width = 35
          Height = 13
          Caption = 'Inicial'
        end
        object lblFinal: TLabel
          Left = 204
          Top = 16
          Width = 28
          Height = 13
          Caption = 'Final'
        end
        object dblcPeriodoIni: TCMDBLookupCombo
          Left = 15
          Top = 31
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPERIODO'#9'60'#9'Nome'
            'PERIODO'#9'10'#9'Número')
          LookupTable = qryPeriodo
          LookupField = 'PERIODO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcPeriodoFim: TCMDBLookupCombo
          Left = 204
          Top = 31
          Width = 175
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPERIODO'#9'60'#9'Nome'
            'PERIODO'#9'10'#9'Número')
          LookupTable = qryPeriodo
          LookupField = 'PERIODO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object dblcExercicio: TCMDBLookupCombo
        Left = 13
        Top = 21
        Width = 124
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'EXERCICIO'#9'10'#9'Exercício')
        LookupTable = qryExercicio
        LookupField = 'EXERCICIO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblcExercicioCloseUp
      end
    end
  end
  inherited Dock971: TDock97
    Top = 294
    Width = 436
    Height = 40
    inherited tb97Fundo: TToolbar97
      Left = 0
      DockPos = 0
      inherited sep1: TToolbarSep97
        Left = 317
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 235
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 237
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 319
      end
      object bbtnAtualizaFluxo: TBitBtn
        Left = 0
        Top = 0
        Width = 235
        Height = 34
        Caption = 'Atualiza Fluxo'
        TabOrder = 2
        OnClick = bbtnAtualizaFluxoClick
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
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPeriodo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERIODO, NOMEPERIODO'
      'FROM PERIODOORCAMEN'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (EXERCICIO = :EXERCICIO)'
      'ORDER BY PERIODO')
    ValidateWithMask = True
    Left = 304
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end>
  end
  object qryExercicio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EXERCICIO '
      'FROM PERIODOORCAMEN'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY EXERCICIO')
    ValidateWithMask = True
    Left = 159
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryPerData: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATAINIPERIODO, DATAFIMPERIODO'
      'FROM PERIODOORCAMEN'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (EXERCICIO = :EXERCICIO) AND'
      '      (PERIODO = :PERIODO)'
      '')
    ValidateWithMask = True
    Left = 360
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EXERCICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PERIODO'
        ParamType = ptUnknown
      end>
  end
  object qrySaldo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.DATAINIPERIODO AS DATAREFERENCIA,SUM(S.VLRORCADO) AS VL' +
        'RORCADO,'
      '       S.IDCONTAORCAMEN, S.IDPLANOORCAMEN'
      'FROM SALDOORCADO S, CONTASORCAMEN C, PERIODOORCAMEN P'
      'WHERE (S.DATAREFERENCIA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      '      (S.DATAREFERENCIA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '      (S.IDPESSOA = :IDPESSOA) AND'
      '      (C.TIPOCALCREALIZADO = '#39'X'#39') AND'
      '      (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '      (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND'
      '      (P.EXERCICIO = S.EXERCICIO) AND'
      '      (P.PERIODO = S.PERIODO) AND'
      '      (P.IDPESSOA = S.IDPESSOA)'
      'GROUP BY P.DATAINIPERIODO, S.IDCONTAORCAMEN, S.IDPLANOORCAMEN'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 248
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryComposicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NUMLINHAS, C.CODTIPRECDES, C.RECPAG,'
      '       C.CODCENTRORESPON, C.UNIDNEGOC, C.CODTIPDOC'
      'FROM COMPCONTASORCAMEN C,'
      '     (SELECT COUNT(*) AS NUMLINHAS'
      '      FROM COMPCONTASORCAMEN'
      '      WHERE (IDPLANOORCAMEN = :PLANOORC) AND'
      '            (IDCONTAORCAMEN = :CONTAORC) AND'
      '            (CODTIPRECDES is not null)) P'
      'WHERE (C.IDPLANOORCAMEN = :PLANOORC) AND'
      '      (C.IDCONTAORCAMEN = :CONTAORC) AND'
      '      (C.CODTIPRECDES is not null)')
    ValidateWithMask = True
    Left = 184
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANOORC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTAORC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PLANOORC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTAORC'
        ParamType = ptUnknown
      end>
  end
  object qryFluxoOrc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 112
    Top = 56
  end
  object qryParamGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT USAABC,UNIDNEGOC,CODCENTRORESPON'
      'FROM PARAMGLOBAL'
      'WHERE (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 40
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
