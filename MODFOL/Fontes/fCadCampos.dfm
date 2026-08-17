inherited frmCadCampos: TfrmCadCampos
  Left = 176
  Top = 59
  Caption = 'Cadastro de Campos'
  ClientHeight = 369
  ClientWidth = 604
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 312
    Top = 24
    Width = 39
    Height = 13
    Caption = 'Label4'
  end
  inherited pnlFundo: TPanel
    Width = 604
    Height = 283
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 99
      Height = 13
      Caption = 'Código Resumido'
    end
    object Label2: TLabel
      Left = 112
      Top = 48
      Width = 43
      Height = 13
      Caption = 'Apelido'
    end
    object Label3: TLabel
      Left = 112
      Top = 8
      Width = 118
      Height = 13
      Caption = 'Descrição do Campo'
    end
    object lblLocal: TLabel
      Left = 112
      Top = 132
      Width = 102
      Height = 13
      Caption = 'Arquivo de Dados'
    end
    object Label10: TLabel
      Left = 112
      Top = 171
      Width = 216
      Height = 13
      Caption = 'Nome do Campo no Arquivo de Dados'
    end
    object Label8: TLabel
      Left = 112
      Top = 90
      Width = 93
      Height = 13
      Caption = 'Grupo de Dados'
    end
    object dedIdCampo: TwwDBEdit
      Left = 8
      Top = 24
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IDCAMPO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dedDescricao: TwwDBEdit
      Left = 112
      Top = 24
      Width = 481
      Height = 21
      DataField = 'DESCRICAODOCAMPO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dedApelido: TwwDBEdit
      Left = 112
      Top = 64
      Width = 233
      Height = 21
      CharCase = ecUpperCase
      DataField = 'APELIDO'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrdTipoDado: TDBRadioGroup
      Left = 422
      Top = 207
      Width = 169
      Height = 66
      Caption = 'Tipo de Dado'
      DataField = 'IDTIPODADO'
      DataSource = ds
      Items.Strings = (
        'Numérico'
        'Caracter'
        'Data')
      TabOrder = 9
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object dblkpcmbArq: TwwDBLookupCombo
      Left = 112
      Top = 144
      Width = 481
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TABLENAME'#9'100'#9'Entidade')
      DataField = 'ENTIDADE'
      DataSource = ds
      LookupTable = qryTabelas
      LookupField = 'TABLENAME'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnExit = dblkpcmbArqExit
    end
    object dblkpcmbCampo: TwwDBLookupCombo
      Left = 112
      Top = 183
      Width = 481
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      CharCase = ecUpperCase
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'FIELDNAME'#9'100'#9'Nome do Campo')
      DataField = 'NOMEDOCAMPO'
      DataSource = ds
      LookupTable = QryCampoEnt
      LookupField = 'FIELDNAME'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkpGrupo: TwwDBLookupCombo
      Left = 112
      Top = 103
      Width = 481
      Height = 21
      TabStop = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Grupo de Arquivo')
      LookupTable = qryGrupos
      LookupField = 'CODGRUPOARQUIVO'
      Options = [loTitles]
      Enabled = False
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object chkObrig: TCheckBox
      Left = 110
      Top = 217
      Width = 115
      Height = 16
      Caption = 'Obrigatório'
      TabOrder = 6
      OnClick = chkObrigClick
    end
    object chkChave: TCheckBox
      Left = 110
      Top = 251
      Width = 115
      Height = 16
      Caption = 'Chave '
      TabOrder = 8
      OnClick = chkChaveClick
    end
    object chkvirtual: TCheckBox
      Left = 110
      Top = 234
      Width = 115
      Height = 16
      Caption = 'Virtual'
      TabOrder = 7
      OnClick = chkvirtualClick
    end
    object wwDBEdit4: TwwDBEdit
      Left = 8
      Top = 48
      Width = 97
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IDCAMPO'
      DataSource = dsDet
      TabOrder = 10
      UnboundDataType = wwDefault
      Visible = False
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 604
  end
  inherited Dock971: TDock97
    Top = 330
    Width = 604
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '      IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, APELIDO,'
      '      CAMPODOBANCO, CHAVE, FLGOBRIGATORIO, IDTIPODADO'
      'FROM'
      '   CMPBD'
      'WHERE'
      '   (CAMPODOBANCO > 0) AND (IDCAMPO = :ID)')
    ParamData = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CMPBD'
      'set'
      '  IDCAMPO = :IDCAMPO,'
      '  ENTIDADE = :ENTIDADE,'
      '  NOMEDOCAMPO = :NOMEDOCAMPO,'
      '  DESCRICAODOCAMPO = :DESCRICAODOCAMPO,'
      '  APELIDO = :APELIDO,'
      '  CAMPODOBANCO = :CAMPODOBANCO,'
      '  CHAVE = :CHAVE,'
      '  FLGOBRIGATORIO = :FLGOBRIGATORIO,'
      '  IDTIPODADO = :IDTIPODADO'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into CMPBD'
      
        '  (IDCAMPO, ENTIDADE, NOMEDOCAMPO, DESCRICAODOCAMPO, APELIDO, CA' +
        'MPODOBANCO, '
      '   CHAVE, FLGOBRIGATORIO, IDTIPODADO)'
      'values'
      
        '  (:IDCAMPO, :ENTIDADE, :NOMEDOCAMPO, :DESCRICAODOCAMPO, :APELID' +
        'O, :CAMPODOBANCO, '
      '   :CHAVE, :FLGOBRIGATORIO, :IDTIPODADO)')
    DeleteSQL.Strings = (
      'delete from CMPBD'
      'where'
      '  IDCAMPO = :OLD_IDCAMPO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'GRPARQUIVO.DESCGRUPOARQUIVO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Campo'
      'Descrição do Campo'
      'Grupo de Arquivo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CMPBD'
      'CMPBDGRP'
      'GRPARQUIVO')
    CamposChave.Strings = (
      'CMPBD.IDCAMPO'
      'CMPBDGRP.CODGRUPOARQUIVO')
    Filtro.Strings = (
      'CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO'
      'CMPBDGRP.CODGRUPOARQUIVO = GRPARQUIVO.CODGRUPOARQUIVO'
      'CMPBD.CAMPODOBANCO > 0')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '40')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CMPBDGRP'
      'set'
      '  CODGRUPOARQUIVO = :CODGRUPOARQUIVO,'
      '  IDCAMPO = :IDCAMPO'
      'where'
      '  CODGRUPOARQUIVO = :OLD_CODGRUPOARQUIVO and'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into CMPBDGRP'
      '  (CODGRUPOARQUIVO, IDCAMPO)'
      'values'
      '  (:CODGRUPOARQUIVO, :IDCAMPO)')
    DeleteSQL.Strings = (
      'delete from CMPBDGRP'
      'where'
      '  CODGRUPOARQUIVO = :OLD_CODGRUPOARQUIVO and'
      '  IDCAMPO = :OLD_IDCAMPO')
    Left = 441
    Top = 8
  end
  object QryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOARQUIVO,IDCAMPO'
      'FROM'
      '    CMPBDGRP'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 471
    Top = 8
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = QryDet
    Left = 501
    Top = 8
  end
  object qryGrupos: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOARQUIVO,DESCGRUPOARQUIVO  AS DESCRICAO'
      'FROM GRPARQUIVO'
      'ORDER BY DESCGRUPOARQUIVO')
    ValidateWithMask = True
    Left = 553
    Top = 6
  end
  object qryTabelas: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      TABLENAME'
      'FROM'
      '    DDTABLE'
      'ORDER BY'
      '      TABLENAME')
    ValidateWithMask = True
    Left = 551
    Top = 46
  end
  object QryCampoEnt: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      #9'UPPER(F.FIELDNAME) AS FIELDNAME'
      'FROM'
      #9'DDTABLE T, DDFIELD F'
      'WHERE'
      #9'T.IDDDTABLE = F.IDDDTABLE AND'
      #9'T.TABLENAME = :ENTIDADE')
    ValidateWithMask = True
    Left = 552
    Top = 93
    ParamData = <
      item
        DataType = ftString
        Name = 'ENTIDADE'
        ParamType = ptUnknown
      end>
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 504
    Top = 95
  end
end
