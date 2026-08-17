inherited FrmProdass: TFrmProdass
  Left = 137
  Top = 151
  Caption = 'FrmProdass'
  ClientHeight = 337
  ClientWidth = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 552
    Height = 251
    object pnlControles: TPanel
      Left = 5
      Top = 5
      Width = 542
      Height = 241
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      TabStop = True
      object Label2: TLabel
        Left = 12
        Top = 7
        Width = 99
        Height = 13
        Caption = 'Nome do Produto'
      end
      object Label3: TLabel
        Left = 12
        Top = 53
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 407
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBNome: TDBEdit
        Left = 12
        Top = 22
        Width = 380
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object DBDescricao: TDBMemo
        Left = 12
        Top = 67
        Width = 505
        Height = 89
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBIdProdass: TDBEdit
        Left = 407
        Top = 22
        Width = 75
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDPRODASS'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBoxPerc: TGroupBox
        Left = 7
        Top = 168
        Width = 525
        Height = 67
        Caption = 'Percentual'
        TabOrder = 3
        object Label4: TLabel
          Left = 10
          Top = 22
          Width = 34
          Height = 13
          Caption = 'IOF %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 136
          Top = 22
          Width = 76
          Height = 13
          Caption = 'Pró-Labore %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwDBCBIof: TwwDBComboBox
          Left = 10
          Top = 36
          Width = 79
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DataField = 'PERCIOF'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object wwDBCBProLabore: TwwDBComboBox
          Left = 136
          Top = 36
          Width = 82
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DataField = 'PERCPROLABORE'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 552
  end
  inherited Dock971: TDock97
    Top = 298
    Width = 552
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 15
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 465
    Top = 13
  end
  inherited ImlPadrao: TImageList
    Left = 320
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 395
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    ProviderName = ''
    BeforeOpen = CdsBeforeOpen
    Left = 434
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PRODASS.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Produto')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PRODASS')
    CamposChave.Strings = (
      'PRODASS.IDPRODASS')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '40')
    Left = 504
    Top = 12
  end
  object Skt: TSocketConnection
    ServerGUID = '{99C58BF5-F272-4E62-8101-F2AB2DD454BA}'
    ServerName = 'SvrAlmoxarifado.RdmAlmoxarifado'
    Host = 'LocalHost'
    Left = 360
    Top = 15
  end
end
