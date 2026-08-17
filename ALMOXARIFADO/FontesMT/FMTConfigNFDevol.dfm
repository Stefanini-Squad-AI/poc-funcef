inherited FrmMTConfigNFDevol: TFrmMTConfigNFDevol
  Left = 66
  Top = 61
  Caption = 'Configuração de Nota de Devolução'
  ClientHeight = 449
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 623
    Height = 363
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 121
      Height = 13
      Caption = 'Descrição do Modelo'
      FocusControl = edDesc
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 167
      Height = 13
      Caption = 'Agregado para ICMS da Nota'
      FocusControl = edDesc
    end
    object Label3: TLabel
      Left = 312
      Top = 64
      Width = 164
      Height = 13
      Caption = 'Agregado para ICMS do Item'
      FocusControl = edDesc
    end
    object Label4: TLabel
      Left = 16
      Top = 112
      Width = 192
      Height = 13
      Caption = 'Agregado para ICMS Substituição'
      FocusControl = edDesc
    end
    object Label5: TLabel
      Left = 312
      Top = 112
      Width = 104
      Height = 13
      Caption = 'Agregado para IPI'
      FocusControl = edDesc
    end
    object Label7: TLabel
      Left = 16
      Top = 160
      Width = 128
      Height = 13
      Caption = 'Agregado para Seguro'
      FocusControl = edDesc
    end
    object Label8: TLabel
      Left = 312
      Top = 160
      Width = 184
      Height = 13
      Caption = 'Agregado para Outras Despesas'
      FocusControl = edDesc
    end
    object Label9: TLabel
      Left = 16
      Top = 208
      Width = 310
      Height = 13
      Caption = 'Tipo de Documento para Inscrição Estadual/Municipal'
      FocusControl = edDesc
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 280
      Width = 613
      Height = 78
      Selected.Strings = (
        'DESCCAMPO'#9'50'#9'Campo'#9'F'
        'LINHA'#9'5'#9'Linha'
        'COLUNA'#9'5'#9'Coluna'
        'TAMANHO'#9'7'#9'Tamanho'
        'FLGALINHAMENTO'#9'9'#9'Alinhamento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = DsDet
      KeyOptions = []
      TabOrder = 9
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = wwDBGrid1CalcCellColors
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 5
      Top = 253
      Width = 613
      Height = 27
      Align = alBottom
      BevelInner = bvLowered
      Caption = 'Campos da Nota'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object edDesc: TDBEdit
      Left = 16
      Top = 32
      Width = 424
      Height = 21
      DataField = 'DESCTEMPLNFDEVOL'
      DataSource = ds
      TabOrder = 0
    end
    object chkImpCond: TDBCheckBox
      Left = 448
      Top = 32
      Width = 145
      Height = 17
      Caption = 'Imprime condensado'
      DataField = 'FLGCONDENSADO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object dblcAgreICMSAgre: TCMDBLookupCombo
      Left = 16
      Top = 80
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'ICMSNOTA'
      DataSource = ds
      LookupTable = CdsAgreICMSNota
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcAgreICMSItem: TCMDBLookupCombo
      Left = 312
      Top = 80
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'ICMSITEM'
      DataSource = ds
      LookupTable = CdsAgreICMSItem
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcICMSSubst: TCMDBLookupCombo
      Left = 16
      Top = 128
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'ICMSSUBSTITUICAO'
      DataSource = ds
      LookupTable = CdsAgreICMSSubst
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcAgreIPI: TCMDBLookupCombo
      Left = 312
      Top = 128
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'IPIITEM'
      DataSource = ds
      LookupTable = CdsAgreIPI
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcAgreSeguro: TCMDBLookupCombo
      Left = 16
      Top = 176
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'SEGURO'
      DataSource = ds
      LookupTable = CdsAgreSeguro
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcAgreOutros: TCMDBLookupCombo
      Left = 312
      Top = 176
      Width = 273
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
      DataField = 'OUTRASDESP'
      DataSource = ds
      LookupTable = CdsAgreOutros
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcTipoDoc: TCMDBLookupCombo
      Left = 16
      Top = 224
      Width = 569
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEDOCUMENTO'#9'30'#9'Descrição'#9'F')
      DataField = 'IDDOCUMENTO'
      DataSource = ds
      LookupTable = CdsTipoDoc
      LookupField = 'IDDOCUMENTO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 623
    inherited Toolbar971: TToolbar97
      object BtnImprime: TToolbarButton97
        Left = 240
        Top = 0
        Width = 71
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        DropdownArrow = False
        DropdownCombo = True
        DropdownMenu = MnuImprimir
        Caption = '&Imprimir'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 559
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 326
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 746
    Top = 23
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 680
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 152
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TEMPLNFDEVOL.DESCTEMPLNFDEVOL')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição Modelo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TEMPLNFDEVOL')
    CamposChave.Strings = (
      'TEMPLNFDEVOL.IDTEMPLNFDEVOL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 440
    Top = 7
  end
  object MnuImprimir: TPopupMenu
    Left = 264
    Top = 1
    object MnuNotateste: TMenuItem
      Caption = '&Nota de Teste'
      OnClick = MnuNotatesteClick
    end
    object MnuMapa: TMenuItem
      Caption = '&Mapa para Configuração'
      OnClick = MnuMapaClick
    end
  end
  object DsDet: TwwDataSource
    DataSet = CdsDet
    Left = 496
    Top = 7
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 7
  end
  object CdsAgreICMSNota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 103
  end
  object CdsAgreICMSSubst: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 159
  end
  object CdsAgreSeguro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 224
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 263
  end
  object CdsAgreICMSItem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 95
  end
  object CdsAgreIPI: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 159
  end
  object CdsAgreOutros: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 544
    Top = 223
  end
  object spAgreICMSNota: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreICMSNota
    Left = 240
    Top = 87
  end
  object spAgreICMSSubst: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreICMSSubst
    Left = 240
    Top = 143
  end
  object spAgreSeguro: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreSeguro
    Left = 240
    Top = 207
  end
  object spAgreICMSItem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreICMSItem
    Left = 544
    Top = 79
  end
  object spAgreIPI: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreIPI
    Left = 545
    Top = 144
  end
  object spAgreOutros: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ClientDataSet = CdsAgreOutros
    Left = 544
    Top = 207
  end
  object spTipoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IDDOCUMENTO,'
      '     NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      ''
      'ORDER BY 2'
      ' ')
    ClientDataSet = CdsTipoDoc
    Left = 424
    Top = 247
  end
end
