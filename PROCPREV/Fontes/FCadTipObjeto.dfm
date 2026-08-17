inherited frmCadTipObjeto: TfrmCadTipObjeto
  Left = 236
  Top = 182
  Width = 468
  Height = 336
  Caption = 'Tipos de Objeto Reclamado em Processos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 460
    Height = 223
    inherited dbGrd: TwwDBGrid [0]
      Width = 450
      Height = 213
      Selected.Strings = (
        'CODTIPOOBJETO'#9'6'#9'Código'
        'DESCRICAO'#9'45'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 450
      Height = 213
      object Label1: TLabel
        Left = 45
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 45
        Top = 115
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = dbedDescricao
      end
      object Label3: TLabel
        Left = 45
        Top = 156
        Width = 100
        Height = 13
        Caption = 'Grupo de Objetos'
      end
      object DBEdit1: TDBEdit
        Left = 45
        Top = 24
        Width = 49
        Height = 21
        DataField = 'CODTIPOOBJETO'
        DataSource = ds
        TabOrder = 0
      end
      object dbedDescricao: TDBEdit
        Left = 45
        Top = 130
        Width = 360
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object dblcGrpObjeto: TwwDBLookupCombo
        Left = 45
        Top = 171
        Width = 360
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'IDGRUPOOBJETO'
        DataSource = ds
        LookupTable = qryGrpObjeto
        LookupField = 'IDGRUPOOBJETO'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbrgRubrica: TDBRadioGroup
        Left = 120
        Top = 12
        Width = 287
        Height = 34
        Caption = 'Objeto Relacionado a uma Rubrica de Folha ?'
        Columns = 2
        DataField = 'FLGPROVDESC'
        DataSource = ds
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 3
        Values.Strings = (
          '1'
          '0')
        OnClick = dbrgRubricaClick
      end
      object gbxRubrica: TGroupBox
        Left = 45
        Top = 57
        Width = 360
        Height = 49
        Caption = 'Rubrica Relacionada'
        TabOrder = 4
        object dblcRubrica: TwwDBLookupCombo
          Left = 7
          Top = 19
          Width = 345
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'80'#9'DESCRICAO')
          DataField = 'IDPROVENTO'
          DataSource = ds
          LookupTable = qryRubrica
          LookupField = 'IDPROVENTO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblcRubricaCloseUp
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 460
  end
  inherited Dock971: TDock97
    Top = 270
    Width = 460
    inherited tb97Fundo: TToolbar97
      Left = 290
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited ds: TwwDataSource
    DataSet = tblTipObjeto
    Left = 408
    Top = 5
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 285
    Top = 65534
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 354
    Top = 0
  end
  object tblTipObjeto: TwwTable
    AfterInsert = tblTipObjetoAfterInsert
    DatabaseName = 'BaseDados'
    Filter = 'CLASSEOBJ = '#39'1'#39
    Filtered = True
    IndexFieldNames = 'CODTIPOOBJETO'
    TableName = 'CM.TIPOOBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 93
    Top = 86
  end
  object qryGrpObjeto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDGRUPOOBJETO, DESCRICAO'
      'From  GRPOBJPROCJUR'
      'Order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 380
    Top = 70
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, DESCRICAO'
      'From  PROVDESC'
      'Order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 395
    Top = 163
  end
end
