inherited frmReajRubIndiv: TfrmReajRubIndiv
  Left = 486
  Top = 152
  HelpContext = 180007
  Caption = 'Reajuste de Rubricas Individuais'
  ClientHeight = 574
  ClientWidth = 894
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 894
    Height = 535
    object GroupBox1: TGroupBox
      Left = 5
      Top = 6
      Width = 884
      Height = 403
      Caption = 'Rubrica a ser Reajustada :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 379
        Width = 297
        Height = 13
        Caption = 'Quantidade Total de Ocorrências para esta rubrica :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblkpcmbRubDesconto: TwwDBLookupCombo
        Left = 6
        Top = 19
        Width = 874
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'173'#9'DESCRICAO'#9'F')
        LookupTable = qryRubricasExistentes
        LookupField = 'IDPROVENTO'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbRubDescontoCloseUp
        OnExit = dblkpcmbRubDescontoExit
      end
      object dbgrDadosIniciais: TwwDBGrid
        Left = 3
        Top = 49
        Width = 877
        Height = 307
        Selected.Strings = (
          'SELECAO'#9'6'#9'Seleção'
          'MATRICULA'#9'8'#9'Maticula'
          'NOME'#9'35'#9'Nome'
          'VALORRUBRICA'#9'10'#9'Valor /~Percentual Atual da Rubrica'
          'FLGPERMANENTE'#9'10'#9'Rubrica~Permanente'
          'FLGDESATIVADO'#9'10'#9'Rubrica~Desativada'
          'VALORANTERIOR'#9'10'#9'Valor /~Percentual Anterior'
          'COUNT(*)'#9'10'#9'Nº de Ocorrências')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        EditControlOptions = []
        DataSource = dsQuantitativos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyOptions = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgPerfectRowFit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dbgrDadosIniciaisDblClick
        IndicatorColor = icYellow
      end
      object pnlTotal: TPanel
        Left = 736
        Top = 375
        Width = 142
        Height = 22
        Alignment = taRightJustify
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rdgForma: TRadioGroup
      Left = 6
      Top = 414
      Width = 440
      Height = 75
      Caption = 'Forma do Reajuste'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Percentual'
        'Valor')
      ParentFont = False
      TabOrder = 1
      OnClick = rdgFormaClick
      OnExit = rdgFormaExit
    end
    object rdgEscopo: TRadioGroup
      Left = 454
      Top = 414
      Width = 435
      Height = 75
      Caption = 'Escopo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Para todas as Ocorrências da Rubrica a ser Reajustada'
        'Apenas para o Registro Selecionado no Grid')
      ParentFont = False
      TabOrder = 2
      OnClick = rdgEscopoClick
      OnExit = rdgEscopoExit
    end
    object GroupBox2: TGroupBox
      Left = 7
      Top = 491
      Width = 882
      Height = 36
      TabOrder = 3
      object lblForma: TLabel
        Left = 5
        Top = 14
        Width = 170
        Height = 13
        Caption = 'Informe o Valor para Reajuste'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object redValor: TRealEdit
        Left = 755
        Top = 10
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        TabOrder = 0
        WordWrap = False
        OnChange = redValorChange
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 535
    Width = 894
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 589
      inherited sep1: TToolbarSep97
        Left = 298
      end
      inherited bbtnSair: TBitBtn
        Left = 128
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 209
        Width = 89
      end
      object bbtnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 128
        Height = 33
        Caption = 'Processar'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnProcessarClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
          000033833333333F00003088333333380000300883333337000030A088333338
          000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
          000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
          000030AA0333333800003070333333380000300333333338000030333333333F
          00003333333333300000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 403
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryRubricasExistentes: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PR.IDPROVENTO, PR.CODPROVDESC,'
      
        '      '#9'(NVL(PR.CODPROVDESC, to_char(PR.IDPROVENTO)) || '#39' - '#39' || ' +
        'PR.DESCRICAO) AS DESCRICAO,'
      
        '     '#9' (PR.CODPROVDESC || '#39' - '#39' || PR.DESCRPROVDESC) AS DESCRPRO' +
        'VDESC'
      'FROM RUBRICAINDIV RI, PROVDESC PR'
      'WHERE RI.IDRUBRICA = PR.IDPROVENTO'
      'AND (RI.FLGDESATIVADO = 0 OR RI.FLGDESATIVADO IS NULL)'
      'order by descricao'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 149
    Top = 308
  end
  object qryQuantitativos: TwwQuery
    Tag = 5
    CachedUpdates = True
    ObjectView = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select :PSELECAO as SELECAO,DEPENTIT.MATRICULA,PESSOA.NOME, VALO' +
        'RRUBRICA,VALORRUBRICA, FLGPERMANENTE, FLGDESATIVADO, VALORANTERI' +
        'OR, RUBRICAINDIV.idpessoa, RUBRICAINDIV.idempresa, RUBRICAINDIV.' +
        'idrubrica, RUBRICAINDIV.seqrubricaindiv, COUNT(*)'
      'FROM RUBRICAINDIV INNER JOIN'
      
        '     DEPENTIT ON DEPENTIT.IDPESSOA = RUBRICAINDIV.IDPESSOA AND D' +
        'EPENTIT.IDTITULAR = RUBRICAINDIV.IDTITULAR INNER JOIN'
      '     PESSOA ON PESSOA.IDPESSOA = RUBRICAINDIV.IDPESSOA'
      'WHERE IDRUBRICA = :RUBRICA'
      'AND (FLGDESATIVADO = 0 OR FLGDESATIVADO IS NULL)'
      
        'GROUP BY DEPENTIT.MATRICULA,PESSOA.NOME,VALORRUBRICA, FLGPERMANE' +
        'NTE, FLGDESATIVADO, VALORANTERIOR, RUBRICAINDIV.idpessoa, RUBRIC' +
        'AINDIV.idempresa, RUBRICAINDIV.idrubrica, RUBRICAINDIV.seqrubric' +
        'aindiv'
      'ORDER BY PESSOA.NOME'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updQuantitativos
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0'
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 213
    Top = 340
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PSELECAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'RUBRICA'
        ParamType = ptUnknown
      end>
    object qryQuantitativosSELECAO: TFloatField
      FieldName = 'SELECAO'
    end
    object qryQuantitativosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryQuantitativosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryQuantitativosVALORRUBRICA: TFloatField
      FieldName = 'VALORRUBRICA'
      DisplayFormat = '#.00'
    end
    object qryQuantitativosFLGPERMANENTE: TFloatField
      FieldName = 'FLGPERMANENTE'
    end
    object qryQuantitativosFLGDESATIVADO: TFloatField
      FieldName = 'FLGDESATIVADO'
    end
    object qryQuantitativosVALORANTERIOR: TFloatField
      FieldName = 'VALORANTERIOR'
      DisplayFormat = '#.00'
    end
    object qryQuantitativosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryQuantitativosIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryQuantitativosIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryQuantitativosSEQRUBRICAINDIV: TFloatField
      FieldName = 'SEQRUBRICAINDIV'
    end
    object qryQuantitativosCOUNT: TFloatField
      FieldName = 'COUNT(*)'
    end
  end
  object dsQuantitativos: TDataSource
    DataSet = qryQuantitativos
    Left = 48
    Top = 328
  end
  object qryAux: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0'
      'FLGDESATIVADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 229
    Top = 276
  end
  object updQuantitativos: TUpdateSQL
    Left = 432
    Top = 272
  end
end
