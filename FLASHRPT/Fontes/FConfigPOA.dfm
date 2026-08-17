inherited frmConfigPOA: TfrmConfigPOA
  Left = 337
  Top = 196
  Caption = 'Configuração do POA'
  ClientHeight = 290
  ClientWidth = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 471
    Height = 204
    inherited pnlControles: TPanel
      Width = 461
      Height = 194
      object lblLInha: TLabel
        Left = 28
        Top = 113
        Width = 146
        Height = 13
        Caption = 'Linha relativa do relatório'
      end
      object Label1: TLabel
        Left = 28
        Top = 62
        Width = 156
        Height = 13
        Caption = 'Elemento do Demonstrativo'
      end
      object Label2: TLabel
        Left = 28
        Top = 11
        Width = 82
        Height = 13
        Caption = 'Demonstrativo'
      end
      object dbcbLinhas: TwwDBComboBox
        Left = 30
        Top = 130
        Width = 401
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        ShowMatchText = True
        DataField = 'IDLINHARELAT'
        DataSource = ds
        DropDownCount = 10
        ItemHeight = 0
        Items.Strings = (
          'Total Rooms'#9'1'
          'Less Out of Order Rooms'#9'2'
          'Less House Use Rooms'#9'3'
          'Sallable Rooms'#9'4'
          'Occupied Rooms Pais'#9'5'
          'Complimentary Rooms'#9'6'
          'Total Occupied Rooms'#9'7'
          '% Occupancy'#9'8'
          'Average Daily Rate'#9'9'
          'Revenue Per Avaliable Room'#9'10'
          '# of Rooms Occupied by Groups'#9'11'
          'Group Business - Room Nights Contribution %'#9'12'
          'ADR for Group Business'#9'13'
          '# of Rooms Occupied by Transient Guest'#9'14'
          'Transient Business - Room Nights Contribution %'#9'15'
          'ADR for Transient Business'#9'16'
          '# of Rooms Occupied by Repeat Guest'#9'17'
          'Repeat Guest - Room Nights Contribution %'#9'18'
          '# of Rooms Occupied by Choice RS'#9'19'
          'Choice RS - Room Nights Contribution %'#9'20'
          '# of Rooms Occupied by Stay Overs'#9'21'
          'Stay Overs - Room Nights Contribution %'#9'22'
          '# of Rooms Not Occupied due to Early Departures'#9'23'
          'Early Departures - Lost Room Nights Contribution %'#9'24'
          '# of Rooms Occupied by Same Day Reservations'#9'25'
          'Same Day Reservations - Room Nights Contribution %'#9'26'
          '# of Rooms Occupied by Walk-ins'#9'27'
          'Walk-ins - Room Nights Contribution %'#9'28'
          '# of Rooms Not Occupied due to No-Show'#9'29'
          'No-Show - Lost Room Nights Contribution %'#9'30'
          '# Total of Guests'#9'31'
          'Guests per Occupied Room'#9'32'
          '# of Check-ins'#9'33'
          'Average Length of Stay'#9'34'
          'Covers'#9'35'
          'Average Check'#9'36')
        Sorted = False
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object dbDemonst: TwwDBLookupCombo
        Left = 30
        Top = 28
        Width = 399
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DEMDESCDEMONSTRAT'#9'60'#9'Descrição')
        DataField = 'IDDEMONSTRATIVO'
        DataSource = ds
        LookupTable = qryDemonst
        LookupField = 'IDDEMONSTRATIVO'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dbDemonstExit
      end
      object dblkElemDemo: TwwDBLookupCombo
        Left = 30
        Top = 78
        Width = 399
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'ELEDESCELEM'#9'60'#9'Descrição')
        DataField = 'IDELEMDEMONSTRAT'
        DataSource = ds
        LookupTable = qryElemDemo
        LookupField = 'IDELEMDEMONSTRAT'
        Options = [loColLines, loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbckRateio: TDBCheckBox
        Left = 32
        Top = 164
        Width = 97
        Height = 17
        Caption = 'Utiliza Rateio'
        DataField = 'FLGRATEIO'
        DataSource = ds
        TabOrder = 3
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 461
      Height = 194
      Selected.Strings = (
        'IDDEMONSTRATIVO'#9'12'#9'Demonstrativo'
        'IDELEMDEMONSTRAT'#9'21'#9'Elemento do demonstrativo'
        'IDLINHARELAT'#9'13'#9'Linha do relatório'
        'FLGRATEIO'#9'5'#9'Rateio')
      Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      TitleAlignment = taCenter
      TitleButtons = True
      OnTitleButtonClick = dbGrdTitleButtonClick
    end
  end
  inherited Dock972: TDock97
    Width = 471
  end
  inherited Dock971: TDock97
    Top = 251
    Width = 471
    inherited tb97Fundo: TToolbar97
      Left = 287
      DockPos = 287
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 119
      DockPos = 119
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select IDLRELATELEMDEMO, IDHOTEL, IDLINHARELAT,'
      '       IDDEMONSTRATIVO, IDELEMDEMONSTRAT, FLGRATEIO'
      'from LRELATXELEMDEMO'
      'WHERE IDHOTEL = :IDHOTEL'
      'ORDER BY IDLINHARELAT')
    ControlType.Strings = (
      'FLGRATEIO;CheckBox;S;N')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHOTEL'
        ParamType = ptUnknown
      end>
    object qryIDDEMONSTRATIVO: TFloatField
      DisplayLabel = 'Demonstrativo'
      DisplayWidth = 12
      FieldName = 'IDDEMONSTRATIVO'
      Origin = 'LRELATXELEMDEMO.IDDEMONSTRATIVO'
    end
    object qryIDELEMDEMONSTRAT: TFloatField
      DisplayLabel = 'Elemento do demonstrativo'
      DisplayWidth = 21
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'LRELATXELEMDEMO.IDELEMDEMONSTRAT'
    end
    object qryIDLINHARELAT: TFloatField
      DisplayLabel = 'Linha do relatório'
      DisplayWidth = 13
      FieldName = 'IDLINHARELAT'
      Origin = 'LRELATXELEMDEMO.IDLINHARELAT'
    end
    object qryFLGRATEIO: TStringField
      DisplayLabel = 'Rateio'
      DisplayWidth = 5
      FieldName = 'FLGRATEIO'
      Origin = 'LRELATXELEMDEMO.FLGRATEIO'
      Size = 1
    end
    object qryIDLRELATELEMDEMO: TFloatField
      DisplayLabel = 'Elemento do demonstrativo'
      DisplayWidth = 22
      FieldName = 'IDLRELATELEMDEMO'
      Origin = 'LRELATXELEMDEMO.IDLRELATELEMDEMO'
      Visible = False
    end
    object qryIDHOTEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHOTEL'
      Origin = 'LRELATXELEMDEMO.IDHOTEL'
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LRELATXELEMDEMO'
      'set'
      '  IDLRELATELEMDEMO = :IDLRELATELEMDEMO,'
      '  IDHOTEL = :IDHOTEL,'
      '  IDLINHARELAT = :IDLINHARELAT,'
      '  IDDEMONSTRATIVO = :IDDEMONSTRATIVO,'
      '  IDELEMDEMONSTRAT = :IDELEMDEMONSTRAT,'
      '  FLGRATEIO = :FLGRATEIO'
      'where'
      '  IDLRELATELEMDEMO = :OLD_IDLRELATELEMDEMO')
    InsertSQL.Strings = (
      'insert into LRELATXELEMDEMO'
      
        '  (IDLRELATELEMDEMO, IDHOTEL, IDLINHARELAT, IDDEMONSTRATIVO, IDE' +
        'LEMDEMONSTRAT, FLGRATEIO)'
      'values'
      
        '  (:IDLRELATELEMDEMO, :IDHOTEL, :IDLINHARELAT, :IDDEMONSTRATIVO,' +
        ' :IDELEMDEMONSTRAT, :FLGRATEIO)')
    DeleteSQL.Strings = (
      'delete from LRELATXELEMDEMO'
      'where'
      '  IDLRELATELEMDEMO = :OLD_IDLRELATELEMDEMO')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Selecionar Campo'
    Colunas.Strings = (
      'LRELATXELEMDEMO.IDDEMONSTRATIVO'
      'LRELATXELEMDEMO.IDELEMDEMONSTRAT'
      'LRELATXELEMDEMO.IDLINHARELAT')
    TipodeDado.Strings = (
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Demonstrativo'
      'Elemento do demonstrativo'
      'Linha do relatório')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LRELATXELEMDEMO')
    CamposChave.Strings = (
      'LRELATXELEMDEMO.IDLRELATELEMDEMO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryElemDemo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select IDELEMDEMONSTRAT, ELEDESCELEM, IDDEMONSTRATIVO'
      'from ELEMDEMONSTRATIVO'
      'where IDDEMONSTRATIVO = :IDDEMO'
      'order by IDELEMDEMONSTRAT')
    ValidateWithMask = True
    Left = 493
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDDEMO'
        ParamType = ptUnknown
      end>
    object qryElemDemoIDELEMDEMONSTRAT: TFloatField
      FieldName = 'IDELEMDEMONSTRAT'
      Origin = 'ELEMDEMONSTRATIVO.IDELEMDEMONSTRAT'
    end
    object qryElemDemoELEDESCELEM: TStringField
      FieldName = 'ELEDESCELEM'
      Origin = 'ELEMDEMONSTRATIVO.ELEDESCELEM'
      Size = 60
    end
    object qryElemDemoIDDEMONSTRATIVO: TFloatField
      FieldName = 'IDDEMONSTRATIVO'
      Origin = 'ELEMDEMONSTRATIVO.IDDEMONSTRATIVO'
    end
  end
  object qryDemonst: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT D.IDDEMONSTRATIVO,'
      '       D.DEMDESCDEMONSTRAT'
      'FROM   DEMONSTRATIVO D'
      'WHERE'
      '      (D.IDPESSOA    = :IDPESSOA)'
      'ORDER BY D.DEMDESCDEMONSTRAT'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 497
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDemonstIDDEMONSTRATIVO: TFloatField
      FieldName = 'IDDEMONSTRATIVO'
      Origin = 'DEMONSTRATIVO.IDDEMONSTRATIVO'
    end
    object qryDemonstDEMDESCDEMONSTRAT: TStringField
      FieldName = 'DEMDESCDEMONSTRAT'
      Origin = 'DEMONSTRATIVO.DEMDESCDEMONSTRAT'
      Size = 60
    end
  end
end
