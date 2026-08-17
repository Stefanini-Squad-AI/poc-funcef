inherited frmCadUFINSS: TfrmCadUFINSS
  Left = 687
  Top = 362
  HelpContext = 160086
  Caption = 'Cadastro de Órgãos do INSS'
  ClientHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 388
    inherited dbGrd: TwwDBGrid [0]
      Height = 386
      Selected.Strings = (
        'SIGLA'#9'2'#9'SIGLA'
        'CODORGAOLOCAL'#9'15'#9'CODORGAOLOCAL'
        'SINONIMO'#9'7'#9'SINONIMO'
        'SIGLACENTRAL'#9'2'#9'SIGLACENTRAL'
        'EMAIL'#9'30'#9'EMAIL'
        'TEXTOEMAIL'#9'10'#9'TEXTOEMAIL'
        'UFLOCAL'#9'36'#9'UFLOCAL'
        'UFCENTRAL'#9'36'#9'UFCENTRAL')
    end
    inherited pnlControles: TPanel [1]
      Height = 386
      object Label1: TLabel
        Left = 18
        Top = 14
        Width = 103
        Height = 13
        Caption = 'UF do INSS Local'
      end
      object Label2: TLabel
        Left = 18
        Top = 66
        Width = 146
        Height = 13
        Caption = 'UF do INSS Centralizador'
      end
      object Label3: TLabel
        Left = 443
        Top = 14
        Width = 52
        Height = 13
        Caption = 'Sinônimo'
      end
      object Label4: TLabel
        Left = 254
        Top = 14
        Width = 131
        Height = 13
        Caption = 'Código do Órgão Local'
      end
      object Label5: TLabel
        Left = 255
        Top = 66
        Width = 36
        Height = 13
        Caption = 'E-Mail'
      end
      object Label6: TLabel
        Left = 16
        Top = 119
        Width = 85
        Height = 13
        Caption = 'Texto do Email'
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
        Top = 82
        Width = 202
        Height = 21
        DataField = 'SIGLACENTRAL'
        DataSource = ds
        KeyField = 'CODESTADO'
        ListField = 'DESCRICAO'
        ListSource = dsEstado
        TabOrder = 3
      end
      object edtSinonimo: TwwDBEdit
        Left = 443
        Top = 30
        Width = 82
        Height = 21
        DataField = 'SINONIMO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtCodOrgao: TwwDBEdit
        Left = 256
        Top = 30
        Width = 127
        Height = 21
        DataField = 'CODORGAOLOCAL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edtEmail: TwwDBEdit
        Left = 255
        Top = 82
        Width = 270
        Height = 21
        DataField = 'EMAIL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbmemTextoEmail: TDBMemo
        Left = 16
        Top = 134
        Width = 508
        Height = 241
        DataField = 'TEXTOEMAIL'
        DataSource = ds
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 435
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 6
    Top = 235
    TargetsData = (
      1
      3
      (
        ''
        'DisplayLabel'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update UFINSS'
      'set'
      '  SIGLA = :SIGLA,'
      '  CODORGAOLOCAL = :CODORGAOLOCAL,'
      '  SINONIMO = :SINONIMO,'
      '  SIGLACENTRAL = :SIGLACENTRAL,'
      '  EMAIL = :EMAIL'
      'where'
      '  SIGLA = :OLD_SIGLA and'
      '  CODORGAOLOCAL = :OLD_CODORGAOLOCAL')
    InsertSQL.Strings = (
      'insert into UFINSS'
      '  (SIGLA, CODORGAOLOCAL, SINONIMO, SIGLACENTRAL, EMAIL)'
      'values'
      '  (:SIGLA, :CODORGAOLOCAL, :SINONIMO, :SIGLACENTRAL, :EMAIL)')
    DeleteSQL.Strings = (
      'delete from UFINSS'
      'where'
      '  SIGLA = :OLD_SIGLA and'
      '  CODORGAOLOCAL = :OLD_CODORGAOLOCAL')
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
    AfterPost = qryAfterPost
    SQL.Strings = (
      'SELECT'
      #9'UF.SIGLA,'
      #9'UF.CODORGAOLOCAL,'
      #9'UF.SINONIMO,'
      #9'UF.SIGLACENTRAL,'
      #9'UF.EMAIL,'
      #9'UF.TEXTOEMAIL,'
      #9'EL.CODESTADO||'#39' - '#39'||EL.NOMEESTADO AS UFLOCAL,'
      #9'EC.CODESTADO||'#39' - '#39'||EC.NOMEESTADO AS UFCENTRAL'
      'FROM UFINSS UF, ESTADO EL, ESTADO EC'
      'WHERE UF.SIGLA = EL.CODESTADO'
      '  AND UF.SIGLACENTRAL = EC.CODESTADO(+)'
      'ORDER BY UF.SIGLA')
    Left = 295
    Top = 10
  end
  object qryEstado: TQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT CODESTADO, NOMEESTADO, '
      'CODESTADO||'#39' - '#39'||NOMEESTADO AS DESCRICAO'
      'FROM ESTADO'
      'WHERE IDPAIS = 1'
      'ORDER BY CODESTADO')
    Left = 328
    Top = 198
  end
  object dsEstado: TDataSource
    DataSet = qryEstado
    Left = 392
    Top = 217
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 132
    Top = 138
  end
end
