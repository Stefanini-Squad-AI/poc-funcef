inherited FrmCadTipoAvali: TFrmCadTipoAvali
  Left = 146
  Top = 81
  Caption = 'Cadastro de Tipo de Avaliação'
  ClientHeight = 367
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 281
    inherited pnlMestre: TPanel
      Width = 498
      Height = 68
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 104
        Height = 13
        Caption = 'Tipo de Avaliação'
        FocusControl = edDescTipo
      end
      object edDescTipo: TDBEdit
        Left = 16
        Top = 24
        Width = 465
        Height = 21
        DataField = 'DESCTIPOAVALIACAO'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 73
      Width = 498
      Height = 203
      Tabs.Strings = (
        'Critérios de Avaliação')
      inherited pgctrlDetalhe: TPageControl
        Width = 405
        Height = 144
        inherited tbsDet: TTabSheet
          Caption = 'Critérios de Avaliação'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 397
            Height = 116
            Selected.Strings = (
              'DESCCRITAVALIACAO'#9'45'#9'Critério'
              'PESO'#9'10'#9'Peso')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 397
            Height = 116
            object Label2: TLabel
              Left = 8
              Top = 16
              Width = 104
              Height = 13
              Caption = 'Tipo de Avaliação'
              FocusControl = edDescCrit
            end
            object Label3: TLabel
              Left = 8
              Top = 64
              Width = 91
              Height = 13
              Caption = 'Peso do Critério'
              FocusControl = edDescCrit
            end
            object edDescCrit: TDBEdit
              Left = 8
              Top = 32
              Width = 381
              Height = 21
              DataField = 'DESCCRITAVALIACAO'
              DataSource = dsDet
              TabOrder = 0
            end
            object edPeso: TDBRealEdit
              Left = 8
              Top = 80
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              MaxLength = 3
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'PESO'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 490
      end
      inherited Dock974: TDock97
        Left = 409
        Height = 144
        inherited tb97Detalhe: TToolbar97
          Caption = 'Critérios de Avaliação'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 508
  end
  inherited Dock971: TDock97
    Top = 328
    Width = 508
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '            IDTIPOAVALIACAO,'
      '            DESCTIPOAVALIACAO'
      'FROM'
      '           TIPOAVALIACAO'
      'WHERE'
      '          (IDTIPOAVALIACAO = :pIDTIPOAVALI)')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDTIPOAVALI'
        ParamType = ptUnknown
      end>
    object qryIDTIPOAVALIACAO: TFloatField
      FieldName = 'IDTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.IDTIPOAVALIACAO'
    end
    object qryDESCTIPOAVALIACAO: TStringField
      FieldName = 'DESCTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.DESCTIPOAVALIACAO'
      Size = 50
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 402
    Top = 15
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65531
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAVALIACAO'
      'set'
      '  IDTIPOAVALIACAO = :IDTIPOAVALIACAO,'
      '  DESCTIPOAVALIACAO = :DESCTIPOAVALIACAO'
      'where'
      '  IDTIPOAVALIACAO = :OLD_IDTIPOAVALIACAO')
    InsertSQL.Strings = (
      'insert into TIPOAVALIACAO'
      '  (IDTIPOAVALIACAO, DESCTIPOAVALIACAO)'
      'values'
      '  (:IDTIPOAVALIACAO, :DESCTIPOAVALIACAO)')
    DeleteSQL.Strings = (
      'delete from TIPOAVALIACAO'
      'where'
      '  IDTIPOAVALIACAO = :OLD_IDTIPOAVALIACAO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAVALIACAO.DESCTIPOAVALIACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Avaliação')
    Tabelas.Strings = (
      'TIPOAVALIACAO')
    CamposChave.Strings = (
      'TIPOAVALIACAO.IDTIPOAVALIACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Top = 13
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '          IDCRITAVALIACAO,'
      '          IDTIPOAVALIACAO,'
      '          DESCCRITAVALIACAO,'
      '          PESO'
      'FROM'
      '         CRITAVALIACAO'
      'WHERE'
      '         (IDTIPOAVALIACAO = :pIDTIPOAVALI)'
      'ORDER BY DESCCRITAVALIACAO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 440
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDTIPOAVALI'
        ParamType = ptUnknown
      end>
    object qryDetDESCCRITAVALIACAO: TStringField
      DisplayLabel = 'Critério'
      DisplayWidth = 45
      FieldName = 'DESCCRITAVALIACAO'
      Origin = 'CRITAVALIACAO.DESCCRITAVALIACAO'
      Size = 50
    end
    object qryDetPESO: TFloatField
      DisplayLabel = 'Peso'
      DisplayWidth = 10
      FieldName = 'PESO'
      Origin = 'CRITAVALIACAO.PESO'
    end
    object qryDetIDCRITAVALIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCRITAVALIACAO'
      Origin = 'CRITAVALIACAO.IDCRITAVALIACAO'
      Visible = False
    end
    object qryDetIDTIPOAVALIACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOAVALIACAO'
      Origin = 'CRITAVALIACAO.IDTIPOAVALIACAO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CRITAVALIACAO'
      'set'
      '  IDCRITAVALIACAO = :IDCRITAVALIACAO,'
      '  IDTIPOAVALIACAO = :IDTIPOAVALIACAO,'
      '  DESCCRITAVALIACAO = :DESCCRITAVALIACAO,'
      '  PESO = :PESO'
      'where'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    InsertSQL.Strings = (
      'insert into CRITAVALIACAO'
      '  (IDCRITAVALIACAO, IDTIPOAVALIACAO, DESCCRITAVALIACAO, PESO)'
      'values'
      
        '  (:IDCRITAVALIACAO, :IDTIPOAVALIACAO, :DESCCRITAVALIACAO, :PESO' +
        ')')
    DeleteSQL.Strings = (
      'delete from CRITAVALIACAO'
      'where'
      '  IDCRITAVALIACAO = :OLD_IDCRITAVALIACAO')
    Left = 488
    Top = 17
  end
end
