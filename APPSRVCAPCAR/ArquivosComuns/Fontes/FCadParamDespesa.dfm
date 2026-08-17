inherited frmCadParamDespesa: TfrmCadParamDespesa
  Left = 31
  Top = 77
  Caption = 'Parâmetros para Integração Financeiras/Contábil [Despesas]'
  ClientHeight = 442
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 374
    object Label6: TLabel
      Left = 399
      Top = 71
      Width = 54
      Height = 13
      Caption = 'Despesa:'
    end
    object Label26: TLabel
      Left = 16
      Top = 169
      Width = 160
      Height = 13
      Caption = 'Centro de Responsabilidade'
    end
    object Label7: TLabel
      Left = 384
      Top = 169
      Width = 116
      Height = 13
      Caption = 'Tipo de Desembolso'
    end
    object Label28: TLabel
      Left = 16
      Top = 329
      Width = 108
      Height = 13
      Caption = 'Atividade / Projeto'
    end
    object Label4: TLabel
      Left = 384
      Top = 329
      Width = 126
      Height = 13
      Caption = 'Grupo de Lançamento'
    end
    object Label2: TLabel
      Left = 16
      Top = 19
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
    object Bevel1: TBevel
      Left = 8
      Top = 53
      Width = 737
      Height = 3
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 24
      Top = 46
      Width = 93
      Height = 13
      Caption = ' Filtro / Escopo '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 16
      Top = 71
      Width = 71
      Height = 13
      Caption = 'Tipo Imóvel:'
    end
    object Bevel2: TBevel
      Left = 8
      Top = 157
      Width = 737
      Height = 3
      Shape = bsTopLine
    end
    object Label9: TLabel
      Left = 24
      Top = 150
      Width = 72
      Height = 13
      Caption = ' Parâmetros '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inline molContratoDB1: TmolContratoDB
      Left = 8
      Top = 113
      Width = 737
      Height = 33
      TabOrder = 6
      inherited Label2: TLabel
        Top = 12
        Width = 53
        Caption = 'Contrato:'
      end
      inherited btnBuscaContrato: TBitBtn
        Left = 680
        Top = 8
        OnClick = molContratoDB1btnBuscaContratoClick
      end
      inherited btnLimpaContrato: TBitBtn
        Left = 704
        Top = 8
      end
      inherited DBedtContrato: TDBEdit
        Left = 80
        Top = 8
        Width = 600
        DataField = 'CONTRATO_EXTENSO'
        DataSource = ds
      end
      inherited DBedtIDContrato: TDBEdit
        Left = 624
        Top = 8
        DataField = 'IDCONTRATOIMOVEL'
        DataSource = ds
      end
    end
    inline molImovelDB1: TmolImovelDB
      Left = 8
      Top = 86
      Width = 737
      Height = 33
      TabOrder = 5
      TabStop = True
      inherited Label5: TLabel
        Top = 12
        Width = 42
        Caption = 'Imóvel:'
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 680
        Top = 8
        OnClick = molImovelDB1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 704
        Top = 8
      end
      inherited DBedtImovel: TDBEdit
        Left = 81
        Top = 8
        Width = 599
        DataField = 'IMOVEL_EXTENSO'
        DataSource = ds
      end
      inherited DBedtIDMestre: TDBEdit
        Left = 584
        Top = 8
        DataField = 'IDIMOVELMESTRE'
        DataSource = ds
      end
      inherited DBedtIDImovel: TDBEdit
        Left = 624
        Top = 8
        DataField = 'IDIMOVEL'
        DataSource = ds
      end
    end
    object DBcboTipoRecCusto: TwwDBLookupCombo
      Left = 459
      Top = 67
      Width = 277
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
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboCentroRespon: TwwDBLookupCombo
      Left = 16
      Top = 183
      Width = 353
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
      TabOrder = 7
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboTipoRecebDesemb: TwwDBLookupCombo
      Left = 384
      Top = 183
      Width = 353
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
      TabOrder = 8
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboUnidNegocio: TwwDBLookupCombo
      Left = 16
      Top = 343
      Width = 353
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
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DBcboTipOper: TwwDBLookupCombo
      Left = 384
      Top = 343
      Width = 353
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
      DataField = 'TIPCODIGO'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookTipOper
      LookupField = 'TIPCODIGO'
      Style = csDropDownList
      DropDownCount = 4
      DropDownWidth = 8
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object grpContaResult: TGroupBox
      Left = 16
      Top = 207
      Width = 721
      Height = 57
      Caption = ' Conta Contábil de Despesa'
      TabOrder = 9
      object lblSubConta: TLabel
        Left = 448
        Top = 14
        Width = 60
        Height = 13
        Caption = 'Sub-Conta'
        Enabled = False
        Visible = False
      end
      object Label25: TLabel
        Left = 176
        Top = 14
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label11: TLabel
        Left = 8
        Top = 14
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object btnBuscaContaResult: TBitBtn
        Left = 144
        Top = 28
        Width = 24
        Height = 22
        Hint = 'Busca um Locatário'
        TabOrder = 1
        OnClick = btnBuscaContaResultClick
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
      object DBcboCCResult: TwwDBLookupCombo
        Left = 176
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTORESULT'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookCCResult
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
      object DBedtContaResult: TDBEdit
        Left = 8
        Top = 28
        Width = 137
        Height = 21
        DataField = 'CONTARESULT'
        DataSource = ds
        TabOrder = 0
        OnExit = DBedtContaResultExit
      end
      object DBcboSCResult: TwwDBLookupCombo
        Left = 448
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
        DataField = 'SUBCONTARESULT'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookSCResult
        LookupField = 'SUBCONTARESULT'
        Enabled = False
        TabOrder = 3
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpContaDebCre: TGroupBox
      Left = 16
      Top = 269
      Width = 721
      Height = 57
      Caption = ' Conta Contábil de Passivo '
      TabOrder = 10
      object Label3: TLabel
        Left = 8
        Top = 12
        Width = 39
        Height = 13
        Caption = 'Label2'
      end
      object Label5: TLabel
        Left = 448
        Top = 14
        Width = 60
        Height = 13
        Caption = 'Sub-Conta'
        Enabled = False
        Visible = False
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
      object DBcboSCDebCre: TwwDBLookupCombo
        Left = 448
        Top = 28
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA')
        DataField = 'SUBCONTADEBCRE'
        DataSource = ds
        LookupTable = dtmLookImobiliario.qryLookSCDebCre
        LookupField = 'SUBCONTADEBCRE'
        Enabled = False
        TabOrder = 3
        Visible = False
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object DBedtDescricao: TDBEdit
      Left = 81
      Top = 16
      Width = 419
      Height = 21
      DataField = 'DESCPADRLANCIMO'
      DataSource = ds
      TabOrder = 0
    end
    object DBcboTipoImovel: TwwDBLookupCombo
      Left = 90
      Top = 67
      Width = 295
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOIMOVEL'#9'25'#9'DESCTIPOIMOVEL'#9'F')
      DataField = 'CODTIPIMOVEL'
      DataSource = ds
      LookupTable = dtmLookImobiliario.qryLookTipoImovel
      LookupField = 'CODTIPIMOVEL'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      ShowMatchText = True
      OnChange = DBcboTipoImovelExit
      OnCloseUp = DBcboTipoImovelCloseUp
      OnExit = DBcboTipoImovelExit
    end
    object DBchkIntegraCaPCaR: TDBCheckBox
      Left = 512
      Top = 9
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
    object DBchkIntegraContab: TDBCheckBox
      Left = 512
      Top = 25
      Width = 233
      Height = 17
      Caption = 'Gera Lançamentos Contábeis'
      DataField = 'FLGINTEGRACONTAB'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = DBchkIntegraContabClick
    end
  end
  inherited Dock972: TDock97
    Width = 752
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 580
      DockPos = 667
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 408
      DockPos = 465
    end
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
      '   PLI.IDFORCLI,'
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
      ''
      
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
      '   AND ( PLI.RECPAG = '#39'P'#39' )'
      '   AND ( PLI.IDIMOVEL = I.IDIMOVEL(+) )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( PLI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      '   AND ( PLI.IDFORCLI = PC.IDPESSOA (+) )'
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
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDFORCLI'
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
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PADRLANCIMOVEL'
      'set'
      '  IDPADRLANCIMOVEL = :IDPADRLANCIMOVEL,'
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
      '  IDFORCLI = :IDFORCLI,'
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
      '  TIPCODIGO = :TIPCODIGO'
      'where'
      '  IDPADRLANCIMOVEL = :OLD_IDPADRLANCIMOVEL')
    InsertSQL.Strings = (
      'insert into PADRLANCIMOVEL'
      
        '  (IDPADRLANCIMOVEL, IDMODULO, RECPAG, DESCPADRLANCIMO, FLGINTEG' +
        'RACAPCAR, '
      
        '   FLGINTEGRACONTAB, IDPESSOA, CODTIPIMOVEL, IDTIPOCUSTORECIMO, ' +
        'IDIMOVEL, '
      
        '   IDCONTRATOIMOVEL, IDFORCLI, CODCENTRORESPON, CODTIPRECDES, PL' +
        'ANO, IDEMPRESA, '
      
        '   CONTARESULT, CENTROCUSTORESULT, SUBCONTARESULT, CONTADEBCRE, ' +
        'CENTROCUSTODEBCRE, '
      '   SUBCONTADEBCRE, UNIDNEGOC, TIPCODIGO)'
      'values'
      
        '  (:IDPADRLANCIMOVEL, :IDMODULO, :RECPAG, :DESCPADRLANCIMO, :FLG' +
        'INTEGRACAPCAR, '
      
        '   :FLGINTEGRACONTAB, :IDPESSOA, :CODTIPIMOVEL, :IDTIPOCUSTORECI' +
        'MO, :IDIMOVEL, '
      
        '   :IDCONTRATOIMOVEL, :IDFORCLI, :CODCENTRORESPON, :CODTIPRECDES' +
        ', :PLANO, '
      
        '   :IDEMPRESA, :CONTARESULT, :CENTROCUSTORESULT, :SUBCONTARESULT' +
        ', :CONTADEBCRE, '
      '   :CENTROCUSTODEBCRE, :SUBCONTADEBCRE, :UNIDNEGOC, :TIPCODIGO)')
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
      'TI.CODTIPIMOVEL'
      'TCR.DESCCUSTORECIMO'
      'IM.IMONOME'
      'I.IMONOME'
      'I.IMOCODIGO'
      'C.CONNUMERO'
      'C.CONNOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descricão'
      'Tipo de Imóvel'
      'Tipo de Despesa'
      'Imóvel Mestre'
      'Imóvel'
      'Código do Imóvel'
      'Nº Contrato'
      'Nome Contrato')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'IMOVEL I'
      'IMOVEL IM'
      'CONTRATOIMOVEL C'
      'PADRLANCIMOVEL PLI'
      'TIPOIMOVEL TI'
      'TIPOCUSTORECIMOV TCR')
    CamposChave.Strings = (
      'PLI.IDPADRLANCIMOVEL')
    Filtro.Strings = (
      'PLI.RECPAG = '#39'P'#39
      'PLI.IDIMOVEL = I.IDIMOVEL(+)'
      'I.IDIMOVELMESTRE = IM.IDIMOVEL(+)'
      'PLI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+)'
      'PLI.CODTIPIMOVEL = TI.CODTIPIMOVEL(+)'
      'PLI.IDTIPOCUSTORECIMO = TCR.IDTIPOCUSTORECIMO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '10'
      '20'
      '30'
      '30'
      '10'
      '10'
      '30')
    ExibePergunta = False
    Left = 648
    Top = 0
  end
  inherited ds: TwwDataSource
    Left = 592
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 977
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 456
    Top = 43
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCIMOVEL, DESCPADRLANCIMO'
      ''
      'FROM'
      '   PADRLANCIMOVEL'
      ''
      'WHERE'
      '  ( LOWER(DESCPADRLANCIMO) =:PDESCPADRLANCIMO )'
      '  AND ( IDMODULO =:PIDMODULO )')
    ValidateWithMask = True
    Left = 360
    Top = 43
    ParamData = <
      item
        DataType = ftString
        Name = 'PDESCPADRLANCIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryVerificaOcorrenciaIDPADRLANCIMOVEL: TFloatField
      FieldName = 'IDPADRLANCIMOVEL'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.IDPADRLANCIMOVEL'
    end
    object qryVerificaOcorrenciaDESCPADRLANCIMO: TStringField
      FieldName = 'DESCPADRLANCIMO'
      Origin = 'BASEDADOS.PADRLANCIMOVEL.DESCPADRLANCIMO'
      Size = 120
    end
  end
end
