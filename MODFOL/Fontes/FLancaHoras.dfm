inherited frmLancaHoras: TfrmLancaHoras
  Left = 221
  Top = 178
  Caption = 'Lançamento de Horas Extras e Atrasos'
  ClientHeight = 307
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 268
    BorderWidth = 2
    object Label5: TLabel
      Left = 24
      Top = 73
      Width = 43
      Height = 13
      Caption = 'Atrasos'
    end
    object Label1: TLabel
      Left = 24
      Top = 109
      Width = 83
      Height = 13
      Caption = 'Extras Diurnas'
    end
    object Label2: TLabel
      Left = 24
      Top = 139
      Width = 91
      Height = 13
      Caption = 'Extras Noturnas'
    end
    object Label3: TLabel
      Left = 24
      Top = 169
      Width = 85
      Height = 13
      Caption = 'Extraordinárias'
    end
    object Label4: TLabel
      Left = 477
      Top = 73
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label6: TLabel
      Left = 477
      Top = 106
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label7: TLabel
      Left = 477
      Top = 139
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label8: TLabel
      Left = 477
      Top = 169
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label9: TLabel
      Left = 24
      Top = 205
      Width = 102
      Height = 13
      Caption = 'Adicional Noturno'
    end
    object Label10: TLabel
      Left = 477
      Top = 205
      Width = 24
      Height = 13
      Caption = 'min.'
    end
    object Label11: TLabel
      Left = 24
      Top = 237
      Width = 98
      Height = 13
      Caption = 'Repouso Remun.'
    end
    object Label12: TLabel
      Left = 477
      Top = 237
      Width = 30
      Height = 13
      Caption = 'qtde.'
    end
    object dblcAtraso: TwwDBLookupCombo
      Left = 138
      Top = 70
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub1
      LookupField = 'DESCRICAO'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcDiurna: TwwDBLookupCombo
      Left = 138
      Top = 106
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub2
      LookupField = 'DESCRICAO'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcNoturna: TwwDBLookupCombo
      Left = 138
      Top = 136
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub3
      LookupField = 'DESCRICAO'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object dblcExtra: TwwDBLookupCombo
      Left = 138
      Top = 166
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub4
      LookupField = 'DESCRICAO'
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object redAtraso: TRealEdit
      Left = 404
      Top = 70
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 4
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redDiurna: TRealEdit
      Left = 404
      Top = 106
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 5
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redNoturna: TRealEdit
      Left = 404
      Top = 136
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 6
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object redExtra: TRealEdit
      Left = 404
      Top = 166
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 7
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object wwDBEdit1: TwwDBEdit
      Left = 24
      Top = 25
      Width = 264
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = frmRegHoras.ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object grpMesRef: TGroupBox
      Left = 303
      Top = 13
      Width = 200
      Height = 42
      Caption = ' Mês e Ano de Referência '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object cmbMes: TComboBox
        Left = 7
        Top = 14
        Width = 115
        Height = 21
        ItemHeight = 13
        TabOrder = 0
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
      object spnedAno: TSpinEdit
        Left = 132
        Top = 14
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object dblcAdicNot: TwwDBLookupCombo
      Left = 138
      Top = 202
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub5
      LookupField = 'DESCRICAO'
      TabOrder = 10
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object redAdNot: TRealEdit
      Left = 404
      Top = 202
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '         0')
      TabOrder = 11
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = iNumber
      Signal = False
    end
    object dblcRepouso: TwwDBLookupCombo
      Left = 138
      Top = 234
      Width = 250
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'130'#9'DESCRICAO')
      LookupTable = qryRub6
      LookupField = 'DESCRICAO'
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
    object redRepouso: TRealEdit
      Left = 404
      Top = 234
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 13
      WordWrap = False
      IntDigits = 4
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 268
    inherited TB97oKCancelar: TToolbar97 [0]
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
    inherited tb97Fundo: TToolbar97 [1]
      inherited bbtnSair: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 267
    Top = 259
  end
  object qryRub1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 11
    Top = 260
  end
  object qryRub2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 50
    Top = 260
  end
  object qryRub3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 81
    Top = 265
  end
  object qryRub4: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 114
    Top = 262
  end
  object tblRubInd: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;IDEMPRESA;IDRUBRICA;SEQRUBRICAINDIV'
    TableName = 'CM.RUBRICAINDIV'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 482
    Top = 252
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO from MOTIVO order by DESCRICAO')
    ValidateWithMask = True
    Left = 432
    Top = 242
  end
  object qryRub5: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 159
    Top = 259
  end
  object qryRub6: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPROVENTO, CODRUBCLT, IDREGRA, DESCRICAO '
      'from PROVDESC '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 207
    Top = 259
  end
end
