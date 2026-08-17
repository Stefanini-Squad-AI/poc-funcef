inherited frmCadCamposVincValores: TfrmCadCamposVincValores
  Left = 192
  Top = 107
  Width = 391
  Height = 417
  Caption = 'Valores dos Campos'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 5
    Top = 55
    Width = 103
    Height = 13
    Caption = 'Campo do arquivo'
  end
  object Label2: TLabel [1]
    Left = 5
    Top = 100
    Width = 125
    Height = 13
    Caption = 'Grupo de informações'
  end
  object Label3: TLabel [2]
    Left = 5
    Top = 145
    Width = 242
    Height = 13
    Caption = 'Informação à qual o campo esta vinculado'
  end
  inherited pnlFundo: TPanel
    Top = 189
    Width = 383
    Height = 162
    Align = alBottom
    inherited pnlControles: TPanel
      Width = 373
      Height = 152
      object Label4: TLabel
        Left = 5
        Top = 15
        Width = 153
        Height = 13
        Caption = 'Valor do campo no arquivo'
      end
      object Label5: TLabel
        Left = 5
        Top = 70
        Width = 176
        Height = 13
        Caption = 'Valor a ser atribuído ao campo'
      end
      object DBLkpCmbBxValorSistema: TDBLookupComboBox
        Left = 5
        Top = 90
        Width = 356
        Height = 21
        DataField = 'VL_ATRIBUIDO'
        DataSource = ds
        ListSource = dsLookupAssoc
        TabOrder = 2
      end
      object DBEdtValorSistema: TDBEdit
        Left = 5
        Top = 90
        Width = 356
        Height = 21
        DataField = 'VL_ATRIBUIDO'
        DataSource = ds
        TabOrder = 1
      end
      object DBEdtValorArquivo: TDBEdit
        Left = 5
        Top = 35
        Width = 356
        Height = 21
        DataField = 'VL_ARQUIVO'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 373
      Height = 152
      Selected.Strings = (
        'VL_ARQUIVO'#9'15'#9'Valor do campo no arquivo'
        'NO_CAMPO'#9'15'#9'Valor a ser atribuído ao campo')
    end
  end
  inherited Dock972: TDock97
    Width = 383
  end
  inherited Dock971: TDock97
    Top = 351
    Width = 383
    inherited tb97Fundo: TToolbar97
      Left = 10
      DockPos = 10
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 180
      DockPos = 180
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  object DBEdit1: TDBEdit [6]
    Left = 5
    Top = 70
    Width = 371
    Height = 21
    DataField = 'NO_CAMPO_ARQUIVO'
    DataSource = frmCadLayoutArquivo.dsDet
    TabOrder = 3
  end
  object DBEdit2: TDBEdit [7]
    Left = 5
    Top = 115
    Width = 371
    Height = 21
    DataField = 'NO_GRUPO'
    DataSource = frmCadLayoutArquivo.dsDetalheVinc
    TabOrder = 4
  end
  object DBEdit3: TDBEdit [8]
    Left = 5
    Top = 160
    Width = 371
    Height = 21
    DataField = 'DS_ATRIBUTO_TABELA'
    DataSource = frmCadLayoutArquivo.dsDetalheVinc
    TabOrder = 5
  end
  inherited ds: TwwDataSource
    DataSet = qryPrincipal
    Left = 153
    Top = 48
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 263
    Top = 36
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 294
    Top = 34
  end
  object qryPrincipal: TwwQuery
    CachedUpdates = True
    BeforePost = qryPrincipalBeforePost
    AfterPost = qryPrincipalAfterPost
    AfterDelete = qryPrincipalAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'NO_TABELA, NO_ATRIBUTO_TABELA, CD_ARQUIVO, SQ_CAMPO,'
      'SQ_VALOR, VL_ARQUIVO, VL_ATRIBUIDO, VL_ATRIBUIDO NO_CAMPO '
      'FROM FI_LAYOUT_ARQUIVO_TABELA_VALOR'
      '')
    UpdateObject = UpdtSQLPrincipal
    ValidateWithMask = True
    Left = 125
    Top = 46
  end
  object UpdtSQLPrincipal: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_LAYOUT_ARQUIVO_TABELA_VALOR'
      'set'
      '  VL_ARQUIVO = :VL_ARQUIVO,'
      '  VL_ATRIBUIDO = :VL_ATRIBUIDO'
      'where'
      '  RTRIM(NO_TABELA) = :OLD_NO_TABELA and'
      '  RTRIM(NO_ATRIBUTO_TABELA) = :OLD_NO_ATRIBUTO_TABELA and'
      '  CD_ARQUIVO = :OLD_CD_ARQUIVO and'
      '  SQ_CAMPO = :OLD_SQ_CAMPO and'
      '  SQ_VALOR = :OLD_SQ_VALOR')
    InsertSQL.Strings = (
      'insert into FI_LAYOUT_ARQUIVO_TABELA_VALOR'
      
        '  (NO_TABELA, NO_ATRIBUTO_TABELA, CD_ARQUIVO, SQ_CAMPO, SQ_VALOR' +
        ', '
      'VL_ARQUIVO, '
      '   VL_ATRIBUIDO)'
      'values'
      '  (:NO_TABELA, :NO_ATRIBUTO_TABELA, :CD_ARQUIVO, :SQ_CAMPO, '
      ':SQ_VALOR, '
      '   :VL_ARQUIVO, :VL_ATRIBUIDO)')
    DeleteSQL.Strings = (
      'delete from FI_LAYOUT_ARQUIVO_TABELA_VALOR'
      'where'
      '  RTRIM(NO_TABELA) = :OLD_NO_TABELA and'
      '  RTRIM(NO_ATRIBUTO_TABELA) = :OLD_NO_ATRIBUTO_TABELA and'
      '  CD_ARQUIVO = :OLD_CD_ARQUIVO and'
      '  SQ_CAMPO = :OLD_SQ_CAMPO and'
      '  SQ_VALOR = :OLD_SQ_VALOR')
    Left = 182
    Top = 48
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 230
    Top = 50
  end
  object qryVerificaValor: TQuery
    DatabaseName = 'DtBsSat'
    Left = 287
    Top = 102
  end
  object qryCampoLookup: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = frmCadLayoutArquivo.dsDetalheVinc
    SQL.Strings = (
      'SELECT A.NO_TABELA_LOOKUP   NO_TABELA,'
      '       B.NO_ATRIBUTO_TABELA NO_CHAVE,'
      '       A.NO_ATRIBUTO_TABELA_LOOKUP NO_CAMPO,'
      '       C.TP_ATRIBUTO TIPO_CAMPO'
      '  FROM FI_ATRIBUTO_TABELA A,'
      '       FI_PK_TABELA B,'
      '       FI_ATRIBUTO_TABELA C'
      ' WHERE A.NO_TABELA_LOOKUP = B.NO_TABELA'
      '   AND A.NO_TABELA_LOOKUP = C.NO_TABELA'
      '   AND B.NO_ATRIBUTO_TABELA = C.NO_ATRIBUTO_TABELA'
      '   AND RTRIM(A.NO_TABELA) = :NO_TABELA'
      '   AND RTRIM(A.NO_ATRIBUTO_TABELA) = :NO_ATRIBUTO_TABELA')
    ValidateWithMask = True
    Left = 10
    Top = 115
    ParamData = <
      item
        DataType = ftString
        Name = 'NO_TABELA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NO_ATRIBUTO_TABELA'
        ParamType = ptUnknown
      end>
  end
  object dsCampoLookup: TwwDataSource
    DataSet = qryCampoLookup
    Left = 30
    Top = 115
  end
  object qryLookupAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 75
    Top = 115
  end
  object dsLookupAssoc: TwwDataSource
    DataSet = qryLookupAssoc
    Left = 100
    Top = 115
  end
end
