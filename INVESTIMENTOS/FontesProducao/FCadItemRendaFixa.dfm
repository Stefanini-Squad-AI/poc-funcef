inherited frmCadItemRendaFixa: TfrmCadItemRendaFixa
  Left = 238
  Top = 148
  ClientHeight = 302
  ClientWidth = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 364
    Height = 216
    inherited Bevel2: TBevel
      Width = 362
    end
    object Label1: TLabel [1]
      Left = 24
      Top = 109
      Width = 104
      Height = 13
      Caption = 'Descrição do Item'
    end
    object Label2: TLabel [2]
      Left = 24
      Top = 61
      Width = 86
      Height = 13
      Caption = 'Código do Item'
    end
    object Label3: TLabel [3]
      Left = 24
      Top = 155
      Width = 72
      Height = 13
      Caption = 'Tipo de Item'
    end
    inherited pnlTitulo: TPanel
      Width = 362
      TabOrder = 2
      inherited lbNomItem: TfcLabel
        Width = 199
        Caption = 'Itens de Renda Fixa'
      end
    end
    object dbeDescItemRenFix: TwwDBEdit
      Left = 24
      Top = 125
      Width = 321
      Height = 21
      DataField = 'DESCITEMRENFIX'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeCodigoItem: TwwDBEdit
      Left = 24
      Top = 77
      Width = 129
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODITEMRENFIX'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbTipoItem: TwwDBComboBox
      Left = 24
      Top = 171
      Width = 193
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      AutoDropDown = True
      DataField = 'TIPOITEM'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Ágio'#9'A'
        'Deságio'#9'D'
        'Imposto'#9'I'
        'Lucro'#9'L'
        'Moeda'#9'M'
        'Percentual'#9'R'
        'PU'#9'P'
        'Taxa'#9'T'
        'Valor'#9'V')
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
  end
  inherited Dock972: TDock97
    Width = 364
  end
  inherited Dock971: TDock97
    Top = 263
    Width = 364
    inherited tb97Fundo: TToolbar97
      Left = 192
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
    end
  end
  inherited ds: TwwDataSource
    Left = 267
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMRENFIX'
      'set'
      '  DESCITEMRENFIX = :DESCITEMRENFIX,'
      '  CODITEMRENFIX = :CODITEMRENFIX,'
      '  FLGREGRA = '#39'Y'#39','
      '  TIPOITEM = :TIPOITEM'
      'where'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX')
    InsertSQL.Strings = (
      'insert into ITEMRENFIX'
      
        '  (IDITEMRENFIX, DESCITEMRENFIX, CODITEMRENFIX, FLGREGRA,TIPOITE' +
        'M)'
      'values'
      '  (:IDITEMRENFIX, :DESCITEMRENFIX, :CODITEMRENFIX,'#39'Y'#39',:TIPOITEM)')
    DeleteSQL.Strings = (
      'delete from ITEMRENFIX'
      'where'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX')
    Left = 299
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ITEMRENFIX.CODITEMRENFIX'
      'ITEMRENFIX.DESCITEMRENFIX')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMRENFIX')
    CamposChave.Strings = (
      'ITEMRENFIX.IDITEMRENFIX')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '     IDITEMRENFIX,'
      '     DESCITEMRENFIX,'
      '     CODITEMRENFIX,'
      '     FLGREGRA,'
      '     TIPOITEM'
      'FROM '
      '     ITEMRENFIX'
      'WHERE'
      '    IDITEMRENFIX = :IDITEMRENFIX')
    Left = 234
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptUnknown
      end>
    object qryIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.IDITEMRENFIX'
    end
    object qryDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
    object qryCODITEMRENFIX: TStringField
      FieldName = 'CODITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.CODITEMRENFIX'
      Size = 12
    end
    object qryFLGREGRA: TStringField
      FieldName = 'FLGREGRA'
      Origin = 'BASEDADOS.ITEMRENFIX.FLGREGRA'
      FixedChar = True
      Size = 1
    end
    object qryTIPOITEM: TStringField
      FieldName = 'TIPOITEM'
      Origin = 'BASEDADOS.ITEMRENFIX.TIPOITEM'
      FixedChar = True
      Size = 1
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 336
    Top = 55
  end
end
