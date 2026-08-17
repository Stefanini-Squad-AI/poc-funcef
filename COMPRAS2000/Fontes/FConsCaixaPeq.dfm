inherited FrmConsCaixaPeq: TFrmConsCaixaPeq
  Left = 15
  Top = 94
  Caption = 'Consulta de Caixa Pequeno'
  ClientHeight = 426
  ClientWidth = 742
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 742
    Height = 387
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 86
      Height = 13
      Caption = 'Caixa Pequeno'
    end
    object Label2: TLabel
      Left = 400
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Favorecido'
    end
    object Label3: TLabel
      Left = 400
      Top = 64
      Width = 166
      Height = 13
      Caption = 'Valor Total dos Lançamentos'
    end
    object Label4: TLabel
      Left = 584
      Top = 64
      Width = 33
      Height = 13
      Caption = 'Saldo'
    end
    object Label5: TLabel
      Left = 16
      Top = 64
      Width = 81
      Height = 13
      Caption = 'Nº do Borderô'
    end
    object Label6: TLabel
      Left = 232
      Top = 64
      Width = 111
      Height = 13
      Caption = 'Data da Efetivação'
    end
    object Panel1: TPanel
      Left = 5
      Top = 112
      Width = 732
      Height = 270
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Lançamentos do Caixa Pequeno'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 0
      end
      object Grdlanc: TwwDBGrid
        Left = 0
        Top = 32
        Width = 516
        Height = 238
        Selected.Strings = (
          'IDLANCCXPEQ'#9'10'#9'Nº do Lançamento'
          'NODOCUMENTO'#9'20'#9'Nº do Documento'
          'DATALANC'#9'10'#9'Data'
          'VLRLANC'#9'10'#9'Valor'
          'PLACONTA'#9'18'#9'Conta'
          'CODSUBCONTA'#9'10'#9'Sub-Conta'
          'CODCENTRORESPON'#9'10'#9'Centro de~Responsabilidade'
          'UNIDNEGOC'#9'10'#9'Atividade~Projeto'
          'NUMSOLCOMPRA'#9'10'#9'Nº da SCI'
          'CODARTIGO'#9'14'#9'Código~Artigo')
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsLanc
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel4: TPanel
        Left = 516
        Top = 32
        Width = 216
        Height = 238
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel4'
        TabOrder = 2
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 216
          Height = 31
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Histórico'
          TabOrder = 0
        end
        object memHist: TDBMemo
          Left = 0
          Top = 31
          Width = 216
          Height = 207
          TabStop = False
          Align = alClient
          DataField = 'HISTLANCAMENTO'
          DataSource = dsLanc
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object dblcCaixaPeq: TCMDBLookupCombo
      Left = 16
      Top = 32
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCAIXAPEQ'#9'60'#9'DESCCAIXAPEQ')
      DataField = 'IDCAIXAPEQUENO'
      LookupTable = qryCP
      LookupField = 'IDCAIXAPEQUENO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcCaixaPeqCloseUp
    end
    object edValTot: TDBEdit
      Left = 400
      Top = 80
      Width = 169
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'TOTAL'
      DataSource = dsTot
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edDataEfet: TDBEdit
      Left = 232
      Top = 80
      Width = 153
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATAEFETBORDERO'
      DataSource = dsBord
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edNumBord: TRealEdit
      Left = 16
      Top = 80
      Width = 185
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object edSaldo: TRealEdit
      Left = 584
      Top = 80
      Width = 137
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '      0.00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edForn: TEdit
      Left = 400
      Top = 32
      Width = 321
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 387
    Width = 742
    inherited tb97Fundo: TToolbar97
      Left = 378
      DockPos = 378
      inherited sep1: TToolbarSep97
        Left = 274
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 192
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 95
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 194
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 276
      end
      object BtnSel: TBitBtn
        Left = 0
        Top = 0
        Width = 95
        Height = 33
        Caption = '&Consultar'
        TabOrder = 2
        OnClick = BtnSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      object btnLimpar: TBitBtn
        Left = 97
        Top = 0
        Width = 95
        Height = 33
        Caption = '&Limpar'
        TabOrder = 3
        OnClick = btnLimparClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000012000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888000000888888078888888888000000888880D078888888880000008888
          0DD507888888880000008880DD705078888888000000880DD7DD050788888800
          000080DD7DDDD05078888800000080D7DDDDDD05078888000000807DDDDDDDD0
          607888000000880DDDDDDDDD0607880000008880DDDDDDD7E060780000008888
          0DDDDD7E6E0608000000888880DDD7E6E6E0080000008888880D7E6E6E6E0800
          000088888880E6E6E6E088000000888888880E6E6E08880000008888888880E6
          E0888800000088888888880E0888880000008888888888808888880000008888
          88888888888888000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLanc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDLANCCXPEQ,'
      '      IDEMPRESA,'
      '      CODCENTROCUSTO,'
      '      CODSUBCONTA,'
      '      IDPESSOA,'
      '      PLANO,'
      '      PLACONTA,'
      '      CODCENTRORESPON,'
      '      UNIDNEGOC,'
      '      RECPAG,'
      '      CODTIPRECDES,'
      '      IDITEMSOLI,'
      '      NODOCUMENTO,'
      '      DATALANC,'
      '      VLRLANC,'
      '      HISTLANCAMENTO,'
      '      IDBORDEROCXPEQ'
      'FROM'
      '      LANCCAIXAPEQ'
      'WHERE'
      '      (IDBORDEROCXPEQ IS NULL )'
      '  AND (IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)')
    Params.Data = {010001000F704944434149584150455155454E4F00030400000000000100}
    ValidateWithMask = True
    Left = 23
    Top = 192
    object qryLancIDLANCCXPEQ: TFloatField
      DisplayLabel = 'Nº do Lançamento'
      DisplayWidth = 10
      FieldName = 'IDLANCCXPEQ'
      Origin = 'LANCCAIXAPEQ.IDLANCCXPEQ'
    end
    object qryLancNODOCUMENTO: TStringField
      DisplayLabel = 'Nº do Documento'
      DisplayWidth = 20
      FieldName = 'NODOCUMENTO'
      Origin = 'LANCCAIXAPEQ.NODOCUMENTO'
    end
    object qryLancDATALANC: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATALANC'
      Origin = 'LANCCAIXAPEQ.DATALANC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryLancVLRLANC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRLANC'
      Origin = 'LANCCAIXAPEQ.VLRLANC'
      DisplayFormat = '#,##0.00'
    end
    object qryLancPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'LANCCAIXAPEQ.PLACONTA'
      Size = 18
    end
    object qryLancCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub-Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'LANCCAIXAPEQ.CODSUBCONTA'
    end
    object qryLancCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro de~Responsabilidade'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'LANCCAIXAPEQ.CODCENTRORESPON'
      Size = 10
    end
    object qryLancUNIDNEGOC: TFloatField
      DisplayLabel = 'Atividade~Projeto'
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'LANCCAIXAPEQ.UNIDNEGOC'
    end
    object qryLancIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'LANCCAIXAPEQ.IDEMPRESA'
      Visible = False
    end
    object qryLancCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LANCCAIXAPEQ.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryLancIDPESSOA2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'LANCCAIXAPEQ.IDPESSOA'
      Visible = False
    end
    object qryLancPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'LANCCAIXAPEQ.PLANO'
      Visible = False
    end
    object qryLancRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'LANCCAIXAPEQ.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLancCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'LANCCAIXAPEQ.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryLancHISTLANCAMENTO: TStringField
      DisplayWidth = 200
      FieldName = 'HISTLANCAMENTO'
      Origin = 'LANCCAIXAPEQ.HISTLANCAMENTO'
      Visible = False
      Size = 200
    end
    object qryLancIDBORDEROCXPEQ: TFloatField
      FieldName = 'IDBORDEROCXPEQ'
      Visible = False
    end
    object qryLancIDITEMSOLI: TFloatField
      FieldName = 'IDITEMSOLI'
      Origin = 'LANCCAIXAPEQ.IDITEMSOLI'
      Visible = False
    end
  end
  object dsLanc: TwwDataSource
    AutoEdit = False
    DataSet = qryLanc
    Left = 69
    Top = 192
  end
  object qryTot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      SUM(VLRLANC) AS TOTAL'
      'FROM'
      '      LANCCAIXAPEQ'
      'WHERE'
      '       (IDBORDEROCXPEQ  IS NULL )'
      '   AND (IDCAIXAPEQUENO = :pIDCAIXAPEQUENO)'
      '')
    Params.Data = {010001000F704944434149584150455155454E4F00030400000000000100}
    ValidateWithMask = True
    Left = 23
    Top = 240
    object qryTotTOTAL: TFloatField
      FieldName = 'TOTAL'
      Origin = '"CM.LANCCAIXAPEQ".VLRLANC'
      DisplayFormat = '#,##0.00'
    end
  end
  object dsTot: TwwDataSource
    AutoEdit = False
    DataSet = qryTot
    Left = 67
    Top = 240
  end
  object qryCP: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CP.IDCAIXAPEQUENO,'
      '      CP.DESCCAIXAPEQ,'
      '      CP.VLRTOTCAIXAPEQ,'
      '      P.RAZAOSOCIAL'
      'FROM'
      '      PESSOA P,'
      '      CAIXAPEQUENO CP,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (CP.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = CP.IDCAIXAPEQUENO)'
      '    AND (CP.IDFORCLI = P.IDPESSOA)'
      'ORDER BY CP.DESCCAIXAPEQ')
    Params.Data = {
      0100020009704944504553534F41000304000000000001000A70494455535541
      52494F00030400000000000100}
    ValidateWithMask = True
    Left = 23
    Top = 288
    object qryCPIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = '"CM.CAIXAPEQUENO".IDCAIXAPEQUENO'
    end
    object qryCPDESCCAIXAPEQ: TStringField
      FieldName = 'DESCCAIXAPEQ'
      Origin = '"CM.CAIXAPEQUENO".DESCCAIXAPEQ'
      Size = 60
    end
    object qryCPRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryCPVLRTOTCAIXAPEQ: TFloatField
      FieldName = 'VLRTOTCAIXAPEQ'
      Origin = '"CM.CAIXAPEQUENO".VLRTOTCAIXAPEQ'
    end
  end
  object qryBord: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      DISTINCT'
      '      L.IDCAIXAPEQUENO,'
      '      B.DATAEFETBORDERO'
      'FROM'
      '      LANCCAIXAPEQ L,'
      '      BORDEROCAIXAPEQ B,'
      '      USUARIOXCAIXAPEQ UXC'
      'WHERE'
      '        (L.IDBORDEROCXPEQ = :pIDBORD)'
      '    AND (L.IDPESSOA = :pIDPESSOA)'
      '    AND (UXC.IDUSUARIO = :pIDUSUARIO)'
      '    AND (UXC.IDCAIXAPEQUENO = L.IDCAIXAPEQUENO)'
      '    AND (L.IDBORDEROCXPEQ = B.IDBORDEROCXPEQ)'
      '')
    Params.Data = {
      0100030007704944424F52440006080000000000000000000100097049445045
      53534F41000304000000000001000A7049445553554152494F00030400000000
      000100}
    ValidateWithMask = True
    Left = 71
    Top = 288
    object qryBordIDCAIXAPEQUENO: TFloatField
      FieldName = 'IDCAIXAPEQUENO'
      Origin = 'LANCCAIXAPEQ.IDCAIXAPEQUENO'
    end
    object qryBordDATAEFETBORDERO: TDateTimeField
      FieldName = 'DATAEFETBORDERO'
      Origin = 'BORDEROCAIXAPEQ.DATAEFETBORDERO'
      DisplayFormat = 'DD/MM/YYYY'
    end
  end
  object dsCP: TwwDataSource
    AutoEdit = False
    DataSet = qryCP
    Left = 21
    Top = 336
  end
  object dsBord: TwwDataSource
    AutoEdit = False
    DataSet = qryBord
    Left = 125
    Top = 288
  end
end
