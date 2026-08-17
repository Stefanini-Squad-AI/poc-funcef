inherited frmExpressao: TfrmExpressao
  Left = 62
  Top = 83
  ActiveControl = EditExpressao
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Assistente para construção de Expressões'
  ClientHeight = 411
  ClientWidth = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 568
    Height = 372
    object Panel1: TPanel
      Left = 16
      Top = 20
      Width = 312
      Height = 170
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 27
        Top = 15
        Width = 41
        Height = 24
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 73
        Top = 15
        Width = 41
        Height = 24
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton4: TSpeedButton
        Left = 73
        Top = 44
        Width = 41
        Height = 24
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton3: TSpeedButton
        Left = 27
        Top = 44
        Width = 41
        Height = 24
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton7: TSpeedButton
        Left = 27
        Top = 74
        Width = 41
        Height = 24
        Caption = '^'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton5: TSpeedButton
        Left = 27
        Top = 104
        Width = 41
        Height = 24
        Caption = '('
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton9: TSpeedButton
        Left = 27
        Top = 133
        Width = 41
        Height = 24
        Caption = '['
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton10: TSpeedButton
        Left = 73
        Top = 133
        Width = 41
        Height = 24
        Caption = ']'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton6: TSpeedButton
        Left = 73
        Top = 104
        Width = 41
        Height = 24
        Caption = ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton8: TSpeedButton
        Left = 73
        Top = 74
        Width = 41
        Height = 24
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object SpeedButton16: TSpeedButton
        Left = 147
        Top = 44
        Width = 41
        Height = 24
        Caption = '7'
        OnClick = SpeedButton1Click
      end
      object SpeedButton15: TSpeedButton
        Left = 193
        Top = 44
        Width = 41
        Height = 24
        Caption = '8'
        OnClick = SpeedButton1Click
      end
      object SpeedButton14: TSpeedButton
        Left = 240
        Top = 44
        Width = 41
        Height = 24
        Caption = '9'
        OnClick = SpeedButton1Click
      end
      object SpeedButton22: TSpeedButton
        Left = 240
        Top = 74
        Width = 41
        Height = 24
        Caption = '6'
        OnClick = SpeedButton1Click
      end
      object SpeedButton17: TSpeedButton
        Left = 240
        Top = 104
        Width = 41
        Height = 24
        Caption = '3'
        OnClick = SpeedButton1Click
      end
      object SpeedButton24: TSpeedButton
        Left = 193
        Top = 133
        Width = 41
        Height = 24
        Caption = ','
        OnClick = SpeedButton1Click
      end
      object SpeedButton18: TSpeedButton
        Left = 193
        Top = 104
        Width = 41
        Height = 24
        Caption = '2'
        OnClick = SpeedButton1Click
      end
      object SpeedButton21: TSpeedButton
        Left = 193
        Top = 74
        Width = 41
        Height = 24
        Caption = '5'
        OnClick = SpeedButton1Click
      end
      object SpeedButton20: TSpeedButton
        Left = 147
        Top = 74
        Width = 41
        Height = 24
        Caption = '4'
        OnClick = SpeedButton1Click
      end
      object SpeedButton19: TSpeedButton
        Left = 147
        Top = 104
        Width = 41
        Height = 24
        Caption = '1'
        OnClick = SpeedButton1Click
      end
      object SpeedButton23: TSpeedButton
        Left = 147
        Top = 133
        Width = 41
        Height = 24
        Caption = '0'
        OnClick = SpeedButton1Click
      end
      object BtBtnLimpar: TBitBtn
        Left = 147
        Top = 14
        Width = 134
        Height = 24
        Hint = 'Limpa condição'
        Caption = '    &Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BtBtnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 192
      Width = 312
      Height = 179
      Caption = 'Expressão'
      TabOrder = 1
      object EditExpressao: TMemo
        Left = 2
        Top = 15
        Width = 308
        Height = 162
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
        OnDragDrop = EditExpressaoDragDrop
        OnDragOver = EditExpressaoDragOver
      end
    end
    object Panel2: TPanel
      Left = 333
      Top = 63
      Width = 216
      Height = 308
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object DBGrdVariavel: TwwDBGrid
        Left = 2
        Top = 2
        Width = 212
        Height = 304
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        DragMode = dmAutomatic
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnColEnter = DBGrdVariavelColEnter
        OnDblClick = DBGrdVariavelDblClick
        OnDragDrop = DBGrdVariavelDragDrop
        OnEndDrag = DBGrdVariavelEndDrag
        IndicatorColor = icBlack
      end
    end
    object GroupBox2: TGroupBox
      Left = 333
      Top = 15
      Width = 216
      Height = 46
      Caption = 'Buscar'
      TabOrder = 3
      object edtVar: TEdit
        Left = 7
        Top = 17
        Width = 174
        Height = 21
        TabOrder = 0
        OnChange = edtVarChange
        OnKeyDown = edtVarKeyDown
      end
      object BtnBusca: TButton
        Left = 185
        Top = 14
        Width = 25
        Height = 25
        Caption = '>'
        TabOrder = 1
        OnClick = SpBtnBuscaClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 568
    inherited tb97Fundo: TToolbar97
      Left = 396
      DockPos = 404
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 227
      DockPos = 235
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 5
    Top = 5
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryVariaveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select NO_VARIAVEL'
      'from FI_VARIAVEL'
      'order by NO_VARIAVEL')
    ValidateWithMask = True
    Left = 488
    Top = 99
    object qryVariaveisNO_VARIAVEL: TStringField
      DisplayLabel = 'Variável'
      DisplayWidth = 19
      FieldName = 'NO_VARIAVEL'
      Origin = 'FI_VARIAVEL.NO_VARIAVEL'
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryVariaveis
    Left = 521
    Top = 101
  end
end
