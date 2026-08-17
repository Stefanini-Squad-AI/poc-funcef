inherited FrmCadClasseTitRenFixMT: TFrmCadClasseTitRenFixMT
  Left = 348
  Top = 236
  HelpContext = 790058
  Caption = 'Cadastro'
  ClientHeight = 249
  ClientWidth = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 404
    Height = 132
    inherited dbGrd: TwwDBGrid [0]
      Width = 402
      Height = 130
      Selected.Strings = (
        'DESCCLASSETIT'#9'42'#9'Classe'
        'FLGATIVA'#9'9'#9'Ativa'#9'F')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
    inherited pnlControles: TPanel [1]
      Width = 402
      Height = 130
      object lblClasseTitRenFixa: TLabel
        Left = 15
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object lblClasseRisco: TLabel
        Left = 15
        Top = 58
        Width = 92
        Height = 13
        Caption = 'Classe de Risco'
      end
      object dbeDescClasseTitRenFix: TDBEdit
        Left = 14
        Top = 27
        Width = 321
        Height = 21
        DataField = 'DESCCLASSETIT'
        DataSource = ds
        TabOrder = 0
      end
      object dbckFlgAtiva: TDBCheckBox
        Left = 14
        Top = 102
        Width = 83
        Height = 17
        Caption = 'Ativa ?'
        DataField = 'FLGATIVA'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblkCarteiraRF: TwwDBLookupCombo
        Left = 14
        Top = 74
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECLASSRISCO'#9'30'#9'Descrição'#9'F')
        DataField = 'IDCLASSERISCO'
        DataSource = ds
        LookupTable = CdsClasseRisco
        LookupField = 'IDCLASSRISCORENFIX'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 404
  end
  inherited Dock971: TDock97
    Top = 210
    Width = 404
    inherited tb97Fundo: TToolbar97
      Left = 232
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
    end
  end
  inherited pnlTitulo: TPanel
    Width = 404
    inherited lbNomItem: TfcLabel
      Width = 162
      Caption = 'Classe do Título'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 250
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 103
  end
  inherited ImlPadrao: TImageList
    Left = 296
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 280
    Top = 55
  end
  inherited Cds: TCMClientDataSet
    ProviderName = 'DataSetProvider1'
    Left = 268
    Top = 135
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSETITRENFIX.DESCCLASSETIT'
      'CLASSETITRENFIX.FLGATIVA')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Classe'
      'Ativa')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSETITRENFIX')
    CamposChave.Strings = (
      'CLASSETITRENFIX.IDCLASSETIT')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '1')
  end
  inherited CdsAux: TCMClientDataSet
    Left = 228
    Top = 135
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, CORCLASSRISCO'
      'FROM CLASSRISCORENFIX'
      'ORDER BY NIVELCLASSRISCO'
      ' ')
    ClientDataSet = Cds
    Left = 344
    Top = 135
  end
  object CdsClasseRisco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 148
    Top = 135
  end
end
