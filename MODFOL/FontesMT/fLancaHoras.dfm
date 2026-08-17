inherited frmLancaHoras: TfrmLancaHoras
  Left = 167
  Top = 136
  ActiveControl = cmbMes
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Lançamento de Horas Extras e Atrasos'
  ClientHeight = 330
  ClientWidth = 527
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 527
    Height = 291
    BorderWidth = 2
    object Label5: TLabel
      Left = 24
      Top = 56
      Width = 43
      Height = 13
      Caption = 'Atrasos'
    end
    object Label1: TLabel
      Left = 24
      Top = 90
      Width = 83
      Height = 13
      Caption = 'Extras Diurnas'
    end
    object Label2: TLabel
      Left = 24
      Top = 123
      Width = 91
      Height = 13
      Caption = 'Extras Noturnas'
    end
    object Label3: TLabel
      Left = 24
      Top = 155
      Width = 85
      Height = 13
      Caption = 'Extraordinárias'
    end
    object Label4: TLabel
      Left = 477
      Top = 56
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label6: TLabel
      Left = 477
      Top = 90
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label7: TLabel
      Left = 477
      Top = 123
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label8: TLabel
      Left = 477
      Top = 155
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label9: TLabel
      Left = 24
      Top = 188
      Width = 102
      Height = 13
      Caption = 'Adicional Noturno'
    end
    object Label10: TLabel
      Left = 477
      Top = 188
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label11: TLabel
      Left = 24
      Top = 243
      Width = 98
      Height = 13
      Caption = 'Repouso Remun.'
    end
    object Label12: TLabel
      Left = 477
      Top = 243
      Width = 30
      Height = 13
      Caption = 'qtde.'
    end
    object lblAdNotDSR1: TLabel
      Left = 24
      Top = 216
      Width = 104
      Height = 13
      Caption = 'Adic.Not. em DSR'
    end
    object lblAdNotDSR2: TLabel
      Left = 477
      Top = 216
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object edNome: TEdit
      Left = 24
      Top = 18
      Width = 264
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object grpMesRef: TGroupBox
      Left = 303
      Top = 6
      Width = 200
      Height = 42
      Caption = ' Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 7
        Top = 14
        Width = 115
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
      object spnedAno: TSpinEdit
        Left = 132
        Top = 14
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object redRub1: TRealEdit
      Left = 404
      Top = 53
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redRub2: TRealEdit
      Left = 404
      Top = 86
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redRub3: TRealEdit
      Left = 404
      Top = 119
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redRub4: TRealEdit
      Left = 404
      Top = 152
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redRub5: TRealEdit
      Left = 404
      Top = 185
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redRub6: TRealEdit
      Left = 404
      Top = 240
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 7
      WordWrap = False
      IntDigits = 4
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object pgbrRub: TProgressBar
      Left = 12
      Top = 265
      Width = 503
      Height = 16
      Min = 0
      Max = 7
      Step = 1
      TabOrder = 8
    end
    object dblckRub2: TwwDBLookupCombo
      Left = 138
      Top = 86
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub2
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object dblckRub3: TwwDBLookupCombo
      Left = 138
      Top = 119
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub3
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object dblckRub4: TwwDBLookupCombo
      Left = 138
      Top = 152
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub4
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object dblckRub5: TwwDBLookupCombo
      Left = 138
      Top = 185
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub5
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 13
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object dblckRub6: TwwDBLookupCombo
      Left = 138
      Top = 240
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub6
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object dblckRub1: TwwDBLookupCombo
      Left = 138
      Top = 53
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub1
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
    object redRub7: TRealEdit
      Left = 404
      Top = 213
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 15
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object dblckRub7: TwwDBLookupCombo
      Left = 138
      Top = 213
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub7
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 291
    Width = 527
    inherited tb97Fundo: TToolbar97
      Left = 278
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
        Cancel = True
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 29
    Top = 284
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object CdsRub1: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'CODPROVDESC'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DESCRPROVDESC'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'CODRUBCLT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'IDREGRA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'ds'
    ReadOnly = True
    StoreDefs = True
    Left = 154
    Top = 46
  end
  object CdsRub2: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 195
    Top = 79
  end
  object CdsRub4: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 283
    Top = 145
  end
  object CdsRub5: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 328
    Top = 178
  end
  object CdsRub3: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 238
    Top = 112
  end
  object CdsRub6: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'IDEMPRESA'
        DataType = ftFloat
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'IDHORARIO'
        DataType = ftFloat
      end
      item
        Name = 'TIPOSIT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAREFHORARIO'
        DataType = ftDateTime
      end
      item
        Name = 'SITUACAO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 405
    Top = 244
  end
  object CdsRub7: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 371
    Top = 208
  end
end
