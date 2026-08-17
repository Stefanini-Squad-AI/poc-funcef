inherited FrmConfigNFDevol: TFrmConfigNFDevol
  Left = 82
  Top = 22
  HelpContext = 50067
  Caption = 'Configuração de Nota de Devolução'
  ClientHeight = 461
  ClientWidth = 623
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 16
    Top = 208
    Width = 104
    Height = 13
    Caption = 'Agregado para IPI'
    FocusControl = edDesc
  end
  inherited pnlFundo: TPanel
    Width = 623
    Height = 375
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
      LookupTable = qryAgreICMSNota
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
      LookupTable = qryAgreICMSItem
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
      LookupTable = qryAgreICMSSubst
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
      LookupTable = qryAgreIPI
      LookupField = 'CODTIPOCUSTAGREG'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object Panel2: TPanel
      Left = 5
      Top = 254
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
      TabOrder = 6
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 281
      Width = 613
      Height = 89
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
      TabOrder = 7
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
    Top = 422
    Width = 623
    inherited tb97Fundo: TToolbar97
      Left = 453
      DockPos = 496
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50067
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 286
      DockPos = 329
    end
  end
  object dblcAgreSeguro: TCMDBLookupCombo [4]
    Left = 16
    Top = 224
    Width = 273
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
    DataField = 'SEGURO'
    DataSource = ds
    LookupTable = qryAgreSeguro
    LookupField = 'CODTIPOCUSTAGREG'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 3
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object dblcAgreOutros: TCMDBLookupCombo [5]
    Left = 312
    Top = 224
    Width = 273
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'DESCCUSTAGREG'#9'60'#9'Agregado'#9'F')
    DataField = 'OUTRASDESP'
    DataSource = ds
    LookupTable = qryAgreOutros
    LookupField = 'CODTIPOCUSTAGREG'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 4
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  object dblcTipoDoc: TCMDBLookupCombo [6]
    Left = 16
    Top = 272
    Width = 569
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOMEDOCUMENTO'#9'30'#9'Descrição'#9'F')
    DataField = 'IDDOCUMENTO'
    DataSource = ds
    LookupTable = qryTipoDoc
    LookupField = 'IDDOCUMENTO'
    Options = [loTitles]
    Style = csDropDownList
    TabOrder = 5
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    ShowMatchText = True
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDTEMPLNFDEVOL,'
      '     DESCTEMPLNFDEVOL,'
      '     ICMSNOTA,'
      '     ICMSITEM,'
      '     ICMSSUBSTITUICAO,'
      '     IPIITEM,'
      '     FRETE,'
      '     SEGURO,'
      '     OUTRASDESP,'
      '     FLGCONDENSADO,'
      '     IDDOCUMENTO '
      'FROM'
      '     TEMPLNFDEVOL'
      'WHERE'
      '     (IDTEMPLNFDEVOL = :IDTEMPLNFDEVOL)'
      ' ')
    Left = 314
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTEMPLNFDEVOL'
        ParamType = ptUnknown
      end>
    object qryIDTEMPLNFDEVOL: TFloatField
      FieldName = 'IDTEMPLNFDEVOL'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.IDTEMPLNFDEVOL'
    end
    object qryDESCTEMPLNFDEVOL: TStringField
      FieldName = 'DESCTEMPLNFDEVOL'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.DESCTEMPLNFDEVOL'
      Size = 60
    end
    object qryICMSNOTA: TFloatField
      FieldName = 'ICMSNOTA'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSNOTA'
    end
    object qryICMSITEM: TFloatField
      FieldName = 'ICMSITEM'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSITEM'
    end
    object qryICMSSUBSTITUICAO: TFloatField
      FieldName = 'ICMSSUBSTITUICAO'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.ICMSSUBSTITUICAO'
    end
    object qryIPIITEM: TFloatField
      FieldName = 'IPIITEM'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.IPIITEM'
    end
    object qryFRETE: TFloatField
      FieldName = 'FRETE'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.FRETE'
    end
    object qrySEGURO: TFloatField
      FieldName = 'SEGURO'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.SEGURO'
    end
    object qryOUTRASDESP: TFloatField
      FieldName = 'OUTRASDESP'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.OUTRASDESP'
    end
    object qryFLGCONDENSADO: TStringField
      FieldName = 'FLGCONDENSADO'
      Origin = 'BASEDADOS.TEMPLNFDEVOL.FLGCONDENSADO'
      FixedChar = True
      Size = 1
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 768
    Top = 65526
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TEMPLNFDEVOL'
      'set'
      '  IDTEMPLNFDEVOL = :IDTEMPLNFDEVOL,'
      '  DESCTEMPLNFDEVOL = :DESCTEMPLNFDEVOL,'
      '  ICMSNOTA = :ICMSNOTA,'
      '  ICMSITEM = :ICMSITEM,'
      '  ICMSSUBSTITUICAO = :ICMSSUBSTITUICAO,'
      '  IPIITEM = :IPIITEM,'
      '  FRETE = :FRETE,'
      '  SEGURO = :SEGURO,'
      '  OUTRASDESP = :OUTRASDESP,'
      '  FLGCONDENSADO = :FLGCONDENSADO,'
      '  IDDOCUMENTO = :IDDOCUMENTO'
      'where'
      '  IDTEMPLNFDEVOL = :OLD_IDTEMPLNFDEVOL')
    InsertSQL.Strings = (
      'insert into TEMPLNFDEVOL'
      
        '  (IDTEMPLNFDEVOL, DESCTEMPLNFDEVOL, ICMSNOTA, ICMSITEM, ICMSSUB' +
        'STITUICAO, '
      
        '   IPIITEM, FRETE, SEGURO, OUTRASDESP, FLGCONDENSADO, IDDOCUMENT' +
        'O)'
      'values'
      
        '  (:IDTEMPLNFDEVOL, :DESCTEMPLNFDEVOL, :ICMSNOTA, :ICMSITEM, :IC' +
        'MSSUBSTITUICAO, '
      
        '   :IPIITEM, :FRETE, :SEGURO, :OUTRASDESP, :FLGCONDENSADO, :IDDO' +
        'CUMENTO)')
    DeleteSQL.Strings = (
      'delete from TEMPLNFDEVOL'
      'where'
      '  IDTEMPLNFDEVOL = :OLD_IDTEMPLNFDEVOL')
    Left = 395
    Top = 6
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
    Left = 61
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 355
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 649
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 140
    Top = 6
  end
  object qryAgreICMSNota: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 240
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAgreICMSItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 528
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAgreICMSSubst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 240
    Top = 167
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAgreIPI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 528
    Top = 167
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAgreSeguro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 240
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAgreOutros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG'
      'FROM TIPOAGRE'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 528
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    OnCalcFields = QryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDCONFIGNFDEVOL,'
      '     IDTEMPLNFDEVOL,'
      '     IDCAMPONFDEVOL,'
      '     LINHA,'
      '     COLUNA,'
      '     TAMANHO,'
      '     FLGALINHAMENTO'
      ''
      'FROM'
      '     CONFIGNFDEVOL'
      'WHERE'
      '     (IDTEMPLNFDEVOL = :IDTEMPLNFDEVOL)'
      ''
      'ORDER BY IDCAMPONFDEVOL'
      ''
      ' ')
    UpdateObject = UpdDet
    ValidateWithMask = True
    Left = 472
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTEMPLNFDEVOL'
        ParamType = ptUnknown
      end>
    object QryDetDESCCAMPO: TStringField
      DisplayLabel = 'Campo'
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'DESCCAMPO'
      Size = 60
      Calculated = True
    end
    object QryDetLINHA: TFloatField
      DisplayLabel = 'Linha'
      DisplayWidth = 5
      FieldName = 'LINHA'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.LINHA'
    end
    object QryDetCOLUNA: TFloatField
      DisplayLabel = 'Coluna'
      DisplayWidth = 5
      FieldName = 'COLUNA'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.COLUNA'
    end
    object QryDetTAMANHO: TFloatField
      DisplayLabel = 'Tamanho'
      DisplayWidth = 7
      FieldName = 'TAMANHO'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.TAMANHO'
    end
    object QryDetFLGALINHAMENTO: TStringField
      DisplayLabel = 'Alinhamento'
      DisplayWidth = 9
      FieldName = 'FLGALINHAMENTO'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.FLGALINHAMENTO'
      FixedChar = True
      Size = 1
    end
    object QryDetIDCONFIGNFDEVOL: TFloatField
      FieldName = 'IDCONFIGNFDEVOL'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.IDCONFIGNFDEVOL'
      Visible = False
    end
    object QryDetIDTEMPLNFDEVOL: TFloatField
      FieldName = 'IDTEMPLNFDEVOL'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.IDTEMPLNFDEVOL'
      Visible = False
    end
    object QryDetIDCAMPONFDEVOL: TFloatField
      FieldName = 'IDCAMPONFDEVOL'
      Origin = 'BASEDADOS.CONFIGNFDEVOL.IDCAMPONFDEVOL'
      Visible = False
    end
  end
  object DsDet: TwwDataSource
    DataSet = QryDet
    Left = 512
    Top = 7
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONFIGNFDEVOL'
      'set'
      '  IDCONFIGNFDEVOL = :IDCONFIGNFDEVOL,'
      '  IDTEMPLNFDEVOL = :IDTEMPLNFDEVOL,'
      '  IDCAMPONFDEVOL = :IDCAMPONFDEVOL,'
      '  LINHA = :LINHA,'
      '  COLUNA = :COLUNA,'
      '  TAMANHO = :TAMANHO,'
      '  FLGALINHAMENTO = :FLGALINHAMENTO'
      'where'
      '  IDCONFIGNFDEVOL = :OLD_IDCONFIGNFDEVOL')
    InsertSQL.Strings = (
      'insert into CONFIGNFDEVOL'
      
        '  (IDCONFIGNFDEVOL, IDTEMPLNFDEVOL, IDCAMPONFDEVOL, LINHA, COLUN' +
        'A, '
      'TAMANHO, '
      '   FLGALINHAMENTO)'
      'values'
      '  (:IDCONFIGNFDEVOL, :IDTEMPLNFDEVOL, :IDCAMPONFDEVOL, :LINHA, '
      ':COLUNA, '
      '   :TAMANHO, :FLGALINHAMENTO)')
    DeleteSQL.Strings = (
      'delete from CONFIGNFDEVOL'
      'where'
      '  IDCONFIGNFDEVOL = :OLD_IDCONFIGNFDEVOL')
    Left = 568
    Top = 7
  end
  object MnuImprimir: TPopupMenu
    Left = 432
    Top = 9
    object MnuNotateste: TMenuItem
      Caption = '&Nota de Teste'
      OnClick = MnuNotatesteClick
    end
    object MnuMapa: TMenuItem
      Caption = '&Mapa para Configuração'
      OnClick = MnuMapaClick
    end
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     IDDOCUMENTO,'
      '     NOMEDOCUMENTO'
      'FROM TIPODOCPESSOA'
      ''
      'ORDER BY 2'
      ' ')
    ValidateWithMask = True
    Left = 408
    Top = 231
  end
end
