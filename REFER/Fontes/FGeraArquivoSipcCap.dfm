inherited FrmGeraArquivoSipcCap: TFrmGeraArquivoSipcCap
  Left = 275
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerar Arquivo SIPCCAP - REFER'
  ClientHeight = 515
  ClientWidth = 535
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 26
    Top = 107
    Width = 124
    Height = 13
    Caption = 'Cód. Plano de Contas'
  end
  inherited pnlFundo: TPanel
    Width = 535
    Height = 476
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 128
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 351
      Top = 16
      Width = 95
      Height = 13
      Caption = 'Cód.da Entidade'
    end
    object Label2: TLabel
      Left = 23
      Top = 67
      Width = 130
      Height = 13
      Caption = 'Cód SPC Plano Contas'
    end
    object Label6: TLabel
      Left = 24
      Top = 388
      Width = 274
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Caminho onde será gravado o BALANCETE.TXT'
    end
    object Label7: TLabel
      Left = 24
      Top = 116
      Width = 160
      Height = 13
      Caption = 'Cód SPC - Plano Benefícios'
    end
    object dblkExercicio: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PEREXERCICIO'#9'10'#9'Exercício')
      DataField = 'PEREXERCI'
      LookupTable = cdsExercicio
      LookupField = 'PEREXERCICIO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnCloseUp = dblkExercicioCloseUp
    end
    object dblkPeriodo: TwwDBLookupCombo
      Left = 128
      Top = 32
      Width = 203
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PERNOME'#9'25'#9'Nome')
      DataField = 'PEREXERCI'
      LookupTable = cdsPeriodo
      LookupField = 'PERNUMERO'
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object edtEntidade: TEdit
      Left = 351
      Top = 32
      Width = 144
      Height = 21
      MaxLength = 5
      TabOrder = 2
    end
    object edtPlanoContas: TDBRealEdit
      Left = 23
      Top = 83
      Width = 146
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object rgTotalizacao: TRadioGroup
      Left = 256
      Top = 73
      Width = 249
      Height = 81
      Caption = 'Totalização'
      ItemIndex = 0
      Items.Strings = (
        '&Consolidado'
        'Por &Plano de Benefícios')
      TabOrder = 4
      OnClick = rgTotalizacaoClick
    end
    object edtPath: TEdit
      Left = 24
      Top = 402
      Width = 279
      Height = 21
      TabStop = False
      Anchors = [akLeft, akBottom]
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 5
    end
    object btnSelecionar: TBitBtn
      Left = 303
      Top = 400
      Width = 25
      Height = 24
      Anchors = [akLeft, akBottom]
      TabOrder = 6
      OnClick = btnSelecionarClick
      Glyph.Data = {
        16010000424D1601000000000000760000002800000010000000140000000100
        040000000000A000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880088888888888880910888888888888089108888888888880890000088
        88888880800FFF088888888800FFFFF0888888880FFFFFFF0888870008888888
        0088800B0F8F8F8F0B088007B0F8F8F0B70880B07B0F8F0B7B0880F0B7B777B7
        B7B080BF0B7B7B7B7B7080FBF0000000000880BFBFBFBFBFB08880FBFBFBFBFB
        F08880BFB0000000078887000788888888888888888888888888}
    end
    object pgbStatus: TProgressBar
      Left = 1
      Top = 455
      Width = 533
      Height = 20
      Align = alBottom
      Min = 0
      Max = 0
      Step = 1
      TabOrder = 7
    end
    object pnlGrids: TPanel
      Left = 24
      Top = 177
      Width = 489
      Height = 185
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 8
      object dbgrPlanoPrev: TwwDBGrid
        Left = 2
        Top = 2
        Width = 240
        Height = 181
        Selected.Strings = (
          'MARCA'#9'1'#9'Imp.'#9'F'
          'NOME'#9'50'#9'Plano'#9'F'
          'IDPLANOPREV'#9'10'#9'Código'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alLeft
        DataSource = dsPlanoPrevG
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object dbgrPatro: TwwDBGrid
        Left = 242
        Top = 2
        Width = 245
        Height = 181
        Selected.Strings = (
          'MARCA'#9'1'#9'Imp.'#9'F'
          'NOME'#9'60'#9'Patrocinadora'#9'F'
          'IDPESSOA'#9'10'#9'Código'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
        Align = alClient
        DataSource = dsPatroG
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object edtPlanoBenef: TDBRealEdit
      Left = 23
      Top = 133
      Width = 146
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 9
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 476
    Width = 535
    inherited tb97Fundo: TToolbar97
      Left = 363
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 65515
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object cdsExercicio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 16
  end
  object ProcuraDir: TProcuraDirDlg
    Caption = 'Gravar arquivo de balancete em: '
    ShowPath = False
    OnSelectionChanged = ProcuraDirSelectionChanged
    Left = 336
    Top = 400
  end
  object sqlPlanoPrevG: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANOPREV, NOME, '#39'N'#39' AS MARCA'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY'
      '   NOME'
      '')
    ClientDataSet = cdsPlanoPrevG
    Left = 201
    Top = 251
  end
  object cdsPlanoPrevG: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ControlType.Strings = (
      'MARCA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 202
    Top = 224
  end
  object dsPatroG: TwwDataSource
    DataSet = cdsPatroG
    Left = 457
    Top = 275
  end
  object dsPlanoPrevG: TwwDataSource
    DataSet = cdsPlanoPrevG
    Left = 198
    Top = 289
  end
  object cdsPatroG: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ControlType.Strings = (
      'MARCA;CheckBox;S;N')
    ValidateWithMask = True
    Left = 448
    Top = 200
  end
  object sqlPatroG: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   PA.IDPESSOA, PE.NOME, '#39'N'#39' AS MARCA'
      'FROM'
      '   PESSOA PE,'
      '   PATRO PA'
      'WHERE'
      '   (PA.IDPESSOA = PE.IDPESSOA)'
      'ORDER BY'
      '   PE.NOME'
      '')
    ClientDataSet = cdsPatroG
    Left = 449
    Top = 235
  end
  object SqlBalancete: TCMSqlParams
    ClientDataSet = cdsBalancete
    Left = 412
    Top = 352
  end
  object sqlPorPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   /*+RULE*/'
      '   PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA,'
      '   SUM(S.DEB) AS DEB,'
      '   SUM(S.CRED) AS CRED,'
      '   SUM(SA.SALDOANT) AS SALDOANT'#39
      'FROM'
      
        '   (SELECT C.PLANO, C.PLACONTA, C.PLANATUREZA, PPC.IDPLANOPREV, ' +
        'PPC.IDPATRO'
      '    FROM PLANOCONTA C, PLANPREVCONTABPATRO PPC'
      
        '    WHERE (C.PLANO = :PLANO) AND (C.PLASECRETARIA = '#39'S'#39') ) PLANO' +
        ','
      '   (SELECT'
      '       IDPLANOPREV,'
      '       IDPATRO,'
      '       PLACONTA,'
      '       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,'
      '       SUM(NVL(PLSCREDITOCOR,0)) AS CRED'
      '    FROM PLANOSALDO'
      '    WHERE (PLANO = :PLANO)'
      '      AND (PEREXERCICIO = :EXERCICIO)'
      '      AND (PERNUMERO = :PERIODO)'
      '      AND (IDPESSOA = :IDPESSOA)'
      ''
      '      ALEX MONTAR LISTA DE PLANOS E PATROS'
      '      AND (IDPLANOPREV IN  )'
      '      AND (IDPATRO IN )'
      '      FIM ALEX MONTAR LISTA DE PLANOS E PATROS'
      ''
      '    GROUP BY PLACONTA, IDPLANOPREV, IDPATRO ) S,'
      '   (SELECT'
      '       IDPLANOPREV,IDPATRO,'
      
        '       PLACONTA, SUM(NVL(PLSDEBITOCORRENTE, 0) - NVL(PLSCREDITOC' +
        'OR, 0)) AS SALDOANT'
      '    FROM PLANOSALDO'
      '    WHERE (PLANO = :PLANO)'
      '      AND (PEREXERCICIO = :EXERCICIO)'
      '      AND ((PERNUMERO < :PERIODO) OR (PERNUMERO IS NULL))'
      '      AND (IDPESSOA = :IDPESSOA)'
      ''
      '      ALEX MONTAR LISTA DE PLANOS E PATROS'
      '      AND (IDPLANOPREV IN  )'
      '      AND (IDPATRO IN )'
      '      FIM ALEX MONTAR LISTA DE PLANOS E PATROS'
      ''
      '    GROUP BY PLACONTA, IDPLANOPREV, IDPATRO ) SA'
      'WHERE'
      '    (PLANO.PLACONTA = S.PLACONTA(+))'
      '    AND (PLANO.IDPLANOPREV = S.IDPLANOPREV(+))'
      '    AND (PLANO.IDPATRO = S.IDPATRO(+))'
      '    AND (PLANO.PLACONTA = SA.PLACONTA(+))'
      '    AND (PLANO.IDPLANOPREV = SA.IDPLANOPREV(+))'
      '    AND (PLANO.IDPATRO = SA.IDPATRO(+))'
      '    AND ((S.DEB <> 0) OR (S.CRED <> 0) OR (SA.SALDOANT <> 0))'
      'GROUP BY PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA'
      'ORDER BY PLACONTA ASC'
      '')
    Left = 488
    Top = 352
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 8
  end
  object cdsEntidade: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 88
  end
  object cdsBalancete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 417
  end
  object SqlEntidade: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   F.CODFUNDSPC'
      ''
      'FROM'
      '   FUNDACAO F,'
      '   EMPRESAPROP E'
      'WHERE'
      '    E.IDPESSOA = :IDEMPRESA'
      'AND E.IDPESSOA = F.IDPESSOA')
    ClientDataSet = cdsEntidade
    Left = 424
    Top = 88
  end
end
