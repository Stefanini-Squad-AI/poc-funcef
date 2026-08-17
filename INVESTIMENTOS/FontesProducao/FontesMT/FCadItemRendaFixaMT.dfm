inherited FrmCadItemRendaFixaMT: TFrmCadItemRendaFixaMT
  Left = 535
  Top = 321
  HelpContext = 790059
  Caption = 'Cadastro'
  ClientHeight = 311
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 438
    Height = 194
    inherited pnlControles: TPanel
      Width = 436
      Height = 192
      object lblCodigoItem: TLabel
        Left = 24
        Top = 13
        Width = 86
        Height = 13
        Caption = 'Código do Item'
      end
      object lblDescItemRenFix: TLabel
        Left = 24
        Top = 61
        Width = 104
        Height = 13
        Caption = 'Descrição do Item'
      end
      object lblTipoItem: TLabel
        Left = 24
        Top = 111
        Width = 72
        Height = 13
        Caption = 'Tipo de Item'
      end
      object Label1: TLabel
        Left = 216
        Top = 13
        Width = 118
        Height = 13
        Caption = 'Identificador do Item'
      end
      object dbeCodigoItem: TwwDBEdit
        Left = 24
        Top = 29
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CODITEMRENFIX'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDescItemRenFix: TwwDBEdit
        Left = 24
        Top = 77
        Width = 361
        Height = 21
        DataField = 'DESCITEMRENFIX'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbTipoItem: TwwDBComboBox
        Left = 24
        Top = 127
        Width = 193
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        AutoDropDown = True
        DataField = 'TIPOITEM'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Ágio'#9'A'
          'Deságio'#9'D'
          'Imposto'#9'I'
          'Lucro'#9'L'
          'Moeda'#9'M'
          'Percentual'#9'R'
          'PU'#9'P'
          'Taxa'#9'T'
          'Valor'#9'V'
          'Valor para Cálculo'#9'N')
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object dbeIDItem: TwwDBEdit
        Left = 216
        Top = 29
        Width = 169
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'IDITEMRENFIX'
        DataSource = ds
        PopupMenu = pmnuIDItemRenFix
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 436
      Height = 192
      Selected.Strings = (
        'DESCITEMRENFIX'#9'35'#9'Item'
        'CODITEMRENFIX'#9'15'#9'Código'
        'TIPOITEM'#9'5'#9'Tipo')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TitleAlignment = taLeftJustify
    end
  end
  inherited Dock972: TDock97
    Width = 438
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 438
    inherited tb97Fundo: TToolbar97
      Left = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
    end
  end
  inherited pnlTitulo: TPanel
    Width = 438
    inherited lbNomItem: TfcLabel
      Width = 199
      Caption = 'Itens de Renda Fixa'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ITEMRENFIX.CODITEMRENFIX'
      'ITEMRENFIX.DESCITEMRENFIX')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Item')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'ITEMRENFIX')
    CamposChave.Strings = (
      'ITEMRENFIX.IDITEMRENFIX')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '60')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDITEMRENFIX, DESCITEMRENFIX, CODITEMRENFIX, TIPOITEM '
      'FROM ITEMRENFIX')
    Left = 264
    Top = 103
  end
  object pmnuIDItemRenFix: TPopupMenu
    Left = 369
    Top = 7
    object mnuGeraIDNeg: TMenuItem
      Caption = 'Gera Identificador Negativo'
      OnClick = mnuGeraIDNegClick
    end
    object mnuGeraIDPos: TMenuItem
      Caption = 'Gera Identificador Positivo'
      OnClick = mnuGeraIDPosClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuPermiteAlteracao: TMenuItem
      Caption = 'Permite Alteração'
      OnClick = mnuPermiteAlteracaoClick
    end
  end
  object cdsCopia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 364
    Top = 173
  end
end
