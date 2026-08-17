inherited frmCadParamImobiliario: TfrmCadParamImobiliario
  Left = 293
  Top = 135
  HelpContext = 545018
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Parâmetros Imobiliário'
  ClientHeight = 419
  ClientWidth = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 586
    Height = 333
    inherited pnlControles: TPanel
      Top = 149
      Width = 584
      Height = 183
      object Label3: TLabel
        Left = 16
        Top = -17
        Width = 56
        Height = 13
        Caption = 'Operação'
        FocusControl = DBEdit1
      end
      object Label4: TLabel
        Left = 164
        Top = -16
        Width = 42
        Height = 13
        Caption = 'Módulo'
        FocusControl = DBEdit2
      end
      object Label5: TLabel
        Left = 24
        Top = 58
        Width = 112
        Height = 13
        Caption = 'Descrição do Custo'
        FocusControl = DBEdit3
      end
      object Label1: TLabel
        Left = 32
        Top = 112
        Width = 96
        Height = 13
        Caption = 'Nome do Módulo'
      end
      object Label6: TLabel
        Left = 24
        Top = 10
        Width = 56
        Height = 13
        Caption = 'Operação'
        FocusControl = DBEdit1
      end
      object Label7: TLabel
        Left = 168
        Top = 10
        Width = 42
        Height = 13
        Caption = 'Módulo'
      end
      object rdgrMovCota: TDBRadioGroup
        Left = 23
        Top = 104
        Width = 534
        Height = 54
        Columns = 3
        DataField = 'FLGMOVCOTA'
        DataSource = ds
        Items.Strings = (
          'Rentabiliza'
          'Cotiza'
          'Não Afeta')
        TabOrder = 3
        Values.Strings = (
          'R'
          'C'
          'N')
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 24
        Width = 57
        Height = 21
        Color = clBtnFace
        DataField = 'RECCUSTO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 168
        Top = 24
        Width = 389
        Height = 21
        Color = clBtnFace
        DataField = 'DESCMODULO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 72
        Width = 532
        Height = 21
        Color = clBtnFace
        DataField = 'DESCCUSTORECIMO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Top = 149
      Width = 584
      Height = 183
      Selected.Strings = (
        'RECCUSTO'#9'5'#9'Oper.'
        'DESCMODULO'#9'46'#9'Módulo'
        'DESCCUSTORECIMO'#9'60'#9'Tipo'
        'FLGMOVCOTA'#9'8'#9'Tipo Mov.')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
    object pnlCriterios: TPanel
      Left = 1
      Top = 1
      Width = 584
      Height = 148
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 98
        Width = 108
        Height = 13
        Caption = 'Receita / Despesa'
      end
      object Label8: TLabel
        Left = 16
        Top = 58
        Width = 96
        Height = 13
        Caption = 'Nome do Módulo'
      end
      object rdgrTipoOper: TRadioGroup
        Left = 16
        Top = 5
        Width = 393
        Height = 47
        Caption = ' Tipo de Operação de Cota '
        Columns = 3
        Items.Strings = (
          'Receita  (+)'
          'Despesa  (-)'
          'Ambas')
        TabOrder = 0
        OnClick = rdgrTipoOperClick
        OnExit = rdgrTipoOperExit
      end
      object cmbModulos: TCMDBLookupCombo
        Left = 16
        Top = 72
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEMODULO'#9'50'#9'Descrição'#9'F')
        LookupTable = CdsModulos
        LookupField = 'IDMODULO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbModulosCloseUp
        OnExit = cmbModulosExit
      end
      object cmbDesCusto: TCMDBLookupCombo
        Left = 16
        Top = 112
        Width = 392
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'60'#9'Descrição'#9'F')
        LookupTable = CdsDescCusto
        LookupField = 'IDTIPOCUSTORECIMO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbDesCustoCloseUp
        OnExit = cmbDesCustoExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 586
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 380
    Width = 586
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 818
    Top = 63
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 768
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
    object CdsIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
    end
    object CdsRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Size = 7
    end
    object CdsIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object CdsDESCMODULO: TStringField
      FieldName = 'DESCMODULO'
      Size = 50
    end
    object CdsDESCCUSTORECIMO: TStringField
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DECODE(IM.IDMODULO,NULL,'#39#39',M.NOMEMODULO) AS DESCMODULO'
      'IM.DESCCUSTORECIMO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Módulo'
      'Receita / Despesa')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCUSTORECIMOV IM'
      'MODULO M ')
    CamposChave.Strings = (
      'IM.IDMODULO'
      'IM.IDTIPOCUSTORECIMO'
      'IM.RECCUSTO')
    Filtro.Strings = (
      'IM.IDMODULO = M.IDMODULO'
      'IM.RECCUSTO <> '#39'O'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '60')
    Left = 376
    Top = 0
  end
  object CdsModulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 80
  end
  object CdsDescCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 136
  end
end
