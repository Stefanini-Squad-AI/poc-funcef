inherited FrmCadPaisAlex: TFrmCadPaisAlex
  Caption = 'FrmCadPaisAlex'
  ClientHeight = 440
  ClientWidth = 503
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 503
    Height = 354
    inherited pnlMestre: TPanel
      Width = 501
      Height = 56
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 65
        Height = 13
        Caption = 'NOMEPAIS'
        FocusControl = DBEdit1
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 214
        Height = 21
        DataField = 'NOMEPAIS'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 57
      Width = 501
      Height = 296
      Tabs.Strings = (
        'Detalhe'
        'Estado')
      detdbGrids.Strings = (
        ''
        'dbGrdEstado')
      inherited pgctrlDetalhe: TPageControl
        Width = 403
        Height = 237
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 395
            Height = 209
            DataSource = nil
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 395
            Height = 209
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 137
              Height = 13
              Caption = 'NOMENACIONALIDADE'
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 8
              Top = 48
              Width = 136
              Height = 13
              Caption = 'CODRECEITAFEDERAL'
              FocusControl = DBEdit3
            end
            object Label4: TLabel
              Left = 8
              Top = 88
              Width = 127
              Height = 13
              Caption = 'CODINTERNACIONAL'
              FocusControl = DBEdit4
            end
            object Label5: TLabel
              Left = 8
              Top = 128
              Width = 116
              Height = 13
              Caption = 'MASCARACPOSTAL'
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 8
              Top = 168
              Width = 74
              Height = 13
              Caption = 'CODREGIAO'
              FocusControl = DBEdit6
            end
            object DBEdit2: TDBEdit
              Left = 8
              Top = 24
              Width = 214
              Height = 21
              DataField = 'NOMENACIONALIDADE'
              DataSource = ds
              TabOrder = 0
            end
            object DBEdit3: TDBEdit
              Left = 8
              Top = 64
              Width = 74
              Height = 21
              DataField = 'CODRECEITAFEDERAL'
              DataSource = ds
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 8
              Top = 104
              Width = 25
              Height = 21
              DataField = 'CODINTERNACIONAL'
              DataSource = ds
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 8
              Top = 144
              Width = 144
              Height = 21
              DataField = 'MASCARACPOSTAL'
              DataSource = ds
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 8
              Top = 184
              Width = 74
              Height = 21
              DataField = 'CODREGIAO'
              DataSource = ds
              TabOrder = 4
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Estado'
          ImageIndex = 1
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 395
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 77
              Height = 13
              Caption = 'CODESTADO'
              FocusControl = DBEdit7
            end
            object Label8: TLabel
              Left = 8
              Top = 48
              Width = 87
              Height = 13
              Caption = 'NOMEESTADO'
              FocusControl = DBEdit8
            end
            object Label9: TLabel
              Left = 8
              Top = 88
              Width = 101
              Height = 13
              Caption = 'CODJURISDICAO'
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 8
              Top = 128
              Width = 69
              Height = 13
              Caption = 'CODFISCAL'
              FocusControl = DBEdit10
            end
            object DBEdit7: TDBEdit
              Left = 8
              Top = 24
              Width = 81
              Height = 21
              DataField = 'CODESTADO'
              DataSource = DataSource1
              TabOrder = 0
            end
            object DBEdit8: TDBEdit
              Left = 8
              Top = 64
              Width = 214
              Height = 21
              DataField = 'NOMEESTADO'
              DataSource = DataSource1
              TabOrder = 1
            end
            object DBEdit9: TDBEdit
              Left = 8
              Top = 104
              Width = 81
              Height = 21
              DataField = 'CODJURISDICAO'
              DataSource = DataSource1
              TabOrder = 2
            end
            object DBEdit10: TDBEdit
              Left = 8
              Top = 144
              Width = 81
              Height = 21
              DataField = 'CODFISCAL'
              DataSource = DataSource1
              TabOrder = 3
            end
          end
          object dbGrdEstado: TwwDBGrid
            Left = 0
            Top = 0
            Width = 395
            Height = 209
            Selected.Strings = (
              'CODESTADO'#9'3'#9'CODESTADO'
              'NOMEESTADO'#9'30'#9'NOMEESTADO'
              'CODJURISDICAO'#9'2'#9'CODJURISDICAO'
              'CODFISCAL'#9'10'#9'CODFISCAL')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 493
      end
      inherited Dock974: TDock97
        Left = 407
        Height = 237
      end
    end
  end
  inherited Dock972: TDock97
    Width = 503
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 503
    inherited tb97Fundo: TToolbar97
      Left = 331
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 162
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 78
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 264
  end
  inherited Cds: TCMClientDataSet
    Left = 36
    Top = 63
    object CdsIDPAIS: TFloatField
      FieldName = 'IDPAIS'
    end
    object CdsNOMEPAIS: TStringField
      FieldName = 'NOMEPAIS'
      Size = 30
    end
    object CdsNOMENACIONALIDADE: TStringField
      FieldName = 'NOMENACIONALIDADE'
      Size = 30
    end
    object CdsCODRECEITAFEDERAL: TFloatField
      FieldName = 'CODRECEITAFEDERAL'
    end
    object CdsCODINTERNACIONAL: TStringField
      FieldName = 'CODINTERNACIONAL'
      Size = 3
    end
    object CdsMASCARACPOSTAL: TStringField
      FieldName = 'MASCARACPOSTAL'
    end
    object CdsTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsCODREGIAO: TFloatField
      FieldName = 'CODREGIAO'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PAIS')
    CamposChave.Strings = (
      'PAIS.IDPAIS')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 348
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsEstado
    Top = 247
  end
  object cdsEstado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 313
    Top = 176
    object cdsEstadoCODESTADO: TStringField
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsEstadoNOMEESTADO: TStringField
      DisplayWidth = 30
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object cdsEstadoCODJURISDICAO: TStringField
      DisplayWidth = 2
      FieldName = 'CODJURISDICAO'
      FixedChar = True
      Size = 2
    end
    object cdsEstadoCODFISCAL: TStringField
      DisplayWidth = 10
      FieldName = 'CODFISCAL'
      Size = 10
    end
    object cdsEstadoIDPAIS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPAIS'
      Visible = False
    end
    object cdsEstadoIDESTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDESTADO'
      Visible = False
    end
    object cdsEstadoTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object cdsEstadoTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsEstado
    Left = 193
    Top = 271
  end
end
