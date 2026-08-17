inherited frmCadLayoutDesconto: TfrmCadLayoutDesconto
  Left = 191
  Top = 74
  Caption = 'Cadastro de Layout de Arquivos TXT'
  ClientHeight = 436
  ClientWidth = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 510
    Height = 350
    BorderWidth = 2
    object pnlDecricao: TPanel
      Left = 4
      Top = 4
      Width = 502
      Height = 55
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label13: TLabel
        Left = 9
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedDescricao: TwwDBEdit
        Left = 9
        Top = 24
        Width = 484
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 11
      Top = 64
      Width = 489
      Height = 62
      Caption = 'Identificação do Empregado'
      TabOrder = 1
      object Label14: TLabel
        Left = 11
        Top = 16
        Width = 46
        Height = 13
        Caption = 'Posição'
      end
      object Label15: TLabel
        Left = 67
        Top = 16
        Width = 53
        Height = 13
        Caption = 'Tamanho'
      end
      object dbedMatriculaPos: TwwDBEdit
        Left = 11
        Top = 31
        Width = 49
        Height = 21
        DataField = 'COLCODIGO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedMatriculaTam: TwwDBEdit
        Left = 68
        Top = 31
        Width = 56
        Height = 21
        DataField = 'TAMCODIGO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rgTipoIdent: TRadioGroup
        Left = 133
        Top = 17
        Width = 160
        Height = 35
        Caption = 'Tipo de Identficação'
        Columns = 2
        Enabled = False
        ItemIndex = 0
        Items.Strings = (
          'Matrícula'
          'Outro')
        TabOrder = 2
        OnClick = rgTipoIdentClick
      end
      object dblcTipoDoc: TwwDBLookupCombo
        Left = 301
        Top = 31
        Width = 177
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO')
        DataField = 'COLCODIGODEP'
        DataSource = ds
        LookupTable = qryTipoDoc
        LookupField = 'IDDOCUMENTO'
        Style = csDropDownList
        TabOrder = 3
        Visible = False
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 11
      Top = 131
      Width = 179
      Height = 128
      Caption = 'Coluna da Rubrica'
      TabOrder = 2
      object Label17: TLabel
        Left = 14
        Top = 20
        Width = 46
        Height = 13
        Caption = 'Posição'
      end
      object Label18: TLabel
        Left = 95
        Top = 20
        Width = 53
        Height = 13
        Caption = 'Tamanho'
      end
      object Label16: TLabel
        Left = 10
        Top = 66
        Width = 160
        Height = 43
        AutoSize = False
        Caption = 
          'OBS: Preencher apenas se, para cada linha do TXT, houver uma Rub' +
          'rica diferente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object dbedRubricaPos: TwwDBEdit
        Left = 14
        Top = 35
        Width = 67
        Height = 21
        DataField = 'COLCODFAVORECIDO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = dbedRubricaPosChange
      end
      object dbedRubricaTam: TwwDBEdit
        Left = 96
        Top = 35
        Width = 67
        Height = 21
        DataField = 'TAMCODFAVORECIDO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnChange = dbedRubricaPosChange
      end
    end
    object gbxOcorrencias: TGroupBox
      Left = 198
      Top = 131
      Width = 147
      Height = 62
      Caption = 'Coluna de Ocorrências'
      TabOrder = 3
      object Label1: TLabel
        Left = 12
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Posição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 79
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Tamanho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedPosOcorr: TwwDBEdit
        Left = 12
        Top = 29
        Width = 57
        Height = 21
        DataField = 'COLOCORRENCIAS'
        DataSource = dsDet
        MaxLength = 3
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedTamOcorr: TwwDBEdit
        Left = 79
        Top = 29
        Width = 56
        Height = 21
        DataField = 'TAMOCORRENCIAS'
        DataSource = dsDet
        MaxLength = 2
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object gbxParcelas: TGroupBox
      Left = 352
      Top = 131
      Width = 147
      Height = 62
      Caption = 'Coluna de Parcelas'
      TabOrder = 4
      object Label7: TLabel
        Left = 12
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Posição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 79
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Tamanho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbedPosParc: TwwDBEdit
        Left = 12
        Top = 29
        Width = 57
        Height = 21
        DataField = 'COLPARCELAS'
        DataSource = dsDet
        MaxLength = 3
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedTamParc: TwwDBEdit
        Left = 79
        Top = 29
        Width = 56
        Height = 21
        DataField = 'TAMPARCELAS'
        DataSource = dsDet
        MaxLength = 2
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object gbxValor: TGroupBox
      Left = 198
      Top = 197
      Width = 301
      Height = 62
      Caption = 'Coluna de Valor'
      TabOrder = 5
      object Label4: TLabel
        Left = 10
        Top = 14
        Width = 38
        Height = 13
        Caption = 'Posição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 77
        Top = 14
        Width = 45
        Height = 13
        Caption = 'Tamanho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 144
        Top = 14
        Width = 63
        Height = 13
        Hint = 'Caracter usado para fazer a separação decimal'
        Caption = 'Sep. Decimal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label12: TLabel
        Left = 219
        Top = 14
        Width = 71
        Height = 13
        Hint = 'Caracter usado para fazer a separação decimal'
        Caption = 'Num. Decimais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object dbedtPosicaoValor: TwwDBEdit
        Left = 10
        Top = 29
        Width = 57
        Height = 21
        DataField = 'COLVALOR'
        DataSource = dsDet
        MaxLength = 3
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtTamValor: TwwDBEdit
        Left = 78
        Top = 29
        Width = 56
        Height = 21
        DataField = 'TAMVALOR'
        DataSource = dsDet
        MaxLength = 2
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtDepDecimalValor: TwwDBEdit
        Left = 145
        Top = 29
        Width = 56
        Height = 21
        DataField = 'CARACDECIMAL'
        DataSource = dsDet
        MaxLength = 2
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNumDecimais: TwwDBEdit
        Left = 220
        Top = 29
        Width = 56
        Height = 21
        DataField = 'NUMDECIMAIS'
        DataSource = dsDet
        MaxLength = 2
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlRubrica: TPanel
      Left = 11
      Top = 269
      Width = 489
      Height = 71
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object Label6: TLabel
        Left = 9
        Top = 4
        Width = 242
        Height = 13
        Caption = 'Rubrica (caso seja única por arquivo TXT)'
      end
      object sbtnSelRubrica: TSpeedButton
        Left = 408
        Top = 19
        Width = 72
        Height = 44
        Caption = 'Selecionar'
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
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = False
        OnClick = sbtnSelRubricaClick
      end
      object memRubrica: TMemo
        Left = 9
        Top = 19
        Width = 394
        Height = 44
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 510
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 510
    inherited tb97Fundo: TToolbar97
      Left = 340
      DockPos = 584
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 173
      DockPos = 417
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IdLayout, Descricao, ColCodigo, TamCodigo,'
      '  ColCodFavorecido, TamCodFavorecido, ColCodigoDep'
      'FROM'
      '  LayoutDesconto'
      'WHERE'
      '  (IdLayout = :IdLayout)')
    Left = 270
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IdLayout'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 355
    Top = 81
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTDESCONTO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  COLCODIGO = :COLCODIGO,'
      '  TAMCODIGO = :TAMCODIGO,'
      '  COLCODFAVORECIDO = :COLCODFAVORECIDO,'
      '  TAMCODFAVORECIDO = :TAMCODFAVORECIDO,'
      '  COLCODIGODEP = :COLCODIGODEP'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    InsertSQL.Strings = (
      'insert into LAYOUTDESCONTO'
      '  (IDLAYOUT, DESCRICAO, COLCODIGO, TAMCODIGO, COLCODFAVORECIDO, '
      'TAMCODFAVORECIDO, '
      '   COLCODIGODEP)'
      'values'
      
        '  (:IDLAYOUT, :DESCRICAO, :COLCODIGO, :TAMCODIGO, :COLCODFAVOREC' +
        'IDO, '
      ':TAMCODFAVORECIDO, '
      '   :COLCODIGODEP)')
    DeleteSQL.Strings = (
      'delete from LAYOUTDESCONTO'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Layout'
    Colunas.Strings = (
      'LAYOUTDESCONTO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'LAYOUTDESCONTO')
    CamposChave.Strings = (
      'LAYOUTDESCONTO.IDLAYOUT')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    ExibePergunta = False
    Left = 355
    Top = 68
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 355
    Top = 55
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 355
    Top = 41
  end
  object qryTipoDoc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  NOMEDOCUMENTO, IDDOCUMENTO'
      'FROM'
      '  TIPODOCPESSOA'
      'WHERE '
      '  (FISICAJURIDICA = '#39'F'#39')'
      'ORDER BY'
      '  UPPER(NOMEDOCUMENTO)')
    ValidateWithMask = True
    Left = 152
    Top = 28
  end
  object qryRubrica: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'  '#39' || RTRIM(LTRIM(RP.DESCRPROVDESC))) AS DESCRPROVDESC'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA  = :IDEMPRESA) AND'
      '  (RP.IDRUBRICA = :IDRUBRICA) AND'
      '  (RP.IDRUBRICA = PD.IDPROVENTO) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 15
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object qryFavorecido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39#39' || RTRIM(LTRIM(PJ.RAZAOSOCIAL))) AS RAZAOSOCIAL'
      'FROM'
      '  PESSOA PJ, EMPRESAFORN EF, PLANO PL'
      'WHERE'
      '  (EF.IDFORCLI = :IDFORCLI)   AND'
      '  (PJ.IDPESSOA = :IDFORCLI)   AND'
      '  (EF.IDFORCLI = PJ.IDPESSOA) AND'
      '  (EF.PLANO    = PL.PLANO)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update layoutxcolunas'
      'set'
      '  COLVALOR = :COLVALOR,'
      '  TAMVALOR = :TAMVALOR,'
      '  IDRUBRICA = :IDRUBRICA,'
      '  IDFAVORECIDO = :IDFAVORECIDO,'
      '  NUMDECIMAIS = :NUMDECIMAIS,'
      '  CARACDECIMAL = :CARACDECIMAL,'
      '  COLPARCELAS = :COLPARCELAS,'
      '  TAMPARCELAS = :TAMPARCELAS,'
      '  COLOCORRENCIAS = :COLOCORRENCIAS,'
      '  TAMOCORRENCIAS = :TAMOCORRENCIAS'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    InsertSQL.Strings = (
      'insert into layoutxcolunas'
      '  (IDLAYOUT, COLVALOR, TAMVALOR, IDRUBRICA, IDFAVORECIDO, '
      'NUMDECIMAIS, '
      '   CARACDECIMAL, COLPARCELAS, TAMPARCELAS, COLOCORRENCIAS, '
      'TAMOCORRENCIAS)'
      'values'
      '  (:IDLAYOUT, :COLVALOR, :TAMVALOR, :IDRUBRICA, :IDFAVORECIDO, '
      ':NUMDECIMAIS, '
      '   :CARACDECIMAL, :COLPARCELAS, :TAMPARCELAS, :COLOCORRENCIAS, '
      ':TAMOCORRENCIAS)')
    DeleteSQL.Strings = (
      'delete from layoutxcolunas'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    Left = 360
    Top = 2
  end
  object qryDet: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  LAYOUTXCOLUNAS'
      'WHERE'
      '  (IDLAYOUT = :IDLAYOUT)')
    UpdateObject = updDet
    ValidateWithMask = True
    OnFilterOptions = [ofoEnabled, ofoShowHourGlass, ofoCancelOnEscape]
    Left = 400
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryDetIDLAYOUT: TFloatField
      DisplayLabel = 'Layout'
      DisplayWidth = 10
      FieldName = 'IDLAYOUT'
      Origin = 'LAYOUTXCOLUNAS.IDLAYOUT'
    end
    object qryDetCOLVALOR: TFloatField
      DisplayLabel = 'Coluna Valor'
      DisplayWidth = 10
      FieldName = 'COLVALOR'
      Origin = 'LAYOUTXCOLUNAS.COLVALOR'
    end
    object qryDetTAMVALOR: TFloatField
      DisplayLabel = 'Tamanho Valor'
      DisplayWidth = 11
      FieldName = 'TAMVALOR'
      Origin = 'LAYOUTXCOLUNAS.TAMVALOR'
    end
    object qryDetIDRUBRICA: TFloatField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Origin = 'LAYOUTXCOLUNAS.IDRUBRICA'
    end
    object qryDetIDFAVORECIDO: TFloatField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 10
      FieldName = 'IDFAVORECIDO'
      Origin = 'LAYOUTXCOLUNAS.IDFAVORECIDO'
    end
    object qryDetCOLPARCELAS: TFloatField
      DisplayLabel = 'Coluna Parcelas'
      DisplayWidth = 10
      FieldName = 'COLPARCELAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLPARCELAS'
    end
    object qryDetTAMPARCELAS: TFloatField
      DisplayLabel = 'Tamanho Parcelas'
      DisplayWidth = 10
      FieldName = 'TAMPARCELAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMPARCELAS'
    end
    object qryDetCOLOCORRENCIAS: TFloatField
      DisplayLabel = 'Coluna Ocorrências'
      DisplayWidth = 10
      FieldName = 'COLOCORRENCIAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLOCORRENCIAS'
    end
    object qryDetTAMOCORRENCIAS: TFloatField
      DisplayLabel = 'Tamanho Ocorrências'
      DisplayWidth = 10
      FieldName = 'TAMOCORRENCIAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMOCORRENCIAS'
    end
    object qryDetIDEMPRESA: TFloatField
      DisplayLabel = 'Empresa'
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'LAYOUTXCOLUNAS.IDEMPRESA'
    end
    object qryDetUNIDNEGOC: TFloatField
      DisplayLabel = 'Coluna Ocorrências'
      DisplayWidth = 14
      FieldName = 'UNIDNEGOC'
      Origin = 'LAYOUTXCOLUNAS.UNIDNEGOC'
      Visible = False
    end
    object qryDetCODTIPRECDES: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'Tamanho Ocorrências'
      DisplayWidth = 16
      FieldName = 'CODTIPRECDES'
      Origin = 'LAYOUTXCOLUNAS.CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object qryDetPLANO: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'LAYOUTXCOLUNAS.PLANO'
      Visible = False
    end
    object qryDetCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro de Responsabilidade'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'LAYOUTXCOLUNAS.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'LAYOUTXCOLUNAS.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryDetRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'LAYOUTXCOLUNAS.RECPAG'
      Visible = False
      Size = 1
    end
    object qryDetTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'LAYOUTXCOLUNAS.TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'LAYOUTXCOLUNAS.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetCARACDECIMAL: TStringField
      FieldName = 'CARACDECIMAL'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CARACDECIMAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetNUMDECIMAIS: TFloatField
      FieldName = 'NUMDECIMAIS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.NUMDECIMAIS'
      Visible = False
    end
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDet
    Left = 433
    Top = 2
  end
  object MontaSelectRubrica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'RUBRICAXPESS.DESCRPROVDESC'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS')
    CamposChave.Strings = (
      'RUBRICAXPESS.IDRUBRICA'
      'RUBRICAXPESS.DESCRPROVDESC')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 344
    Top = 315
  end
end
