inherited frmLancaHoras: TfrmLancaHoras
  Left = 186
  Top = 41
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Lançamento Individual do Ponto'
  ClientHeight = 434
  ClientWidth = 527
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 527
    Height = 395
    BorderWidth = 2
    object Label5: TLabel
      Left = 24
      Top = 73
      Width = 43
      Height = 13
      Caption = 'Atrasos'
    end
    object Label4: TLabel
      Left = 477
      Top = 73
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label1: TLabel
      Left = 24
      Top = 107
      Width = 83
      Height = 13
      Caption = 'Extras Diurnas'
    end
    object Label6: TLabel
      Left = 477
      Top = 107
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label2: TLabel
      Left = 24
      Top = 140
      Width = 91
      Height = 13
      Caption = 'Extras Noturnas'
    end
    object Label7: TLabel
      Left = 477
      Top = 140
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label3: TLabel
      Left = 24
      Top = 172
      Width = 85
      Height = 13
      Caption = 'Extraordinárias'
    end
    object Label8: TLabel
      Left = 477
      Top = 172
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label9: TLabel
      Left = 24
      Top = 236
      Width = 102
      Height = 13
      Caption = 'Adicional Noturno'
    end
    object Label10: TLabel
      Left = 477
      Top = 236
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label11: TLabel
      Left = 24
      Top = 204
      Width = 110
      Height = 13
      Caption = 'Extras Transferidas'
    end
    object Label12: TLabel
      Left = 477
      Top = 204
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label13: TLabel
      Left = 24
      Top = 268
      Width = 35
      Height = 13
      Caption = 'Faltas'
    end
    object Label15: TLabel
      Left = 477
      Top = 267
      Width = 24
      Height = 13
      Caption = 'dias'
    end
    object Label14: TLabel
      Left = 24
      Top = 301
      Width = 95
      Height = 13
      Caption = 'Faltas Abonadas'
    end
    object Label16: TLabel
      Left = 477
      Top = 300
      Width = 24
      Height = 13
      Caption = 'dias'
    end
    object edNome: TEdit
      Left = 24
      Top = 25
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
      Top = 13
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
    object dblckRub1: TwwDBLookupCombo
      Left = 138
      Top = 70
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub1
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub1: TRealEdit
      Left = 404
      Top = 70
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
    object dblckRub2: TwwDBLookupCombo
      Left = 138
      Top = 103
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub2
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub2: TRealEdit
      Left = 404
      Top = 103
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
    object dblckRub3: TwwDBLookupCombo
      Left = 138
      Top = 136
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub3
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub3: TRealEdit
      Left = 404
      Top = 136
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object dblckRub4: TwwDBLookupCombo
      Left = 138
      Top = 169
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub4
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub4: TRealEdit
      Left = 404
      Top = 169
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object dblckRub5: TwwDBLookupCombo
      Left = 138
      Top = 233
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub5
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub5: TRealEdit
      Left = 404
      Top = 233
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object dblckRub6: TwwDBLookupCombo
      Left = 138
      Top = 201
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub6
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub6: TRealEdit
      Left = 404
      Top = 201
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 13
      WordWrap = False
      IntDigits = 4
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object dblckRub7: TwwDBLookupCombo
      Left = 138
      Top = 265
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub7
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub7: TRealEdit
      Left = 404
      Top = 265
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
    object dblckRub8: TwwDBLookupCombo
      Left = 138
      Top = 298
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRPROVDESC'#9'130'#9'DESCRPROVDESC'#9'F')
      LookupTable = CdsRub8
      LookupField = 'IDPROVENTO'
      Style = csDropDownList
      TabOrder = 16
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object redRub8: TRealEdit
      Left = 404
      Top = 298
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 17
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object gbxBancoHoras3: TGroupBox
      Left = 12
      Top = 321
      Width = 503
      Height = 43
      Caption = 'Banco de Horas (min.)'
      TabOrder = 18
      object Label21: TLabel
        Left = 21
        Top = 17
        Width = 41
        Height = 13
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 175
        Top = 17
        Width = 38
        Height = 13
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 328
        Top = 17
        Width = 79
        Height = 13
        Caption = 'Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object redCredito: TRealEdit
        Left = 69
        Top = 14
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object redDebito: TRealEdit
        Left = 222
        Top = 14
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
      object redTransf: TRealEdit
        Left = 415
        Top = 14
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
        Signal = True
      end
    end
    object pgbrRub: TProgressBar
      Left = 12
      Top = 369
      Width = 503
      Height = 16
      Min = 0
      Max = 8
      Step = 1
      TabOrder = 19
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 527
    inherited tb97Fundo: TToolbar97
      Left = 276
      inherited sep1: TToolbarSep97
        Left = 164
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
        Left = 166
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
    object bbtnRubrica: TBitBtn
      Left = 4
      Top = 2
      Width = 106
      Height = 33
      Caption = '&Criar Rubrica'
      Default = True
      TabOrder = 1
      OnClick = bbtnRubricaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 130
    Top = 383
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
    Top = 59
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
    Top = 92
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
    Top = 158
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
    Top = 191
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
    Top = 125
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
    Left = 373
    Top = 228
  end
  object CdsRub7: TCMClientDataSet
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
    Left = 240
    Top = 263
  end
  object CdsRub8: TCMClientDataSet
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
    Left = 309
    Top = 300
  end
  object CdsBancoHoras: TCMClientDataSet
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
    StoreDefs = True
    Left = 82
    Top = 255
  end
end
