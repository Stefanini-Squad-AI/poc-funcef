inherited frmCadItemxTipoContrato: TfrmCadItemxTipoContrato
  Left = 211
  Top = 149
  HelpContext = 150064
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Itens do Tipo de Contrato'
  ClientHeight = 411
  ClientWidth = 720
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 720
    Height = 378
    object Label5: TLabel
      Left = 386
      Top = 10
      Width = 112
      Height = 13
      Caption = 'Tipo de Empréstimo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 15
      Top = 10
      Width = 96
      Height = 13
      Caption = 'Tipo de Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbcoTipoContrato: TwwDBLookupCombo
      Left = 15
      Top = 24
      Width = 320
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TceDescricao'#9'40'#9'Tipo de Contrato'#9'F'
        'DESCTIPOEMPTMO'#9'32'#9'Tipo de Empréstimo'#9'F')
      LookupTable = qryTipoContrato
      LookupField = 'TceDescricao'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnCloseUp = dbcoTipoContratoCloseUp
    end
    object LstItensNAOAss: TListBox
      Left = 15
      Top = 80
      Width = 320
      Height = 281
      ItemHeight = 13
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
    end
    object LstItensAss: TTreeView
      Left = 386
      Top = 80
      Width = 319
      Height = 281
      Indent = 19
      ParentShowHint = False
      ReadOnly = True
      RightClickSelect = True
      ShowHint = False
      TabOrder = 4
      OnChanging = LstItensAssChanging
      Items.Data = {
        01000000190000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        00}
    end
    object Panel3: TPanel
      Left = 386
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Panel1: TPanel
      Left = 15
      Top = 54
      Width = 320
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Itens não Associados'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object edtTipoEmptmo: TEdit
      Left = 386
      Top = 24
      Width = 320
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 7
    end
    object btnIncluir: TfcShapeBtn
      Left = 346
      Top = 171
      Width = 28
      Height = 28
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
        66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
        66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
        660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 0
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnIncluirClick
    end
    object btnExcluir: TfcShapeBtn
      Left = 346
      Top = 216
      Width = 28
      Height = 26
      Color = clBtnFace
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888006666600
        88888887788888778F88880666666666088888788888F88878F880E6666F6666
        608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
        66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
        66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
        660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
        6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
        8888888778FFFF77888888888000008888888888877777888888}
      NumGlyphs = 2
      Options = [boFocusable]
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsFlat
      TabOrder = 1
      TabStop = True
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnExcluirClick
    end
  end
  inherited Dock971: TDock97
    Top = 378
    Width = 720
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 431
      DockPos = 453
      inherited sep1: TToolbarSep97
        Left = 202
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 41
      end
      inherited bbtnSair: TBitBtn
        Left = 121
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 204
        Height = 27
        ClickHelpContext = 150056
      end
      object btnDetalhe: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 27
        Caption = 'Detalhe'
        TabOrder = 2
        OnClick = btnDetalheClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 3
  end
  object qryRecCred: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDadosTpContrato
    SQL.Strings = (
      'SELECT'
      '   IDITEMEMPTMO, ITEDESCRICAO'
      ''
      'FROM'
      '   ITEMEMPTMO'
      ''
      'WHERE'
      '   IDITEMEMPTMO NOT IN'
      '   ('
      '   SELECT'
      '      IDITEMEMPTMO'
      '   FROM'
      '      ITEMXTIPOCONTR'
      '   WHERE'
      '      ( IDTIPOCONTREMPTMO =:IDTIPOCONTREMPTMO )'
      '   )'
      '   AND IDITEMEMPTMO > 0'
      ''
      'ORDER BY'
      '   ITEDESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTipoContrEmptmo'
        ParamType = ptInput
      end>
    object qryRecCredIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryRecCredITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
  end
  object dsItens: TwwDataSource
    DataSet = qryItens
    Left = 283
    Top = 152
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIP.IDTIPOCONTREMPTMO, TIP.IDTIPOEMPTMO, TIP.TCEDESCRICAO,'
      '   TEM.DESCTIPOEMPTMO'
      'FROM'
      '   TIPOCONTREMPTMO  TIP,'
      '   TIPOEMPTMO TEM'
      'WHERE'
      '   ( TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO )'
      '   AND ( TEM.IDEMPRESAPROP =:PIDEMPRESAPROP )')
    ValidateWithMask = True
    Left = 48
    Top = 84
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEDESCRICAO'
      Size = 60
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 48
    Top = 184
  end
  object qryItens: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DECODE(ITC.ITCEVENTO,'#39'0'#39','#39'Concessão/Renovação'#39','
      '                        '#39'1'#39','#39'Prestação'#39','
      '                        '#39'2'#39','#39'Amotização/Refinanciamento'#39','
      '                        '#39'3'#39','#39'Quitação'#39','
      '                        '#39'4'#39','#39'Atualização de Débito'#39','
      '                        '#39'5'#39','#39'Atualização de Saldo (Diária)'#39','
      '                        '#39'6'#39','#39'Importação/Migração'#39','
      '                        '#39'7'#39','#39'Ajustes (Cobrança/Devolução)'#39' ,'
      
        '                        '#39'8'#39','#39'Ajustes (Saldo Devedor)'#39') AS DESCEV' +
        'ENTO,'
      
        '   ITC.ITCSEQCALCULO, ITC.FLGDESTACADO, ITC.FLGCENTRALIZA, ITC.I' +
        'TCEVENTO,'
      
        '   ITC.IDPROVENTON, ITC.IDPROVENTOA, ITC.IDPROVENTOD, ITC.ITCREC' +
        'PAG,'
      ''
      '   ITE.ITEDESCRICAO, ITE.IDITEMEMPTMO'
      ''
      'FROM'
      '   ITEMXTIPOCONTR ITC,'
      '   ITEMEMPTMO ITE'
      ''
      'WHERE'
      '   ( ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '   AND ( ITE.IDITEMEMPTMO = ITC.IDITEMEMPTMO )'
      '   AND ( ITE.IDITEMEMPTMO > 0 )'
      ''
      'ORDER BY'
      '   ITC.ITCEVENTO, ITC.FLGCENTRALIZA DESC, '
      '   ITC.FLGDESTACADO, ITC.ITCSEQCALCULO'
      ' ')
    ValidateWithMask = True
    Left = 656
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptInput
      end>
    object qryItensITCSEQCALCULO: TFloatField
      FieldName = 'ITCSEQCALCULO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCSEQCALCULO'
    end
    object qryItensFLGDESTACADO: TFloatField
      FieldName = 'FLGDESTACADO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGDESTACADO'
    end
    object qryItensFLGCENTRALIZA: TFloatField
      FieldName = 'FLGCENTRALIZA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.FLGCENTRALIZA'
    end
    object qryItensITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCEVENTO'
    end
    object qryItensIDPROVENTON: TFloatField
      FieldName = 'IDPROVENTON'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTON'
    end
    object qryItensIDPROVENTOA: TFloatField
      FieldName = 'IDPROVENTOA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOA'
    end
    object qryItensIDPROVENTOD: TFloatField
      FieldName = 'IDPROVENTOD'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOD'
    end
    object qryItensITCRECPAG: TStringField
      FieldName = 'ITCRECPAG'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCRECPAG'
      FixedChar = True
      Size = 1
    end
    object qryItensITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryItensIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
    end
    object qryItensDESCEVENTO: TStringField
      FieldName = 'DESCEVENTO'
      Size = 29
    end
  end
  object dsDadosTpContrato: TwwDataSource
    DataSet = qryTipoContrato
    Left = 48
    Top = 136
  end
end
