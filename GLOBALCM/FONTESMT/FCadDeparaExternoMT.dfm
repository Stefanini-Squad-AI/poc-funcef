inherited FrmCadDeparaExternoMT: TFrmCadDeparaExternoMT
  Left = 153
  Top = 155
  Caption = 'Cadastro de De/Para Externo'
  ClientHeight = 266
  ClientWidth = 463
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 463
    Height = 180
    object Label1: TLabel
      Left = 26
      Top = 28
      Width = 45
      Height = 13
      Caption = 'Atributo'
    end
    object Label2: TLabel
      Left = 26
      Top = 81
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel
      Left = 147
      Top = 81
      Width = 77
      Height = 13
      Caption = 'Valor Externo'
    end
    object Label4: TLabel
      Left = 269
      Top = 81
      Width = 40
      Height = 13
      Caption = 'Origem'
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 43
      Width = 409
      Height = 21
      DataField = 'ATRIBUTO'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 96
      Width = 97
      Height = 21
      DataField = 'VLRCM'
      DataSource = ds
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 145
      Top = 96
      Width = 97
      Height = 21
      DataField = 'VLREXTERNO'
      DataSource = ds
      TabOrder = 2
    end
    object DbCombo: TwwDBComboBox
      Left = 267
      Top = 96
      Width = 169
      Height = 21
      ShowButton = True
      Style = csDropDown
      MapList = True
      AllowClearKey = False
      DataField = 'FLGORIGEM'
      DataSource = ds
      DropDownCount = 8
      ItemHeight = 0
      Items.Strings = (
        'Contábil'#9'C'
        'Financeiro'#9'F'
        'Contas a Pagar'#9'P'
        'Contas a Receber'#9'R'
        'Todos'#9)
      ItemIndex = 0
      Sorted = False
      TabOrder = 3
      UnboundDataType = wwDefault
    end
  end
  inherited Dock972: TDock97
    Width = 463
  end
  inherited Dock971: TDock97
    Top = 227
    Width = 463
    inherited tb97Fundo: TToolbar97
      Left = 291
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 122
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 450
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 318
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 424
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 248
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEPARAEXTERNO.ATRIBUTO'
      'DEPARAEXTERNO.VLRCM'
      'DEPARAEXTERNO.VLREXTERNO'
      'DEPARAEXTERNO.FLGORIGEM')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Atributo'
      'Valor'
      'Valor Externo'
      'Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPARAEXTERNO')
    CamposChave.Strings = (
      'DEPARAEXTERNO.IDDEPARAEXTERNO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '30'
      '1')
    Left = 280
    Top = 7
  end
end
