inherited frmCadClassRiscoRenFixMT: TfrmCadClassRiscoRenFixMT
  Top = 197
  HelpContext = 790065
  Caption = 'Cadastro'
  ClientHeight = 226
  ClientWidth = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 364
    Height = 109
    inherited pnlControles: TPanel
      Width = 362
      Height = 107
      object Label1: TLabel
        Left = 14
        Top = 14
        Width = 146
        Height = 13
        Caption = 'Nome da Classe de Risco'
      end
      object Label2: TLabel
        Left = 256
        Top = 14
        Width = 32
        Height = 13
        Caption = 'Nível'
      end
      object Label3: TLabel
        Left = 300
        Top = 14
        Width = 20
        Height = 13
        Caption = 'Cor'
      end
      object dbeNome: TwwDBEdit
        Left = 14
        Top = 30
        Width = 235
        Height = 21
        DataField = 'NOMECLASSRISCO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbsNivel: TwwDBSpinEdit
        Left = 256
        Top = 30
        Width = 37
        Height = 21
        Increment = 1
        MaxValue = 100
        MinValue = 1
        Value = 1
        DataField = 'NIVELCLASSRISCO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object dbcCor: TfcColorCombo
        Left = 300
        Top = 30
        Width = 36
        Height = 21
        ButtonStyle = cbsEllipsis
        Color = clWhite
        ColorDialogOptions = [cdoPreventFullOpen, cdoAnyColor]
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.Options = [ccoShowSystemColors, ccoShowColorNone, ccoShowCustomColors, ccoShowStandardColors, ccoShowColorNames, ccoGroupSystemColors]
        DropDownCount = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 2
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 362
      Height = 107
      Selected.Strings = (
        'NOMECLASSRISCO'#9'60'#9'Classe de Risco')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited Dock972: TDock97
    Width = 364
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 364
    inherited tb97Fundo: TToolbar97
      Left = 192
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 23
    end
  end
  inherited pnlTitulo: TPanel
    Width = 364
    inherited lbNomItem: TfcLabel
      Width = 228
      Caption = 'Classificação de Risco'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 216
  end
  inherited Cds: TCMClientDataSet
    Left = 148
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CLASSRISCORENFIX.NOMECLASSRISCO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Classe de Risco')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CLASSRISCORENFIX')
    CamposChave.Strings = (
      'CLASSRISCORENFIX.IDCLASSRISCORENFIX')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDCLASSRISCORENFIX, NOMECLASSRISCO, NIVELCLASSRISCO, CORC' +
        'LASSRISCO'
      'FROM CLASSRISCORENFIX'
      'ORDER BY NOMECLASSRISCO')
    ClientDataSet = Cds
    Left = 304
    Top = 151
  end
end
