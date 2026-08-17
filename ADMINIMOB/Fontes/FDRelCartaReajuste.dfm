inherited frmDesenhoRelCartaReajuste: TfrmDesenhoRelCartaReajuste
  Left = 102
  Top = 218
  HelpContext = 640008
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
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDCARTACOBRANCA, MODELOCARTA,'
      '   IDREPORTS, ORIGEMCM, FLGTIPOCARTA'
      'FROM'
      '   CARTACOBRANCA'
      'WHERE'
      '   ( IDCARTACOBRANCA = :PCARTACOBRANCA )'
      '   AND (FLGTIPOCARTA = '#39'J'#39')')
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
      'CC.FLGTIPOCARTA = '#39'J'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 512
  end
  inherited ds: TwwDataSource
    Left = 456
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  object qrySql: TwwQuery [12]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.CONNUMERO AS NUMERO_CONTRATO,'
      '   C.CONNOME AS NOME_CONTRATO,'
      '   C.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO,'
      '   C.CONVLRTOTAL AS VLR_ANT_CONTRATO,'
      ''
      '   C.CONINDICEREAJUSTE,'
      '   C.CONPROXREAJUSTE,'
      '   C.CONDATAREAJUSTE,'
      ''
      '   P.RAZAOSOCIAL AS RS_LOCATARIO,'
      '   CP.NOME AS NOME_CONTATO,'
      
        '   (E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO) AS ENDERE' +
        'CO,'
      ''
      '   M.MOESIGLA AS INDICE_REAJUSTE,'
      ''
      '   0 AS DIAS_MES,'
      '   0 AS DIAS_VLR_ANTERIOR,'
      '   0 AS DIAS_VLR_POSTERIOR,'
      '   0 AS VLR_DIAS_ANTERIOR,'
      '   0 AS VLR_DIAS_POSTERIOR,'
      '   0 AS VLR_TOTAL,'
      '   0 AS PERCENT_REAJUSTE_CALCULADO,'
      '   0 AS PERCENT_REAJUSTE_ACUMULADO,'
      ''
      '   '#39'        '#39' AS MES_REAJUSTE,'
      '   '#39'        '#39' AS MES_ULT_REAJUSTE,'
      '   '#39'        '#39' AS MES_REAJUSTE_MENOS_UM,'
      ''
      '   '#39'                                           '#39' AS CABECALHO'
      ''
      'FROM'
      '   PESSOA P, CONTRATOIMOVEL C,'
      '   ENDPESS E, MOEDA M,'
      ''
      '   ('
      '   SELECT'
      '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '   FROM'
      '      CONTATOPESS CXP, '
      '      ( '
      '      SELECT '
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO '
      '      FROM '
      '         CONTATOPESS '
      '      GROUP BY '
      '         IDENDERECO '
      '      ) CON '
      '   WHERE '
      '      ( CON.IDCONTATO = CXP.IDCONTATO )'
      '   ) CP'
      ''
      'WHERE'
      '   ( C.CONINDICEREAJUSTE = M.MOECODIGO(+) )'
      '   AND ( C.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      ''
      '   AND'
      
        '   (  ( (:DATAINI IS NOT NULL) AND (C.CONDATAREAJUSTE >=:DATAINI' +
        ') )'
      '   OR   (:DATAINI IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:DATAFIM IS NOT NULL) AND (C.CONDATAREAJUSTE <=:DATAFIM' +
        ') )'
      '   OR   (:DATAFIM IS NULL) )'
      ''
      '   AND'
      
        '   (  ( (:CONTRATO IS NOT NULL) AND (C.IDCONTRATOIMOVEL =:CONTRA' +
        'TO) )'
      '   OR   (:CONTRATO IS NULL) )'
      ''
      'ORDER BY'
      '   C.CONNUMERO, C.CONNOME')
    ValidateWithMask = True
    Left = 104
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CONTRATO'
        ParamType = ptUnknown
      end>
    object qrySqlData_Atual: TStringField
      FieldKind = fkCalculated
      FieldName = 'Data_Atual'
      Size = 200
      Calculated = True
    end
    object qrySqlCABECALHO: TStringField
      FieldName = 'CABECALHO'
      Size = 43
    end
    object qrySqlNUMERO_CONTRATO: TStringField
      FieldName = 'NUMERO_CONTRATO'
    end
    object qrySqlNOME_CONTRATO: TStringField
      FieldName = 'NOME_CONTRATO'
      Size = 60
    end
    object qrySqlVLR_ATUAL_CONTRATO: TFloatField
      FieldName = 'VLR_ATUAL_CONTRATO'
    end
    object qrySqlVLR_ANT_CONTRATO: TFloatField
      FieldName = 'VLR_ANT_CONTRATO'
    end
    object qrySqlCONINDICEREAJUSTE: TFloatField
      FieldName = 'CONINDICEREAJUSTE'
    end
    object qrySqlCONPROXREAJUSTE: TDateTimeField
      FieldName = 'CONPROXREAJUSTE'
    end
    object qrySqlCONDATAREAJUSTE: TDateTimeField
      FieldName = 'CONDATAREAJUSTE'
    end
    object qrySqlRS_LOCATARIO: TStringField
      FieldName = 'RS_LOCATARIO'
      Size = 60
    end
    object qrySqlNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qrySqlINDICE_REAJUSTE: TStringField
      FieldName = 'INDICE_REAJUSTE'
      Size = 10
    end
    object qrySqlDIAS_VLR_ANTERIOR: TFloatField
      FieldName = 'DIAS_VLR_ANTERIOR'
    end
    object qrySqlDIAS_VLR_POSTERIOR: TFloatField
      FieldName = 'DIAS_VLR_POSTERIOR'
    end
    object qrySqlPERCENT_REAJUSTE_CALCULADO: TFloatField
      FieldName = 'PERCENT_REAJUSTE_CALCULADO'
    end
    object qrySqlPERCENT_REAJUSTE_ACUMULADO: TFloatField
      FieldName = 'PERCENT_REAJUSTE_ACUMULADO'
    end
    object qrySqlMES_REAJUSTE: TStringField
      FieldName = 'MES_REAJUSTE'
      Size = 8
    end
    object qrySqlMES_ULT_REAJUSTE: TStringField
      FieldName = 'MES_ULT_REAJUSTE'
      Size = 8
    end
    object qrySqlMES_REAJUSTE_MENOS_UM: TStringField
      FieldName = 'MES_REAJUSTE_MENOS_UM'
      Size = 8
    end
    object qrySqlVLR_DIAS_ANTERIOR: TFloatField
      FieldName = 'VLR_DIAS_ANTERIOR'
    end
    object qrySqlVLR_DIAS_POSTERIOR: TFloatField
      FieldName = 'VLR_DIAS_POSTERIOR'
    end
    object qrySqlDIAS_MES: TFloatField
      FieldName = 'DIAS_MES'
    end
    object qrySqlVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object qrySqlValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Calculated = True
    end
    object qrySqlValorExtensoTot: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtensoTot'
      Calculated = True
    end
    object qrySqlENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
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
    Left = 248
    Top = 99
  end
end
