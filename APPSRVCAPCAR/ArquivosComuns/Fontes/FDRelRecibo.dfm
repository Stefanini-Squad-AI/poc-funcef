inherited frmDesenhoRelRecibo: TfrmDesenhoRelRecibo
  Left = 134
  Top = 204
  Caption = 'Configuração de Recibo'
  ClientHeight = 248
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 178
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
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Novo'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 213
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
      '   AND'
      '   ('
      '   (FLGTIPOCARTA = '#39'B'#39') OR'
      '   (FLGTIPOCARTA IS NULL)'
      '   )')
    Left = 440
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
    Left = 408
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CC.MODELOCARTA')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'CARTACOBRANCA CC')
    CamposChave.Strings = (
      'CC.IDCARTACOBRANCA')
    Filtro.Strings = (
      'CC.IDREPORTS IS NOT NULL'
      'CC.FLGTIPOCARTA = '#39'B'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 528
  end
  inherited ds: TwwDataSource
    Left = 472
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  object qrySql: TwwQuery [12]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.RAZAOSOCIAL, P.NUMDOCUMENTO,'
      '   C.CONNUMERO, C.CONNOME,'
      '   CP.NOME AS NOME_CONTATO,'
      '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO AS ENDERECO'
      'FROM'
      '   CONTRATOIMOVEL C, PESSOA P, ENDPESS E,'
      ''
      '   ('
      '   SELECT'
      '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME'
      '   FROM'
      '      CONTATOPESS CXP,'
      '      ('
      '      SELECT'
      '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO'
      '      FROM'
      '         CONTATOPESS'
      '      GROUP BY'
      '         IDENDERECO'
      '      ) CON'
      '   WHERE'
      '      ( CON.IDCONTATO = CXP.IDCONTATO )'
      '   ) CP'
      ''
      ''
      'WHERE'
      '   ( C.IDLOCATARIO = P.IDPESSOA )'
      '   AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) )'
      '   AND ( P.IDPESSOA = E.IDPESSOA(+) )'
      '   AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) )'
      ''
      'GROUP BY'
      '   P.RAZAOSOCIAL, P.NUMDOCUMENTO,'
      '   C.CONNUMERO, C.CONNOME,'
      '   CP.NOME,'
      '   E.LOGRADOURO||'#39', '#39'||E.NUMERO||'#39', '#39'||E.COMPLEMENTO '
      ''
      'ORDER BY'
      '   P.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 376
    Top = 124
    object qrySqlDataAtual: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'DataAtual'
      Size = 40
      Calculated = True
    end
    object qrySqlDataMes: TStringField
      FieldKind = fkCalculated
      FieldName = 'DataMes'
      Size = 35
      Calculated = True
    end
    object qrySqlValorRecibo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorRecibo'
      Calculated = True
    end
    object qrySqlValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorExtenso'
      Size = 180
      Calculated = True
    end
    object qrySqlDescricao: TStringField
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      Size = 500
      Calculated = True
    end
    object qrySqlLarguraRazaoSocial: TStringField
      FieldKind = fkCalculated
      FieldName = 'LarguraRazaoSocial'
      Size = 60
      Calculated = True
    end
    object qrySqlRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qrySqlNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qrySqlCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object qrySqlCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object qrySqlNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Size = 50
    end
    object qrySqlENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 92
    end
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
end
