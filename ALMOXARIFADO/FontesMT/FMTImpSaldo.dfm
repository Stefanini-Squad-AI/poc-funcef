inherited FrmMTImpSaldo: TFrmMTImpSaldo
  Left = 181
  Top = 87
  HelpContext = 50060
  Caption = 'Implantação de Saldo'
  ClientHeight = 350
  ClientWidth = 737
  PixelsPerInch = 96
  TextHeight = 13
  object dbGrd: TwwDBGrid [0]
    Left = 0
    Top = 47
    Width = 737
    Height = 264
    Selected.Strings = (
      'CODARTIGO'#9'14'#9'Código'
      'DESCPROD'#9'35'#9'Descrição'
      'CODMEDCUSTO'#9'4'#9'Unidade ~Medida'
      'SALDOQTDEMOV'#9'10'#9'Saldo~Inicial'
      'CUSTOMEDIOMOV'#9'10'#9'Custo Médio~Inicial'
      'VALULTCOMPRA'#9'10'#9'Valor~Ult. Compra')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds
    KeyOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
    TabOrder = 3
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -9
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = False
    OnDblClick = sbtnAlterarClick
    IndicatorColor = icBlack
  end
  inherited pnlFundo: TPanel
    Width = 737
    Height = 264
    object Grp: TGroupBox
      Left = 16
      Top = 16
      Width = 705
      Height = 225
      Caption = ' Almoxarifado '
      TabOrder = 0
      object Label3: TLabel
        Left = 24
        Top = 124
        Width = 102
        Height = 13
        Caption = 'Saldo Quantidade'
      end
      object Label4: TLabel
        Left = 368
        Top = 124
        Width = 48
        Height = 13
        Caption = 'Unidade'
      end
      object Label5: TLabel
        Left = 200
        Top = 124
        Width = 71
        Height = 13
        Caption = 'Custo Médio'
      end
      object Label7: TLabel
        Left = 520
        Top = 124
        Width = 100
        Height = 13
        Caption = 'Valor Ult. Compra'
      end
      object Label8: TLabel
        Left = 24
        Top = 176
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object GrpArt: TGroupBox
        Left = 19
        Top = 24
        Width = 646
        Height = 89
        Caption = ' Artigo '
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label2: TLabel
          Left = 160
          Top = 24
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object dbCodArt: TDBEdit
          Left = 16
          Top = 40
          Width = 121
          Height = 21
          Color = clGray
          DataField = 'CODARTIGO'
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
        object edDesc: TDBEdit
          Left = 160
          Top = 40
          Width = 465
          Height = 21
          Color = clGray
          DataField = 'DESCPROD'
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
      end
      object edSaldo: TDBRealEdit
        Left = 24
        Top = 140
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALDOQTDEMOV'
        DataSource = ds
      end
      object edCustoMed: TDBRealEdit
        Left = 200
        Top = 140
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'CUSTOMEDIOMOV'
        DataSource = ds
      end
      object edUN: TDBEdit
        Left = 368
        Top = 140
        Width = 97
        Height = 21
        Color = clGray
        DataField = 'CODMEDCUSTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edValUltCompra: TDBRealEdit
        Left = 520
        Top = 140
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 4
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALULTCOMPRA'
        DataSource = ds
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 24
        Top = 192
        Width = 297
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        DataField = 'UNIDNEGOC'
        LookupTable = cdsUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 737
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Implantar'
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 737
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 591
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50060
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 396
      DockPos = 422
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 706
    Top = 65511
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 334
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 744
    Top = 65519
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 272
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 372
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPPROD.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'GRUPPROD')
    CamposChave.Strings = (
      'GRUPPROD.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    Left = 432
    Top = 7
  end
  object cdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 41
  end
end
