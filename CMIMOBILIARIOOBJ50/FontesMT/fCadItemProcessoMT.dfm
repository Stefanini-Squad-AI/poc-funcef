inherited frmCadItemProcessoMT: TfrmCadItemProcessoMT
  Left = 115
  Top = 147
  HelpContext = 640105
  Caption = 'Cadastro de Itens por Processo'
  ClientHeight = 289
  ClientWidth = 568
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 568
    Height = 203
    inherited pnlControles: TPanel
      Width = 566
      Height = 201
      object lblNomeRelatorio: TLabel
        Left = 17
        Top = 13
        Width = 52
        Height = 13
        Caption = 'Relatório'
      end
      object lblTipoInterno: TLabel
        Left = 17
        Top = 76
        Width = 70
        Height = 13
        Caption = 'Tipo Interno'
      end
      object lblMovimentacao: TLabel
        Left = 17
        Top = 139
        Width = 130
        Height = 13
        Caption = 'Tipo de Movimentação'
      end
      object dblComboRelatorio: TwwDBLookupCombo
        Left = 17
        Top = 26
        Width = 372
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NAME'#9'30'#9'Relatórios'#9'F')
        DataField = 'IDREPORTS'
        DataSource = ds
        LookupTable = cdsBuscaProcesso
        LookupField = 'IDREPORTS'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblComboRelatorioChange
      end
      object dblComboTipoInterno: TwwDBLookupCombo
        Left = 17
        Top = 89
        Width = 372
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Tipo Interno'#9'F')
        DataField = 'IDPROCESSOIMOB'
        DataSource = ds
        LookupTable = cdsTipoInterno
        LookupField = 'IDPROCESSOIMOB'
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblComboTipoInternoChange
      end
      object dblComboMovimentacao: TwwDBLookupCombo
        Left = 17
        Top = 152
        Width = 372
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'30'#9'Tipo de Movimentação'#9'F')
        DataField = 'IDTIPOCUSTORECIMO'
        DataSource = ds
        LookupTable = cdsTipoMovimentacao
        LookupField = 'IDTIPOCUSTORECIMO'
        Enabled = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 566
      Height = 201
      Selected.Strings = (
        'NOMETIPOINTERNO'#9'11'#9'Tipo Interno'
        'MOVIMENTACAO'#9'19'#9'Tipo de Movimentação'
        'PROCESSO'#9'44'#9'Relatório')
    end
  end
  inherited Dock972: TDock97
    Width = 568
  end
  inherited Dock971: TDock97
    Top = 250
    Width = 568
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 29
    Top = 252
  end
  inherited ds: TwwDataSource
    Left = 384
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 1
    Top = 252
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 320
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 366
    Top = 2
    object CdsNOMETIPOINTERNO: TStringField
      DisplayLabel = 'Tipo Interno'
      DisplayWidth = 11
      FieldName = 'NOMETIPOINTERNO'
      Size = 30
    end
    object CdsMOVIMENTACAO: TStringField
      DisplayLabel = 'Tipo de Movimentação'
      DisplayWidth = 19
      FieldName = 'MOVIMENTACAO'
      Size = 60
    end
    object CdsPROCESSO: TStringField
      DisplayLabel = 'Relatório'
      DisplayWidth = 44
      FieldName = 'PROCESSO'
      Size = 100
    end
    object CdsTIPOINTERNO2: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOINTERNO'
      Visible = False
    end
    object CdsIDPROCESSOIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCESSOIMOB'
      Visible = False
    end
    object CdsIDREPORTS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREPORTS'
      Visible = False
    end
    object CdsIDITEMXPROCIMOB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMXPROCIMOB'
      Visible = False
    end
    object CdsIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P.DESCRICAO'
      'T.DESCCUSTORECIMO'
      'R.NAME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo Interno'
      'Tipo de Movimentação'
      'Relatório')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROCESSOIMOB P'
      'ITEMXPROCESSOIMOB I'
      'TIPOCUSTORECIMOV T'
      'REPORTS R')
    CamposChave.Strings = (
      'P.IDPROCESSOIMOB'
      'P.IDREPORTS'
      'P.TIPOINTERNO'
      'P.DESCRICAO'
      'P.IDMODULO'
      'I.IDITEMXPROCIMOB'
      'T.IDTIPOCUSTORECIMO'
      'T.DESCCUSTORECIMO'
      'T.RECCUSTO'
      'R.NAME')
    Filtro.Strings = (
      'I.IDPROCESSOIMOB = P.IDPROCESSOIMOB'
      'I.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+)'
      'P.IDREPORTS = R.IDREPORTS')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '30'
      '36')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 260
    Top = 2
  end
  object cdsBuscaProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 126
    Top = 58
    object cdsBuscaProcessoNAME: TStringField
      DisplayLabel = 'Relatórios'
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 100
    end
    object cdsBuscaProcessoIDREPORTS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREPORTS'
      Visible = False
    end
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      '--SELECT IDPROCESSOIMOB, TIPOINTERNO, DESCRICAO'
      '--FROM PROCESSOIMOB'
      '--WHERE IDREPORTS = 20340'
      ''
      '--SELECT DISTINCT B.IDREPORTS, R.NAME, B.IDPROCESSOIMOB'
      '--FROM PROCESSOIMOB B, REPORTS R'
      '--WHERE B.IDREPORTS = R.IDREPORTS'
      '--  AND B.IDMODULO  = 64'
      ''
      '--SELECT TIPOINTERNO, DESCRICAO'
      '--FROM PROCESSOIMOB'
      '--WHERE IDREPORTS = 20340'
      ' '
      ' '
      ' '
      
        'SELECT DISTINCT P.DESCRICAO AS NOMETIPOINTERNO, T.DESCCUSTORECIM' +
        'O AS MOVIMENTACAO, R.NAME AS PROCESSO,'
      
        '                P.TIPOINTERNO, P.IDPROCESSOIMOB, P.IDREPORTS, I.' +
        'IDITEMXPROCIMOB, T.IDTIPOCUSTORECIMO'
      
        'FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I, TIPOCUSTORECIMOV T, RE' +
        'PORTS R'
      'WHERE I.IDPROCESSOIMOB    = P.IDPROCESSOIMOB'
      '  AND I.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+)'
      '  AND P.IDREPORTS         = R.IDREPORTS'
      'ORDER BY NOMETIPOINTERNO ')
    Left = 361
    Top = 104
  end
  object cdsTipoInterno: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 54
    Top = 114
    object cdsTipoInternoDESCRICAO: TStringField
      DisplayLabel = 'Tipo Interno'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object cdsTipoInternoTIPOINTERNO: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOINTERNO'
      Visible = False
    end
    object cdsTipoInternoIDPROCESSOIMOB: TFloatField
      FieldName = 'IDPROCESSOIMOB'
    end
  end
  object dsTipoInterno: TwwDataSource
    DataSet = cdsTipoInterno
    Left = 72
    Top = 130
  end
  object cdsTipoMovimentacao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 78
    Top = 186
    Data = {
      EE0600009619E0BD010000001800000002003A00000003000000650011494454
      49504F435553544F524543494D4F08000400000000000F44455343435553544F
      524543494D4F0100490000000100055749445448020002003C000100044C4349
      4404000100090800000000000000000000444013416C75677565697320616E74
      6572696F7265730000000000000000244007416C756775656C00000000000000
      00574010414C554755454C2053484F5050494E47000000000000000043400B41
      6C756775656C20312F3200000000000000003140164173736573736F72696120
      496D6F62696C6961726961000000000000008042401263657373E36F20646520
      6469726569746F730000000000000000374009434F4D495353D5455300000000
      00000000264012436F6E646F6D696E696F206520546178617300000000000000
      00414022436F6E646F6D696E696F732065205461786173202841205265656D62
      6F6C736172290000000000000000004013436F6E66697373616F206465204469
      76696461000000000000000046400443504D4600000000000000804340224375
      73746173204A7564696369616973202D2049505455202845642E205365646529
      0000000000000000454015446573636F6E746F7320636F6E63656469646F7320
      000000000000000036400B44657370616368616E746500000000000000002A40
      0B64657370616368616E74650000000000000080454011446573706573617320
      44697665727361730000000000000000084012456E636F6E74726F2064652063
      6F6E74617300000000000000002E4010456E657267696120456C657472696361
      000000000000008057401F454E455247494120454C4554524943412028412052
      45454D424F4C5341522900000000000000002C4004466F726F00000000000000
      0033401046756E646F2064652052657365727661000000000000008048401049
      6D706F73746F2064652052656E64610000000000000000284004495054550000
      00000000008041401349505455202841205265656D626F6C7361722900000000
      000000004040044954424900000000000000004F40274D616E75742E20417220
      436F6E646963696F6E61646F20282061207265656D626F6C7361722029000000
      00000000003440154D616E7574656E63616F2064652050726564696F73000000
      00000000805340244D414E5554454EC7C34F204445205052C944494F53202841
      205245454D424F4C5341522900000000000000405040104D554C544120524553
      434953D352494100000000000000804440104D756C7461207265736369736F72
      6961000000000000000042400F4F757472617320446573706573617300000000
      000000804E40114F7574726F73205265656D626F6C736F730000000000000080
      4F400750617263656C610000000000000000144016506C616E6F206465205265
      766974616C697A6163616F0000000000000000F03F1350726F647563616F2065
      20616E756E63696F7300000000000000804C4014526563656974612064652041
      6C69656E61E7E36F00000000000000804A401652656365697461204573746163
      696F6E616D656E746F00000000000000004B400C5265656D622E204C69676874
      00000000000000004E40195265656D626F6C736F20617220636F6E646963696F
      6E61646F00000000000000001C40175265656D626F6C736F20646520436F6E64
      6F6D696E696F00000000000000004C401D5265656D626F6C736F20646520456E
      657267696120456C65747269636100000000000000001840125265656D626F6C
      736F20646520495054552000000000000000804940135265656D626F6C736F20
      64652053656775726F00000000000000804D401A5265656D626F6C736F20456E
      657267696120456CE9747269636100000000000000003E40105265656D626F6C
      736F2049505455203200000000000000004D401A5265656D626F6C736F207461
      786120646520496E63656E64696F00000000000000001040135265656D626F6C
      736F73206469766572736F73000000000000008050400653454755524F000000
      000000000032400653656775726F000000000000000050401153454755524F20
      5245454D424F4C53415200000000000000003F4015546178612064652041646D
      696E697374726163E36F00000000000000804040105461786120646520496E63
      656E64696F000000000000000049401D5461786120646520496E63656E64696F
      2061205265656D626F6C73617200000000000000804B401B5461786120456E65
      72676961202861207265656D626F6C7361722900000000000000004A400A5461
      7861204578747261000000000000000030400854656C65666F6E650000000000
      0000C056401754656C65666F6E65202861207265656D626F6C73617229000000
      000000000035400A566967696C616E636961}
    object cdsTipoMovimentacaoDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Movimentação'
      DisplayWidth = 30
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsTipoMovimentacaoIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
  end
  object dsTipoMovimentacao: TwwDataSource
    DataSet = cdsTipoMovimentacao
    Left = 96
    Top = 202
  end
  object dsBuscaProcesso: TwwDataSource
    DataSet = cdsBuscaProcesso
    Left = 144
    Top = 74
  end
end
