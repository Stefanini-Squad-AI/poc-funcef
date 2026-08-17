inherited frmDesenhoRelCartaReajuste: TfrmDesenhoRelCartaReajuste
  Left = 229
  Top = 334
  HelpContext = 1350038
  Caption = 'Configuração de Carta de Reajuste'
  ClientHeight = 248
  ClientWidth = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 577
    Height = 180
    inherited Label1: TLabel
      Top = 10
    end
    inherited Label2: TLabel
      Top = 58
    end
    inherited DBedtNomeModelo: TwwDBEdit
      Top = 24
      DataField = 'MODELOCARTA'
    end
    inherited memReports: TMemo
      Top = 24
    end
    inherited btnDesenho: TBitBtn
      Top = 114
    end
    inherited edtArquivoModelo: TEdit
      Top = 72
    end
    inherited btnLimpaArquivo: TBitBtn
      Top = 72
      Width = 24
    end
    inherited btnAbreArquivo: TBitBtn
      Left = 512
      Top = 72
    end
  end
  inherited Dock972: TDock97
    Width = 577
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Novo'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 215
    Width = 577
  end
  inherited ds: TwwDataSource
    Left = 456
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARTACOBRANCA'
      'set'
      '  IDCARTACOBRANCA = :IDCARTACOBRANCA,'
      '  MODELOCARTA = :MODELOCARTA,'
      '  IDREPORTS = :IDREPORTS,'
      '  ORIGEMCM = :ORIGEMCM,'
      '  FLGTIPOCARTA = :FLGTIPOCARTA'
      'where'
      '  IDCARTACOBRANCA = :OLD_IDCARTACOBRANCA')
    InsertSQL.Strings = (
      'insert into CARTACOBRANCA'
      
        '  (IDCARTACOBRANCA, MODELOCARTA, IDREPORTS, ORIGEMCM, FLGTIPOCAR' +
        'TA)'
      'values'
      
        '  (:IDCARTACOBRANCA, :MODELOCARTA, :IDREPORTS, :ORIGEMCM, :FLGTI' +
        'POCARTA)')
    DeleteSQL.Strings = (
      'delete from CARTACOBRANCA'
      'where'
      '  IDCARTACOBRANCA = :OLD_IDCARTACOBRANCA')
    Left = 392
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CC.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTACOBRANCA CC')
    CamposChave.Strings = (
      'CC.IDCARTACOBRANCA'
      'CC.MODELOCARTA')
    Filtro.Strings = (
      'CC.IDREPORTS IS NOT NULL'
      'CC.FLGTIPOCARTA = '#39'A'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 512
    Top = 80
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA, MODELOCARTA,'
      '   IDREPORTS, ORIGEMCM, FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   ( IDCARTACOBRANCA = :PCARTACOBRANCA )'
      '   AND (FLGTIPOCARTA = '#39'A'#39')')
    Left = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PCARTACOBRANCA'
        ParamType = ptUnknown
      end>
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
  inherited dlgAbreArquivo: TOpenDialog
    Left = 486
    Top = 76
  end
  inherited ppConsulta: TppBDEPipeline
    object ppConsultappField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppConsultappField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppConsultappField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 92
      DisplayWidth = 92
      Position = 2
    end
    object ppConsultappField4: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppConsultappField5: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppConsultappField6: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object ppConsultappField7: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 6
    end
    object ppConsultappField8: TppField
      FieldAlias = 'NUMERO_CONTRATO'
      FieldName = 'NUMERO_CONTRATO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object ppConsultappField9: TppField
      FieldAlias = 'NOME_CONTRATO'
      FieldName = 'NOME_CONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppConsultappField10: TppField
      FieldAlias = 'CONDICAO_PAGAMENTO'
      FieldName = 'CONDICAO_PAGAMENTO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 9
    end
    object ppConsultappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_FINANCIADO'
      FieldName = 'VALOR_FINANCIADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppConsultappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMERO_PARCELAS'
      FieldName = 'NUMERO_PARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppConsultappField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERIODICIDADE_MESES'
      FieldName = 'PERIODICIDADE_MESES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppConsultappField14: TppField
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object ppConsultappField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELA_ATUAL'
      FieldName = 'PARCELA_ATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppConsultappField16: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object ppConsultappField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PRESTACAO'
      FieldName = 'VALOR_PRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppConsultappField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_AMORTIZACAO'
      FieldName = 'VALOR_AMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppConsultappField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_PRESTACAO_ATUALIZADA'
      FieldName = 'VALOR_PRESTACAO_ATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppConsultappField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RESIDUO'
      FieldName = 'VALOR_RESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppConsultappField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RESIDUO_ATUALIZADO'
      FieldName = 'VALOR_RESIDUO_ATUALIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppConsultappField22: TppField
      FieldAlias = 'INDICE'
      FieldName = 'INDICE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppConsultappField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR_CORRECAO'
      FieldName = 'FATOR_CORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppConsultappField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR_ACUMULADO'
      FieldName = 'FATOR_ACUMULADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppConsultappField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_PARCELA'
      FieldName = 'PROX_PARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppConsultappField26: TppField
      FieldAlias = 'PROX_DATAVENCIMENTO'
      FieldName = 'PROX_DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 25
    end
    object ppConsultappField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_PRESTACAO'
      FieldName = 'PROX_PRESTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppConsultappField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_AMORTIZACAO'
      FieldName = 'PROX_AMORTIZACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppConsultappField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_PREST_ATUALIZADA'
      FieldName = 'PROX_PREST_ATUALIZADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppConsultappField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_RESID'
      FieldName = 'PROX_RESID'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppConsultappField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'PROX_RESID_ATUALIZADO'
      FieldName = 'PROX_RESID_ATUALIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppConsultappField32: TppField
      FieldAlias = 'MesAno'
      FieldName = 'MesAno'
      FieldLength = 8
      DisplayWidth = 8
      Position = 31
    end
    object ppConsultappField33: TppField
      FieldAlias = 'ProxPrestacaoExtenso'
      FieldName = 'ProxPrestacaoExtenso'
      FieldLength = 500
      DisplayWidth = 500
      Position = 32
    end
    object ppConsultappField34: TppField
      FieldAlias = 'UltPrestacaoExtenso'
      FieldName = 'UltPrestacaoExtenso'
      FieldLength = 500
      DisplayWidth = 500
      Position = 33
    end
  end
  object qrySql: TwwQuery [12]
    OnCalcFields = qrySqlCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       P.RAZAOSOCIAL,'
      
        '       DECODE( E.LOGRADOURO, '#39#39', E.NUMERO, E.LOGRADOURO || '#39', '#39' ' +
        '|| E.NUMERO ) || '#39'  '#39' || E.COMPLEMENTO AS ENDERECO,'
      '       E.BAIRRO,'
      '       C.NOME AS CIDADE,'
      '       E.CEP,'
      '       C.CODESTADO,'
      '       CI.CONNUMERO AS NUMERO_CONTRATO,'
      '       CI.CONNOME AS NOME_CONTRATO,'
      '       PF.DSCTIPO AS CONDICAO_PAGAMENTO,'
      '       PF.VLRFINANC AS VALOR_FINANCIADO,'
      '       PF.NUMPARCELAS NUMERO_PARCELAS,'
      '       PF.PERIODO AS PERIODICIDADE_MESES,'
      '       PF.PRAZO,'
      '       PF.NUMPARCELA AS PARCELA_ATUAL,'
      '       PF.DATAVENCIMENTO,'
      '       PF.VLRPRESTACAO AS VALOR_PRESTACAO,'
      '       PF.VLRAMORTIZACAO AS VALOR_AMORTIZACAO,'
      '       PF.VLRPRESTATUALIZADA AS VALOR_PRESTACAO_ATUALIZADA,'
      '       PF.VLRRESIDUO AS VALOR_RESIDUO,'
      '       PF.VLRRESIDUOATUALI AS VALOR_RESIDUO_ATUALIZADO,'
      '       MPF.MOESIGLA  AS INDICE,'
      '       CM.COTVALOR FATOR_CORRECAO,'
      '       PF.FATORCORRECAO AS FATOR_ACUMULADO,'
      '       PF.PROX_NUMPARCELA AS PROX_PARCELA,'
      '       PF.PROX_DATAVENCIMENTO AS PROX_DATAVENCIMENTO,'
      '       PF.PROX_VLRPRESTACAO AS PROX_PRESTACAO,'
      '       PF.PROX_VLRAMORTIZACAO AS PROX_AMORTIZACAO,'
      '       PF.PROX_VLRPRESTATUALIZADA AS PROX_PREST_ATUALIZADA,'
      '       PF.PROX_VLRRESIDUO AS PROX_RESID,'
      '       PF.PROX_VLRRESIDUOATUALI AS PROX_RESID_ATUALIZADO'
      'FROM   ( SELECT DECODE( CP.TIPOCONDPAG, '#39'S'#39', '#39'Sinal'#39','
      '                                        '#39'P'#39', '#39'Parcelamento'#39','
      '                                        '#39'V'#39', '#39'Venda à Vista'#39','
      '                                        '#39'C'#39', '#39'Caução'#39','
      '                                        '#39'R'#39', '#39'Repactuação'#39','
      
        '                                        '#39'Cond. Inicial'#39' ) AS DSC' +
        'TIPO,'
      '                CP.TIPOCONDPAG,'
      '                CP.VLRFINANC,'
      '                CP.NUMPARCELAS,'
      '                CP.PERIODO,'
      '                DECODE( CP.PRAZO, '#39'M'#39', '#39'Mês'#39', '#39'Ano'#39' ) AS PRAZO,'
      '                CP.IDCONTRATOIMOVEL,'
      '                CP.MESREFREAJUSTE,'
      '                PF.IDINDCORRECAO,'
      '                PF.NUMPARCELA,'
      '                PF.DATAVENCIMENTO,'
      '                PF.VLRPRESTACAO,'
      '                PF.VLRAMORTIZACAO,'
      '                PF.VLRPRESTATUALIZADA,'
      '                PF.VLRRESIDUO,'
      '                PF.VLRRESIDUOATUALI,'
      '                PF.FATORCORRECAO,'
      '                PF.FLGTIPOLANC,'
      '                PX.IDCONDPAGIMOVEL    AS PROX_IDCONDPAGIMOVEL,'
      '                PX.NUMPARCELA         AS PROX_NUMPARCELA,'
      '                PX.DATAVENCIMENTO     AS PROX_DATAVENCIMENTO,'
      '                PX.VLRPRESTACAO       AS PROX_VLRPRESTACAO,'
      '                PX.VLRAMORTIZACAO     AS PROX_VLRAMORTIZACAO,'
      
        '                PX.VLRPRESTATUALIZADA AS PROX_VLRPRESTATUALIZADA' +
        ','
      '                PX.VLRRESIDUO         AS PROX_VLRRESIDUO,'
      '                PX.VLRRESIDUOATUALI   AS PROX_VLRRESIDUOATUALI'
      '         FROM   CONDPAGIMOVEL  CP,'
      '                PARCFINANCIMOV PF,'
      '                ( SELECT PFX.IDCONDPAGIMOVEL,'
      '                         PFX.NUMPARCELA,'
      '                         PFX.DATAVENCIMENTO, '
      '                         PFX.VLRPRESTACAO,'
      '                         PFX.VLRAMORTIZACAO,'
      '                         PFX.VLRPRESTATUALIZADA,'
      '                         PFX.VLRRESIDUO,'
      '                         PFX.VLRRESIDUOATUALI'
      '                  FROM   PARCFINANCIMOV PFX'
      
        '                  WHERE  PFX.FLGTIPOLANC    IN ( 1, 2, 3, 4, 7, ' +
        '8, 9 ) ) PX '
      
        '         WHERE  PF.DATAVENCIMENTO BETWEEN CP.DATAINI AND CP.DATA' +
        'FIM'
      '           AND  CP.IDCONDINICIAL  = PF.IDCONDPAGIMOVEL'
      '           AND  PF.NUMPARCELA     <> 0'
      '           AND  PF.FLGTIPOLANC    IN ( 1, 2, 3, 4, 7, 8, 9 )'
      '           AND  PX.IDCONDPAGIMOVEL = CP.IDCONDINICIAL '
      '           AND  PX.NUMPARCELA      = PF.NUMPARCELA + 1 '
      '           AND  PX.IDCONDPAGIMOVEL = PF.IDCONDPAGIMOVEL ) PF,'
      '     CONTRATOIMOVEL CI,'
      '     MOEDA          MPF,'
      '     COTACAOMOEDA   CM,'
      '     PESSOA         P,'
      '     ENDPESS        E,'
      '     CIDADES        C'
      'WHERE    ( PF.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL )'
      '  AND    ( MPF.MOECODIGO(+)    = PF.IDINDCORRECAO    )'
      '  AND    ( CM.MOECODIGO (+)    = PF.IDINDCORRECAO    )'
      
        '  AND    ( CM.COTMESREF (+)    = TO_CHAR( ADD_MONTHS( PF.DATAVEN' +
        'CIMENTO, PF.MESREFREAJUSTE * ( -1 ) ), '#39'MMYYYY'#39' ) )'
      '  AND    ( P.IDPESSOA   (+)    = CI.IDLOCATARIO      )'
      '  AND    ( P.IDENDCORRESP      = E.IDENDERECO(+)     )'
      '  AND    ( E.IDCIDADES         = C.IDCIDADES (+)     )'
      'ORDER BY CI.CONNUMERO,'
      '         PF.DATAVENCIMENTO,'
      '         PF.FLGTIPOLANC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 176
    object qrySqlNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySqlRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qrySqlENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
    object qrySqlBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qrySqlCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qrySqlCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrySqlCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qrySqlNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qrySqlNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qrySqlCONDICAO_PAGAMENTO: TStringField
      FieldName = 'CONDICAO_PAGAMENTO'
      Size = 13
    end
    object qrySqlVALOR_FINANCIADO: TFloatField
      FieldName = 'VALOR_FINANCIADO'
    end
    object qrySqlNUMERO_PARCELAS: TFloatField
      FieldName = 'NUMERO_PARCELAS'
    end
    object qrySqlPERIODICIDADE_MESES: TFloatField
      FieldName = 'PERIODICIDADE_MESES'
    end
    object qrySqlPRAZO: TStringField
      FieldName = 'PRAZO'
      Size = 3
    end
    object qrySqlPARCELA_ATUAL: TFloatField
      FieldName = 'PARCELA_ATUAL'
    end
    object qrySqlDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object qrySqlVALOR_PRESTACAO: TFloatField
      FieldName = 'VALOR_PRESTACAO'
    end
    object qrySqlVALOR_AMORTIZACAO: TFloatField
      FieldName = 'VALOR_AMORTIZACAO'
    end
    object qrySqlVALOR_PRESTACAO_ATUALIZADA: TFloatField
      FieldName = 'VALOR_PRESTACAO_ATUALIZADA'
    end
    object qrySqlVALOR_RESIDUO: TFloatField
      FieldName = 'VALOR_RESIDUO'
    end
    object qrySqlVALOR_RESIDUO_ATUALIZADO: TFloatField
      FieldName = 'VALOR_RESIDUO_ATUALIZADO'
    end
    object qrySqlINDICE: TStringField
      FieldName = 'INDICE'
      Size = 10
    end
    object qrySqlFATOR_CORRECAO: TFloatField
      FieldName = 'FATOR_CORRECAO'
    end
    object qrySqlFATOR_ACUMULADO: TFloatField
      FieldName = 'FATOR_ACUMULADO'
    end
    object qrySqlPROX_PARCELA: TFloatField
      FieldName = 'PROX_PARCELA'
    end
    object qrySqlPROX_DATAVENCIMENTO: TDateTimeField
      FieldName = 'PROX_DATAVENCIMENTO'
    end
    object qrySqlPROX_PRESTACAO: TFloatField
      FieldName = 'PROX_PRESTACAO'
    end
    object qrySqlPROX_AMORTIZACAO: TFloatField
      FieldName = 'PROX_AMORTIZACAO'
    end
    object qrySqlPROX_PREST_ATUALIZADA: TFloatField
      FieldName = 'PROX_PREST_ATUALIZADA'
    end
    object qrySqlPROX_RESID: TFloatField
      FieldName = 'PROX_RESID'
    end
    object qrySqlPROX_RESID_ATUALIZADO: TFloatField
      FieldName = 'PROX_RESID_ATUALIZADO'
    end
    object qrySqlMesAno: TStringField
      FieldKind = fkCalculated
      FieldName = 'MesAno'
      Size = 8
      Calculated = True
    end
    object qrySqlProxPrestacaoExtenso: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'ProxPrestacaoExtenso'
      Size = 500
      Calculated = True
    end
    object qrySqlUltPrestacaoExtenso: TStringField
      DisplayWidth = 500
      FieldKind = fkCalculated
      FieldName = 'UltPrestacaoExtenso'
      Size = 500
      Calculated = True
    end
  end
  inherited DsgnCM: TppDesigner
    Left = 248
  end
  inherited dsConsulta: TwwDataSource
    DataSet = qrySql
  end
  inherited MergeMenu: TMainMenu
    inherited mniFile: TMenuItem
      inherited mniFileSave: TMenuItem
        OnClick = nil
      end
      inherited Sair1: TMenuItem
        OnClick = nil
      end
    end
  end
  inherited qryReports: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '   REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PREPORT) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
  end
  inherited RptCM: TppReport
    Template.FileName = 'c:\temp\teste.rtm'
    Left = 248
    Top = 99
    DataPipelineName = 'ppConsulta'
    inherited ppHeaderBand1: TppHeaderBand
      mmHeight = 87313
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        mmHeight = 36248
        mmLeft = 1588
        mmTop = 38629
        mmWidth = 194734
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Carta de Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 794
        mmTop = 1058
        mmWidth = 47625
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 794
        mmTop = 8202
        mmWidth = 195792
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 10848
        mmWidth = 22860
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Razão Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 16140
        mmWidth = 22860
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 10848
        mmWidth = 41540
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 16140
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 21431
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 21431
        mmWidth = 1588
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'BAIRRO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 24871
        mmWidth = 41010
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 67733
        mmTop = 24871
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CEP'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 28840
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CODESTADO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 44979
        mmTop = 28840
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 34660
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'No.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 39952
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'NUMERO_CONTRATO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 40217
        mmWidth = 9525
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'NOME_CONTRATO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 45244
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 44979
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Condições de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 49742
        mmWidth = 39952
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'CONDICAO_PAGAMENTO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 50006
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Valor financiado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 54769
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'VALOR_FINANCIADO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 55033
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Número de Parcelas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 59796
        mmWidth = 31750
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'NUMERO_PARCELAS'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 43921
        mmTop = 60061
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'Periodicidade (meses):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 64823
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'PERIODICIDADE_MESES'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 65088
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Prazo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 69850
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'PRAZO'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 70115
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 82286
        mmWidth = 12435
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1058
        mmTop = 85196
        mmWidth = 194998
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data Vencto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 15346
        mmTop = 82286
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Valor Prestação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 38100
        mmTop = 78052
        mmWidth = 20320
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Prestação Reajustada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 60325
        mmTop = 78052
        mmWidth = 20320
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Valor Amortização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 82550
        mmTop = 78052
        mmWidth = 20320
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Resíduo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 82286
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Resíduo Reajustado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 127000
        mmTop = 78052
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 82286
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Fator de Correção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 170921
        mmTop = 77788
        mmWidth = 25135
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 4498
      object ppDBText15: TppDBText
        UserName = 'DBText11'
        DataField = 'PARCELA_ATUAL'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 0
        mmWidth = 11430
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = ppConsulta
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 15346
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText15'
        DataField = 'VALOR_PRESTACAO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 38100
        mmTop = 0
        mmWidth = 20320
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'VALOR_PRESTACAO_ATUALIZADA'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 60325
        mmTop = 0
        mmWidth = 20320
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VALOR_PRESTACAO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 82550
        mmTop = 0
        mmWidth = 20320
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'VALOR_RESIDUO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 104775
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'VALOR_RESIDUO_ATUALIZADO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 127000
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText201'
        DataField = 'INDICE'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'FATOR_CORRECAO'
        DataPipeline = ppConsulta
        DisplayFormat = '#.00000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 0
        mmWidth = 24871
        BandType = 4
      end
    end
    inherited ppFooterBand1: TppFooterBand
      mmHeight = 6350
      object ppLabel29: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Alienação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1323
        mmWidth = 194469
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1323
        mmWidth = 194734
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 529
        mmTop = 0
        mmWidth = 194998
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 194998
        BandType = 7
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'FATOR_ACUMULADO'
        DataPipeline = ppConsulta
        DisplayFormat = '#.00000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 3175
        mmWidth = 24871
        BandType = 7
      end
      object ppLabel22: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Parcela mensal de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 7408
        mmWidth = 29369
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText17'
        DataField = 'MesAno'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 30692
        mmTop = 7408
        mmWidth = 21167
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Valor do Resíduo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 13229
        mmWidth = 54769
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Parcela mensal a partir de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 24342
        mmWidth = 41275
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'MesAno'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 24342
        mmWidth = 14552
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'com resíduo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 24342
        mmWidth = 26988
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Parcela mensal a partir de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 29898
        mmWidth = 41275
        BandType = 7
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'MesAno'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 42598
        mmTop = 29898
        mmWidth = 14552
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'sem resíduo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 29898
        mmWidth = 26988
        BandType = 7
      end
      object ppDBText28: TppDBText
        UserName = 'DBText22'
        DataField = 'VALOR_PRESTACAO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 7408
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR_RESIDUO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 13229
        mmWidth = 21696
        BandType = 7
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Valor do Resíduo reajustado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 18785
        mmWidth = 54769
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALOR_RESIDUO_ATUALIZADO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 18785
        mmWidth = 21696
        BandType = 7
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'PROX_PRESTACAO'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 24342
        mmWidth = 21696
        BandType = 7
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'VALOR_PRESTACAO_ATUALIZADA'
        DataPipeline = ppConsulta
        DisplayFormat = '#,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 30163
        mmWidth = 21696
        BandType = 7
      end
      object ppDBText31: TppDBText
        UserName = 'DBText25'
        DataField = 'ProxPrestacaoExtenso'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3969
        mmLeft = 108215
        mmTop = 24342
        mmWidth = 87313
        BandType = 7
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'UltPrestacaoExtenso'
        DataPipeline = ppConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppConsulta'
        mmHeight = 3969
        mmLeft = 108215
        mmTop = 29898
        mmWidth = 87313
        BandType = 7
      end
    end
  end
end
