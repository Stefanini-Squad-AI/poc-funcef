inherited frmCadParamEmprestimo: TfrmCadParamEmprestimo
  Left = 258
  Top = 167
  HelpContext = 545017
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Parâmetros de Empréstimo'
  ClientHeight = 407
  ClientWidth = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    Height = 321
    inherited dbGrd: TwwDBGrid [0]
      Top = 146
      Width = 579
      Height = 174
      Selected.Strings = (
        'DECITEMEVTO'#9'5'#9'Oper.'
        'TCEDESCRICAO'#9'50'#9'Tipo de Contrato'
        'DESCEVENTO'#9'30'#9'Evento'
        'ITEDESCRICAO'#9'40'#9'Items de Empréstimo'
        'FLGMOVCOTA'#9'8'#9'Tipo Mov.')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
    end
    inherited pnlControles: TPanel [1]
      Top = 146
      Width = 579
      Height = 174
      object Label4: TLabel
        Left = 96
        Top = 10
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
        FocusControl = DBEdit1
      end
      object Label5: TLabel
        Left = 16
        Top = 58
        Width = 111
        Height = 13
        Caption = 'Item de Empréstimo'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 304
        Top = 58
        Width = 41
        Height = 13
        Caption = 'Evento'
        FocusControl = DBEdit2
      end
      object Label7: TLabel
        Left = 17
        Top = 10
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object DBEdit1: TDBEdit
        Left = 96
        Top = 24
        Width = 457
        Height = 21
        Color = clBtnFace
        DataField = 'TCEDESCRICAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 72
        Width = 273
        Height = 21
        Color = clBtnFace
        DataField = 'ITEDESCRICAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 304
        Top = 72
        Width = 249
        Height = 21
        Color = clBtnFace
        DataField = 'DESCEVENTO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object rdgrMovCota: TDBRadioGroup
        Left = 15
        Top = 104
        Width = 539
        Height = 49
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
      object DBEdit4: TDBEdit
        Left = 16
        Top = 24
        Width = 57
        Height = 21
        Color = clBtnFace
        DataField = 'DECITEMEVTO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 4
      end
    end
    object pnlCriterios: TPanel
      Left = 1
      Top = 1
      Width = 579
      Height = 145
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 95
        Height = 13
        Caption = 'Tipo de contrato'
      end
      object Label2: TLabel
        Left = 16
        Top = 50
        Width = 41
        Height = 13
        Caption = 'Evento'
      end
      object Label3: TLabel
        Left = 16
        Top = 90
        Width = 115
        Height = 13
        Caption = 'Itens de Empréstimo'
      end
      object cmbTipoContrEmptmo: TCMDBLookupCombo
        Left = 16
        Top = 24
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TCEDESCRICAO'#9'60'#9'Descrição'#9'F')
        LookupTable = CdsTipoContrEmptmo
        LookupField = 'IDTIPOCONTREMPTMO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbTipoContrEmptmoCloseUp
        OnExit = cmbTipoContrEmptmoExit
      end
      object cmbItensContrato: TCMDBLookupCombo
        Left = 16
        Top = 104
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ITEDESCRICAO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsItemEmptmo
        LookupField = 'IDITEMEMPTMO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = cmbTipoContrEmptmoCloseUp
        OnExit = cmbItensContratoExit
      end
      object cmbEvento: TwwDBComboBox
        Left = 16
        Top = 64
        Width = 353
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = False
        AllowClearKey = False
        AutoDropDown = True
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          '0 - Concessão / Renovação'
          '1 - Prestação'
          '2 - Amortização / Refinanciamento'
          '3 - Quitação'
          '4 - Atualização de Débito'
          '5 - Atualização de Saldo (Diária)'
          '6 - Improtação / Migração'
          '7 - Ajustes (Cobrança / Devolução)'
          '8 - Ajustes (Saldo Devedor)')
        Sorted = False
        TabOrder = 1
        UnboundDataType = wwDefault
        OnClick = cmbEventoClick
        OnCloseUp = cmbEventoCloseUp
        OnExit = cmbEventoExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 581
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Width = 72
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 192
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 132
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 898
    Top = 63
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 264
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 848
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyEdit
    Left = 336
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 296
    Top = 0
    object CdsDECITEMEVTO: TStringField
      FieldName = 'DECITEMEVTO'
      Size = 3
    end
    object CdsIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object CdsFLGCOTARECDES: TStringField
      FieldName = 'FLGCOTARECDES'
      FixedChar = True
      Size = 1
    end
    object CdsIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object CdsTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object CdsITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
    end
    object CdsITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object CdsFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
    object CdsDESCEVENTO: TStringField
      FieldName = 'DESCEVENTO'
      Size = 30
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecionando Tipo de Contrato'
    Colunas.Strings = (
      'T.TCEDESCRICAO'
      'ITE.ITEDESCRICAO'
      
        'DECODE(IX.ITCEVENTO,0, '#39'CONCESSÃO / RENOVAÇÃO'#39',1,'#39'PRESTAÇÃO'#39',2,'#39 +
        'AMORTIZAÇÃO / REFINANCIAMENTO'#39',3,'#39'QUITAÇÃO'#39',4,'#39'ATUALIZAÇÃO DE DÉ' +
        'BITO'#39',5,'#39'ATUALIZAÇÃO DE SALDO'#39',6,'#39'IMPORTAÇÃO / MIGRAÇÃO'#39',7,'#39'AJUS' +
        'TES (COBRANÇA / DEVOLUÇÃO)'#39',8,'#39'AJUSTES (SALDO DEVEDOR)'#39' )')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Contrato'
      'Item de Contrato'
      'Evento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMXTIPOCONTR IX'
      'TIPOCONTREMPTMO T'
      'ITEMEMPTMO ITE')
    CamposChave.Strings = (
      'IX.IDTIPOCONTREMPTMO'
      'IX.IDITEMEMPTMO'
      'IX.ITCEVENTO')
    Filtro.Strings = (
      'IX.FLGDESTACADO       = 0'
      'IX.FLGCENTRALIZA  =  0'
      'IX.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO'
      'IX.IDITEMEMPTMO    = ITE.IDITEMEMPTMO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '40'
      '1')
    Left = 384
    Top = 0
  end
  object CdsTipoContrEmptmo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 88
  end
  object CdsItemEmptmo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 144
  end
end
