inherited frmCadastroEventoRegularizacao: TfrmCadastroEventoRegularizacao
  Left = 368
  Top = 209
  BorderIcons = [biMinimize]
  Caption = 'Cadastro de Eventos para Regularização de Pagamentos'
  ClientHeight = 322
  ClientWidth = 762
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 762
    Height = 236
    inherited dbGrd: TwwDBGrid [0]
      Width = 760
      Height = 234
    end
    inherited pnlControles: TPanel [1]
      Width = 760
      Height = 234
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 84
        Height = 13
        Caption = 'Código Interno'
        FocusControl = dbeCodInterno
      end
      object Label2: TLabel
        Left = 152
        Top = 16
        Width = 120
        Height = 13
        Caption = 'Descrição do Evento'
        FocusControl = dbeDescricao
      end
      object Label4: TLabel
        Left = 16
        Top = 64
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label5: TLabel
        Left = 312
        Top = 64
        Width = 107
        Height = 13
        Caption = 'Código de Retorno'
        FocusControl = dbeCodRetorno
      end
      object Label6: TLabel
        Left = 17
        Top = 163
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
      end
      object Label7: TLabel
        Left = 16
        Top = 113
        Width = 149
        Height = 13
        Caption = 'Tipo de Documento Pagar'
      end
      object Label3: TLabel
        Left = 312
        Top = 113
        Width = 164
        Height = 13
        Caption = 'Tipo de Documento Receber'
      end
      object dbeCodInterno: TDBEdit
        Left = 16
        Top = 32
        Width = 113
        Height = 21
        TabStop = False
        Color = cl3DLight
        DataField = 'IDCADEVENTOSDEREGULARIZACAO'
        DataSource = ds
        Enabled = False
        TabOrder = 0
      end
      object dbeDescricao: TDBEdit
        Left = 152
        Top = 32
        Width = 473
        Height = 21
        DataField = 'DESCRICAOEVENTO'
        DataSource = ds
        TabOrder = 1
      end
      object dbeCodRetorno: TDBEdit
        Left = 312
        Top = 80
        Width = 113
        Height = 21
        DataField = 'CODIGORETORNO'
        DataSource = ds
        TabOrder = 4
        OnExit = dbeCodRetornoExit
        OnKeyPress = dbeCodRetornoKeyPress
        OnMouseDown = dbeCodRetornoMouseDown
      end
      object ChkDesativado: TDBCheckBox
        Left = 648
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Desativar'
        DataField = 'FLGDESATIVADO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = ChkDesativadoClick
      end
      object dblkCentroResp: TwwDBLookupCombo
        Left = 16
        Top = 80
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        DataField = 'CODCENTRORESPON'
        DataSource = ds
        LookupTable = qryCentroResp
        LookupField = 'CODCENTRORESPON'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object DblkCentroCusto: TwwDBLookupCombo
        Left = 17
        Top = 179
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = qryCentroCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkTipoDoc: TwwDBLookupCombo
        Left = 16
        Top = 129
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F')
        DataField = 'TIPODOCUMENTO'
        DataSource = ds
        LookupTable = qryTipoDoc
        LookupField = 'CODTIPDOC'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkTipoDocRec: TwwDBLookupCombo
        Left = 312
        Top = 129
        Width = 273
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição'#9'F')
        DataField = 'TIPODOCUMENTOREC'
        DataSource = ds
        LookupTable = qryTipoDocRec
        LookupField = 'CODTIPDOC'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 7
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 762
  end
  inherited Dock971: TDock97
    Top = 283
    Width = 762
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Caption = 'Sair'
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        TabOrder = 0
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Ok'
      end
      inherited bbtnCancelar: TBitBtn
        Caption = 'Cancelar'
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 344
    Top = 3
  end
  inherited ds: TwwDataSource
    Left = 467
    Top = 3
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CADASTROEVENTOSDEREGULARIZACAO'
      'set'
      '  DESCRICAOEVENTO = :DESCRICAOEVENTO,'
      '  FLGDESATIVADO = :FLGDESATIVADO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODIGORETORNO = :CODIGORETORNO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  TIPODOCUMENTO = :TIPODOCUMENTO,'
      '   TIPODOCUMENTOREC = :TIPODOCUMENTOREC'
      'where'
      '  IDCADEVENTOSDEREGULARIZACAO = '
      ':OLD_IDCADEVENTOSDEREGULARIZACAO')
    InsertSQL.Strings = (
      'insert into CADASTROEVENTOSDEREGULARIZACAO'
      '  (IDCADEVENTOSDEREGULARIZACAO,DESCRICAOEVENTO, FLGDESATIVADO, '
      'CODCENTRORESPON, '
      'CODIGORETORNO, CODCENTROCUSTO, '
      '   TIPODOCUMENTO, TIPODOCUMENTOREC)'
      'values'
      '  (cm.SEQCADEVENTOSREGULARIZACAO.nextval, :DESCRICAOEVENTO, '
      ':FLGDESATIVADO, :CODCENTRORESPON, '
      ':CODIGORETORNO, '
      '   :CODCENTROCUSTO, :TIPODOCUMENTO, :TIPODOCUMENTOREC)')
    DeleteSQL.Strings = (
      'delete from CADASTROEVENTOSDEREGULARIZACAO'
      'where'
      '  IDCADEVENTOSDEREGULARIZACAO = '
      ':OLD_IDCADEVENTOSDEREGULARIZACAO')
    Left = 507
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Eventos de Regularização'
    Colunas.Strings = (
      'CODIGORETORNO'
      'DESCRICAOEVENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CADASTROEVENTOSDEREGULARIZACAO')
    CamposChave.Strings = (
      'IDCADEVENTOSDEREGULARIZACAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '100')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 592
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 385
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 544
    Top = 7
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from CADASTROEVENTOSDEREGULARIZACAO'
      
        'where (IDCADEVENTOSDEREGULARIZACAO = :IDCADEVENTO) or (:IDCADEVE' +
        'NTO = 0)  ')
    Left = 434
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCADEVENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCADEVENTO'
        ParamType = ptInput
      end>
    object qryIDCADEVENTOSDEREGULARIZACAO: TFloatField
      FieldName = 'IDCADEVENTOSDEREGULARIZACAO'
      Origin = 
        'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.IDCADEVENTOSDEREGULARIZ' +
        'ACAO'
    end
    object qryDESCRICAOEVENTO: TStringField
      FieldName = 'DESCRICAOEVENTO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.DESCRICAOEVENTO'
      Size = 100
    end
    object qryFLGDESATIVADO: TFloatField
      FieldName = 'FLGDESATIVADO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.FLGDESATIVADO'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.CODCENTRORESPON'
      Size = 10
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.CODCENTROCUSTO'
      Size = 10
    end
    object qryTIPODOCUMENTO: TFloatField
      FieldName = 'TIPODOCUMENTO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TIPODOCUMENTO'
    end
    object qryTIPODOCUMENTOREC: TFloatField
      FieldName = 'TIPODOCUMENTOREC'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TIPODOCUMENTOREC'
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTRGDTALTERACAO: TDateTimeField
      FieldName = 'TRGDTALTERACAO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TRGDTALTERACAO'
    end
    object qryTRGUSERALTERACAO: TStringField
      FieldName = 'TRGUSERALTERACAO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.TRGUSERALTERACAO'
      Size = 30
    end
    object qryCODIGORETORNO: TStringField
      FieldName = 'CODIGORETORNO'
      Origin = 'BASEDADOS.CADASTROEVENTOSDEREGULARIZACAO.CODIGORETORNO'
      FixedChar = True
      Size = 2
    end
  end
  object qryCentroResp: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODCENTRORESPON,'
      '   C.CODCENTRORESPON || C.NOME AS DESCRICAO'
      'FROM'
      
        '   CENTRESPON C INNER JOIN PESSOAXCRESP PC ON (C.CODCENTRORESPON' +
        ' = PC.CODCENTRORESPON)'
      'WHERE C.ATIVO = '#39'S'#39
      '  AND  (PC.IDPESSOAACESSO = :IDUSUARIO)'
      ''
      'UNION'
      ''
      
        'SELECT CC.CODCENTRORESPON, C.CODCENTRORESPON || C.NOME from CADA' +
        'STROEVENTOSDEREGULARIZACAO CC'
      
        'LEFT JOIN CENTRESPON C ON TRIM(C.CODCENTRORESPON) = TRIM(CC.CODC' +
        'ENTRORESPON)'
      
        'WHERE CC.IDCADEVENTOSDEREGULARIZACAO = :IDCADEVENTOSDEREGULARIZA' +
        'CAO'
      ''
      'ORDER BY 1'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 450
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'IDCADEVENTOSDEREGULARIZACAO'
        ParamType = ptInput
        Value = '0'
      end>
    object qryCentroRespDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CENTRESPON.CODCENTRORESPON'
      FixedChar = True
      Size = 40
    end
    object qryCentroRespCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.CENTRESPON.CODCENTRORESPON'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object DsCentroResp: TwwDataSource
    DataSet = qryCentroResp
    Left = 491
    Top = 109
  end
  object qryCentroCusto: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO,'
      '   C.CODCENTROCUSTO || C.NOME AS DESCRICAO'
      'FROM'
      '   CENTCUST C'
      'WHERE C.ATIVO = '#39'S'#39'   '
      
        'AND   C.CODCENTROCUSTO IN (SELECT CODCENTROCUSTO FROM USCCUSTO U' +
        'C WHERE (UC.IDUSUARIO = :IDUSUARIO))'
      ' '
      'UNION'
      ''
      
        'SELECT CC.CODCENTROCUSTO, C.CODCENTROCUSTO || C.NOME from CADAST' +
        'ROEVENTOSDEREGULARIZACAO CC'
      
        'LEFT JOIN CENTCUST C ON TRIM(C.CODCENTROCUSTO) = TRIM(CC.CODCENT' +
        'ROCUSTO)'
      
        'WHERE CC.IDCADEVENTOSDEREGULARIZACAO = :IDCADEVENTOSDEREGULARIZA' +
        'CAO'
      ''
      'ORDER BY 1'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 538
    Top = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'IDCADEVENTOSDEREGULARIZACAO'
        ParamType = ptInput
        Value = '0'
      end>
    object qryCentroCustoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      Size = 40
    end
    object qryCentroCustoCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.CENTCUST.CODCENTROCUSTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
  end
  object DsCentroCusto: TwwDataSource
    DataSet = qryCentroCusto
    Left = 579
    Top = 253
  end
  object qryTipoDoc: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.CODTIPDOC,'
      '    T.DESCRICAO '
      'FROM'
      '   TIPODOCRECPAG T '
      'WHERE T.RECPAG = '#39'P'#39' '
      'ORDER BY T.DESCRICAO')
    ValidateWithMask = True
    Left = 466
    Top = 237
    object qryTipoDocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryTipoDocCODTIPDOC: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object DsTipoDoc: TwwDataSource
    DataSet = qryTipoDoc
    Left = 507
    Top = 237
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 493
    Top = 62
  end
  object qryTipoDocRec: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.CODTIPDOC,'
      '    T.DESCRICAO '
      'FROM'
      '   TIPODOCRECPAG T '
      'WHERE T.RECPAG = '#39'R'#39' '
      'ORDER BY T.DESCRICAO')
    ValidateWithMask = True
    Left = 618
    Top = 237
    object StringField1: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
  object DsTipoDocRec: TwwDataSource
    DataSet = qryTipoDocRec
    Left = 699
    Top = 237
  end
end
