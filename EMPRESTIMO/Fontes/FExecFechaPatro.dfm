inherited frmExecFechaPatro: TfrmExecFechaPatro
  Left = 38
  Top = 98
  Caption = 'Fechamento por Patrocinadora (pré-Recebimento)'
  ClientHeight = 369
  ClientWidth = 727
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 205
    Top = 300
    Width = 201
    Height = 13
    Alignment = taRightJustify
    Caption = 'Novo mês de fechamento (Banco): '
  end
  inherited pnlFundo: TPanel
    Width = 727
    Height = 336
    object Label3: TLabel
      Left = 159
      Top = 238
      Width = 244
      Height = 13
      Alignment = taRightJustify
      Caption = 'Novo mês de fechamento (Patrocinadora): '
    end
    object Label1: TLabel
      Left = 177
      Top = 302
      Width = 226
      Height = 13
      Alignment = taRightJustify
      Caption = 'Novo mês de fechamento (CaP / CaR): '
    end
    object Label4: TLabel
      Left = 207
      Top = 270
      Width = 196
      Height = 13
      Alignment = taRightJustify
      Caption = 'Novo mês de fechamento (Folha): '
    end
    object Label5: TLabel
      Left = 110
      Top = 334
      Width = 293
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fechamento de Recebimento (Folha e CaP / CaR): '
      Visible = False
    end
    object cboMesPatro: TComboBox
      Left = 405
      Top = 234
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
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
    object DBspnAnoPatro: TwwDBSpinEdit
      Left = 549
      Top = 234
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 2020
      MinValue = 1980
      TabOrder = 3
      UnboundDataType = wwDefault
    end
    object Panel3: TPanel
      Left = 18
      Top = 16
      Width = 690
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 
        'Último(s) Fechamento(s)                                         ' +
        '                                    '
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Panel1: TPanel
        Left = 348
        Top = 8
        Width = 108
        Height = 20
        Caption = 'Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 564
        Top = 8
        Width = 108
        Height = 20
        Caption = 'CaP / CaR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Panel4: TPanel
        Left = 456
        Top = 8
        Width = 108
        Height = 20
        Caption = 'Folha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object cboMesCAPCAR: TComboBox
      Left = 405
      Top = 298
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
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
    object DBspnAnoCAPCAR: TwwDBSpinEdit
      Left = 549
      Top = 298
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 2020
      MinValue = 1980
      TabOrder = 9
      UnboundDataType = wwDefault
    end
    object cboMesFolha: TComboBox
      Left = 405
      Top = 266
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
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
    object DBspnAnoFolha: TwwDBSpinEdit
      Left = 549
      Top = 266
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 2020
      MinValue = 1980
      TabOrder = 6
      UnboundDataType = wwDefault
    end
    object btnUpdatePatro: TBitBtn
      Left = 629
      Top = 232
      Width = 81
      Height = 25
      Caption = 'Confirma'
      TabOrder = 4
      OnClick = btnUpdatePatroClick
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
    object btnUpdateFolha: TBitBtn
      Left = 629
      Top = 264
      Width = 81
      Height = 25
      Caption = 'Confirma'
      TabOrder = 7
      OnClick = btnUpdateFolhaClick
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
    object btnUpdateCAPCAR: TBitBtn
      Left = 629
      Top = 296
      Width = 81
      Height = 25
      Caption = 'Confirma'
      TabOrder = 10
      OnClick = btnUpdateCAPCARClick
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
    object DBgrdItensConcessao: TwwDBGrid
      Left = 18
      Top = 43
      Width = 690
      Height = 174
      Selected.Strings = (
        'NOME'#9'47'#9'NOME'
        'MES_FECHA_PATRO'#9'9'#9'    Mês'
        'ANOFECHAPATROEP'#9'5'#9' Ano'
        'MES_FECHA_FOLHA'#9'9'#9'    Mês'
        'ANOFECHAFOLHAEP'#9'5'#9' Ano'
        'MES_FECHA_CAPCAR'#9'9'#9'    Mês'
        'ANOFECHAEMPTMO'#9'5'#9' Ano')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsPatro
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = DBgrdItensConcessaoCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = DBgrdItensConcessaoTopRowChanged
    end
    object cboMesRecebimento: TComboBox
      Left = 405
      Top = 330
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 11
      Visible = False
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
    object DBSpnAnoRecebimento: TwwDBSpinEdit
      Left = 549
      Top = 330
      Width = 65
      Height = 21
      Increment = 1
      MaxValue = 2020
      MinValue = 1980
      TabOrder = 12
      UnboundDataType = wwDefault
      Visible = False
    end
    object btnUpdateRecebimento: TBitBtn
      Left = 629
      Top = 328
      Width = 81
      Height = 25
      Caption = 'Confirma'
      TabOrder = 13
      Visible = False
      OnClick = btnUpdateRecebimentoClick
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
  inherited Dock971: TDock97
    Top = 336
    Width = 727
    inherited tb97Fundo: TToolbar97
      Left = 555
      DockPos = 557
    end
  end
  object qryUpdatePatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PATRO P'
      'SET'
      '   P.ANOFECHAPATROEP =:PANOFECHAEMPTMO,'
      '   P.MESFECHAPATROEP =:PMESFECHAEMPTMO'
      'WHERE'
      '   ( P.IDPESSOA =:PIDPATRO )')
    ValidateWithMask = True
    Left = 120
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PANOFECHAEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PMESFECHAEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object qryUpdatePatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryUpdatePatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object dsPatro: TwwDataSource
    DataSet = dtmLookEmptmo.qryLookPatro
    Left = 384
    Top = 112
  end
  object qryUpdateCAPCAR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PATRO P'
      'SET'
      '   P.ANOFECHAEMPTMO  =:PANOFECHAEMPTMO,'
      '   P.MESFECHAEMPTMO =:PMESFECHAEMPTMO'
      'WHERE'
      '   ( P.IDPESSOA =:PIDPATRO )')
    ValidateWithMask = True
    Left = 120
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PANOFECHAEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PMESFECHAEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryUpdateFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   PATRO P'
      'SET'
      '   P.ANOFECHAFOLHAEP  =:PANOFECHAEMPTMO,'
      '   P.MESFECHAFOLHAEP =:PMESFECHAEMPTMO'
      'WHERE'
      '   ( P.IDPESSOA =:PIDPATRO )')
    ValidateWithMask = True
    Left = 120
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PANOFECHAEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PMESFECHAEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end>
    object FloatField2: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object StringField2: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryUpdateRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   HME.IDHISTMOVEMPTMO,  HME.IDCONTRATOEMPTMO,  HME.HMEANOCOMPET' +
        'ENCIA,'
      
        '   HME.IDRUBRICA,        HME.HMEMESCOMPETENCIA, HME.IDITEMEMPTMO' +
        ','
      
        '   HME.HMEORIGEM,        HME.HMEFORMACOBRANCA,  HME.HMESEQCOBRAN' +
        'CA,'
      
        '   HME.HMEPRIORIDADE,    HME.HMEDATAPREVISTA,   HME.HMEDATAEFETI' +
        'VA,'
      
        '   HME.HMEANOCOBRANCA,   HME.HMEMESCOBRANCA,    HME.HMEVLRPREVIS' +
        'TO,'
      
        '   HME.HMEVLREFETIVO,    HME.FLGBAIXADO,        HME.FLGDIVERGPEN' +
        'D,'
      '   HME.CODDOCUMENTO,     HME.HMECENTRALIZA,     HME.HMERECPAG,'
      
        '   HME.HMEPARCELA,       HME.IDITEMCENTRALIZA,  HME.HMEDATAATUAL' +
        'IZA,'
      '   HME.HMETIPOMOV,       HME.HMESALDODEV,       HME.HMETXJUROS,'
      
        '   HME.IDREGRA,          HME.HMEDESTACADO,      HME.HMENUMPARCEL' +
        'AS,'
      ''
      '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, '#39'0000'#39')))||'#39'/'#39'||'
      
        '    LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39')))) AS ANOMESCO' +
        'BRANCA,'
      ''
      '   (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))||'#39'/'#39'||'
      
        '    LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39')))) AS ANOME' +
        'SCOMPETENCIA,'
      ''
      
        '   CNT.IDPATRO, CNT.IDPLANOPREV, CNT.IDPESSOA, CNT.IDBENEF, CNT.' +
        'FLGSITUACAO,'
      '   CNT.IDINSCRICAOEMPTMO,'
      ''
      '   TEM.IDEMPRESAPROP,'
      '   PPP.INSCRICAONUMERO,'
      '   ELP.MATRICULA,'
      '   IXT.PLANO'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   PARTPREVPLAN    PPP,'
      '   ELEGPATRO       ELP,'
      '   CONTRATOEMPTMO  CNT,'
      '   ITEMXTIPOCONTR  IXT,'
      '   TIPOCONTREMPTMO TIP,'
      '   TIPOEMPTMO      TEM'
      ''
      'WHERE'
      '       ( TEM.IDEMPRESAPROP       = :PIDEMPRESAPROP )'
      '   AND ( HME.HMEANOCOBRANCA      = :PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA      = :PHMEMESCOBRANCA )'
      '   AND ( HME.FLGBAIXADO          = 0 )'
      '   AND ( HME.FLGENVIO            IS NULL )'
      '   AND ( HME.HMEVLREFETIVO       IS NULL )'
      '   AND ( HME.HMETIPOMOV          <> 5 )'
      '   AND ( HME.HMEDATAEFETIVA      IS NULL )'
      
        '   AND ( ( HME.HMECENTRALIZA     = 1 ) OR ( HME.HMEDESTACADO = 1' +
        ' ) )'
      
        '   AND ( ( HME.FLGESTORNADO      IS NULL ) OR ( HME.FLGESTORNADO' +
        ' = 0 ) )'
      
        '   AND ( ( HME.FLGSUSPENSAO      = 0) OR ( HME.FLGSUSPENSAO IS N' +
        'ULL) )'
      '   AND ( PPP.FLGDESATIVADO       = 0 )'
      
        '   AND ( ( HME.FLGQUITADO        IS NULL ) OR ( HME.FLGQUITADO =' +
        ' 0 ) )'
      '   AND ( HME.IDCONTRATOEMPTMO    = CNT.IDCONTRATOEMPTMO )'
      '   AND ( TIP.IDTIPOEMPTMO        = TEM.IDTIPOEMPTMO )'
      '   AND ( CNT.IDTIPOCONTREMPTMO   = TIP.IDTIPOCONTREMPTMO )'
      ''
      '   AND ( CNT.IDPATRO             = PPP.IDPESSJUR )'
      '   AND ( CNT.IDPESSOA            = PPP.IDPESSOA )'
      '   AND ( CNT.IDPLANOPREV         = PPP.IDPLANOPREV )'
      ''
      '   AND ( CNT.IDPESSOA            = ELP.IDPESSOA )'
      '   AND ( CNT.IDPATRO             = ELP.IDPESSJUR )'
      ''
      '   AND ( CNT.IDTIPOCONTREMPTMO   = IXT.IDTIPOCONTREMPTMO )'
      '   AND ( HME.IDITEMEMPTMO        = IXT.IDITEMEMPTMO)'
      'ORDER BY'
      '   CNT.IDPATRO, CNT.IDCONTRATOEMPTMO,'
      '   HME.HMEANOCOMPETENCIA,  HME.HMEMESCOMPETENCIA,'
      '   HME.HMEPRIORIDADE'
      '')
    ValidateWithMask = True
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object FloatField3: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object StringField3: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
end
