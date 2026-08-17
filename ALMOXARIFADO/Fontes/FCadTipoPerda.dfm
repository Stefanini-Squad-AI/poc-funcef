inherited FrmCadTipoPerda: TFrmCadTipoPerda
  Left = 152
  Top = 170
  Caption = 'Cadastro de Tipo de Perda'
  ClientHeight = 212
  ClientWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 126
    object LbDesc: TLabel
      Left = 23
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object edDesc: TDBEdit
      Left = 23
      Top = 30
      Width = 434
      Height = 21
      DataField = 'DESCTIPOPERDA'
      DataSource = ds
      TabOrder = 0
    end
    object chkConsumo: TDBCheckBox
      Left = 23
      Top = 75
      Width = 259
      Height = 17
      Caption = 'Essa perda incide  para consumo'
      DataField = 'CONSUMO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
  end
  inherited Dock972: TDock97
    Width = 484
  end
  inherited Dock971: TDock97
    Top = 173
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 101
      DockPos = 101
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDTIPOPERDA,    '
      '     DESCTIPOPERDA,  '
      '     CONSUMO        '
      'FROM'
      '    TIPOPERDA'
      'WHERE'
      '    (IDTIPOPERDA = :pID) ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pID'
        ParamType = ptUnknown
      end>
    object qryIDTIPOPERDA: TFloatField
      FieldName = 'IDTIPOPERDA'
      Origin = 'TIPOPERDA.IDTIPOPERDA'
    end
    object qryDESCTIPOPERDA: TStringField
      FieldName = 'DESCTIPOPERDA'
      Origin = 'TIPOPERDA.DESCTIPOPERDA'
    end
    object qryCONSUMO: TStringField
      FieldName = 'CONSUMO'
      Origin = 'TIPOPERDA.CONSUMO'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 768
    Top = 9
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOPERDA'
      'set'
      '  IDTIPOPERDA = :IDTIPOPERDA,'
      '  DESCTIPOPERDA = :DESCTIPOPERDA,'
      '  CONSUMO = :CONSUMO'
      'where'
      '  IDTIPOPERDA = :OLD_IDTIPOPERDA')
    InsertSQL.Strings = (
      'insert into TIPOPERDA'
      '  (IDTIPOPERDA, DESCTIPOPERDA, CONSUMO)'
      'values'
      '  (:IDTIPOPERDA, :DESCTIPOPERDA, :CONSUMO)')
    DeleteSQL.Strings = (
      'delete from TIPOPERDA'
      'where'
      '  IDTIPOPERDA = :OLD_IDTIPOPERDA')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOPERDA.DESCTIPOPERDA'
      'TIPOPERDA.CONSUMO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Inside no Cosumo')
    Tabelas.Strings = (
      'TIPOPERDA')
    CamposChave.Strings = (
      'TIPOPERDA.IDTIPOPERDA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '1')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
