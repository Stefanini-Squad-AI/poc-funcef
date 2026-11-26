inherited frmCadUFINSS: TfrmCadUFINSS
  Left = 246
  Top = 116
  HelpContext = 160086
  Caption = 'Cadastro de Órgãos do INSS'
  ClientHeight = 273
  ClientWidth = 505
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 505
    Height = 187
    inherited dbGrd: TwwDBGrid [0]
      Width = 503
      Height = 185
      Selected.Strings = (
        'UFLOCAL'#9'20'#9'UF INSS Local'#9'F'
        'CODORGAOLOCAL'#9'15'#9'Cód. Órgão Local'#9'F'
        'SINONIMO'#9'8'#9'Sinônimo'#9'F'
        'UFCENTRAL'#9'20'#9'UF INSS Central'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Width = 503
      Height = 185
      object Label1: TLabel
        Left = 18
        Top = 14
        Width = 103
        Height = 13
        Caption = 'UF do INSS Local'
      end
      object Label2: TLabel
        Left = 18
        Top = 89
        Width = 146
        Height = 13
        Caption = 'UF do INSS Centralizador'
      end
      object Label3: TLabel
        Left = 387
        Top = 14
        Width = 52
        Height = 13
        Caption = 'Sinônimo'
      end
      object Label4: TLabel
        Left = 238
        Top = 14
        Width = 131
        Height = 13
        Caption = 'Código do Órgão Local'
      end
      object dbcmbEstado: TDBLookupComboBox
        Left = 18
        Top = 30
        Width = 202
        Height = 21
        DataField = 'SIGLA'
        DataSource = ds
        KeyField = 'CODESTADO'
        ListField = 'DESCRICAO'
        ListSource = dsEstado
        TabOrder = 0
      end
      object dbcmbEstadoCentral: TDBLookupComboBox
        Left = 18
        Top = 105
        Width = 202
        Height = 21
        DataField = 'SIGLACENTRAL'
        DataSource = ds
        KeyField = 'CODESTADO'
        ListField = 'DESCRICAO'
        ListSource = dsEstado
        TabOrder = 3
      end
      object wwDBEdit1: TwwDBEdit
        Left = 387
        Top = 30
        Width = 82
        Height = 21
        DataField = 'SINONIMO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 240
        Top = 30
        Width = 127
        Height = 21
        DataField = 'CODORGAOLOCAL'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 505
  end
  inherited Dock971: TDock97
    Top = 234
    Width = 505
    inherited tb97Fundo: TToolbar97
      Left = 333
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 164
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 6
    Top = 235
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update UFINSS'
      'set'
      '  SIGLACENTRAL = :SIGLACENTRAL'
      'where'
      '  SIGLA = :OLD_SIGLA and'
      '  CODORGAOLOCAL = :OLD_CODORGAOLOCAL and'
      '  SINONIMO = :OLD_SINONIMO')
    InsertSQL.Strings = (
      'insert into UFINSS'
      '  (SIGLA, CODORGAOLOCAL, SIGLACENTRAL, SINONIMO)'
      'values'
      '  (:SIGLA, :CODORGAOLOCAL, :SIGLACENTRAL, :SINONIMO)'
      ''
      ' ')
    DeleteSQL.Strings = (
      'delete from UFINSS'
      'where'
      '  SIGLA = :OLD_SIGLA and'
      '  CODORGAOLOCAL = :OLD_CODORGAOLOCAL and'
      '  SINONIMO = :OLD_SINONIMO')
    Left = 382
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UFINSS.SIGLA'
      'UFINSS.CODORGAOLOCAL'
      'UFINSS.SINONIMO'
      'UFINSS.SIGLACENTRAL')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'UF INSS Local'
      'Código do Órgão Local'
      'Sinônimo'
      'UF INSS Central')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UFINSS')
    CamposChave.Strings = (
      'UFINSS.SIGLA'
      'UFINSS.CODORGAOLOCAL'
      'UFINSS.SINONIMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '2'
      '15'
      '7'
      '2')
    Left = 422
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 47
    Top = 238
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 264
    Top = 7
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      #9'UF.SIGLA,'
      #9'UF.CODORGAOLOCAL,'
      #9'UF.SINONIMO,'
      #9'UF.SIGLACENTRAL,'
      #9'EL.CODESTADO||'#39' - '#39'||EL.NOMEESTADO AS UFLOCAL,'
      #9'EC.CODESTADO||'#39' - '#39'||EC.NOMEESTADO AS UFCENTRAL'
      'FROM UFINSS UF, ESTADO EL, ESTADO EC'
      'WHERE UF.SIGLA = EL.CODESTADO'
      '  AND UF.SIGLACENTRAL = EC.CODESTADO(+)'
      'ORDER BY UF.SIGLA'
      ''
      ''
      ' ')
    Left = 295
    Top = 10
    object qryUFLOCAL: TStringField
      DisplayLabel = 'UF INSS Local'
      DisplayWidth = 20
      FieldName = 'UFLOCAL'
      Size = 36
    end
    object qryCODORGAOLOCAL: TStringField
      DisplayLabel = 'Cód. Órgão Local'
      DisplayWidth = 15
      FieldName = 'CODORGAOLOCAL'
      Size = 15
    end
    object qrySINONIMO: TStringField
      DisplayLabel = 'Sinônimo'
      DisplayWidth = 8
      FieldName = 'SINONIMO'
      FixedChar = True
      Size = 7
    end
    object qryUFCENTRAL: TStringField
      DisplayLabel = 'UF INSS Central'
      DisplayWidth = 20
      FieldName = 'UFCENTRAL'
      Size = 36
    end
    object qrySIGLA: TStringField
      FieldName = 'SIGLA'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object qrySIGLACENTRAL: TStringField
      FieldName = 'SIGLACENTRAL'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  object qryEstado: TQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT CODESTADO, NOMEESTADO, '
      'CODESTADO||'#39' - '#39'||NOMEESTADO AS DESCRICAO'
      'FROM ESTADO'
      'WHERE IDPAIS = 1'
      'ORDER BY CODESTADO')
    Left = 392
    Top = 166
  end
  object dsEstado: TDataSource
    DataSet = qryEstado
    Left = 392
    Top = 217
  end
end
