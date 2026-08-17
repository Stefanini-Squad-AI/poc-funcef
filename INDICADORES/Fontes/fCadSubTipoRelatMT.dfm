inherited frmCadSubTipoRelatMT: TfrmCadSubTipoRelatMT
  Left = 141
  Top = 80
  HelpContext = 4390020
  Caption = 'Cadastro de SubTipo de Relatório'
  ClientHeight = 420
  ClientWidth = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 334
    inherited pnlMestre: TPanel
      Width = 572
      Height = 119
      object Label1: TLabel
        Left = 16
        Top = 53
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 16
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Tipo de Relatório'
      end
      object lblReport: TLabel
        Left = 388
        Top = 105
        Width = 60
        Height = 13
        Caption = 'Nr. Report'
        Enabled = False
      end
      object dbedtDescricao: TwwDBEdit
        Left = 16
        Top = 69
        Width = 521
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBcboTipoIndicador: TwwDBLookupCombo
        Left = 16
        Top = 25
        Width = 521
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F')
        DataField = 'IDTIPO'
        DataSource = ds
        LookupTable = CdsTipo
        LookupField = 'IDTIPO'
        Style = csDropDownList
        DropDownCount = 4
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbedtReport: TwwDBEdit
        Left = 480
        Top = 97
        Width = 57
        Height = 21
        DataField = 'IDREPORTS'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedtOrigemCM: TwwDBEdit
        Left = 457
        Top = 97
        Width = 21
        Height = 21
        DataField = 'ORIGEMCM'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 120
      Width = 572
      Height = 213
      Tabs.Strings = (
        'Indicadores')
      inherited pgctrlDetalhe: TPageControl
        Width = 474
        Height = 154
        inherited tbsDet: TTabSheet
          Caption = 'Indicadores'
          inherited pnlControlesDet: TPanel
            Width = 466
            Height = 126
            object Label4: TLabel
              Left = 312
              Top = 64
              Width = 37
              Height = 13
              Caption = 'Ordem'
            end
            object dbrgTipo: TDBRadioGroup
              Left = 15
              Top = 64
              Width = 234
              Height = 41
              Caption = 'Tipo de Lançamento'
              Columns = 2
              DataField = 'TIPOLANCA'
              DataSource = dsDet
              Items.Strings = (
                'Previsto'
                'Realizado')
              TabOrder = 1
              Values.Strings = (
                'P'
                'R')
            end
            object dbspnOrdem: TwwDBSpinEdit
              Left = 312
              Top = 80
              Width = 65
              Height = 21
              Increment = 1
              DataField = 'ORDEM'
              DataSource = dsDet
              TabOrder = 2
              UnboundDataType = wwDefault
            end
            inline molIndicador1: TmolIndicador
              Left = 7
              Top = 8
              Width = 442
              inherited btnLimpaIndicador: TBitBtn
                Left = 392
              end
              inherited edtIndicador: TEdit
                Width = 361
              end
              inherited btnBuscaIndicador: TBitBtn
                Left = 368
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 466
            Height = 126
            Selected.Strings = (
              'DSC_INDICADOR'#9'51'#9'Indicador'
              'DSC_TIPOLANCA'#9'12'#9'Tipo'
              'ORDEM'#9'6'#9'Ordem')
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 564
      end
      inherited Dock974: TDock97
        Left = 478
        Height = 154
      end
    end
  end
  inherited Dock972: TDock97
    Width = 574
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 306
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 470
  end
  inherited ImlPadrao: TImageList
    Left = 264
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 416
  end
  inherited Cds: TCMClientDataSet
    Left = 511
    Top = 65533
    object CdsIDSUBTIPO: TFloatField
      FieldName = 'IDSUBTIPO'
    end
    object CdsIDTIPO: TFloatField
      FieldName = 'IDTIPO'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object CdsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TI.DESCRICAO'
      'SI.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Relatório'
      'SubTipo de Relatório')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INDTIPOINDICADOR TI'
      'INDSUBTIPOINDICADOR SI')
    CamposChave.Strings = (
      'SI.IDSUBTIPO')
    Filtro.Strings = (
      'SI.IDTIPO = TI.IDTIPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '60')
    Left = 360
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 509
    Top = 314
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 439
    Top = 311
  end
  object CdsTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 463
    Top = 69
    object CdsTipoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsTipoIDTIPO: TFloatField
      FieldName = 'IDTIPO'
      Visible = False
    end
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 439
    Top = 326
    object cdsDetDSC_INDICADOR: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 51
      FieldName = 'DSC_INDICADOR'
      Size = 60
    end
    object cdsDetDSC_TIPOLANCA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 12
      FieldName = 'DSC_TIPOLANCA'
      Size = 9
    end
    object cdsDetORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 6
      FieldName = 'ORDEM'
    end
    object cdsDetIDGRPINDICADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPINDICADOR'
      Visible = False
    end
    object cdsDetIDSUBTIPO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSUBTIPO'
      Visible = False
    end
    object cdsDetIDINDICADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADOR'
      Visible = False
    end
    object cdsDetTIPOLANCA: TStringField
      DisplayWidth = 1
      FieldName = 'TIPOLANCA'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
