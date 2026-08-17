inherited frmCadTipObjeto: TfrmCadTipObjeto
  Left = 210
  Top = 152
  HelpContext = 1100008
  Caption = 'Tipos de Objeto Reclamado em Processos'
  ClientHeight = 319
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 233
    BorderWidth = 2
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 500
      Height = 225
      object Label1: TLabel
        Left = 69
        Top = 17
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 69
        Top = 123
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescricao
      end
      object Label3: TLabel
        Left = 69
        Top = 164
        Width = 100
        Height = 13
        Caption = 'Grupo de Objetos'
      end
      object DBEdit1: TDBEdit
        Left = 69
        Top = 32
        Width = 49
        Height = 21
        DataField = 'CODTIPOOBJETO'
        DataSource = ds
        TabOrder = 0
      end
      object dbrgRubrica: TDBRadioGroup
        Left = 144
        Top = 20
        Width = 287
        Height = 34
        Caption = 'Objeto Relacionado a uma Rubrica de Folha?'
        Columns = 2
        DataField = 'FLGPROVDESC'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
        OnChange = dbrgRubricaChange
      end
      object gbxRubrica: TGroupBox
        Left = 69
        Top = 65
        Width = 360
        Height = 49
        Caption = 'Rubrica Relacionada'
        TabOrder = 2
        object dblcRubrica: TwwDBLookupCombo
          Left = 7
          Top = 19
          Width = 345
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'80'#9'DESCRICAO')
          DataField = 'IDPROVENTO'
          DataSource = ds
          LookupTable = qryRubrica
          LookupField = 'IDPROVENTO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcRubricaChange
        end
      end
      object dbedDescricao: TDBEdit
        Left = 69
        Top = 138
        Width = 360
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 3
      end
      object dblcGrpObjeto: TwwDBLookupCombo
        Left = 69
        Top = 179
        Width = 360
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDGRUPOOBJETO'
        DataSource = ds
        LookupTable = qryGrpObjeto
        LookupField = 'IDGRUPOOBJETO'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 500
      Height = 225
      Selected.Strings = (
        'CODTIPOOBJETO'#9'10'#9'Código'
        'DESCRICAO'#9'100'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 508
  end
  inherited Dock971: TDock97
    Top = 280
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 339
      DockPos = 391
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 172
      DockPos = 224
    end
  end
  inherited qry: TwwQuery
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT'
      '  CODTIPOOBJETO, DESCRICAO, CLASSEOBJ,'
      '  IDGRUPOOBJETO, IDPROVENTO, FLGPROVDESC'
      'FROM'
      '  TIPOOBJPROCTRAB'
      'ORDER BY'
      '  CODTIPOOBJETO')
    Left = 271
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 41
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOBJPROCTRAB'
      'set'
      '  CODTIPOOBJETO = :CODTIPOOBJETO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CLASSEOBJ = :CLASSEOBJ,'
      '  IDGRUPOOBJETO = :IDGRUPOOBJETO,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  FLGPROVDESC = :FLGPROVDESC'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    InsertSQL.Strings = (
      'insert into TIPOOBJPROCTRAB'
      '  (CODTIPOOBJETO, DESCRICAO, CLASSEOBJ, IDGRUPOOBJETO, '
      'IDPROVENTO, FLGPROVDESC)'
      'values'
      '  (:CODTIPOOBJETO, :DESCRICAO, :CLASSEOBJ, :IDGRUPOOBJETO, '
      ':IDPROVENTO, '
      '   :FLGPROVDESC)')
    DeleteSQL.Strings = (
      'delete from TIPOOBJPROCTRAB'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    Left = 243
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
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Left = 459
    Top = 28
  end
  inherited ds: TwwDataSource
    Left = 299
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 459
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 459
    Top = 1
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, DESCRICAO'
      'From  PROVDESC'
      'Order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 459
    Top = 115
  end
  object qryGrpObjeto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDGRUPOOBJETO, DESCRICAO'
      'From  GRPOBJPROCJUR'
      'Order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 460
    Top = 166
  end
end
