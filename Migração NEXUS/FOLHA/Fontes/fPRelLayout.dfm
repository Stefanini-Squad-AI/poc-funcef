inherited frmPRelLayout: TfrmPRelLayout
  Left = 137
  Top = 60
  HelpContext = 180096
  Caption = 'Relatório de Importações de Convênios'
  ClientHeight = 453
  ClientWidth = 429
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 429
    Height = 414
    object GroupBox3: TGroupBox
      Left = 16
      Top = 265
      Width = 395
      Height = 65
      Caption = 'Rubricas'
      TabOrder = 5
      object dblkpRubrica: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Rubrica')
        LookupTable = qryRubricas
        LookupField = 'IDRUBRICA'
        Enabled = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 128
      Width = 395
      Height = 65
      Caption = 'Relação de Layouts / Descontos'
      TabOrder = 3
      object dblkpLayout: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 377
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição')
        LookupTable = qryLayout
        LookupField = 'IDLAYOUT'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkpLayoutCloseUp
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 196
      Width = 395
      Height = 64
      Caption = 'Ano / Mês Cobrança'
      TabOrder = 4
      object cboxMes: TComboBox
        Left = 90
        Top = 25
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cboxMes'
        OnExit = cboxMesExit
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object seAno: TSpinEdit
        Left = 10
        Top = 26
        Width = 67
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnExit = seAnoExit
      end
      object chkAbono: TCheckBox
        Left = 265
        Top = 27
        Width = 119
        Height = 17
        Caption = 'Abono Anual'
        TabOrder = 2
        OnClick = chkAbonoClick
      end
    end
    object grpTipo: TRadioGroup
      Left = 16
      Top = 11
      Width = 393
      Height = 41
      Caption = 'Tipo de Relatório'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Convênios Importados'
        'Convênios Processados')
      TabOrder = 0
      OnClick = grpTipoClick
    end
    object gboxHist: TGroupBox
      Left = 16
      Top = 333
      Width = 395
      Height = 65
      Caption = 'Versão da Folha'
      TabOrder = 6
      object blkcmpHistorico: TwwDBLookupCombo
        Left = 11
        Top = 26
        Width = 373
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryHistorico
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object rgOrigem: TRadioGroup
      Left = 16
      Top = 60
      Width = 113
      Height = 61
      Caption = 'Origem'
      ItemIndex = 0
      Items.Strings = (
        'Histórico'
        'Prévia')
      TabOrder = 1
      OnClick = rgOrigemClick
    end
    object rgTipoRegistro: TRadioGroup
      Left = 144
      Top = 60
      Width = 265
      Height = 61
      Caption = 'Tipo Registro '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Processados'
        'Não Processados')
      TabOrder = 2
      OnClick = rgOrigemClick
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 429
    inherited tb97Fundo: TToolbar97
      Left = 256
      DockPos = 256
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 87
      DockPos = 87
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 355
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryLayout: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'IDLAYOUT,'
      #9'DESCRICAO,'
      '  FLGTIPOCONVENIO'
      'FROM'
      #9'LAYOUTDESCONTO'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 336
    Top = 24
    object qryLayoutDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'LAYOUTDESCONTO.DESCRICAO'
      Size = 30
    end
    object qryLayoutIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'LAYOUTDESCONTO.IDLAYOUT'
      Visible = False
    end
    object qryLayoutFLGTIPOCONVENIO: TFloatField
      FieldName = 'FLGTIPOCONVENIO'
      Origin = 'BASEDADOS.LAYOUTDESCONTO.FLGTIPOCONVENIO'
    end
  end
  object qryRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'LC.IDRUBRICA,'
      
        '       DECODE(PRM.FLGUSACODRUBEXT, 0, PD.DESCRICAO, PD.DESCRPROV' +
        'DESC) AS DESCRICAO'
      'FROM LAYOUTXCOLUNAS LC, PROVDESC PD, PARAMAPREV PRM'
      'WHERE (LC.IDLAYOUT = :IDLAYOUT)'
      'AND (PD.IDPROVENTO'#9'= LC.IDRUBRICA)'
      ''
      ''
      ''
      '  '
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryRubricasIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryRubricasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO,'
      '  MESREFERENCIA '
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' ')
    ValidateWithMask = True
    Left = 378
    Top = 299
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'baseDados'
    SQL.Strings = (
      'SELECT IDLOTE'
      'FROM CTRLINTERFACE'
      'WHERE MESREFERENCIA = :MESCOBRANCA'
      '  AND TIPO = '#39'B'#39
      '  AND IDREFERENCIA IN (SELECT IDLAYOUT FROM LAYOUTXCOLUNAS'
      #9#9#9' WHERE IDRUBRICA = :IDPROVENTO)'
      '')
    ValidateWithMask = True
    Left = 376
    Top = 245
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
end
