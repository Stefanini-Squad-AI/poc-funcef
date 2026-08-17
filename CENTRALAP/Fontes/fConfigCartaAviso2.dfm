inherited frmConfigCartaAviso2: TfrmConfigCartaAviso2
  Left = 174
  Top = 168
  Caption = 'Carta de Aviso de Pendência de RUBS'
  ClientHeight = 293
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 562
    Height = 207
    inherited PnlImprime: TPanel
      Width = 560
      Height = 205
      object Bevel1: TBevel [0]
        Left = 20
        Top = 61
        Width = 409
        Height = 31
        Shape = bsFrame
      end
      inherited Label2: TLabel
        Top = 13
      end
      inherited CmbModelo: TCMDBLookupCombo
        Left = 20
        Top = 34
        Width = 407
      end
      object GpRubs: TGroupBox
        Left = 20
        Top = 98
        Width = 408
        Height = 46
        Caption = ' Número da RUBS '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object EdtRubIni: TRealEdit
          Left = 12
          Top = 16
          Width = 88
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
        object EdtRubFin: TRealEdit
          Left = 109
          Top = 16
          Width = 88
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
        object CkbPendentes: TCheckBox
          Left = 206
          Top = 17
          Width = 193
          Height = 17
          Caption = 'Considera somente pendentes'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object CkbEmAtraso: TCheckBox
        Left = 96
        Top = 68
        Width = 274
        Height = 17
        Caption = 'Emite carta para todas as RUBS em atraso'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CkbEmAtrasoClick
      end
    end
    inherited PnlCadastro: TPanel
      Width = 560
      Height = 205
      inherited DeRelatorio: TwwDBEdit
        DataField = 'MODELOCARTA'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 562
  end
  inherited Dock971: TDock97
    Top = 254
    Width = 562
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
    end
  end
  inherited ds: TwwDataSource
    Left = 85
    Top = 131
  end
  inherited upd: TUpdateSQL
    Left = 52
    Top = 131
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARTACOBRANCA.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome Modelo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA')
    CamposChave.Strings = (
      'CARTACOBRANCA.IDCARTACOBRANCA')
    Filtro.Strings = (
      'CARTACOBRANCA.FLGTIPOCARTA = '#39'X'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 142
    Top = 139
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (IDCARTACOBRANCA = :IDCARTACOBRANCA) AND'
      '  (FLGTIPOCARTA = '#39'X'#39')'
      ''
      ''
      '')
    Left = 20
    Top = 131
    object qryIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object qryMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object qryFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
  inherited DsgnCM: TppDesigner
    OnHide = GravaEmissaoCarta
    Left = 254
    Top = 125
  end
  inherited MergeMenu: TMainMenu
    Left = 305
    Top = 133
  end
  inherited qryReports: TwwQuery
    Left = 30
    Top = 181
  end
  inherited PpDados: TppBDEPipeline
    Left = 248
    Top = 181
    object PpDadosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPARTICIPANTE'
      FieldName = 'IDPARTICIPANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object PpDadosppField2: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpDadosppField3: TppField
      FieldAlias = 'NOMESOLICITANTE'
      FieldName = 'NOMESOLICITANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object PpDadosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUB'
      FieldName = 'IDRUB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpDadosppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 4
    end
    object PpDadosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object PpDadosppField7: TppField
      FieldAlias = 'DATAINSCRICAO'
      FieldName = 'DATAINSCRICAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object PpDadosppField8: TppField
      FieldAlias = 'ADMISSAO'
      FieldName = 'ADMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object PpDadosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATROCINADORA'
      FieldName = 'IDPATROCINADORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpDadosppField10: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object PpDadosppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANO'
      FieldName = 'IDPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpDadosppField12: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object PpDadosppField13: TppField
      FieldAlias = 'NOME_DO_PAI'
      FieldName = 'NOME_DO_PAI'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object PpDadosppField14: TppField
      FieldAlias = 'NOME_DA_MAE'
      FieldName = 'NOME_DA_MAE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object PpDadosppField15: TppField
      FieldAlias = 'DATA_MORTE'
      FieldName = 'DATA_MORTE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object PpDadosppField16: TppField
      FieldAlias = 'DATA_NASCIMENTO'
      FieldName = 'DATA_NASCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object PpDadosppField17: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object PpDadosppField18: TppField
      FieldAlias = 'TIPO_SANGUINIO'
      FieldName = 'TIPO_SANGUINIO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 17
    end
    object PpDadosppField19: TppField
      FieldAlias = 'ESTADO_CIVIL'
      FieldName = 'ESTADO_CIVIL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 18
    end
    object PpDadosppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMERO_DEPENDENTE_IRRF'
      FieldName = 'NUMERO_DEPENDENTE_IRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object PpDadosppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMERO_DEPENDENTES_SALFAMILIA'
      FieldName = 'NUMERO_DEPENDENTES_SALFAMILIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object PpDadosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMERO_DEPENDENTES'
      FieldName = 'NUMERO_DEPENDENTES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object PpDadosppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'ISENTO_IRRF'
      FieldName = 'ISENTO_IRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpDadosppField24: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 23
    end
    object PpDadosppField25: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 24
    end
    object PpDadosppField26: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object PpDadosppField27: TppField
      FieldAlias = 'ESTADO'
      FieldName = 'ESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 26
    end
    object PpDadosppField28: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object PpDadosppField29: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 28
    end
    object PpDadosppField30: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 29
    end
  end
  inherited DsDados: TwwDataSource
    Left = 180
    Top = 189
  end
  inherited QryDados: TwwQuery
    SQL.Strings = (
      'SELECT'
      '       P.IDPESSOA AS IDPARTICIPANTE,'
      '       P.NOME AS PARTICIPANTE,'
      '       A.NOMESOLICITANTE,'
      '       R.IDRUBS AS IDRUB,'
      '       EL.MATRICULA ,'
      '       PP.INSCRICAONUMERO AS INSCRICAO,'
      '       PP.INSCRICAODATA AS DATAINSCRICAO,'
      '       EL.DATAADMISSAO AS ADMISSAO,'
      '       EL.IDPESSJUR AS IDPATROCINADORA,'
      '       PJ.NOME AS PATROCINADORA,'
      '       PL.IDPLANOPREV AS IDPLANO,'
      '       PL.NOME AS PLANO,'
      '       PF.NOMEPAI AS NOME_DO_PAI,'
      '       PF.NOMEMAE AS NOME_DA_MAE,'
      '       PF.DATAMORTE AS DATA_MORTE,'
      '       PF.DATANASC AS DATA_NASCIMENTO,'
      '       PF.SEXO,'
      '       PF.TIPOSANG AS TIPO_SANGUINIO,'
      '       PF.ESTCIVIL AS ESTADO_CIVIL,'
      '       PF.NUMDEPIRRF AS NUMERO_DEPENDENTE_IRRF,'
      '       PF.NUMDEPSALF AS NUMERO_DEPENDENTES_SALFAMILIA,'
      '       PF.NUMDEPTOT AS NUMERO_DEPENDENTES,'
      '       PF.FLGISENTOIRRF AS ISENTO_IRRF,'
      '       EP.LOGRADOURO AS ENDERECO,'
      '       EP.NUMERO AS NUMERO,'
      '       EP.COMPLEMENTO AS COMPLEMENTO,'
      '       EST.CODESTADO AS ESTADO,'
      '       EP.BAIRRO,'
      '       CID.NOME AS CIDADE,'
      '       EP.CEP'
      'FROM   PESSOA P,'
      '       PESSOA PJ,'
      '       ELEGPATRO EL,'
      '       PLANPREV PL,'
      '       PATRO PT,'
      '       PARTPREVPLAN PP,'
      '       PESSOAFISICA PF,'
      '       ENDPESS EP,'
      '       CIDADES CID,'
      '       ESTADO EST,'
      '       ATEND A,'
      '       ASSUNTOXATEND AXA,'
      '       RUBS R'
      'WHERE'
      '--#ADF1'
      '      (AXA.IDASSUNTOXATEND = R.IDASSUNTOXATEND)'
      'AND   (PJ.IDPESSOA    = PT.IDPESSOA)'
      'AND   (PT.IDPESSOA    = EL.IDPESSJUR)'
      'AND   (P.IDPESSOA     = EL.IDPESSOA)'
      'AND   (P.IDPESSOA     = PF.IDPESSOA)'
      'AND   (PP.IDPESSJUR   = PT.IDPESSOA)'
      'AND   (PP.IDPESSOA    = P.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = PL.IDPLANOPREV)'
      'AND   (P.IDENDCORRESP = EP.IDENDERECO (+))'
      'AND   (EP.IDCIDADES = CID.IDCIDADES (+))'
      'AND   (CID.IDESTADO = EST.IDESTADO (+))'
      'AND   (A.IDTITULAR = P.IDPESSOA)'
      'AND   (A.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (A.IDATEND = AXA.IDATEND)'
      '')
    Left = 113
    Top = 181
    object QryDadosIDPARTICIPANTE: TFloatField
      FieldName = 'IDPARTICIPANTE'
    end
    object QryDadosPARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Size = 60
    end
    object QryDadosNOMESOLICITANTE: TStringField
      FieldName = 'NOMESOLICITANTE'
      Size = 60
    end
    object QryDadosIDRUB: TFloatField
      FieldName = 'IDRUB'
    end
    object QryDadosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object QryDadosINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object QryDadosDATAINSCRICAO: TDateTimeField
      FieldName = 'DATAINSCRICAO'
    end
    object QryDadosADMISSAO: TDateTimeField
      FieldName = 'ADMISSAO'
    end
    object QryDadosIDPATROCINADORA: TFloatField
      FieldName = 'IDPATROCINADORA'
    end
    object QryDadosPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object QryDadosIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object QryDadosPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object QryDadosNOME_DO_PAI: TStringField
      FieldName = 'NOME_DO_PAI'
      Size = 50
    end
    object QryDadosNOME_DA_MAE: TStringField
      FieldName = 'NOME_DA_MAE'
      Size = 50
    end
    object QryDadosDATA_MORTE: TDateTimeField
      FieldName = 'DATA_MORTE'
    end
    object QryDadosDATA_NASCIMENTO: TDateTimeField
      FieldName = 'DATA_NASCIMENTO'
    end
    object QryDadosSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object QryDadosTIPO_SANGUINIO: TStringField
      FieldName = 'TIPO_SANGUINIO'
      Size = 3
    end
    object QryDadosESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Size = 1
    end
    object QryDadosNUMERO_DEPENDENTE_IRRF: TFloatField
      FieldName = 'NUMERO_DEPENDENTE_IRRF'
    end
    object QryDadosNUMERO_DEPENDENTES_SALFAMILIA: TFloatField
      FieldName = 'NUMERO_DEPENDENTES_SALFAMILIA'
    end
    object QryDadosNUMERO_DEPENDENTES: TFloatField
      FieldName = 'NUMERO_DEPENDENTES'
    end
    object QryDadosISENTO_IRRF: TFloatField
      FieldName = 'ISENTO_IRRF'
    end
    object QryDadosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object QryDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object QryDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object QryDadosESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 3
    end
    object QryDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object QryDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object QryDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
  end
  inherited RptModelo: TppReport
    OnPrintingComplete = GravaEmissaoCarta
    Left = 203
    Top = 133
    DataPipelineName = 'PpDados'
  end
  inherited QryCadModelo: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      
        '  IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCART' +
        'A'
      'FROM'
      '  CARTACOBRANCA'
      'WHERE'
      '  (FLGTIPOCARTA = '#39'X'#39')'
      'ORDER BY'
      '  MODELOCARTA'
      ''
      '')
    Left = 380
    Top = 133
    object QryCadModeloIDCARTACOBRANCA: TFloatField
      FieldName = 'IDCARTACOBRANCA'
      Origin = 'CARTACOBRANCA.IDCARTACOBRANCA'
    end
    object QryCadModeloMODELOCARTA: TStringField
      FieldName = 'MODELOCARTA'
      Origin = 'CARTACOBRANCA.MODELOCARTA'
      Size = 60
    end
    object QryCadModeloIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'CARTACOBRANCA.IDREPORTS'
    end
    object QryCadModeloORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'CARTACOBRANCA.ORIGEMCM'
    end
    object QryCadModeloFLGTIPOCARTA: TStringField
      FieldName = 'FLGTIPOCARTA'
      Origin = 'CARTACOBRANCA.FLGTIPOCARTA'
      Size = 1
    end
  end
end
