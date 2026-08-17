inherited frmCadGrau: TfrmCadGrau
  Left = 279
  Top = 122
  HelpContext = 740006
  Caption = 'Cadastro de Graus Atribuídos ao Cargo'
  ClientHeight = 406
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 320
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 522
      Height = 90
      object Label6: TLabel
        Left = 9
        Top = 47
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
        Left = 442
        Top = 6
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
        Left = 11
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
        Left = 82
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
      object Label7: TLabel
        Left = 115
        Top = 47
        Width = 94
        Height = 13
        Caption = 'Grupo Funcional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedCodCargo: TDBEdit
        Left = 11
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
        Left = 82
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
        Left = 10
        Top = 61
        Width = 95
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDFAIXASALARIAL'#9'10'#9'Código'
          'STEP1'#9'10'#9'STEP 1'
          'STEP2'#9'10'#9'STEP 2'
          'STEP3'#9'10'#9'STEP 3'
          'STEP4'#9'10'#9'STEP 4'
          'STEP5'#9'10'#9'STEP 5'
          'STEP6'#9'10'#9'STEP 6'
          'STEP7'#9'10'#9'STEP 7'
          'STEP8'#9'10'#9'STEP 8'
          'STEP9'#9'10'#9'STEP 9'
          'DATAEFETIV'#9'10'#9'Data Efetiv.')
        DataField = 'IDFAIXASALARIAL'
        DataSource = ds
        LookupTable = CdsFaixaSal
        LookupField = 'IDFAIXASALARIAL'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        Color = clGray
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
      end
      object dbedGrupo: TwwDBEdit
        Left = 115
        Top = 61
        Width = 392
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
        Left = 442
        Top = 21
        Width = 65
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
      Left = 2
      Top = 92
      Width = 522
      Height = 226
      Tabs.Strings = (
        'Graus')
      inherited pgctrlDetalhe: TPageControl
        Width = 424
        Height = 167
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 416
            Height = 139
            Selected.Strings = (
              'DESCRFATORAVAL'#9'30'#9'Fator de Avaliação'
              'GRAU'#9'10'#9'Grau'
              'PESO'#9'10'#9'Peso'
              'NOTA'#9'10'#9'Nota')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 416
            Height = 139
            object Label3: TLabel
              Left = 10
              Top = 23
              Width = 108
              Height = 13
              Caption = 'Fator de Avaliação'
            end
            object Label5: TLabel
              Left = 10
              Top = 80
              Width = 84
              Height = 13
              Caption = 'Grau Atribuído'
            end
            object dblcFatorAval: TwwDBLookupCombo
              Left = 10
              Top = 38
              Width = 391
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'30'#9'DESCRFATORAVAL')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = CdsFatorAval
              LookupField = 'IDFATORAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedGrau: TwwDBEdit
              Left = 10
              Top = 95
              Width = 70
              Height = 21
              DataField = 'GRAU'
              DataSource = dsDet
              MaxLength = 2
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 514
      end
      inherited Dock974: TDock97
        Left = 428
        Height = 167
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
    Top = 367
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 354
      DockPos = 366
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 197
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 400
    Top = 26
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 477
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'IDCARGO'
      'TITULO')
    TipodeDado.Strings = (
      'C'
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
    OperComparador.Strings = (
      '-1'
      '-1')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 400
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 477
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 337
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 303
    Top = 1
  end
  object CdsFaixaSal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 458
    Top = 312
  end
  object CdsFatorAval: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 458
    Top = 298
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 458
    Top = 284
  end
end
