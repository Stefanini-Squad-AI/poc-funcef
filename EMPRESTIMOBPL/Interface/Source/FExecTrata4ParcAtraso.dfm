inherited frmExecTrataParcAtraso: TfrmExecTrataParcAtraso
  Left = 359
  Top = 169
  Caption = 'Tratamento de Parcelas em Atraso'
  ClientHeight = 390
  ClientWidth = 776
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 776
    Height = 357
    object lblTitulo: TfcLabel
      Left = 14
      Top = 18
      Width = 350
      Height = 24
      Caption = 'Tratamento de Parcelas em Atraso'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object Panel2: TPanel
      Left = 392
      Top = 124
      Width = 369
      Height = 57
      TabOrder = 0
      object Label3: TLabel
        Left = 112
        Top = 10
        Width = 128
        Height = 13
        Caption = 'Mês/Ano de Cobrança'
      end
      object chkCobranca: TCheckBox
        Left = 16
        Top = 26
        Width = 105
        Height = 17
        Caption = 'aplicar filtro:   '
        TabOrder = 0
      end
      object dbspAnoCob: TwwDBSpinEdit
        Left = 256
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object cboMesCobranca: TComboBox
        Left = 112
        Top = 24
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object grpCompetencia: TGroupBox
      Left = 19
      Top = 195
      Width = 345
      Height = 89
      Caption = ' Competência dos itens de atualização gerados '
      TabOrder = 1
      object Label15: TLabel
        Left = 16
        Top = 18
        Width = 135
        Height = 13
        Caption = 'Competência (mês/ano)'
      end
      object Label6: TLabel
        Left = 102
        Top = 64
        Width = 127
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Lançamento: '
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 152
        Top = 32
        Width = 65
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 16
        Top = 32
        Width = 137
        Height = 21
        Style = csDropDownList
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
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object edtDataLancto: TwwDBDateTimePicker
        Left = 232
        Top = 60
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 2
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object chkInArquivo: TCheckBox
      Left = 395
      Top = 198
      Width = 265
      Height = 17
      Caption = 'Considerar APENAS matrículas do arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object chkNotInArquivo: TCheckBox
      Left = 395
      Top = 219
      Width = 265
      Height = 17
      Caption = 'NÃO considerar matrículas do arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btnContinuaSelecao: TfcShapeBtn
      Left = 672
      Top = 312
      Width = 89
      Height = 29
      Caption = 'Continuar'
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
        88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
        B08887F88888888887F887FBBBBB0BBBB088878888887F88878F7FBBBBBB00BB
        BB087F88FFFF77F8887F7FB00000000BBB087F877777777F887F7FB000000000
        BB087F8777777777887F7FB00000000BBB087F8777777778887F7FBBBBBB00BB
        BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
        B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
        8888888778FFFF77888888888777778888888888877777888888}
      Layout = blGlyphRight
      NumGlyphs = 2
      Options = [boFocusable, boFocusRect]
      Offsets.GlyphY = 1
      Offsets.TextDownX = 2
      Offsets.TextDownY = 2
      ParentClipping = True
      ParentFont = False
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      ShowHint = True
      TabOrder = 4
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.ExtrudeEffects.Depth = 4
      TextOptions.ExtrudeEffects.Orientation = fcTopRight
      TextOptions.VAlignment = vaVCenter
      OnClick = btnContinuaSelecaoClick
    end
  end
  inherited Dock971: TDock97
    Top = 357
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 604
      DockPos = 605
    end
  end
  inline molContratoEmptmo: TmolContratoEmptmo [2]
    Left = 15
    Top = 73
    Width = 689
    Height = 41
    TabOrder = 2
    inherited edtNome: TEdit
      Width = 433
    end
    inherited btnBuscaContrato: TBitBtn
      Left = 632
    end
    inherited btnLimpaContrato: TBitBtn
      Left = 656
    end
  end
  object Panel5: TPanel
    Left = 19
    Top = 124
    Width = 369
    Height = 57
    TabOrder = 3
    object Label4: TLabel
      Left = 112
      Top = 10
      Width = 147
      Height = 13
      Caption = 'Mês/Ano de Competência'
    end
    object chkCompetencia: TCheckBox
      Left = 16
      Top = 26
      Width = 105
      Height = 17
      Caption = 'aplicar filtro:   '
      TabOrder = 0
    end
    object dbspAnoComp: TwwDBSpinEdit
      Left = 256
      Top = 24
      Width = 65
      Height = 21
      Increment = 1
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object cboMesCompet: TComboBox
      Left = 112
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 331
  end
  object SP_TRATA_PARCELAS: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_TRAT_PARCELAS_EM_ATRASO'
    Left = 640
    Top = 24
  end
end
