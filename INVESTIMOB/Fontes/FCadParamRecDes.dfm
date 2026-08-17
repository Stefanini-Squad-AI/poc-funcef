inherited FrmCadParamRecDes: TFrmCadParamRecDes
  Left = 232
  Top = 174
  HelpContext = 540041
  Caption = 'Parâmetros para Integração Financeira'
  ClientHeight = 358
  ClientWidth = 778
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 778
    Height = 290
    object Label6: TLabel
      Left = 20
      Top = 63
      Width = 112
      Height = 13
      Caption = 'Receita / Despesa:'
    end
    object Label26: TLabel
      Left = 400
      Top = 62
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object lblTpRecDes: TLabel
      Left = 20
      Top = 109
      Width = 116
      Height = 13
      Caption = 'Tipo de Desembolso'
    end
    object Label28: TLabel
      Left = 400
      Top = 110
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label2: TLabel
      Left = 24
      Top = 15
      Width = 62
      Height = 13
      Caption = 'Descrição:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 20
      Top = 153
      Width = 67
      Height = 13
      Caption = 'Tipo Imóvel'
    end
    object DBcboTipoRecCusto: TwwDBLookupCombo
      Left = 19
      Top = 77
      Width = 358
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCUSTORECIMO'#9'60'#9'DESCCUSTORECIMO')
      DataField = 'IDTIPOCUSTORECIMO'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookTipoRecDes
      LookupField = 'IDTIPOCUSTORECIMO'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = DBcboTipoRecCustoCloseUp
    end
    object DBcboCentroRespon: TwwDBLookupCombo
      Left = 400
      Top = 76
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'NOME')
      DataField = 'CODCENTRORESPON'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookCentroRespon
      LookupField = 'CODCENTRORESPON'
      Style = csDropDownList
      DropDownCount = 6
      DropDownWidth = 8
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboTipoRecebDesemb: TwwDBLookupCombo
      Left = 19
      Top = 124
      Width = 358
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
      DataField = 'CODTIPRECDES'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookTipoDesemb
      LookupField = 'CODTIPRECDES'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboUnidNegocio: TwwDBLookupCombo
      Left = 400
      Top = 124
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'25'#9'NOME')
      DataField = 'UNIDNEGOC'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookUnidNegocio
      LookupField = 'UNIDNEGOC'
      Style = csDropDownList
      DropDownCount = 6
      DropDownWidth = 8
      TabOrder = 6
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object grpContaDebCre: TGroupBox
      Left = 12
      Top = 197
      Width = 457
      Height = 57
      Caption = ' Conta Contábil de Baixa ( Ativo / Passivo ) '
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 39
        Height = 13
        Caption = 'Label2'
      end
      object Label10: TLabel
        Left = 176
        Top = 14
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label12: TLabel
        Left = 8
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object btnBuscaContaDebCre: TBitBtn
        Left = 144
        Top = 28
        Width = 24
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 1
        OnClick = btnBuscaContaDebCreClick
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
      object DBcboCCDebCre: TwwDBLookupCombo
        Left = 176
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTODEBCRE'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookCCDebCre
        LookupField = 'CODCENTROCUSTO'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBedtContaDebCre: TDBEdit
        Left = 8
        Top = 28
        Width = 137
        Height = 21
        DataField = 'CONTADEBCRE'
        DataSource = ds
        TabOrder = 0
        OnExit = DBedtContaDebCreExit
      end
    end
    object DBedtDescricao: TDBEdit
      Left = 20
      Top = 30
      Width = 419
      Height = 21
      DataField = 'DESCPADRLANCIMO'
      DataSource = ds
      TabOrder = 0
    end
    object DBchkIntegraCaPCaR: TDBCheckBox
      Left = 496
      Top = 32
      Width = 233
      Height = 17
      Caption = 'Gera Documento de Contas a Pagar'
      DataField = 'FLGINTEGRACAPCAR'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkIntegraCaPCaRClick
    end
    object DBcboTIpoImovel: TwwDBLookupCombo
      Left = 19
      Top = 172
      Width = 358
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      LookupTable = qryTipoImovel
      LookupField = 'CODTIPIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock972: TDock97
    Width = 778
  end
  inherited Dock971: TDock97
    Top = 325
    Width = 778
    inherited tb97Fundo: TToolbar97
      Left = 606
      DockPos = 667
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 434
      DockPos = 465
    end
  end
  inherited ds: TwwDataSource
    Left = 592
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PADRLANCIMOVEL'
      'set'
      '  IDMODULO = :IDMODULO,'
      '  RECPAG = :RECPAG,'
      '  DESCPADRLANCIMO = :DESCPADRLANCIMO,'
      '  FLGINTEGRACAPCAR = :FLGINTEGRACAPCAR,'
      '  FLGINTEGRACONTAB = :FLGINTEGRACONTAB,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  PLANO = :PLANO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CONTARESULT = :CONTARESULT,'
      '  CENTROCUSTORESULT = :CENTROCUSTORESULT,'
      '  SUBCONTARESULT = :SUBCONTARESULT,'
      '  CONTADEBCRE = :CONTADEBCRE,'
      '  CENTROCUSTODEBCRE = :CENTROCUSTODEBCRE,'
      '  SUBCONTADEBCRE = :SUBCONTADEBCRE,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  TIPCODIGO = :TIPCODIGO,'
      '  FLGDIARIO = :FLGDIARIO'
      'where'
      '  IDPADRLANCIMOVEL = :OLD_IDPADRLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into PADRLANCIMOVEL'
      '  (IDPADRLANCIMOVEL, IDMODULO, RECPAG, DESCPADRLANCIMO, '
      'FLGINTEGRACAPCAR, '
      '   FLGINTEGRACONTAB, IDPESSOA, CODTIPIMOVEL, IDTIPOCUSTORECIMO, '
      'IDIMOVEL, '
      '   IDCONTRATOIMOVEL, CODCENTRORESPON, CODTIPRECDES, PLANO, '
      'IDEMPRESA, CONTARESULT, '
      '   CENTROCUSTORESULT, SUBCONTARESULT, CONTADEBCRE, '
      'CENTROCUSTODEBCRE, SUBCONTADEBCRE, '
      '   UNIDNEGOC, TIPCODIGO, FLGDIARIO)'
      'values'
      '  (:IDPADRLANCIMOVEL, :IDMODULO, :RECPAG, :DESCPADRLANCIMO, '
      ':FLGINTEGRACAPCAR, '
      
        '   :FLGINTEGRACONTAB, :IDPESSOA, :CODTIPIMOVEL, :IDTIPOCUSTORECI' +
        'MO, '
      ':IDIMOVEL, '
      '   :IDCONTRATOIMOVEL, :CODCENTRORESPON, :CODTIPRECDES, :PLANO, '
      ':IDEMPRESA, '
      '   :CONTARESULT, :CENTROCUSTORESULT, :SUBCONTARESULT, '
      ':CONTADEBCRE, :CENTROCUSTODEBCRE, '
      '   :SUBCONTADEBCRE, :UNIDNEGOC, :TIPCODIGO, :FLGDIARIO)')
    DeleteSQL.Strings = (
      'delete from PADRLANCIMOVEL'
      'where'
      '  IDPADRLANCIMOVEL = :OLD_IDPADRLANCIMOVEL')
    Left = 528
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PLI.DESCPADRLANCIMO'
      'TCR.DESCCUSTORECIMO'
      'TI.DESCTIPOIMOVEL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descricão'
      'Tipo de Despesa'
      'Tipo de Imóvel')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PADRLANCIMOVEL PLI'
      'TIPOCUSTORECIMOV TCR'
      'TIPOIMOVEL TI')
    CamposChave.Strings = (
      'PLI.IDPADRLANCIMOVEL')
    Filtro.Strings = (
      'PLI.IDTIPOCUSTORECIMO = TCR.IDTIPOCUSTORECIMO(+)'
      'TCR.IDMODULO = 54'
      'PLI.CODTIPIMOVEL = TI.CODTIPIMOVEL(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '20'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 648
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 977
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 456
    Top = 43
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PLI.IDPADRLANCIMOVEL,'
      '   PLI.IDMODULO,'
      '   PLI.RECPAG,'
      '   PLI.DESCPADRLANCIMO,'
      '   PLI.FLGINTEGRACAPCAR,'
      '   PLI.FLGINTEGRACONTAB,'
      '   PLI.IDPESSOA,'
      ''
      '   PLI.CODTIPIMOVEL,'
      '   PLI.IDTIPOCUSTORECIMO,'
      '   PLI.IDIMOVEL,'
      '   PLI.IDCONTRATOIMOVEL,'
      ''
      '   PLI.CODCENTRORESPON,'
      '   PLI.CODTIPRECDES,'
      ''
      '   PLI.PLANO,'
      '   PLI.IDEMPRESA,'
      '   PLI.CONTARESULT,'
      '   PLI.CENTROCUSTORESULT,'
      '   PLI.SUBCONTARESULT,'
      '   PLI.CONTADEBCRE,'
      '   PLI.CENTROCUSTODEBCRE,'
      '   PLI.SUBCONTADEBCRE,'
      ''
      '   PLI.UNIDNEGOC,'
      '   PLI.TIPCODIGO,'
      '   PLI.FLGDIARIO,'
      
        '   (IM.IMONOME||'#39' - '#39'||I.IMONOME) AS IMOVEL_EXTENSO, I.IDIMOVELM' +
        'ESTRE,'
      
        '   (DECODE(C.CONNUMERO, NULL, C.CONNOME, C.CONNUMERO||'#39' - '#39'||C.C' +
        'ONNOME)) AS CONTRATO_EXTENSO,'
      ''
      '   PC.NOME AS NF_FORCLI, PC.RAZAOSOCIAL AS RS_FORCLI'
      ''
      'FROM'
      '   PESSOA PC, IMOVEL I, IMOVEL IM, CONTRATOIMOVEL C,'
      '   PADRLANCIMOVEL PLI'
      ''
      'WHERE'
      '   ( PLI.IDPADRLANCIMOVEL =:PIDPADRLANCIMOVEL )'
      '   AND ( PLI.IDMODULO =:PIDMODULO )'
      '   AND ( PLI.IDIMOVEL = I.IDIMOVEL(+) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( PLI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      ''
      ''
      ' ')
    Left = 560
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPADRLANCIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryIDPADRLANCIMOVEL: TFloatField
      FieldName = 'IDPADRLANCIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDPADRLANCIMOVEL'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDESCPADRLANCIMO: TStringField
      FieldName = 'DESCPADRLANCIMO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.DESCPADRLANCIMO'
      Size = 120
    end
    object qryFLGINTEGRACAPCAR: TFloatField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.FLGINTEGRACAPCAR'
    end
    object qryFLGINTEGRACONTAB: TFloatField
      FieldName = 'FLGINTEGRACONTAB'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.FLGINTEGRACONTAB'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDPESSOA'
    end
    object qryCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDTIPOCUSTORECIMO'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDIMOVEL'
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDCONTRATOIMOVEL'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.PLANO'
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDEMPRESA'
    end
    object qryCONTARESULT: TStringField
      FieldName = 'CONTARESULT'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CONTARESULT'
      FixedChar = True
      Size = 18
    end
    object qryCENTROCUSTORESULT: TStringField
      FieldName = 'CENTROCUSTORESULT'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CENTROCUSTORESULT'
      FixedChar = True
      Size = 10
    end
    object qrySUBCONTARESULT: TFloatField
      FieldName = 'SUBCONTARESULT'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.SUBCONTARESULT'
    end
    object qryCONTADEBCRE: TStringField
      FieldName = 'CONTADEBCRE'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CONTADEBCRE'
      FixedChar = True
      Size = 18
    end
    object qryCENTROCUSTODEBCRE: TStringField
      FieldName = 'CENTROCUSTODEBCRE'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.CENTROCUSTODEBCRE'
      FixedChar = True
      Size = 10
    end
    object qrySUBCONTADEBCRE: TFloatField
      FieldName = 'SUBCONTADEBCRE'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.SUBCONTADEBCRE'
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.UNIDNEGOC'
    end
    object qryTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.TIPCODIGO'
      FixedChar = True
      Size = 2
    end
    object qryIMOVEL_EXTENSO: TStringField
      FieldName = 'IMOVEL_EXTENSO'
      Size = 123
    end
    object qryCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryNF_FORCLI: TStringField
      FieldName = 'NF_FORCLI'
      Size = 60
    end
    object qryRS_FORCLI: TStringField
      FieldName = 'RS_FORCLI'
      Size = 60
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      FixedChar = True
      Size = 1
    end
  end
  object qryTipoImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPIMOVEL,DESCTIPOIMOVEL AS DESCRICAO'
      ' FROM TIPOIMOVEL ORDER BY DESCTIPOIMOVEL')
    ValidateWithMask = True
    Left = 496
    Top = 208
  end
  object dsTipoImovel: TDataSource
    DataSet = qryTipoImovel
    Left = 496
    Top = 219
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 568
    Top = 208
  end
end
