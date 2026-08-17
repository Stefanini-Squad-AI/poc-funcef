inherited frmCadTipObjeto: TfrmCadTipObjeto
  Left = 297
  Top = 167
  HelpContext = 1110009
  Caption = 'Cadastro de Tipos de Objeto Reclamado em Processos'
  ClientHeight = 287
  ClientWidth = 460
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 201
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 452
      Height = 193
      object Label1: TLabel
        Left = 45
        Top = 15
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 45
        Top = 66
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 45
        Top = 129
        Width = 100
        Height = 13
        Caption = 'Grupo de Objetos'
      end
      object DBEdit1: TDBEdit
        Left = 45
        Top = 30
        Width = 49
        Height = 21
        DataField = 'CODTIPOOBJETO'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 45
        Top = 81
        Width = 360
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dblcGrpObjeto: TwwDBLookupCombo
        Left = 45
        Top = 144
        Width = 360
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDGRUPOOBJETO'
        DataSource = ds
        LookupTable = qryGrpObjeto
        LookupField = 'IDGRUPOOBJETO'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 452
      Height = 193
      Selected.Strings = (
        'CODTIPOOBJETO'#9'10'#9'Código'
        'DESCRICAO'#9'40'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 460
  end
  inherited Dock971: TDock97
    Top = 248
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 290
      DockPos = 390
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 223
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  CODTIPOOBJETO, DESCRICAO, CLASSEOBJ, IDGRUPOOBJETO'
      'FROM'
      '  TIPOOBJPROCTRAB'
      'ORDER BY'
      '  CODTIPOOBJETO')
    Left = 270
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 415
    Top = 13
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOBJPROCTRAB'
      'set'
      '  CODTIPOOBJETO = :CODTIPOOBJETO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CLASSEOBJ = :CLASSEOBJ,'
      '  IDGRUPOOBJETO = :IDGRUPOOBJETO'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    InsertSQL.Strings = (
      'insert into TIPOOBJPROCTRAB'
      '  (CODTIPOOBJETO, DESCRICAO, CLASSEOBJ, IDGRUPOOBJETO)'
      'values'
      '  (:CODTIPOOBJETO, :DESCRICAO, :CLASSEOBJ, :IDGRUPOOBJETO)')
    DeleteSQL.Strings = (
      'delete from TIPOOBJPROCTRAB'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipos de Objeto Reclamado em Processos'
    Colunas.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO'
      'TIPOOBJPROCTRAB.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOOBJPROCTRAB')
    CamposChave.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO')
    Filtro.Strings = (
      'CLASSEOBJ = '#39'1'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Left = 351
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 415
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 351
    Top = 1
  end
  object qryGrpObjeto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDGRUPOOBJETO, DESCRICAO'
      'From  GRPOBJPROCJUR'
      'Order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 392
    Top = 70
  end
end
