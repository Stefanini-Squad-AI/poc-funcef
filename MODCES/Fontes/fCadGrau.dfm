inherited frmCadGrau: TfrmCadGrau
  Left = 230
  Top = 120
  Caption = 'Graus Atribuídos ao Cargo'
  ClientHeight = 373
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 287
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 518
      Height = 73
      object Label6: TLabel
        Left = 9
        Top = 49
        Width = 77
        Height = 13
        Caption = 'Faixa Salarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 413
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Pontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 90
        Top = 6
        Width = 40
        Height = 13
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 160
        Top = 6
        Width = 35
        Height = 13
        Caption = 'Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedCodCargo: TDBEdit
        Left = 90
        Top = 21
        Width = 61
        Height = 21
        Color = clGray
        DataField = 'IDCARGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedTitulo: TDBEdit
        Left = 160
        Top = 21
        Width = 350
        Height = 21
        Color = clGray
        DataField = 'TITULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dblcFaixa: TwwDBLookupCombo
        Left = 90
        Top = 46
        Width = 61
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDFAIXASALARIAL'#9'10'#9'Código'#9'No'
          'STEP1'#9'10'#9'STEP 1'#9'No'
          'STEP2'#9'10'#9'STEP 2'#9'No'
          'STEP3'#9'10'#9'STEP 3'#9'No'
          'STEP4'#9'10'#9'STEP 4'#9'No'
          'STEP5'#9'10'#9'STEP 5'#9'No'
          'STEP6'#9'10'#9'STEP 6'#9'No'
          'STEP7'#9'10'#9'STEP 7'#9'No'
          'STEP8'#9'10'#9'STEP 8'#9'No'
          'STEP9'#9'10'#9'STEP 9'#9'No'
          'DATAEFETIV'#9'10'#9'Data Efetiv.'#9'No')
        DataField = 'IDFAIXASALARIAL'
        DataSource = ds
        LookupTable = qryFaixa
        LookupField = 'IDFAIXASALARIAL'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        Color = clGray
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
      end
      object dbedGrupo: TwwDBEdit
        Left = 160
        Top = 46
        Width = 238
        Height = 21
        Color = clGray
        DataField = 'DESCGRPFUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edPontos: TEdit
        Left = 455
        Top = 46
        Width = 55
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 77
      Width = 518
      Height = 206
      Tabs.Strings = (
        'Graus')
      inherited pgctrlDetalhe: TPageControl
        Width = 420
        Height = 147
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 412
            Height = 119
            Selected.Strings = (
              'DESCRFATORAVAL'#9'30'#9'Fator de Avaliação'
              'GRAU'#9'10'#9'Grau'
              'PESO'#9'10'#9'Peso'
              'NOTA'#9'10'#9'Nota')
            Font.Style = []
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 412
            Height = 119
            object Label3: TLabel
              Left = 14
              Top = 24
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label5: TLabel
              Left = 14
              Top = 81
              Width = 84
              Height = 13
              Caption = 'Grau Atribuído'
            end
            object dblckFator: TwwDBLookupCombo
              Left = 14
              Top = 39
              Width = 391
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = qryAval
              LookupField = 'IDFATORAVAL'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblckFatorChange
            end
            object wwDBEdit1: TwwDBEdit
              Left = 14
              Top = 96
              Width = 70
              Height = 21
              DataField = 'GRAU'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 510
      end
      inherited Dock974: TDock97
        Left = 424
        Height = 147
      end
    end
  end
  inherited Dock972: TDock97
    Width = 526
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 356
      DockPos = 364
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 189
      DockPos = 197
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCARGO, C.TITULO, C.IDFAIXASALARIAL, C.CODGRPFUNC, GF.DESCG' +
        'RPFUNC'
      'FROM'
      '  CARGO C, GRUPFUNC GF'
      'WHERE'
      '  (C.IDCARGO    = :IDCARGO) AND'
      '  (C.CODGRPFUNC = GF.CODGRPFUNC)'
      'ORDER BY'
      '  IDCARGO')
    Left = 271
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 470
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 344
    Top = 121
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGO'
      'set'
      '  IDFAIXASALARIAL = :IDFAIXASALARIAL'
      'where'
      '  IDCARGO = :OLD_IDCARGO')
    Left = 243
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargos'
    Colunas.Strings = (
      'IDCARGO'
      'TITULO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Título')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CARGO')
    CamposChave.Strings = (
      'IDCARGO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    ExibePergunta = False
    Left = 336
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 299
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 385
    Top = 121
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 477
    Top = 125
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 477
    Top = 113
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterDelete = qryDetAfterDelete
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  GC.IDCARGO, GC.IDFATORAVAL, GC.GRAU, FA.DESCRFATORAVAL'
      'FROM'
      '  GRAUCARGO GC, FATORAVAL FA'
      'WHERE'
      '  (GC.IDCARGO     = :IDCARGO) AND'
      '  (GC.IDFATORAVAL = FA.IDFATORAVAL)'
      'ORDER BY'
      '  IDFATORAVAL')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 433
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
    object qryDetDESCRFATORAVAL: TStringField
      DisplayLabel = 'Fator de Avaliação'
      DisplayWidth = 30
      FieldName = 'DESCRFATORAVAL'
      Origin = 'BASEDADOS.FATORAVAL.DESCRFATORAVAL'
      Size = 30
    end
    object qryDetGRAU: TFloatField
      DisplayLabel = 'Grau'
      DisplayWidth = 10
      FieldName = 'GRAU'
      Origin = 'BASEDADOS.GRAUCARGO.GRAU'
    end
    object qryDetPESO: TIntegerField
      DisplayLabel = 'Peso'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'PESO'
      Calculated = True
    end
    object qryDetNOTA: TFloatField
      DisplayLabel = 'Nota'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'NOTA'
      Calculated = True
    end
    object qryDetIDCARGO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARGO'
      Origin = 'BASEDADOS.GRAUCARGO.IDCARGO'
      Visible = False
    end
    object qryDetIDFATORAVAL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFATORAVAL'
      Origin = 'BASEDADOS.GRAUCARGO.IDFATORAVAL'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update GRAUCARGO'
      'set'
      '  IDFATORAVAL = :IDFATORAVAL,'
      '  GRAU = :GRAU'
      'where'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL and'
      '  GRAU = :OLD_GRAU')
    InsertSQL.Strings = (
      'insert into GRAUCARGO'
      '  (IDCARGO, IDFATORAVAL, GRAU)'
      'values'
      '  (:IDCARGO, :IDFATORAVAL, :GRAU)')
    DeleteSQL.Strings = (
      'delete from GRAUCARGO'
      'where'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDFATORAVAL = :OLD_IDFATORAVAL and'
      '  GRAU = :OLD_GRAU')
    Left = 395
    Top = 1
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 287
    Top = 121
  end
  object qryFaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  FAIXASAL'
      'WHERE'
      '  (IDFAIXASALARIAL = :IDFAIXASALARIAL)'
      ' ')
    ValidateWithMask = True
    Left = 230
    Top = 121
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDFAIXASALARIAL'
        ParamType = ptUnknown
      end>
  end
  object qryAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDFATORAVAL, DESCRFATORAVAL'
      'FROM'
      '  FATORAVAL'
      'ORDER BY'
      '  UPPER(DESCRFATORAVAL)'
      ' ')
    ValidateWithMask = True
    Left = 188
    Top = 121
  end
  object qryRelav: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODGRPFUNC, IDFATORAVAL, PESO'
      'FROM'
      '  PESOFATGRP'
      'WHERE'
      '  (CODGRPFUNC = :CODGRPFUNC) AND'
      '  (IDFATORAVAL = :IDFATORAVAL)')
    ValidateWithMask = True
    Left = 260
    Top = 229
    ParamData = <
      item
        DataType = ftString
        Name = 'CODGRPFUNC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDFATORAVAL'
        ParamType = ptUnknown
      end>
  end
  object qryClasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODGRPFUNC, IDFAIXASALARIAL, MINIMO, MAXIMO'
      'FROM'
      '  CLASSESAL'
      'ORDER BY'
      '  CODGRPFUNC, IDFAIXASALARIAL')
    ValidateWithMask = True
    Left = 212
    Top = 229
  end
end
