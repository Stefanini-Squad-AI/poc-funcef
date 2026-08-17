inherited frmCadPlanPrevXContabil: TfrmCadPlanPrevXContabil
  Left = 144
  Top = 113
  HelpContext = 150078
  Caption = 'Plano Previdenciário X Entidade Contábil'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited dbGrd: TwwDBGrid [0]
      Selected.Strings = (
        'PLANO_PREV'#9'36'#9'Plano Previdenciáro'
        'ENTIDADE_CONTABIL'#9'36'#9'Entidade Contábil'#9'F')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
    end
    inherited pnlControles: TPanel [1]
      object Label2: TLabel
        Left = 64
        Top = 50
        Width = 107
        Height = 13
        Caption = 'Plano Previdencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 64
        Top = 114
        Width = 101
        Height = 13
        Caption = 'Entidade Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBcboPlanoPrev: TwwDBLookupCombo
        Left = 64
        Top = 64
        Width = 425
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookPlanPrev
        LookupField = 'IDPLANOPREV'
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBcboPlanoPrevCloseUp
      end
      object DBcboEntidadeContabil: TwwDBLookupCombo
        Left = 64
        Top = 128
        Width = 425
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        DataField = 'IDPLANPREVC'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookPlanPrevContab
        LookupField = 'IDPLANOPREV'
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = DBcboEntidadeContabilCloseUp
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Width = 13
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
  end
  inherited ds: TwwDataSource
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREVXCONTABIL'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDPLANPREVC = :IDPLANPREVC'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANPREVC = :OLD_IDPLANPREVC')
    InsertSQL.Strings = (
      'insert into PLANPREVXCONTABIL'
      '  (IDPLANOPREV, IDPLANPREVC)'
      'values'
      '  (:IDPLANOPREV, :IDPLANPREVC)')
    DeleteSQL.Strings = (
      'delete from PLANPREVXCONTABIL'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPLANPREVC = :OLD_IDPLANPREVC')
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 976
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 977
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 504
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   PXP.IDPLANOPREV, PXP.IDPLANPREVC,'
      ''
      '   PP.NOME AS PLANO_PREV, EC.NOME AS ENTIDADE_CONTABIL'
      ''
      'FROM'
      '   PLANPREVXCONTABIL PXP, PLANPREV PP, PLANPREVCONTABIL EC'
      ''
      'WHERE'
      '       ( PXP.IDPLANOPREV = PP.IDPLANOPREV )'
      '   AND ( PXP.IDPLANPREVC = EC.IDPLANOPREV )'
      ''
      'ORDER BY'
      '   PP.NOME')
    Top = 0
    object qryPLANO_PREV: TStringField
      DisplayLabel = 'Plano Previdenciáro'
      DisplayWidth = 36
      FieldName = 'PLANO_PREV'
      Origin = 'BASEDADOS."CM.PLANPREV".NOME'
      Size = 50
    end
    object qryENTIDADE_CONTABIL: TStringField
      DisplayLabel = 'Entidade Contábil'
      DisplayWidth = 36
      FieldName = 'ENTIDADE_CONTABIL'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANOPREV'
      Visible = False
    end
    object qryIDPLANPREVC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVC'
      Origin = 'BASEDADOS.PLANPREVXCONTABIL.IDPLANPREVC'
      Visible = False
    end
  end
end
