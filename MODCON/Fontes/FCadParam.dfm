inherited frmCadParam: TfrmCadParam
  Left = 251
  Top = 204
  Caption = 'Parâmetros do Sistema'
  ClientWidth = 399
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 399
    object Label12: TLabel
      Left = 43
      Top = 81
      Width = 314
      Height = 13
      Caption = 'Indice Padrão de Atualização Monetária dos Processos'
    end
    object dblcMoeda: TwwDBLookupCombo
      Left = 43
      Top = 99
      Width = 314
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MOEDESC'#9'20'#9'Descrição'
        'MOESIGLA'#9'10'#9'Sigla')
      DataField = 'MOEDAPROCTRAB'
      DataSource = ds
      LookupTable = qryMoeda
      LookupField = 'MOECODIGO'
      Options = [loColLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object gbxIntegraCont: TGroupBox
      Left = 43
      Top = 15
      Width = 314
      Height = 55
      Caption = 'Integração Contábil'
      TabOrder = 1
      object dbrgIntegraCont: TDBRadioGroup
        Left = 12
        Top = 12
        Width = 133
        Height = 33
        Columns = 2
        DataField = 'FLGINTEGRACONT'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
        OnChange = dbrgIntegraContChange
      end
      object dbrgSubConta: TDBRadioGroup
        Left = 172
        Top = 12
        Width = 133
        Height = 33
        Caption = 'Cria Sub Conta ?'
        Columns = 2
        DataField = 'FLGCRIASUBCONTA'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
    end
    object dbrgIntegraCAP: TDBRadioGroup
      Left = 43
      Top = 143
      Width = 314
      Height = 40
      Caption = 'Integração com Contas a Pagar'
      Columns = 2
      DataField = 'FLGINTEGRACAP'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
      Values.Strings = (
        '1'
        '0')
      OnChange = dbrgIntegraContChange
    end
  end
  inherited Dock972: TDock97
    Width = 399
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Width = 399
    inherited tb97Fundo: TToolbar97
      Left = 213
      DockPos = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 9
      DockPos = 9
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
      Visible = False
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblParam
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 21
    Top = 83
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  MOECODIGO, MOEDESC, MOESIGLA '
      'from MOEDA '
      'order by upper(MOEDESC)')
    ValidateWithMask = True
    Left = 318
    Top = 197
  end
end
