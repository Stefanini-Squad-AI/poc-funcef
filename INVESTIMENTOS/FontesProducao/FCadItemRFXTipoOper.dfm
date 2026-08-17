inherited frmCadItemRFXTipoOper: TfrmCadItemRFXTipoOper
  Left = 297
  Top = 105
  ClientHeight = 399
  ClientWidth = 434
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 434
    Height = 313
    inherited Bevel1: TBevel
      Width = 432
    end
    inherited pnlMestre: TPanel
      Width = 432
      object Label1: TLabel
        Left = 17
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object dblTipoOper: TwwDBLookupCombo
        Left = 17
        Top = 24
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'40'#9'Operação'#9'F')
        LookupTable = qryTipoOper
        LookupField = 'IDTIPOOPERACAO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoOperCloseUp
        OnExit = dblTipoOperExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 432
      Height = 195
      Tabs.Strings = (
        'Items de Renda Fixa')
      inherited pgctrlDetalhe: TPageControl
        Width = 334
        Height = 136
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 326
            Height = 108
            Selected.Strings = (
              'Item'#9'45'#9'Item'#9'F')
            TitleAlignment = taLeftJustify
          end
          inherited pnlControlesDet: TPanel
            Width = 326
            Height = 108
            object Label2: TLabel
              Left = 33
              Top = 24
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object dblItem: TwwDBLookupCombo
              Left = 32
              Top = 40
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCITEMRENFIX'#9'40'#9'Item'#9'F')
              DataField = 'IDITEMRENFIX'
              DataSource = dsDet
              LookupTable = qryItems
              LookupField = 'IDITEMRENFIX'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 424
      end
      inherited Dock974: TDock97
        Left = 338
        Height = 136
      end
    end
    inherited pnlTitulo: TPanel
      Width = 432
      inherited lbNomItem: TfcLabel
        Width = 349
        Caption = 'Items de Renda Fixa por Operação'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 434
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 360
    Width = 434
    inherited TB97oKCancelar: TToolbar97
      Visible = False
    end
  end
  inherited dsDet: TwwDataSource
    Left = 245
    Top = 193
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Operação')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'ITEMRENFIXXTIPOOPERACAO'
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'ITEMRENFIXXTIPOOPERACAO.IDTIPOOPERACAO')
    Filtro.Strings = (
      
        'ITEMRENFIXXTIPOOPERACAO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPER' +
        'ACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    UsaDistinct = True
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'Select * from dual')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 96
    Top = 193
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT IDITEMRENFIX, IDTIPOOPERACAO'
      'FROM ITEMRENFIXXTIPOOPERACAO'
      'WHERE IDTIPOOPERACAO = :IDTIPOOPERACAO'
      'ORDER BY IDITEMRENFIX'
      ''
      ' '
      ' ')
    Left = 189
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object qryDetalheItem: TStringField
      DisplayWidth = 45
      FieldKind = fkLookup
      FieldName = 'Item'
      LookupDataSet = qryLKItem
      LookupKeyFields = 'IDITEMRENFIX'
      LookupResultField = 'DESCITEMRENFIX'
      KeyFields = 'IDITEMRENFIX'
      Size = 40
      Lookup = True
    end
    object qryDetalheIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIXXTIPOOPERACAO.IDITEMRENFIX'
      Visible = False
    end
    object qryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.ITEMRENFIXXTIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMRENFIXXTIPOOPERACAO'
      'set'
      '  IDITEMRENFIX = :IDITEMRENFIX,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO'
      'where'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into ITEMRENFIXXTIPOOPERACAO'
      '  (IDITEMRENFIX, IDTIPOOPERACAO)'
      'values'
      '  (:IDITEMRENFIX, :IDTIPOOPERACAO)')
    DeleteSQL.Strings = (
      'delete from ITEMRENFIXXTIPOOPERACAO'
      'where'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 217
    Top = 193
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOOPERACAO, DESCTIPOOPERACAO'
      'FROM TIPOOPERACAO'
      'WHERE IDTIPOINVEST = 1'
      'ORDER BY DESCTIPOOPERACAO')
    ValidateWithMask = True
    Left = 370
    Top = 111
    object qryTipoOperDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
  end
  object qryItems: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IT.IDITEMRENFIX, IT.DESCITEMRENFIX'
      'FROM ITEMRENFIX IT'
      'WHERE IDITEMRENFIX NOT IN'
      '      (SELECT IDITEMRENFIX'
      '       FROM ITEMRENFIXXTIPOOPERACAO'
      
        '       WHERE (((:IDTIPOOPERACAO IS NOT NULL) AND (IDTIPOOPERACAO' +
        ' = :IDTIPOOPERACAO)) OR'
      '               (:IDTIPOOPERACAO IS NULL))   )'
      'ORDER BY IT.DESCITEMRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object qryItemsDESCITEMRENFIX: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 40
      FieldName = 'DESCITEMRENFIX'
      Size = 60
    end
    object qryItemsIDITEMRENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMRENFIX'
      Visible = False
    end
  end
  object qryLKItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM ITEMRENFIX'
      'ORDER BY DESCITEMRENFIX')
    ValidateWithMask = True
    Left = 290
    Top = 193
    object qryLKItemIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.IDITEMRENFIX'
    end
    object qryLKItemDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
  end
end
