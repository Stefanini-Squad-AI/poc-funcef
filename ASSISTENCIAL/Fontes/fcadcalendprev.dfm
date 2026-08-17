inherited frmCadCalendPrev: TfrmCadCalendPrev
  Left = 175
  Top = 191
  Caption = 'Calendário Assistencial'
  ClientHeight = 192
  ClientWidth = 406
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 406
    Height = 106
    object Label1: TLabel
      Left = 15
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 15
      Top = 44
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 15
      Top = 19
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'IDCALENDARIO'
      DataSource = ds
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 15
      Top = 59
      Width = 375
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 406
  end
  inherited Dock971: TDock97
    Top = 153
    Width = 406
    inherited tb97Fundo: TToolbar97
      Left = 191
      DockPos = 191
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      ' IDCALENDARIO, NOME'
      'FROM'
      ' CALENDPREV'
      'WHERE'
      ' (IDCALENDARIO = :pIdCalendario)')
    Left = 305
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdCalendario'
        ParamType = ptUnknown
      end>
    object qryIDCALENDARIO: TFloatField
      FieldName = 'IDCALENDARIO'
      Origin = '"CM.CALENDPREV".IDCALENDARIO'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = '"CM.CALENDPREV".NOME'
      Size = 60
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 14
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
      'update CALENDPREV'
      'set'
      '  IDCALENDARIO = :IDCALENDARIO,'
      '  NOME = :NOME'
      'where'
      '  IDCALENDARIO = :OLD_IDCALENDARIO')
    InsertSQL.Strings = (
      'insert into CALENDPREV'
      '  (IDCALENDARIO, NOME)'
      'values'
      '  (:IDCALENDARIO, :NOME)')
    DeleteSQL.Strings = (
      'delete from CALENDPREV'
      'where'
      '  IDCALENDARIO = :OLD_IDCALENDARIO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IDCALENDARIO'
      'NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'CALENDPREV')
    CamposChave.Strings = (
      'IDCALENDARIO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 378
  end
  inherited ds: TwwDataSource
    Left = 338
  end
  inherited ImlPadrao: TImageList
    Left = 73
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryConsCalendDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCALENDARIO'
      'FROM   PLANPREVPATRO'
      'WHERE  (IDCALENDARIO = :pIdCalendario)'
      ''
      'UNION'
      ''
      'SELECT IDCALENDARIO'
      'FROM   FUNDACAO'
      'WHERE  (IDCALENDARIO = :pIdCalendario)'
      '')
    ValidateWithMask = True
    Left = 314
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdCalendario'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdCalendario'
        ParamType = ptUnknown
      end>
    object qryConsCalendDatasIDCALENDARIO: TFloatField
      FieldName = 'IDCALENDARIO'
      Origin = '"CM.CALENDDATAS".IDCALENDARIO'
    end
  end
  object qryDelCalendDatas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE CALENDDATAS'
      'WHERE  (IDCALENDARIO = :pIdCalendario)'
      '')
    ValidateWithMask = True
    Left = 194
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdCalendario'
        ParamType = ptUnknown
      end>
  end
end
