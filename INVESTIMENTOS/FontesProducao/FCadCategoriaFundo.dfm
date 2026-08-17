inherited frmCadCatogoriaFundo: TfrmCadCatogoriaFundo
  Left = 268
  Top = 109
  HelpContext = 790052
  ClientHeight = 246
  ClientWidth = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 349
    Height = 160
    inherited Bevel2: TBevel
      Width = 347
    end
    object Label1: TLabel [1]
      Left = 24
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel [2]
      Left = 24
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Nível'
    end
    object Label3: TLabel [3]
      Left = 106
      Top = 104
      Width = 20
      Height = 13
      Caption = 'Cor'
    end
    object Label4: TLabel [4]
      Left = 160
      Top = 104
      Width = 39
      Height = 13
      Caption = 'Moeda'
    end
    inherited pnlTitulo: TPanel
      Width = 347
      TabOrder = 4
      inherited lbNomItem: TfcLabel
        Width = 211
        Caption = 'Categoria de Fundos'
      end
    end
    object dbeNome: TwwDBEdit
      Left = 24
      Top = 72
      Width = 297
      Height = 21
      DataField = 'NOMECATEGFUNDO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbsNivel: TwwDBSpinEdit
      Left = 24
      Top = 120
      Width = 65
      Height = 21
      Increment = 1
      DataField = 'NIVELCATEGFUNDO'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dbcCorCategoria: TfcColorCombo
      Left = 106
      Top = 120
      Width = 36
      Height = 21
      ButtonStyle = cbsEllipsis
      Color = clWhite
      ColorDialog = dlgCorCategFundo
      ColorDialogOptions = [cdoPreventFullOpen, cdoAnyColor]
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.Options = [ccoShowSystemColors, ccoShowColorNone, ccoShowCustomColors, ccoShowStandardColors, ccoShowColorNames, ccoGroupSystemColors]
      DropDownCount = 8
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 2
    end
    object dblMoeda: TwwDBLookupCombo
      Left = 160
      Top = 120
      Width = 161
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Moeda'#9'F'
        'MOESIGLA'#9'10'#9'Sigla'#9'F')
      DataField = 'MOECODIGO'
      DataSource = ds
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock972: TDock97
    Width = 349
  end
  inherited Dock971: TDock97
    Top = 207
    Width = 349
    inherited tb97Fundo: TToolbar97
      Left = 177
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 8
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 187
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CATEGORIAFUNDO'
      'set'
      '  IDCATEGORIAFUNDO = :IDCATEGORIAFUNDO,'
      '  NOMECATEGFUNDO = :NOMECATEGFUNDO,'
      '  NIVELCATEGFUNDO = :NIVELCATEGFUNDO,'
      '  CORCATEGFUNDO = :CORCATEGFUNDO,'
      '  MOECODIGO = :MOECODIGO'
      'where'
      '  IDCATEGORIAFUNDO = :OLD_IDCATEGORIAFUNDO')
    InsertSQL.Strings = (
      'insert into CATEGORIAFUNDO'
      '  (IDCATEGORIAFUNDO, NOMECATEGFUNDO, NIVELCATEGFUNDO, '
      'CORCATEGFUNDO, MOECODIGO)'
      'values'
      '  (:IDCATEGORIAFUNDO, :NOMECATEGFUNDO, :NIVELCATEGFUNDO, '
      ':CORCATEGFUNDO, '
      '   :MOECODIGO)')
    DeleteSQL.Strings = (
      'delete from CATEGORIAFUNDO'
      'where'
      '  IDCATEGORIAFUNDO = :OLD_IDCATEGORIAFUNDO')
    Left = 171
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CATEGORIAFUNDO.NOMECATEGFUNDO'
      'CATEGORIAFUNDO.NIVELCATEGFUNDO')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Nível')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CATEGORIAFUNDO')
    CamposChave.Strings = (
      'CATEGORIAFUNDO.IDCATEGORIAFUNDO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '5')
    Left = 296
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 257
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Top = 6
  end
  inherited qry: TwwQuery
    RequestLive = True
    SQL.Strings = (
      
        'SELECT IDCATEGORIAFUNDO, NOMECATEGFUNDO, NIVELCATEGFUNDO, CORCAT' +
        'EGFUNDO, MOECODIGO '
      'FROM CATEGORIAFUNDO'
      'WHERE IDCATEGORIAFUNDO = :IDCATEGORIAFUNDO'
      'ORDER BY NOMECATEGFUNDO')
    Left = 154
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCATEGORIAFUNDO'
        ParamType = ptResult
        Value = '-1'
      end>
    object qryIDCATEGORIAFUNDO: TFloatField
      FieldName = 'IDCATEGORIAFUNDO'
      Origin = 'DES.CATEGORIAFUNDO.IDCATEGORIAFUNDO'
    end
    object qryNOMECATEGFUNDO: TStringField
      FieldName = 'NOMECATEGFUNDO'
      Origin = 'BASEDADOS.CATEGORIAFUNDO.NOMECATEGFUNDO'
      Size = 40
    end
    object qryNIVELCATEGFUNDO: TFloatField
      DisplayWidth = 20
      FieldName = 'NIVELCATEGFUNDO'
      Origin = 'DES.CATEGORIAFUNDO.NIVELCATEGFUNDO'
    end
    object qryCORCATEGFUNDO: TFloatField
      FieldName = 'CORCATEGFUNDO'
      Origin = 'DES.CATEGORIAFUNDO.CORCATEGFUNDO'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.CATEGORIAFUNDO.MOECODIGO'
    end
  end
  object dlgCorCategFundo: TColorDialog
    Ctl3D = True
    Left = 304
    Top = 7
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC, MOESIGLA'
      'FROM MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 264
    Top = 103
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'BASEDADOS.MOEDA.MOEDESC'
    end
    object qryMoedaMOESIGLA: TStringField
      DisplayLabel = 'Sigla'
      DisplayWidth = 10
      FieldName = 'MOESIGLA'
      Origin = 'BASEDADOS.MOEDA.MOESIGLA'
      Size = 10
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.MOEDA.MOECODIGO'
      Visible = False
    end
  end
end
