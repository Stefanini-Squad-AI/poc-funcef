inherited frmCadPrimCota: TfrmCadPrimCota
  Left = 401
  Top = 207
  HelpContext = 545021
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Cadastro de Cotas'
  ClientHeight = 352
  ClientWidth = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 266
    inherited dbGrd: TwwDBGrid [0]
      Width = 450
      Height = 264
      Selected.Strings = (
        'DATA'#9'13'#9'Data Base'
        'ATIVO'#9'60'#9'Patrimônio'#9'F'
        'NOMEPLANO'#9'40'#9'Plano'
        'NOMEPATRO'#9'40'#9'Patro'
        'VLRPATRIMONIO'#9'16'#9'Valor do Patrimônio'
        'VLRCOTA'#9'12'#9'Valor da Cota'
        'QTDCOTA'#9'10'#9'Qtd. Cotas')
    end
    inherited pnlControles: TPanel [1]
      Width = 450
      Height = 264
      object Label1: TLabel
        Left = 16
        Top = 74
        Width = 30
        Height = 13
        Caption = 'Ativo'
      end
      object Label2: TLabel
        Left = 16
        Top = 122
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label3: TLabel
        Left = 16
        Top = 170
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label4: TLabel
        Left = 320
        Top = 74
        Width = 93
        Height = 13
        Caption = 'Valor Patrimônio'
      end
      object Label5: TLabel
        Left = 320
        Top = 122
        Width = 60
        Height = 13
        Caption = 'Valor Cota'
      end
      object Label6: TLabel
        Left = 320
        Top = 170
        Width = 75
        Height = 13
        Caption = 'Quant. Cotas'
      end
      object Label7: TLabel
        Left = 16
        Top = 18
        Width = 60
        Height = 13
        Caption = 'Data Base'
      end
      object cmbPatrimonio: TCMDBLookupCombo
        Left = 16
        Top = 88
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsPatrimonio
        LookupField = 'DESCRICAO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cmbPlano: TCMDBLookupCombo
        Left = 16
        Top = 136
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPLANO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsPlano
        LookupField = 'NOMEPLANO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = cmbPlanoEnter
      end
      object cmbPatro: TCMDBLookupCombo
        Left = 16
        Top = 184
        Width = 265
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEPATRO'#9'40'#9'Descrição'#9'F')
        LookupTable = CdsPatro
        LookupField = 'NOMEPATRO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnEnter = cmbPatroEnter
      end
      object edValorPatri: TDBRealEdit
        Left = 320
        Top = 88
        Width = 105
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '500.000,00')
        TabOrder = 3
        WordWrap = False
        OnExit = edValorPatriExit
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPATRIMONIO'
        DataSource = ds
      end
      object edQtdCota: TwwDBEdit
        Left = 320
        Top = 184
        Width = 105
        Height = 21
        Color = clBtnFace
        DataField = 'QTDCOTA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 16
        Top = 32
        Width = 81
        Height = 21
        Color = clBtnFace
        DataField = 'DATA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object edValorCota: TwwDBEdit
        Left = 320
        Top = 136
        Width = 105
        Height = 21
        Color = clBtnFace
        DataField = 'VLRCOTA'
        DataSource = ds
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 452
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 313
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 280
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 922
    Top = 31
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 248
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 872
    Top = 31
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 320
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 280
    Top = 0
    object CdsDATA: TDateTimeField
      DisplayLabel = 'Data Base'
      DisplayWidth = 13
      FieldName = 'DATA'
    end
    object CdsNOMEPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 40
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object CdsNOMEPATRO: TStringField
      DisplayLabel = 'Patro'
      DisplayWidth = 40
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsVLRPATRIMONIO: TFloatField
      DisplayLabel = 'Valor do Patrimônio'
      DisplayWidth = 16
      FieldName = 'VLRPATRIMONIO'
      currency = True
    end
    object CdsVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 12
      FieldName = 'VLRCOTA'
      currency = True
    end
    object CdsQTDCOTA: TFloatField
      DisplayLabel = 'Qtd. Cotas'
      DisplayWidth = 10
      FieldName = 'QTDCOTA'
    end
    object CdsIDCOTACOTACAO: TFloatField
      FieldName = 'IDCOTACOTACAO'
      Visible = False
    end
    object CdsIDATIVOCOTA: TFloatField
      FieldName = 'IDATIVOCOTA'
      Visible = False
    end
    object CdsIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsIDPLANO: TFloatField
      FieldName = 'IDPLANO'
      Visible = False
    end
    object CdsATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 40
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'C.DATA'
      
        'DECODE(A.DESCRICAO,NULL,DECODE(A.IDINVESTIMENTO,NULL,DECODE(A.ID' +
        'TIPOCONTREMPTMO,NULL,DECODE(A.IDIMOVEL,NULL,DECODE(A.IDFUNDOINVE' +
        'ST,NULL,'#39#39',(SELECT DESCFUNDOINVEST FROM FUNDOINVEST WHERE IDFUND' +
        'OINVEST = A.IDFUNDOINVEST)),(SELECT IMONOME FROM IMOVEL WHERE ID' +
        'IMOVEL =  A.IDIMOVEL)),(SELECT TCEDESCRICAO FROM TIPOCONTREMPTMO' +
        '  WHERE  IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO)),(SELECT DESC' +
        'INVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO =  A.IDINVES' +
        'TIMENTO)),A.DESCRICAO) AS ATIVO'
      'PRV.NOME'
      'PTR.NOME'
      'C.VLRPATRIMONIO'
      'C.VLRCOTA'
      'C.QTDCOTA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Data Base'
      'Patrimônio'
      'Plano'
      'Patro'
      'Valor Patrimônio'
      'Valor Cota'
      'Qtd. Cotas')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTACOTACAO C'
      'ATIVOCOTA A'
      'PESSOA PTR'
      'PLANPREVCONTABIL PRV')
    CamposChave.Strings = (
      'C.IDCOTACOTACAO')
    Filtro.Strings = (
      'C.IDATIVOCOTA = A.IDATIVOCOTA'
      'C.IDPATRO = PTR.IDPESSOA'
      'C.IDPLANO = PRV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      'R$ #################,##'
      'R$ #####################,######'
      '')
    Larguras.Strings = (
      '13'
      '40'
      '40'
      '40'
      '15'
      '15'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 376
    Top = 0
  end
  object CdsPatrimonio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 132
  end
  object CdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 180
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 228
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  DECODE(A.DESCRICAO,NULL,'
      '     DECODE(A.IDINVESTIMENTO,NULL,'
      '        DECODE(A.IDTIPOCONTREMPTMO,NULL,'
      '           DECODE(A.IDIMOVEL,NULL,'
      '              DECODE(A.IDFUNDOINVEST,NULL,'#39#39','
      
        '              (SELECT  DESCFUNDOINVEST  FROM  FUNDOINVEST      W' +
        'HERE  IDFUNDOINVEST     =  A.IDFUNDOINVEST))  '
      
        '          ,(SELECT  IMONOME          FROM  IMOVEL           WHER' +
        'E  IDIMOVEL          =  A.IDIMOVEL))'
      
        '       ,(SELECT  TCEDESCRICAO     FROM  TIPOCONTREMPTMO  WHERE  ' +
        'IDTIPOCONTREMPTMO =  A.IDTIPOCONTREMPTMO))'
      
        '    ,(SELECT  DESCINVESTIMENTO FROM  INVESTIMENTO     WHERE  IDI' +
        'NVESTIMENTO    =  A.IDINVESTIMENTO))'
      ' ,A.DESCRICAO) AS ATIVO,'
      '              '
      ''
      '  C.IDCOTACOTACAO, C.DATA, C.IDATIVOCOTA, C.IDPATRO, '
      '  C.IDPLANO, C.VLRCOTA, C.VLRPATRIMONIO, C.QTDCOTA,  '
      '  PTR.NOME AS NOMEPATRO, PRV.NOME AS NOMEPLANO '
      'FROM '
      '  COTACOTACAO C, ATIVOCOTA A, PESSOA PTR, PLANPREVCONTABIL PRV '
      ''
      'WHERE '
      '  C.IDATIVOCOTA = A.IDATIVOCOTA '
      'AND '
      '  C.IDPATRO = PTR.IDPESSOA '
      'AND '
      '  C.IDPLANO = PRV.IDPLANOPREV ORDER BY A.DESCRICAO')
    Left = 104
    Top = 255
  end
end
