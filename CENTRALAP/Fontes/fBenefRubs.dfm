inherited frmBenefRub: TfrmBenefRub
  Left = 197
  Top = 183
  HelpContext = 190024
  Caption = ' Descrição de Beneficio Para Rubs'
  ClientWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 500
    object Label1: TLabel
      Left = 41
      Top = 125
      Width = 154
      Height = 13
      Caption = 'Descrição Benefício  Rubs'
    end
    object Label2: TLabel
      Left = 41
      Top = 71
      Width = 117
      Height = 13
      Caption = 'Descrição Benefício'
    end
    object DBEDTbeneficio: TwwDBEdit
      Left = 39
      Top = 88
      Width = 418
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Enabled = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBEDTbenefRub: TwwDBEdit
      Left = 39
      Top = 144
      Width = 418
      Height = 21
      DataField = 'DESCRUB'
      DataSource = ds
      TabOrder = 2
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object CheckBoxTemRegra: TCheckBox
      Left = 40
      Top = 40
      Width = 89
      Height = 17
      Caption = 'Tem Regra'
      TabOrder = 0
      OnClick = CheckBoxTemRegraClick
    end
  end
  inherited Dock972: TDock97
    Width = 500
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 500
    inherited tb97Fundo: TToolbar97
      Left = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 159
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 472
    Top = 102
  end
  inherited ds: TwwDataSource
    Left = 315
    Top = 62
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFICIO'
      'set'
      '  DESCRUB = :DESCRUB,'
      '  FLGRUBSREGRA = :FLGRUBSREGRA'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    InsertSQL.Strings = (
      'insert into BENEFICIO'
      '  (DESCRUB, FLGRUBSREGRA)'
      'values'
      '  (:DESCRUB, :FLGRUBSREGRA)')
    DeleteSQL.Strings = (
      'delete from BENEFICIO'
      'where'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 379
    Top = 70
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BENEFICIO.IDBENEFICIO'
      'BENEFICIO.NOME'
      'BENEFICIO.DESCRUB')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Núm. do Benefício'
      'Nome do Benefício'
      'Descrição do Benefício')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BENEFICIO')
    CamposChave.Strings = (
      'BENEFICIO.IDBENEFICIO'
      'BENEFICIO.NOME'
      'BENEFICIO.DESCRUB'
      'BENEFICIO.FLGRUBSREGRA')
    Filtro.Strings = (
      'BENEFICIO.DESCRUB IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    Left = 437
  end
  inherited ImlPadrao: TImageList
    Left = 185
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 340
    Top = 14
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDBENEFICIO,'
      '   NOME,'
      '   DESCRUB,'
      '   FLGRUBSREGRA'
      'FROM BENEFICIO'
      'WHERE IDBENEFICIO = :IDBENEFICIO  '
      ''
      '')
    Left = 258
    Top = 62
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end>
    object qryIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.IDBENEFICIO'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryDESCRUB: TStringField
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.BENEFICIO.DESCRUB'
      Size = 60
    end
    object qryFLGRUBSREGRA: TFloatField
      FieldName = 'FLGRUBSREGRA'
      Origin = 'BASEDADOS.BENEFICIO.FLGRUBSREGRA'
    end
  end
end
