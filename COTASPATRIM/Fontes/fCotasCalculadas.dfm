inherited frmCotasCalculadas: TfrmCotasCalculadas
  Left = 191
  Top = 358
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Cotas Calculadas'
  ClientHeight = 297
  ClientWidth = 652
  Constraints.MinHeight = 331
  Constraints.MinWidth = 550
  FormStyle = fsMDIForm
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 652
    Height = 258
    object pnlCota: TPanel
      Left = 1
      Top = 1
      Width = 650
      Height = 39
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblAtivo: TLabel
        Left = 6
        Top = 1
        Width = 34
        Height = 13
        Caption = 'Ativo:'
      end
      object lblDataInicial: TLabel
        Left = 403
        Top = 1
        Width = 32
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Data:'
      end
      object lblValorCota: TLabel
        Left = 517
        Top = 1
        Width = 81
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Valor da cota:'
      end
      object dblkpAtivo: TCMDBLookupCombo
        Left = 6
        Top = 17
        Width = 383
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Nome do Ativo'#9'F')
        DataField = 'IDCPATIVO'
        LookupTable = cdsAtivo
        LookupField = 'IDCPATIVO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblkpAtivoCloseUp
      end
      object cmbData: TComboBox
        Left = 403
        Top = 17
        Width = 101
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 1
        OnChange = cmbDataChange
      end
      object dbedtVALOR: TDBEdit
        Left = 516
        Top = 17
        Width = 128
        Height = 21
        Anchors = [akTop, akRight]
        Color = 15658734
        DataField = 'VALOR'
        DataSource = dtsValorCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 40
      Width = 650
      Height = 217
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 1
      object PageControl: TPageControl
        Left = 6
        Top = 6
        Width = 638
        Height = 205
        ActivePage = tabContas
        Align = alClient
        TabOrder = 0
        object tabContas: TTabSheet
          Caption = 'Contas'
          object dbgrdFundos: TwwDBGrid
            Left = 0
            Top = 0
            Width = 630
            Height = 177
            Selected.Strings = (
              'NOME'#9'32'#9'Nome'
              'SALDOCOTAS'#9'24'#9'Saldo em cotas'
              'VALOR'#9'24'#9'Valor')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dtsSaldoConta
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tabCalculo: TTabSheet
          Caption = 'Cálculo'
          ImageIndex = 2
          object lblDataCalculo: TLabel
            Left = 9
            Top = 9
            Width = 95
            Height = 13
            Caption = 'Data do cálculo:'
          end
          object Label1: TLabel
            Left = 9
            Top = 65
            Width = 55
            Height = 13
            Caption = 'Situação:'
          end
          object lblProcesso: TLabel
            Left = 388
            Top = 121
            Width = 87
            Height = 13
            Anchors = [akTop, akRight]
            Caption = 'Processo RAD:'
          end
          object lblUsuario: TLabel
            Left = 9
            Top = 121
            Width = 48
            Height = 13
            Caption = 'Usuário:'
          end
          object dbedtDataCalc: TDBEdit
            Left = 9
            Top = 25
            Width = 128
            Height = 21
            Color = 15658734
            DataField = 'DTCALCULO'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 0
          end
          object dbedtStatus: TDBEdit
            Left = 9
            Top = 81
            Width = 611
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = 15658734
            DataField = 'STATUS'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 1
          end
          object dbedtProcesso: TDBEdit
            Left = 388
            Top = 137
            Width = 230
            Height = 21
            Anchors = [akTop, akRight]
            Color = 15658734
            DataField = 'IDPROCESSO'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 3
          end
          object dbedtUsuario: TDBEdit
            Left = 9
            Top = 137
            Width = 230
            Height = 21
            Color = 15658734
            DataField = 'NOMEUSUARIO'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 2
          end
        end
        object tabDados: TTabSheet
          Caption = 'Dados'
          ImageIndex = 3
          object lblSLDAPLICADO: TLabel
            Left = 2
            Top = 3
            Width = 294
            Height = 13
            Caption = 'Saldo total dos investimentos no fechamento do dia'
          end
          object lblSLDATIVOANT: TLabel
            Left = 2
            Top = 46
            Width = 254
            Height = 13
            Caption = 'Saldo do ativo na abertura do dia (em cotas)'
          end
          object lblSAIDAINVEST: TLabel
            Left = 2
            Top = 89
            Width = 278
            Height = 13
            Caption = 'Valor total das saídas de investimentos (resgate)'
          end
          object lblENTRINVEST: TLabel
            Left = 2
            Top = 137
            Width = 304
            Height = 13
            Caption = 'Valor total das entradas em investimentos (aplicação)'
          end
          object lblSALDOANTCTA: TLabel
            Left = 314
            Top = 3
            Width = 248
            Height = 13
            Caption = 'Saldo em conta-corrente na abertura do dia'
          end
          object lblSALDOATUCTA: TLabel
            Left = 314
            Top = 46
            Width = 267
            Height = 13
            Caption = 'Saldo em conta-corrente no fechamento do dia'
          end
          object lblENTRRENT: TLabel
            Left = 314
            Top = 89
            Width = 313
            Height = 13
            Caption = 'Entradas em conta-corrente que afetam a rentabilidade'
          end
          object lblSAIDARENT: TLabel
            Left = 314
            Top = 137
            Width = 301
            Height = 13
            Caption = 'Saídas de conta-corrente que afetam a rentabilidade'
          end
          object edtSLDAPLICADO: TEdit
            Left = 3
            Top = 17
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 0
          end
          object edtENTRRENT: TEdit
            Left = 314
            Top = 103
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 6
          end
          object edtSLDATIVOANT: TEdit
            Left = 3
            Top = 60
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 1
          end
          object edtSALDOANTCTA: TEdit
            Left = 315
            Top = 17
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 4
          end
          object edtSALDOATUCTA: TEdit
            Left = 315
            Top = 60
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 5
          end
          object edtSAIDAINVEST: TEdit
            Left = 3
            Top = 103
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 2
          end
          object edtENTRINVEST: TEdit
            Left = 3
            Top = 151
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 3
          end
          object edtSAIDARENT: TEdit
            Left = 314
            Top = 151
            Width = 270
            Height = 21
            Color = 15658734
            ReadOnly = True
            TabOrder = 7
          end
        end
        object tabRegra: TTabSheet
          Caption = 'Regra'
          ImageIndex = 1
          object lblNumero: TLabel
            Left = 7
            Top = 6
            Width = 48
            Height = 13
            Caption = 'Número:'
          end
          object lblNome: TLabel
            Left = 115
            Top = 6
            Width = 37
            Height = 13
            Caption = 'Nome:'
          end
          object lblQueryEntrada: TLabel
            Left = 7
            Top = 54
            Width = 103
            Height = 13
            Caption = 'Query de entrada:'
          end
          object dbedtIDREGRA: TDBEdit
            Left = 7
            Top = 22
            Width = 98
            Height = 21
            Color = 15658734
            DataField = 'IDREGRA'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 0
          end
          object dbedtNomeRegra: TDBEdit
            Left = 116
            Top = 22
            Width = 505
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = 15658734
            DataField = 'NOMEREGRA'
            DataSource = dtsValorCota
            ReadOnly = True
            TabOrder = 1
          end
          object dbmemQUERYENTRADA: TDBMemo
            Left = 7
            Top = 72
            Width = 614
            Height = 98
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = 15658734
            DataField = 'QUERYENTRADA'
            DataSource = dtsValorCota
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 652
    inherited tb97Fundo: TToolbar97
      Left = 367
      Visible = False
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 955
    Top = 83
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsValorCota: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsValorCotaAfterOpen
    Left = 784
    Top = 88
  end
  object cdsSaldoConta: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsSaldoContaAfterOpen
    Left = 856
    Top = 120
  end
  object cdsAtivo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 215
    Top = 3
  end
  object dtsValorCota: TDataSource
    DataSet = cdsValorCota
    Left = 784
    Top = 136
  end
  object dtsSaldoConta: TDataSource
    DataSet = cdsSaldoConta
    Left = 859
    Top = 166
  end
  object cdsQuery: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 963
    Top = 158
  end
end
